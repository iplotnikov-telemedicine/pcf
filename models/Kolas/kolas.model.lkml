connection: "kolas"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
include: "/views/kolas/*.view.lkml"          # include all views in the views/kolas folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard



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

  join: offices {
    relationship: many_to_one
    sql_on: ${orders.office_id} = ${offices.office_id} ;;
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

  sql_always_where:
  {% if order_items.namesearch._is_filtered %}
  ${order_items.filter_by_product} = 'yes'
  {% else %}
  1=1
  {% endif %};;
}


explore: orders {
  # always_filter: {
  #   filters: [orders.confirmed_time: "2 days", patients.phone: "-EMPTY"]
  # }

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
