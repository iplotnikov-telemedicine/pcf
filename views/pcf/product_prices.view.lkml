view: product_prices {
  sql_table_name: {% if _model._name == 'pcf_ext' %}ext_indica_{% endif %}c4546_company.product_prices ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: is_on_tv_device {
    type: yesno
    sql: ${TABLE}.is_on_tv_device ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
    value_format_name: usd
  }

  dimension: price_group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.price_group_id ;;
  }

  dimension: range_from {
    type: number
    sql: ${TABLE}.range_from ;;
  }

  dimension: range_to {
    type: number
    sql: ${TABLE}.range_to ;;
  }

  dimension: weight_type {
    type: string
    sql: ${TABLE}.weight_type ;;
  }

  dimension_group: sync_created {
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
    sql: ${TABLE}.sync_created_at ;;
  }

  dimension_group: sync_updated {
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
    sql: ${TABLE}.sync_updated_at ;;
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

  measure: number_of_product_prices {
    type: count
    drill_fields: [id, products.prod_name, products.wm_product_id, products.brand_product_strain_name, special_items.count]
  }
}
