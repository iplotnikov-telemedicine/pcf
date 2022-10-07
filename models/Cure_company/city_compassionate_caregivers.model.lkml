connection: "city_compassionate_caregivers"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: order_items {
  sql_always_where: ${offices.office_comp_id} = 7479;;

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
    sql_on: CASE
              WHEN ${discounts.discount_apply_type} = "cart"
              THEN ${orders.discount_id} = ${discounts.id}
              ELSE ${order_items.discount_id} = ${discounts.id}
            END ;;
    sql_where: ${discounts.id} is not null;;
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
}


explore: orders {
  sql_always_where: ${offices.office_comp_id} = 7479;;

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
  sql_always_where: ${offices.office_comp_id} = 7479;;

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
