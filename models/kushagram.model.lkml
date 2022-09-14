connection: "kg"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: order_items {
  view_name: order_items

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
    type: inner
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
