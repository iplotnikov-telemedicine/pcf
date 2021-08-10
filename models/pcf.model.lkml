connection: "io"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: product {
  join: category {
    relationship: many_to_one
    sql_on: ${product.category_id} = ${category.id} ;;
  }
  join: poq {
    view_label: "Product Office Quantity"
    relationship: one_to_one
    sql_on: ${product.id} = ${poq.product_id} and 3781 = ${poq.office_id} ;;
  }
}

explore: category {}
explore: orderItem {
  join: product {
    relationship: many_to_one
    sql_on: ${product.id} = ${orderItem.product_id} ;;
  }
  join: warehouse_orders {
    relationship: many_to_one
    sql_on: ${warehouse_orders.id} = ${orderItem.order_id} ;;
  }
}

explore: warehouse_orders {
  join: orderItem {
    relationship: many_to_one
    sql_on: ${orderItem.order_id} = ${warehouse_orders.id} ;;
  }
}

explore: product_office_qty {}
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
