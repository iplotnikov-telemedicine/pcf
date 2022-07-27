connection: "dtpg"

label: "DTPG"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: product_categories {
  join: products {
    type: inner
    relationship: many_to_one
    sql_on: ${products.prod_category_id} = ${product_categories.id};;
  }

  join: brands {
    relationship: many_to_one
    sql_on: ${products.brand_id} = ${brands.brand_id} ;;
  }

  join: product_categories_1 {
    from: product_categories
    fields: [name]
    relationship: many_to_one
    sql_on: ${product_categories.rgt} < ${product_categories_1.rgt}
      and ${product_categories.lft} > ${product_categories_1.lft}
      and ${product_categories.level} = ${product_categories_1.level} + 1 ;;
  }

  join: product_categories_2 {
    from: product_categories
    fields: [name]
    relationship: many_to_one
    sql_on: ${product_categories_1.rgt} < ${product_categories_2.rgt}
          and ${product_categories_1.lft} > ${product_categories_2.lft}
          and ${product_categories_1.level} = ${product_categories_2.level} + 1 ;;
  }

}


explore: product_quantity_by_office_type {

  join: offices {
    type: inner
    relationship: many_to_one
    sql_on: ${product_quantity_by_office_type.office_id} = ${offices.office_id};;
  }

  join: products {
    type: inner
    relationship: many_to_one
    sql_on:  ${product_quantity_by_office_type.product_id} = ${products.id} ;;
  }

  join: product_types {
    type: inner
    relationship: many_to_one
    sql_on:  ${product_types.id} = ${products.product_type_id} ;;
  }

  join: brands {
    relationship: many_to_one
    sql_on: ${products.brand_id} = ${brands.brand_id} ;;
  }

  join: product_categories_by_level {
    relationship: many_to_one
    sql_on: ${products.id} = ${product_categories_by_level.id} ;;
  }

  join: product_price_group {
    relationship: many_to_one
    sql_on: ${products.id} = ${product_price_group.product_id};;
  }

  join: product_prices {
    relationship: many_to_one
    sql_on: ${product_price_group.id} = ${product_prices.price_group_id}
      and (${product_prices.weight_type} is NULL
        or ${product_prices.weight_type} = 'gram')
      and (${product_prices.range_from} is NULL
        or ${product_prices.range_from} = 1);;
  }

  join: product_tag_ref {
    relationship: one_to_many
    sql_on: ${products.id} = ${product_tag_ref.product_id};;
  }

  join: product_tag {
    relationship: many_to_many
    sql_on: ${product_tag_ref.tag_id} = ${product_tag.id};;
  }
}


explore: order_items {

  # 3583
  sql_always_where: ${offices.office_comp_id} = 3583;;

  join: products {
    relationship: many_to_one
    sql_on: ${products.id} = ${order_items.product_id};;
  }

  join: brands {
    relationship: many_to_one
    sql_on: ${products.brand_id} = ${brands.brand_id} ;;
  }

  join: orders {
    relationship: many_to_one
    sql_on: ${orders.id} = ${order_items.order_id} ;;
  }

  join: discounts {
    relationship: many_to_one
    sql_on: CASE

          WHEN ${discounts.discount_apply_type} = "cart"

          THEN ${orders.discount_id} = ${discounts.id}

          ELSE ${order_items.discount_id} = ${discounts.id}

          END ;;
          # sql_on: ${orders.discount_id} = ${discounts.id} or ${order_items.discount_id} = ${discounts.id};;
      sql_where: ${discounts.id} is not null;;
    }

    join: discount_amount_by_id {
      relationship: one_to_one
      sql_on: ${discounts.id} = ${discount_amount_by_id.id} ;;
    }

  join: offices {
    relationship: many_to_one
    sql_on: ${orders.office_id} = ${offices.office_id} ;;
    # sql_where: ${offices.company_id} = @{kolas_company_id} ;;
  }

    join: patients {
      relationship: many_to_one
      sql_on: ${orders.patient_id} = ${patients.id} ;;
    }

    # join: returning_patients {
    #   relationship: one_to_one
    #   type: inner
    #   sql_on: ${patients.id} = ${returning_patients.id} ;;
    # }

    join: tax_payment {
      relationship: one_to_one
      sql_on: ${tax_payment.order_item_id} = ${order_items.id} ;;
    }

    join: order_item_refunds {
      from: order_items
      relationship: one_to_one
      sql_on: ${order_item_refunds.id} = ${order_items.id} ;;
    }

    join: users {
      relationship: many_to_one
      sql_on: ${users.id} = ${orders.cashier_id} ;;
    }

    # join: self_brand_product {
    #   from: product
    #   relationship: many_to_one
    #   sql_on: ${self_brand_product.id} = ${orderItem.product_id} ;;
    # }

    # sql_always_where:
    # {% if order_items.namesearch._is_filtered %}
    # ${order_items.filter_by_product} = 'yes'
    # {% else %}
    # 1=1
    # {% endif %};;

    # sql_always_where: ${offices.office_id} = 3583;;
  }


  explore: orders {
    # always_filter: {
    #   filters: [orders.confirmed_time: "2 days", patients.phone: "-EMPTY"]
    # }

    sql_always_where: ${offices.office_id} = 3583;;

    join: patients {
      relationship: many_to_one
      sql_on: ${patients.id} = ${orders.patient_id} ;;
    }

    join: offices {
      relationship: many_to_one
      sql_on: ${orders.office_id} = ${offices.office_id} ;;
    }

    join: service_history {
      relationship: many_to_one
      sql_on: ${orders.id} = ${service_history.order_id} ;;
    }

    join: register_log {
      relationship: many_to_one
      sql_on: ${service_history.id} = ${register_log.service_history_id} ;;
    }

    join: register {
      relationship: many_to_one
      sql_on: ${register.id} = ${register_log.register_id} ;;
    }
  }

  explore: register_log {

    sql_always_where: ${offices.office_id} = 3583;;

    join: register {
      relationship: many_to_one
      sql_on: ${register.id} = ${register_log.register_id} ;;
      sql_where: ${register.office_id} IS NOT NULL ;;
    }

    join: service_history {
      relationship: many_to_one
      sql_on: ${register_log.service_history_id} = ${service_history.id} ;;
    }

    join: orders {
      relationship: many_to_one
      sql_on: ${orders.id} = ${service_history.order_id} ;;
    }

    join: offices {
      relationship: many_to_one
      sql_on: ${register.office_id} = ${offices.office_id} ;;
    }
  }
