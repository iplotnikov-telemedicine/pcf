view: tax_payment {
  sql_table_name: {% if _model._name == 'pcf_company' %}@{schema_name}.{% endif %}tax_payment ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: city_delivery_local_tax {
    type: number
    sql: ${TABLE}.city_delivery_local_tax ;;
  }

  dimension: city_delivery_sales_tax {
    type: number
    sql: ${TABLE}.city_delivery_sales_tax ;;
  }

  dimension: city_local_tax {
    type: number
    sql: ${TABLE}.city_local_tax ;;
  }

  dimension: city_mj_tax {
    type: number
    sql: ${TABLE}.city_mj_tax ;;
  }

  dimension: city_sales_tax {
    type: number
    sql: ${TABLE}.city_sales_tax ;;
  }

  dimension: city_tax {
    type: number
    sql: ${TABLE}.city_tax ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: county_delivery_sales_tax {
    type: number
    sql: ${TABLE}.county_delivery_sales_tax ;;
  }

  dimension: county_local_tax {
    type: number
    sql: ${TABLE}.county_local_tax ;;
  }

  dimension: county_mj_tax {
    type: number
    sql: ${TABLE}.county_mj_tax ;;
  }

  dimension: county_sales_tax {
    type: number
    sql: ${TABLE}.county_sales_tax ;;
  }

  dimension: county_tax {
    type: number
    sql: ${TABLE}.county_tax ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: excise_delivery_tax {
    type: number
    sql: ${TABLE}.excise_delivery_tax ;;
  }

  dimension: excise_tax {
    type: number
    sql: ${TABLE}.excise_tax ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_item_id {
    type: number
    sql: ${TABLE}.order_item_id ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: state_delivery_sales_tax {
    type: number
    sql: ${TABLE}.state_delivery_sales_tax ;;
  }

  dimension: state_local_tax {
    type: number
    sql: ${TABLE}.state_local_tax ;;
  }

  dimension: state_mj_tax {
    type: number
    sql: ${TABLE}.state_mj_tax ;;
  }

  dimension: state_sales_tax {
    type: number
    sql: ${TABLE}.state_sales_tax ;;
  }

  dimension: state_tax {
    type: number
    sql: ${TABLE}.state_tax ;;
  }

  dimension: excise_tax_w_delivery {
    type: number
    sql: ${excise_tax} + ${excise_delivery_tax} ;;
  }

  dimension: sales_tax {
    type: number
    sql: ${state_sales_tax} + ${county_sales_tax} + ${city_sales_tax} ;;
  }

  dimension: local_tax {
    type: number
    sql: ${state_local_tax} + ${county_local_tax} + ${city_local_tax} ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  measure: sum_excise_w_delivery {
    type: sum
    sql: ${excise_tax_w_delivery} ;;
  }

  measure: number_of_tax_payments {
    type: count
    drill_fields: [id, products.prod_name, products.wm_product_id, products.brand_product_strain_name, tax_payment_additional.count]
  }

  measure: total_state_sales_tax {
    type: sum
    sql: ${state_sales_tax} ;;
  }

  measure: total_city_sales_tax {
    type: sum
    sql: ${city_sales_tax} ;;
  }

  measure: total_city_local_tax {
    type: sum
    sql: ${city_local_tax} ;;
  }

  measure: tax_total {
    type: number
    sql: ${total_state_sales_tax} + ${total_city_sales_tax} + ${total_city_local_tax} ;;
  }
}
