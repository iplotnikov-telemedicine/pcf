view: warehouse_order_logs {
  sql_table_name: warehouse_order_logs ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: additional_data {
    type: string
    sql: ${TABLE}.additional_data ;;
  }

  dimension: application {
    type: string
    sql: ${TABLE}.application ;;
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

  dimension: order_courier_register_id {
    type: number
    sql: ${TABLE}.order_courier_register_id ;;
  }

  dimension: order_courier_register_id_old {
    type: number
    value_format_name: id
    sql: ${TABLE}.order_courier_register_id_old ;;
  }

  dimension: order_courier_register_name {
    type: string
    sql: ${TABLE}.order_courier_register_name ;;
  }

  dimension: order_courier_register_name_old {
    type: string
    sql: ${TABLE}.order_courier_register_name_old ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
  }

  dimension: patient_name {
    type: string
    sql: ${TABLE}.patient_name ;;
  }

  dimension: register_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.register_id ;;
  }

  dimension: register_name {
    type: string
    sql: ${TABLE}.register_name ;;
  }

  dimension: sf_guard_user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.sf_guard_user_id ;;
  }

  dimension: sf_guard_user_name {
    type: string
    sql: ${TABLE}.sf_guard_user_name ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}.type ;;
  }

  measure: number_of_order_logs {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      sf_guard_user_name,
      order_courier_register_name,
      patient_name,
      register_name,
      sf_guard_user.id,
      sf_guard_user.first_name,
      sf_guard_user.last_name,
      sf_guard_user.username,
      register.id,
      register.name,
      register.application_name
    ]
  }
}
