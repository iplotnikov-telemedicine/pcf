view: service_history {
  sql_table_name: service_history ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ad_campaign_id {
    type: number
    sql: ${TABLE}.ad_campaign_id ;;
  }

  dimension: ad_campaign_patient_type_id {
    type: number
    sql: ${TABLE}.ad_campaign_patient_type_id ;;
  }

  dimension: amount {
    type: string
    sql: ${TABLE}.amount ;;
  }

  dimension: amount_by_referral_points {
    type: number
    sql: ${TABLE}.amount_by_referral_points ;;
  }

  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
  }

  dimension: count_referral_points {
    type: number
    sql: ${TABLE}.count_referral_points ;;
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

  dimension: doctor_id {
    type: number
    sql: ${TABLE}.doctor_id ;;
  }

  dimension: edit_amount {
    type: string
    sql: ${TABLE}.edit_amount ;;
  }

  dimension: edit_reason {
    type: string
    sql: ${TABLE}.edit_reason ;;
  }

  dimension: exam {
    type: string
    sql: ${TABLE}.exam ;;
  }

  dimension: has_exam_for_approving {
    label: "has exam"
    type: yesno
    sql: ${TABLE}.has_exam_for_approving ;;
  }

  dimension: has_intake_for_approving {
    type: yesno
    sql: ${TABLE}.has_intake_for_approving ;;
  }

  dimension: intake {
    type: string
    sql: ${TABLE}.intake ;;
  }

  dimension: is_dejavoo_payment {
    type: yesno
    sql: ${TABLE}.is_dejavoo_payment ;;
  }

  dimension: is_take_payment {
    type: yesno
    sql: ${TABLE}.is_take_payment ;;
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

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: object_id {
    type: number
    sql: ${TABLE}.object_id ;;
  }

  dimension: object_type {
    type: string
    sql: ${TABLE}.object_type ;;
  }

  dimension: office_id {
    type: number
    sql: ${TABLE}.office_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
  }

  dimension: profit {
    type: number
    sql: ${TABLE}.profit ;;
  }

  dimension: referal_id {
    type: number
    sql: ${TABLE}.referal_id ;;
  }

  dimension: register_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.register_id ;;
  }

  dimension: service_id {
    type: number
    sql: ${TABLE}.service_id ;;
  }

  dimension: tax {
    type: number
    sql: ${TABLE}.tax ;;
  }

  dimension: type {
    type: string
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

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, register.id, register.name, register.application_name, register_log.count]
  }
}
