connection: "kg"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "/my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
# include: "//viz_multiple_value/"

explore: sales_by_product {
  join: products {
    relationship: one_to_one
    sql_on: ${sales_by_product.id} = ${products.id};;
  }

  join: quantity_by_product {
    relationship: one_to_one
    type: left_outer
    sql_on: ${sales_by_product.id} = ${quantity_by_product.product_id};;
  }
}

explore: orders_with_details {
  join: latest_patient_orders {
    relationship: many_to_one
    type: inner
    sql_on: ${orders_with_details.confirmed_raw} = ${latest_patient_orders.latest_order_confirmed}
      and ${orders_with_details.patient_id} = ${latest_patient_orders.patient_id}
      and ${latest_patient_orders.has_orders_after_date} = 'No' ;;
  }
  join: patients {
    relationship: many_to_one
    sql_on: ${orders_with_details.patient_id} = ${patients.id} ;;
  }
  join: order_items {
    relationship: one_to_many
    type: inner
    sql_on: ${orders_with_details.id} = ${order_items.order_id} ;;
  }
  join: tax_payment_flat {
    relationship: one_to_one
    sql_on: ${orders_with_details.id} = ${tax_payment_flat.order_id} ;;
  }
  join: products {
    relationship: many_to_one
    sql_on: ${order_items.product_id} = ${products.id};;
  }
  join: brands {
    relationship: many_to_one
    sql_on: ${products.brand_id} = ${brands.id} ;;
  }
  join: product_categories_by_level {
    relationship: many_to_one
    sql_on: ${order_items.product_id} = ${product_categories_by_level.id} ;;
  }
  join: offices {
    relationship: many_to_one
    type: inner
    sql_on: ${orders_with_details.office_id} = ${offices.office_id} ;;
    fields: [office_name, office_is_active]
  }
  join: net_sales_by_office {
    relationship: many_to_one
    type: inner
    sql_on: ${orders_with_details.office_id} = ${net_sales_by_office.office_id} ;;
  }
}

explore: product_quantity_and_offices {
  join: offices {
    type: inner
    relationship: many_to_one
    sql_on: ${product_quantity_and_offices.office_id} = ${offices.office_id};;
  }
}

explore: products {
  from: products

  join: sales_by_product {
    type: inner
    relationship: one_to_one
    sql_on: ${products.id}  = ${sales_by_product.id} ;;
  }

  join: product_office_quantity {
    type: inner
    relationship: one_to_many
    sql_on:  ${products.id}  = ${product_office_quantity.product_id} ;;
  }

  join: runrates {
    type: inner
    relationship: one_to_one
    sql_on:  ${products.id}  = ${runrates.prod_id} ;;
  }

  join: quantity_by_product {
    type: inner
    relationship: one_to_many
    sql_on:  ${products.id}  = ${quantity_by_product.product_id} ;;
  }

  join: product_categories {
    type: inner
    relationship: many_to_one
    sql_on: ${products.prod_category_id} = ${product_categories.id};;
  }

  join: active_products {
    relationship: one_to_one
    type: left_outer
    sql_on: ${products.id} = ${active_products.prod_id} ;;
  }

  join: patients {
    relationship: many_to_one
    sql_on: ${orders.patient_id} = ${patients.id} ;;
  }

  join: order_items {
    relationship: one_to_many
    sql_on: ${products.id} = ${order_items.product_id} ;;
  }

  join: orders {
    relationship: many_to_one
    type: inner
    sql_on: ${order_items.order_id} = ${orders.id} ;;
  }

  join: patient_offices {
    from: offices
    relationship: many_to_one
    sql_on: ${patients.office_id} = ${patient_offices.office_id} ;;
  }

  join: brands {
    relationship: many_to_one
    sql_on: ${products.brand_id} = ${brands.id} ;;
  }

  join: product_categories_by_level {
    type: inner
    relationship: many_to_one
    sql_on: ${products.id} = ${product_categories_by_level.id} ;;
  }

}

