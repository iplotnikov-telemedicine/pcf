connection: "pcf"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: product_transactions {}

explore: product_office_quantity {}

explore: inventory_log {
  join: offices {
    type: inner
    relationship: many_to_one
    sql_on: ${inventory_log.storage_id} = ${offices.office_id} and ${offices.office_comp_id} = 4546;;
  }

  join: products {
    type: inner
    relationship: many_to_one
    sql_on:  ${inventory_log.product_id} = ${products.id} ;;
  }

  join: product_price_group {
    relationship: many_to_one
    sql_on: ${products.id} = ${product_price_group.product_id};;
  }

  join: product_prices {
    relationship: many_to_one
    sql_on: ${product_price_group.id} = ${product_prices.price_group_id}
      and (${inventory_log.item_type} = ${product_prices.weight_type} or ${product_prices.weight_type} IS NULL);;
  }

  join: brands {
    relationship: many_to_one
    sql_on: ${products.brand_id} = ${brands.brand_id} ;;
  }


}

explore: products {

  view_name: products

  join: product_checkins {
    type: inner
    relationship: one_to_many
    sql_on: ${products.id} = ${product_checkins.product_id} ;;
  }

  # join: adjustments {
  #   from: product_transactions
  #   type: left_outer
  #   relationship: one_to_many
  #   sql_on: ${product_checkins.id} = ${adjustments.product_checkin_id}
  #     AND ${adjustments.transaction_type} in (12,13) ;;
  # }

  join: adjustments_by_checkin {
    type: left_outer
    relationship: one_to_one
    sql_on: ${product_checkins.id} = ${adjustments_by_checkin.product_checkin_id} ;;
  }

  join: order_items_by_checkin {
    relationship: one_to_one
    sql_on: ${product_checkins.id} = ${order_items_by_checkin.product_checkin_id};;
      # and ${product_checkins.date_raw} <= ${order_items.created_raw};;
  }

  join: product_categories {
    relationship: many_to_one
    sql_on: ${products.category_id} = ${product_categories.id} ;;
  }

  join: product_office_quantity_by_product {
    relationship: one_to_one
    sql_on: ${products.id} = ${product_office_quantity_by_product.product_id} ;;
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
