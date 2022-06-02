connection: "pcf"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: products {
  view_name: products
  join: product_categories {
    relationship: many_to_one
    sql_on: ${products.category_id} = ${product_categories.id} ;;
  }
  join: product_office_quantity {
    view_label: "Product Office Quantity"
    relationship: one_to_one
    sql_on: ${products.id} = ${product_office_quantity.product_id} and 3781 = ${product_office_quantity.office_id} ;;
  }
  join: brands {
    relationship: many_to_one
    sql_on: ${products.brand_id} = ${brands.brand_id} ;;
  }
}

explore: product_categories {}


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

  join: patients {
    relationship: many_to_one
    sql_on: ${orders.patient_id} = ${patients.id} ;;
  }

  join: returning_patients {
    relationship: one_to_one
    type: inner
    sql_on: ${patients.id} = ${returning_patients.id} ;;
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

  # join: self_brand_product {
  #   from: product
  #   relationship: many_to_one
  #   sql_on: ${self_brand_product.id} = ${orderItem.product_id} ;;
  # }
}


explore: users {
}

# explore: self_products {
#   extends: [products]
#   sql_always_where: ${products.brand_id} IN() ;;
# }

# explore: products_from_other_brand {
#   extends: [products]
#   sql_always_where: ${products.brand_id} NOT IN() ;;
# }

explore: patients { view_name: patients
  join: orders {
    relationship: many_to_one
    sql_on: ${patients.id} = ${orders.patient_id} ;;
  }
}


# explore: new_patients {
#   extends: [patients]
#   sql_always_where:  ;;
# }

# explore: product_office_quantity {}

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
