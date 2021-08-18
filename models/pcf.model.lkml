connection: "io"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: products {
  join: product_categories {
    relationship: many_to_one
    sql_on: ${products.category_id} = ${product_categories.id} ;;
  }
  join: product_office_quantity {
    view_label: "Product Office Quantity"
    relationship: one_to_one
    sql_on: ${products.id} = ${product_office_quantity.product_id} and 3781 = ${product_office_quantity.office_id} ;;
  }
}

explore: product_categories {}


explore: warehouse_order_items {
  join: products {
    relationship: many_to_one
    sql_on: ${products.id} = ${warehouse_order_items.product_id};;
  }

  join: warehouse_orders {
    relationship: many_to_one
    sql_on: ${warehouse_orders.id} = ${warehouse_order_items.order_id} ;;
  }

  # join: self_brand_product {
  #   from: product
  #   relationship: many_to_one
  #   sql_on: ${self_brand_product.id} = ${orderItem.product_id} ;;
  # }
}

explore: patients {
  join: warehouse_orders {
    relationship: many_to_one
    sql_on: ${patients.id} = ${warehouse_orders.patient_id} ;;
  }
}
explore: product_office_quantity {}
# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
