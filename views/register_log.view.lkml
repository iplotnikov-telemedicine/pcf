view: register_log {
  sql_table_name: register_log ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: actual_drawer {
    type: number
    sql: ${TABLE}.actual_drawer ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: cash_returns {
    type: number
    sql: ${TABLE}.cash_returns ;;
  }

  dimension: cash_sales {
    type: number
    sql: ${TABLE}.cash_sales ;;
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

  dimension: report_date {
    type: date
    sql: CONVERT_TZ(${TABLE}.created_at,'America/Los_Angeles','UTC') ;;
  }

  dimension: dc_cash_change {
    type: number
    sql: ${TABLE}.dc_cash_change ;;
  }

  dimension: delivered_amount {
    type: number
    sql: ${TABLE}.delivered_amount ;;
  }

  dimension: discount {
    type: number
    sql: ${TABLE}.discount ;;
  }

  dimension: drops {
    type: number
    sql: ${TABLE}.drops ;;
  }

  dimension: expected_drawer {
    type: number
    sql: ${TABLE}.expected_drawer ;;
  }

  dimension: method1_amount {
    type: number
    sql: ${TABLE}.method1_amount ;;
  }

  dimension: method2_amount {
    type: number
    sql: ${TABLE}.method2_amount ;;
  }

  dimension: method3_amount {
    type: number
    sql: ${TABLE}.method3_amount ;;
  }

  dimension: method4_amount {
    type: number
    sql: ${TABLE}.method4_amount ;;
  }

  dimension: method5_amount {
    type: number
    sql: ${TABLE}.method5_amount ;;
  }

  dimension: method6_amount {
    type: number
    sql: ${TABLE}.method6_amount ;;
  }

  dimension: method7_amount {
    type: number
    sql: ${TABLE}.method7_amount ;;
  }

  dimension: opening_amount {
    type: number
    sql: ${TABLE}.opening_amount ;;
  }

  dimension: over {
    type: number
    sql: ${TABLE}.over_drawer ;;
  }

  dimension: pending_amount {
    type: number
    sql: ${TABLE}.pending_amount ;;
  }

  dimension: register_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.register_id ;;
  }

  dimension: register_type {
    type: number
    sql: ${TABLE}.register_type ;;
  }

  dimension: service_history_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.service_history_id ;;
  }

  measure: min_service_history_id {
    type: min
    sql: ${TABLE}.service_history_id ;;
  }

  measure: max_service_history_id {
    type: max
    sql: ${TABLE}.service_history_id ;;
  }

  dimension: sf_guard_user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.sf_guard_user_id ;;
  }

  dimension: tax {
    type: number
    sql: ${TABLE}.tax ;;
  }

  dimension: total_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
  }

  dimension: total_cost {
    type: number
    sql: ${TABLE}.total_cost ;;
  }

  dimension: total_profit {
    type: number
    sql: ${TABLE}.total_profit ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}.type ;;
  }

  dimension: type_label {
    type: string
    case: {
      when: {
        sql: ${type} = 1 ;;
        label: "Open Shift"
      }
      when: {
        sql: ${type} = 2 ;;
        label: "Safe Drop"
      }
      when: {
        sql: ${type} = 3 ;;
        label: "Sale"
      }
      when: {
        sql: ${type} = 4 ;;
        label: "Close Shift"
      }
      when: {
        sql: ${type} = 5 ;;
        label: "Return"
      }
    }
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

  dimension: vehicle_id {
    type: number
    sql: ${TABLE}.vehicle_id ;;
  }

  measure: number_of_register_logs {
    type: count
    drill_fields: [detail*]
  }

  measure: total_expected {
    type: sum
    sql: ${expected_drawer} ;;
  }

  measure: total_actual_drawer {
    type: sum
    sql: ${actual_drawer} ;;
  }

  measure: total_over {
    type: sum
    sql: ${over} ;;
  }

  measure: total_drops {
    type: sum
    sql: ${drops} ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      register.id,
      register.name,
      register.application_name,
      service_history.id,
      sf_guard_user.id,
      sf_guard_user.first_name,
      sf_guard_user.last_name,
      sf_guard_user.username
    ]
  }
}