explore: product_categories {
  join: products {
    type: inner
    relationship: many_to_one
    sql_on: ${products.prod_category_id} = ${product_categories.id};;
  }

  join: brands {
    relationship: many_to_one
    sql_on: ${products.brand_id} = ${brands.id} ;;
  }

  join: product_categories_1 {
    from: product_categories
    fields: [id, name]
    relationship: many_to_one
    sql_on: ${product_categories.rgt} < ${product_categories_1.rgt}
      and ${product_categories.lft} > ${product_categories_1.lft}
      and ${product_categories.level} = ${product_categories_1.level} + 1 ;;
  }

  join: product_categories_2 {
    from: product_categories
    fields: [id, name]
    relationship: many_to_one
    sql_on: ${product_categories_1.rgt} < ${product_categories_2.rgt}
          and ${product_categories_1.lft} > ${product_categories_2.lft}
          and ${product_categories_1.level} = ${product_categories_2.level} + 1 ;;
  }

}

explore: monthly_sales {

  join: monthly_patients {
    relationship: one_to_one
    sql_on: ${monthly_sales.confirmed_month} = ${monthly_patients.created_month} ;;
  }

  join: monthly_refunds {
    relationship: one_to_one
    sql_on: ${monthly_sales.confirmed_month} = ${monthly_refunds.returned_month} ;;
  }

}

explore: service_history {

  join: users {
    relationship: many_to_one
    sql_on: ${service_history.user_id} = ${users.id} ;;
  }

  join: services {
    relationship: many_to_one
    sql_on: ${service_history.service_id} = ${services.id} ;;
  }

  join: service_company_ref {
  #  type: inner
    relationship: many_to_one
    sql_on: ${services.id} = ${service_company_ref.service_id} ;;
  }

  join: orders {
  #  type: inner
    relationship: many_to_one
    sql_on: ${service_history.order_id} = ${orders.id} ;;
  }

}


