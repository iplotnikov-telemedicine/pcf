connection: "kolas"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: barcode {}

explore: product_office_quantity {
  join: offices {
    relationship: many_to_one
    sql_on: ${product_office_quantity.office_id} = ${offices.office_id};;
  }
}

explore: inventory_log {
  join: offices {
    relationship: many_to_one
    sql_on: ${inventory_log.storage_id} = ${offices.office_id};;
  }

  join: products {
    relationship: many_to_one
    sql_on: ${inventory_log.product_id} = ${products.id};;
  }

  join: brands {
    relationship: many_to_one
    sql_on: ${products.brand_id} = ${brands.brand_id} ;;
  }

}

explore: product_checkins {}

explore: products {

  join: product_tag_ref {
    relationship: one_to_many
    sql_on: ${products.id} = ${product_tag_ref.product_id};;
  }

  join: product_tag {
    relationship: many_to_many
    sql_on: ${product_tag_ref.tag_id} = ${product_tag.id};;
  }

  # join: product_office_quantity {
  #   relationship: many_to_many
  #   sql_on: ${products.id} = ${product_office_quantity.product_id};;
  # }

  # join: offices {
  #   relationship: many_to_one
  #   sql_on: ${product_office_quantity.office_id} = ${offices.office_id};;
  # }



  join: product_office_quantity {
    type: inner
    relationship: one_to_many
    sql_on: ${products.id} = ${product_office_quantity.product_id};;
  }

  join: packages {
    type:  inner
    relationship: one_to_many
    sql_on: ${products.id} = ${packages.product_id};;
  }

  join: product_checkins {
    relationship: one_to_one
    sql_on: ${packages.product_id} = ${product_checkins.product_id}
      ${packages.office_id} = ${product_checkins.office_id} ;;
  }

  join: offices {
    relationship: many_to_one
    sql_on: ${offices.office_id} = ${product_office_quantity.office_id};;
  }

  join: product_price_group {
    relationship: many_to_one
    sql_on: ${products.id} = ${product_price_group.product_id};;
  }

  join: product_prices {
    relationship: many_to_one
    sql_on: ${product_price_group.id} = ${product_prices.price_group_id};;
  }

  join: brands {
    relationship: many_to_one
    sql_on: ${products.brand_id} = ${brands.brand_id} ;;
  }

  join: product_types {
    relationship: many_to_one
    sql_on: ${products.product_type_id} = ${product_types.id};;
  }

  join: product_categories {
    relationship: many_to_one
    sql_on: ${products.prod_category_id} = ${product_categories.id};;
  }

  # join: barcode {
  #   relationship: one_to_many
  #   sql_on: ${products.id} = ${barcode.product_id}
  #     and ${checkins_by_package.checkin_id} = ${barcode.product_checkin_id}
  #     and ${barcode.company_id} = @{kolas_company_id};;
  #   # sql_on: ${product_checkins.id} = ${barcode.product_checkin_id} and ${barcode.company_id} = @{kolas_company_id};;
  # }
  # LEFT JOIN product_types pt ON p.product_type_id = pt.id
  # LEFT JOIN product_categories pcat ON p.prod_category_id = pcat.id
}


explore: order_items {

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

  # join: order_item_discounts {
  #   from: discounts
  #   relationship: many_to_one
  #   sql_on: ${discounts.id} = ${order_items.discount_id} and ${discounts.apply_type} = "item";;
  # }

  # join: order_discounts {
  #   from: discounts
  #   relationship: many_to_one
  #   sql_on: ${discounts.id} = ${orders.discount_id} and ${discounts.apply_type} = "cart";;
  # }

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
}


explore: orders {
  # always_filter: {
  #   filters: [orders.confirmed_time: "2 days", patients.phone: "-EMPTY"]
  # }

  sql_always_where: ${offices.office_comp_id} = 9928;;

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
