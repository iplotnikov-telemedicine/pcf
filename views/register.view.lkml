view: register {
  sql_table_name: register ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: activator_sf_guard_user_id {
    type: number
    sql: ${TABLE}.activator_sf_guard_user_id ;;
  }

  dimension: all_methods_total {
    type: number
    sql: ${TABLE}.all_methods_total ;;
  }

  dimension: application_name {
    type: string
    sql: ${TABLE}.application_name ;;
  }

  dimension: application_version {
    type: string
    sql: ${TABLE}.application_version ;;
  }

  dimension: cash_in_drawer {
    type: number
    sql: ${TABLE}.cash_in_drawer ;;
  }

  dimension: cash_tenders {
    type: number
    sql: ${TABLE}.cash_tenders ;;
  }

  dimension_group: change_status {
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
    sql: ${TABLE}.change_status_at ;;
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

  dimension: dc_cash_change {
    type: number
    sql: ${TABLE}.dc_cash_change ;;
  }

  dimension: delivered_amount {
    type: number
    sql: ${TABLE}.delivered_amount ;;
  }

  dimension: delivered_count {
    type: number
    sql: ${TABLE}.delivered_count ;;
  }

  dimension: dispatch_orders_based_on_delivery_zones {
    type: yesno
    sql: ${TABLE}.dispatch_orders_based_on_delivery_zones ;;
  }

  dimension: drops {
    type: number
    sql: ${TABLE}.drops ;;
  }

  dimension_group: eta {
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
    sql: ${TABLE}.eta ;;
  }

  dimension_group: eta_updated {
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
    sql: ${TABLE}.eta_updated_at ;;
  }

  dimension: expected_drawer {
    type: number
    sql: ${TABLE}.expected_drawer ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: manager_sf_guard_user_id {
    type: number
    sql: ${TABLE}.manager_sf_guard_user_id ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: office_id {
    type: number
    sql: ${TABLE}.office_id ;;
  }

  dimension: opening_amount {
    type: number
    sql: ${TABLE}.opening_amount ;;
  }

  dimension: pending_amount {
    type: number
    sql: ${TABLE}.pending_amount ;;
  }

  dimension: pending_count {
    type: number
    sql: ${TABLE}.pending_count ;;
  }

  dimension: platform {
    type: number
    sql: ${TABLE}.platform ;;
  }

  dimension: port {
    type: number
    sql: ${TABLE}.port ;;
  }

  dimension: poshub_id {
    type: number
    sql: ${TABLE}.poshub_id ;;
  }

  dimension: push_new_order {
    type: yesno
    sql: ${TABLE}.push_new_order ;;
  }

  dimension: push_new_patient {
    type: yesno
    sql: ${TABLE}.push_new_patient ;;
  }

  dimension: push_order_delivered {
    type: yesno
    sql: ${TABLE}.push_order_delivered ;;
  }

  dimension: push_patient_approved {
    type: yesno
    sql: ${TABLE}.push_patient_approved ;;
  }

  dimension: push_patient_declined {
    type: yesno
    sql: ${TABLE}.push_patient_declined ;;
  }

  dimension: returns {
    type: number
    sql: ${TABLE}.returns ;;
  }

  dimension: signin_sf_guard_user_id {
    type: number
    sql: ${TABLE}.signin_sf_guard_user_id ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
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

  dimension: tip_amount {
    type: number
    sql: ${TABLE}.tip_amount ;;
  }

  dimension: total_weight {
    type: number
    sql: ${TABLE}.total_weight ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}.type ;;
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

  measure: number_of_registers {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      application_name,
      account_transaction.count,
      refund_products.count,
      register_log.count,
      service_history.count,
      warehouse_orders.count,
      warehouse_order_logs.count
    ]
  }
}