explore: order_items {
  from: order_items_with_details

  join: products {
    relationship: many_to_one
    sql_on: ${products.id} = ${order_items.product_id};;
  }

  join: brands {
    relationship: many_to_one
    sql_on: ${products.brand_id} = ${brands.id} ;;
  }

  join: orders {
    relationship: many_to_one
    sql_on: ${orders.id} = ${order_items.order_id} ;;
  }

  join: discounts {
    relationship: many_to_one
    sql_on: ${discounts.id} = ${order_items.discount_id} ;;
  }

  join: order_item_discounts {
    from: discounts
    relationship: many_to_one
    sql_on: ${discounts.id} = ${order_items.discount_id} and ${discounts.discount_apply_type} = "item";;
  }

  join: discount_amount_by_id {
    relationship: one_to_one
    sql_on: ${discounts.id} = ${discount_amount_by_id.id} ;;
  }

  join: offices {
    relationship: many_to_one
    sql_on: ${orders.office_id} = ${offices.office_id} ;;
  }

  join: patients {
    relationship: many_to_one
    sql_on: ${orders.patient_id} = ${patients.id} ;;
  }

  join: tax_payment {
    relationship: one_to_one
    sql_on: ${order_items.id} = ${tax_payment.order_item_id} ;;
  }

  join: order_item_refunds {
    from: order_items
    relationship: one_to_one
    sql_on: ${order_item_refunds.id} = ${order_items.id} AND ${order_item_refunds.is_returned} = 1;;
  }

  join: staff {
    from: users
    relationship: many_to_one
    sql_on: ${staff.id} = ${orders.cashier_id} ;;
  }

  join: sf_guard_user_group {
    relationship: many_to_many
    sql_on: ${staff.id} = ${sf_guard_user_group.user_id} ;;
  }

  join: staff_category {
    from: sf_guard_group
    relationship: many_to_one
    #type: inner
    sql_on: ${sf_guard_user_group.group_id} = ${staff_category.id} ;;
  }

  join: discount_preset {
    relationship: many_to_one
    sql_on: ${orders.id} = ${discount_preset.id} ;;
  }

  join: order_discounts {
    from: discounts
    relationship: many_to_one
    sql_on: ${discounts.id} = ${orders.discount_id} and ${discounts.discount_apply_type} = "cart";;
  }

  join: notes {
    relationship: many_to_one
    sql_on:  ${patients.id} = ${notes.patient_id};;
  }

  join: company {
    relationship: one_to_many
    sql_on: ${offices.office_comp_id} = ${company.id} ;;
  }

  join: product_categories {
    relationship: many_to_one
    sql_on: ${products.category_id} = ${product_categories.id} ;;
  }

  join: product_checkins {
    relationship: many_to_one
    sql_on: ${product_checkins.id} = ${order_items.product_checkin_id} ;;
  }

  join: recommendations {
    relationship: many_to_one
    sql_on: ${orders.patient_id} = ${recommendations.rec_pat_id}
          AND ${recommendations.rec_valid_from_date} <= ${orders.confirmed_raw}
          AND ${recommendations.rec_valid_to_raw} >= ${orders.confirmed_raw};;
  }

  join: returning_patients {
    relationship: one_to_one
    #type: inner
    sql_on: ${patients.id} = ${returning_patients.id} ;;
  }

  join: refunds {
    from: order_items
    relationship: many_to_one
    sql_on: ${refunds.order_id} = ${orders.id} ;;
  }

  join: register_log {
    relationship: one_to_one
    sql_on: ${service_history.id} = ${register_log.service_history_id} ;;
  }

  join: service_history {
    relationship: many_to_one
    sql_on: ${orders.id} = ${service_history.order_id} ;;
  }

  join: tax_excise {
    relationship: one_to_many
    sql_on: ${orders.tax_tier_version_id} = ${tax_excise.tax_tier_version_id} ;;
  }

  join: users {
    relationship: many_to_one
    sql_on: ${users.id} = ${orders.cashier_id} ;;
  }
}

explore: patients_with_orders {
  join: orders {
    relationship: one_to_many
    sql_on: ${patients_with_orders.id} = ${orders.patient_id};;
  }
}

explore: customer_frequency {}

explore: inventory_log {

  join: offices {
    type: inner
    relationship: many_to_one
    sql_on: ${inventory_log.storage_id} = ${offices.office_id} ;;
  }

  join: product_checkins {
    relationship: many_to_one
    sql_on: ${inventory_log.package_id} = ${product_checkins.id};;
  }

  join: products {
    type: inner
    relationship: many_to_one
    sql_on:  ${inventory_log.product_id} = ${products.id} ;;
  }

  join: brands {
    relationship: many_to_one
    sql_on: ${products.brand_id} = ${brands.id} ;;
  }

  join: product_categories {
    relationship: many_to_one
    sql_on: ${products.prod_category_id} = ${product_categories.id};;
  }

  join: product_categories_1 {
    from: product_categories
    fields: [name]
    relationship: many_to_one
    sql_on: ${product_categories.id} <= ${product_categories_1.rgt}
      and ${product_categories.id} >= ${product_categories_1.lft}
      and ${product_categories.level} = ${product_categories_1.level} + 1 ;;
  }

  join: product_categories_2 {
    from: product_categories
    fields: [name]
    relationship: many_to_one
    sql_on: ${product_categories_1.id} <= ${product_categories_2.rgt}
          and ${product_categories_1.id} >= ${product_categories_2.lft}
          and ${product_categories_1.level} = ${product_categories_2.level} + 1 ;;
  }

  join: product_categories_3 {
    from: product_categories
    fields: [name]
    relationship: many_to_one
    sql_on: ${product_categories_2.id} <= ${product_categories_3.rgt}
          and ${product_categories_2.id} >= ${product_categories_3.lft}
          and ${product_categories_2.level} = ${product_categories_3.level} + 1 ;;
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
