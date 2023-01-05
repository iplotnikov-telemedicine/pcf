connection: "kolas"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: barcode {}

explore: tax_payment_flat {}

explore: refunds_daily {}

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
    type: inner
    relationship: many_to_one
    sql_on: ${service_history.user_id} = ${users.id} ;;
  }

  join: services {
    type: inner
    relationship: many_to_one
    sql_on: ${service_history.service_id} = ${services.id} ;;
  }

  join: service_company_ref {
    type: inner
    relationship: many_to_one
    sql_on: ${services.id} = ${service_company_ref.service_id} ;;
  }

  join: orders {
    type: inner
    relationship: many_to_one
    sql_on: ${service_history.order_id} = ${orders.id} ;;
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

explore: product_transactions {
  from: product_transactions

  join: products {
    relationship: many_to_one
    sql_on: ${product_transactions.product_id} = ${products.id} ;;
  }

  join: product_categories_by_level {
    relationship: many_to_one
    sql_on: ${products.id} = ${product_categories_by_level.id} ;;
  }

  join: order_items {
    sql_on: ${product_transactions.order_id} = ${order_items.order_id}
      AND ${product_transactions.product_checkin_id} = ${order_items.product_checkin_id};;
    type: inner
    relationship: many_to_one
  }

  join: orders {
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    type: inner
    relationship: many_to_one
  }

  join: discounts_by_order {
    sql_on: ${orders.id} = ${discounts_by_order.id} ;;
    type: left_outer
    relationship: one_to_one
  }

  # join: cart_discounts {
  #   from: discounts
  #   type: left_outer
  #   relationship: many_to_one
  #   sql_on: ${orders.discount_id} = ${cart_discounts.id}
  #     and ${cart_discounts.discount_apply_type} = 'cart';;
  # }

  # join: item_discounts {
  #   from: discounts
  #   type: left_outer
  #   relationship: many_to_one
  #   sql_on: ${order_items.discount_id} = ${item_discounts.id}
  #     and ${item_discounts.discount_apply_type} = 'item';;
  # }

  join: patients {
    from: patients
    relationship: many_to_one
    sql_on: ${product_transactions.patient_id} = ${patients.id} ;;
    type: left_outer
  }

  join: patient_group_ref {
    relationship: one_to_one
    sql_on: ${patients.id} = ${patient_group_ref.patient_id} ;;
    type: left_outer
  }

  join: patient_group {
    relationship: one_to_one
    sql_on: ${patient_group_ref.group_id} = ${patient_group.id} ;;
    type: left_outer
  }

}

explore: product_office_quantity {

  sql_always_where: ${offices.office_comp_id} = 9928;;

  join: offices {
    relationship: many_to_one
    sql_on: ${product_office_quantity.office_id} = ${offices.office_id};;
  }
}

explore: patients_with_orders {
  join: orders {
    relationship: one_to_many
    sql_on: ${patients_with_orders.id} = ${orders.patient_id};;
  }
}

explore: inventory_log {

  sql_always_where: ${offices.office_comp_id} = 9928;;

  join: offices {
    relationship: many_to_one
    sql_on: ${inventory_log.storage_id} = ${offices.office_id};;
  }

  join: product_checkins {
    relationship: many_to_one
    sql_on: ${inventory_log.package_id} = ${product_checkins.id};;
  }

  join: products {
    relationship: many_to_one
    sql_on: ${inventory_log.product_id} = ${products.id};;
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


explore: product_checkins {}

explore: products {

  sql_always_where: ${offices.office_comp_id} = 9928;;

  join: inventory_log {
    relationship: one_to_many
    sql_on: ${products.id} = ${inventory_log.product_id};;
  }

  join: product_tag_ref {
    relationship: one_to_many
    sql_on: ${products.id} = ${product_tag_ref.product_id};;
  }

  join: product_tag {
    relationship: many_to_many
    sql_on: ${product_tag_ref.tag_id} = ${product_tag.id};;
  }

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
    sql_on: ${product_price_group.id} = ${product_prices.price_group_id}
      and (${product_prices.range_from} is NULL
        or ${product_prices.range_from} = 1);;
  }

  join: brands {
    relationship: many_to_one
    sql_on: ${products.brand_id} = ${brands.id} ;;
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
  join: offices {
    relationship: many_to_one
    sql_on: ${orders_with_details.office_id} = ${offices.office_id} ;;
    fields: [office_name]
  }
}

explore: patients_with_details {
  join: orders {
    relationship: one_to_many
    sql_on:  ${patients_with_details.id} = ${orders.patient_id};;
  }
  join: recommendations {
    relationship: one_to_many
    sql_on: ${patients_with_details.id} = ${recommendations.rec_pat_id};;
  }
  join: offices {
    relationship: many_to_one
    sql_on: ${patients_with_details.office_id} = ${offices.office_id} ;;
    fields: [office_name]
  }
  join: patient_point {
    relationship: one_to_many
    sql_on: ${patients_with_details.id} = ${patient_point.patient_id};;
  }
}

explore: orders_daily {

  sql_always_where: ${offices.office_comp_id} = 9928;;

  join: offices {
    relationship: many_to_one
    sql_on: ${orders_daily.office_id} = ${offices.office_id} ;;
  }

  join: total_over_daily {
    relationship: one_to_one
    sql_on: ${orders_daily.office_id} = ${total_over_daily.office_id}
      and ${orders_daily.report_date} = ${total_over_daily.report_date} ;;
  }

  join: refunds_daily {
    relationship: one_to_one
    sql_on: ${orders_daily.office_id} = ${refunds_daily.office_id}
      and ${orders_daily.report_date} = ${refunds_daily.report_date} ;;
  }
}


explore: order_items {
  from: order_items_with_details

  sql_always_where: ${offices.office_comp_id} = 9928;;

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

  join: order_item_refunds {
    from: order_items_with_details
    relationship: one_to_one
    sql_on: ${order_item_refunds.id} = ${order_items.id} AND ${order_item_refunds.is_returned} = 1;;
  }

  # join: total_over_daily {
  #   relationship: many_to_one
  #   sql_on: ${orders.office_id} = ${total_over_daily.office_id}
  #     and ${orders.confirmed_date} = ${total_over_daily.created_date} ;;
  # }

  # join: refunds_daily {
  #   relationship: one_to_one
  #   sql_on: ${total_over_daily.office_id} = ${refunds_daily.office_id}
  #     and ${total_over_daily.created_date} = ${refunds_daily.returned_date} ;;
  # }

  # aggregate_table: orders_daily {
  #   query: {
  #     dimensions: [orders.confirmed_date]
  #     measures: [orders.atv, orders.avg_wait_time_delivery, orders.avg_wait_time_store, orders.number_of_cash_transactions, orders.number_of_credit_card_transactions, orders.sum_total_discounts, orders.total_cash_sales, orders.total_credit_card_sales, orders.total_tax, sum_gross_sale, sum_net_sales]
  #     timezone: "America/Los_Angeles"
  #   }
  #   materialization: {
  #     sql_trigger_value: SELECT CURDATE() ;;
  #   }
  # }


  # join: service_history_sales {
  #   from: service_history
  #   relationship: one_to_one
  #   sql_on: ${orders.id} = ${service_history_sales.order_id} and ${service_history_sales.type} = 'checkout';;
  # }

  # join: register_log_sales {
  #   from: register_log
  #   relationship: one_to_one
  #   sql_on: ${service_history_sales.id} = ${register_log_sales.service_history_id} and ${register_log_sales.type} = 3;;
  # }

  # join: register_log_closes {
  #   from: register_log
  #   relationship: many_to_many
  #   sql_on: ${register_log_sales.created_date} = ${register_log_closes.created_date}
  #     and ${register_log_sales.register_id} = ${register_log_closes.register_id}
  #     and ${register_log_sales.id} < ${register_log_closes.register_id}
  #     and ${register_log_closes.type} = 4;;
  # }

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
    sql_on: ${order_items.id} = ${tax_payment.order_item_id} ;;
  }

  # join: tax_payment_flat {
  #   relationship: one_to_many
  #   sql_on: ${order_items.id} = ${tax_payment_flat.order_item_id} ;;
  # }

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
    type: left_outer
    sql_on: ${sf_guard_user_group.group_id} = ${staff_category.id} ;;
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

explore: patients {

  join: recommendations {
    relationship: one_to_many
    sql_on: ${patients.id} = ${recommendations.rec_pat_id} and ${recommendations.is_current} = 'Yes';;
  }

  join: orders {
    relationship: one_to_many
    sql_on: ${patients.id} = ${orders.patient_id} ;;
  }

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

  sql_always_where: ${offices.office_comp_id} = 9928;;

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
