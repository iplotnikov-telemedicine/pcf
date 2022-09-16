connection: "analytics"

include: "/views/pcf/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


explore: product_transactions {

  sql_always_where:
    ${product_checkins.uid} IS NOT NULL
    AND ${products.deleted_date} IS NULL
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
    sql_on: ${products.brand_id} = ${brands.brand_id} ;;
  }

  join: product_categories {
    relationship: many_to_one
    sql_on: ${products.prod_category_id} = ${product_categories.id};;
  }

  join: package_quantity {
    relationship: one_to_many
    sql_on: ${product_checkins.id} = ${package_quantity.package_id};;
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
