connection: "scflavors"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


explore: product_quantity_and_offices {
  join: offices {
    type: inner
    relationship: many_to_one
    sql_on: ${product_quantity_and_offices.office_id} = ${offices.office_id};;
  }
}

explore: products {
  sql_always_where: ${products.deleted_raw} IS NULL ;;

  join: quantities_by_product {
    type: left_outer
    relationship: one_to_one
    sql_on:  ${products.id} = ${quantities_by_product.product_id} ;;
  }

  join: total_cost_by_product {
    type: left_outer
    relationship: one_to_one
    sql_on:  ${quantities_by_product.product_id} = ${total_cost_by_product.product_id} ;;
  }

  join: product_types {
    type: left_outer
    relationship: many_to_one
    sql_on:  ${product_types.id} = ${products.product_type_id} ;;
  }

  join: brands {
    relationship: many_to_one
    sql_on: ${products.brand_id} = ${brands.id} ;;
  }

  join: product_categories_by_level {
    relationship: many_to_one
    sql_on: ${products.id} = ${product_categories_by_level.id} ;;
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

  join: product_checkins {
    type: inner
    relationship: one_to_many
    sql_on: ${products.id} = ${product_checkins.product_id} ;;
  }

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

  join: product_office_quantities_by_product {
    relationship: one_to_one
    sql_on: ${products.id} = ${product_office_quantities_by_product.product_id} ;;
  }

}

explore: product_with_tax {

  join: brands {
    relationship: many_to_one
    sql_on: ${product_with_tax.brand_id} = ${brands.brand_id} ;;
  }

  join: product_price_group {
    relationship: many_to_one
    sql_on: ${product_with_tax.id} = ${product_price_group.product_id};;
  }

  join: product_prices {
    relationship: many_to_one
    sql_on: ${product_price_group.id} = ${product_prices.price_group_id}
      and (${product_prices.weight_type} is NULL
        or ${product_prices.weight_type} = 'gram')
      and (${product_prices.range_from} is NULL
        or ${product_prices.range_from} = 1);;
  }

  join: tax_tier {
    type: inner
    relationship: many_to_one
    sql_on: 1=1 ;;
  }

  join: tax_tier_versions {
    type: inner
    relationship: one_to_many
    sql_on: ${tax_tier.tax_tier_version_id} = ${tax_tier_versions.id} ;;
  }

  join: tax_excise {
    type: inner
    relationship: one_to_one
    sql_on: ${tax_tier_versions.id} = ${tax_excise.tax_tier_version_id} ;;
  }

  join: tax_city_local {
    type: inner
    relationship: one_to_one
    sql_on: ${tax_tier_versions.id} = ${tax_city_local.tax_tier_version_id} ;;
  }

  join: tax_sales {
    type: inner
    relationship: one_to_one
    sql_on: ${tax_tier_versions.id} = ${tax_sales.tax_tier_version_id} ;;
  }

  join: tax_city_local_rates {
    type: inner
    relationship: one_to_many
    sql_on: ${tax_city_local.id} = ${tax_city_local_rates.city_local_tax_id}
      and ${tax_city_local_rates.location_type} = 'city';;
  }

  join: tax_sales_rates {
    type: inner
    relationship: one_to_many
    sql_on: ${tax_sales.id} = ${tax_sales_rates.sales_tax_id}
      and ${tax_sales_rates.location_type} = 'state';;
  }
}

explore: package_quantity_for_metrc {

  from: package_quantity
  sql_always_where:  ${product_checkins.is_metrc} = 1
    and ${product_checkins.is_finished} = 0
    and ${product_checkins.deleted_date} is NULL;;

  join: product_checkins {
    relationship: one_to_one
    sql_on: ${package_quantity_for_metrc.package_id} = ${product_checkins.id} ;;
  }

}

explore: product_office_quantity {}

explore: product_checkins {}


explore: patients_with_orders {
  join: orders {
    relationship: one_to_many
    sql_on: ${patients_with_orders.id} = ${orders.patient_id};;
  }
}

explore: checkins_by_package {}

explore: package_quantity_ext {
  join: product_checkins {
    relationship: one_to_one
    sql_on: ${product_checkins.id} = ${package_quantity_ext.package_id} ;;
  }
}

explore: product_transactions {

  sql_always_where: ${product_checkins.uid} IS NOT NULL
    AND ${product_checkins.uid} <> ''
    AND {% if product_transactions.date_filter._in_query %}
    ${product_checkins.date_raw} <= {% date_start product_transactions.date_filter %}
    {% else %}
    1 = 1
    {% endif %} ;;

  join: product_checkins {
    relationship: many_to_one
    type: inner
    sql_on: ${product_transactions.product_checkin_id} = ${product_checkins.id} ;;
    # AND ${product_transactions.date_raw} >= ${product_checkins.date_raw};;
  }

  join: products {
    type: inner
    relationship: many_to_one
    sql_on:  ${product_transactions.product_id} = ${products.id} ;;
  }

  join: total_tax_by_product {
    type: left_outer
    relationship: one_to_one
    sql_on:  ${products.id} = ${total_tax_by_product.product_id} ;;
  }

  join: brands {
    relationship: many_to_one
    sql_on: ${products.brand_id} = ${brands.id} ;;
  }

  join: product_categories {
    relationship: many_to_one
    sql_on: ${products.prod_category_id} = ${product_categories.id};;
  }

  join: package_quantity {
    relationship: one_to_many
    sql_on: ${product_checkins.id} = ${package_quantity.package_id};;
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
}


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


explore: order_items {

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
    relationship: one_to_many
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