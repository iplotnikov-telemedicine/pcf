view: purchasing_limits {
  sql_table_name: purchasing_limits ;;
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

  dimension: limit_name {
    type: string
    sql: ${TABLE}.limit_name ;;
  }

  dimension: limit_type {
    type: string
    sql: ${TABLE}.limit_type ;;
  }

  dimension: medical_is_active {
    type: yesno
    sql: ${TABLE}.medical_is_active ;;
  }

  dimension: medical_limit {
    type: number
    sql: ${TABLE}.medical_limit ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }

  dimension: recreational_is_active {
    type: yesno
    sql: ${TABLE}.recreational_is_active ;;
  }

  dimension: recreational_limit {
    type: number
    sql: ${TABLE}.recreational_limit ;;
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

  measure: count {
    type: count
    drill_fields: [id, limit_name, purchasing_limits_product_types_ref.count]
  }
}
