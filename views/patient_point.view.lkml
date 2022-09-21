view: patient_point {
  sql_table_name: {% if _model._name == 'pcf_company' %}@{schema_name}.{% endif %}patient_point ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
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
    sql: ${TABLE}.sync_created_at ;;
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
    sql: ${TABLE}.sync_updated_at ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: number_of_patient_points {
    type: count
    drill_fields: [id]
  }

  measure: sum_value {
    type: sum
    sql: ${value} ;;
  }
}
