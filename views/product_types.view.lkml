view: product_types {
  sql_table_name: product_types ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: deleted {
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
    sql: ${TABLE}.deleted_at ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: is_system {
    type: yesno
    sql: ${TABLE}.is_system ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: system_type {
    type: number
    sql: ${TABLE}.system_type ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      products.count,
      purchasing_limits_product_types_ref.count,
      purchasing_limit_patient_limit_operations.count,
      refund_products.count
    ]
  }
}
