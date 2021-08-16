view: warehouse_orders {
  sql_table_name: warehouse_orders ;;
  label: "Orders"
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: applied_potify_credits {
    type: number
    sql: ${TABLE}.applied_potify_credits ;;
  }

  dimension: asap_delivery {
    type: yesno
    sql: ${TABLE}.asap_delivery ;;
  }

  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
  }

  dimension: cashier_id {
    type: number
    sql: ${TABLE}.cashier_id ;;
  }

  dimension: cashier_name {
    type: string
    sql: ${TABLE}.cashier_name ;;
  }

  dimension: change_amount {
    type: number
    sql: ${TABLE}.change_amount ;;
    value_format_name: usd
  }

  dimension: charge_by {
    type: string
    sql: ${TABLE}.charge_by ;;
  }

  dimension: checkout_staff_id {
    type: number
    sql: ${TABLE}.checkout_staff_id ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension_group: completed {
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
    sql: ${TABLE}.completed_at ;;
  }

  dimension_group: confirmed {
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
    sql: ${TABLE}.confirmed_at ;;
  }

  dimension: week_confirmed {
    group_label: "confirmed" label: "Week"
    sql: ${confirmed_week} ;;
    html: {{ rendered_value | date: "Week %U (%b %d)" }};;
  }

  dimension_group: by_week_confirmed{
    type: duration
    intervals: [week]
    sql_start: ${TABLE}.confirmed_at ;;
    sql_end: ${TABLE}.confirmed_at ;;
  }


  dimension: courier_id {
    type: number
    sql: ${TABLE}.courier_id ;;
  }

  dimension: courier_name {
    type: string
    sql: ${TABLE}.courier_name ;;
  }

  dimension: courier_number {
    type: string
    sql: ${TABLE}.courier_number ;;
  }

  dimension: courier_register_id {
    type: number
    sql: ${TABLE}.courier_register_id ;;
  }

  dimension: courier_register_name {
    type: string
    sql: ${TABLE}.courier_register_name ;;
  }

  dimension: custom_discount_type {
    type: number
    sql: ${TABLE}.custom_discount_type ;;
  }

  dimension: custom_discount_type_bak {
    type: string
    sql: ${TABLE}.custom_discount_type_bak ;;
  }

  dimension: custom_discount_value {
    type: number
    sql: ${TABLE}.custom_discount_value ;;
  }

  dimension: delivery_address {
    type: string
    sql: ${TABLE}.delivery_address ;;
  }

  dimension: delivery_address_id {
    type: number
    sql: ${TABLE}.delivery_address_id ;;
  }

  dimension: delivery_city {
    type: string
    sql: ${TABLE}.delivery_city ;;
  }

  dimension_group: delivery_datetime {
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
    sql: ${TABLE}.delivery_datetime ;;
  }

  dimension: delivery_latitude {
    type: number
    sql: ${TABLE}.delivery_latitude ;;
  }

  dimension: delivery_longitude {
    type: number
    sql: ${TABLE}.delivery_longitude ;;
  }

  dimension: delivery_method {
    type: string
    sql: ${TABLE}.delivery_method ;;
  }

  dimension: delivery_phone {
    type: string
    sql: ${TABLE}.delivery_phone ;;
  }

  dimension: delivery_state {
    type: string
    sql: ${TABLE}.delivery_state ;;
  }

  dimension: delivery_zip {
    type: string
    sql: ${TABLE}.delivery_zip ;;
  }

  dimension: discount_has_changed {
    type: yesno
    sql: ${TABLE}.discount_has_changed ;;
  }

  dimension: discount_id {
    type: number
    sql: ${TABLE}.discount_id ;;
  }

  dimension: discount_type_bak {
    type: string
    sql: ${TABLE}.discount_type_bak ;;
  }

  dimension: fulfillment_status {
    type: number
    sql: ${TABLE}.fulfillment_status ;;
  }

  dimension: is_bonus_point_as_discount {
    type: yesno
    sql: ${TABLE}.is_bonus_point_as_discount ;;
  }

  dimension: is_from_shop {
    type: yesno
    sql: ${TABLE}.is_from_shop ;;
  }

  dimension: is_shipped {
    type: yesno
    sql: ${TABLE}.is_shipped ;;
  }

  dimension: is_transit_started {
    type: yesno
    sql: ${TABLE}.is_transit_started ;;
  }

  dimension: is_verified_by_courier {
    type: yesno
    sql: ${TABLE}.is_verified_by_courier ;;
  }

  dimension: marketplace {
    type: number
    sql: ${TABLE}.marketplace ;;
  }

  dimension: method1_amount {
    label: "Payment via Cash"
    type: number
    sql: ${TABLE}.method1_amount ;;
    value_format_name: usd
  }

  dimension: method2_amount {
    label: "Payment via Credit Card"
    type: number
    sql: ${TABLE}.method2_amount ;;
    value_format_name: usd
  }

  dimension: method3_amount {
    label: "Payment via Check"
    type: number
    sql: ${TABLE}.method3_amount ;;
    value_format_name: usd
  }

  dimension: method4_amount {
    label: "Payment via CC Terminal"
    type: number
    sql: ${TABLE}.method4_amount ;;
    value_format_name: usd
  }

  dimension: method5_amount {
    label: "Payment via Bonus"
    type: number
    sql: ${TABLE}.method5_amount ;;
    value_format_name: usd
  }

  dimension: method6_amount {
    label: "Payment via Potify Bonus"
    type: number
    sql: ${TABLE}.method6_amount ;;
    value_format_name: usd
  }

  dimension: method7_amount {
    label: "Payment via DC Terminal"
    type: number
    sql: ${TABLE}.method7_amount ;;
    value_format_name: usd
  }

  dimension: metrc_delivery_status {
    type: string
    sql: ${TABLE}.metrc_delivery_status ;;
  }

  dimension: metrc_status {
    type: string
    sql: ${TABLE}.metrc_status ;;
  }

  dimension: metrc_substatus {
    type: string
    sql: ${TABLE}.metrc_substatus ;;
  }

  dimension: number {
    type: string
    sql: ${TABLE}.number ;;
  }

  dimension: office_id {
    type: number
    sql: ${TABLE}.office_id ;;
  }

  dimension: office_zip_name {
    type: string
    sql: ${TABLE}.office_zip_name ;;
  }

  dimension: patient_has_caregiver {
    type: yesno
    sql: ${TABLE}.patient_has_caregiver ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
  }

  dimension: patient_is_tax_exempt {
    type: yesno
    sql: ${TABLE}.patient_is_tax_exempt ;;
  }

  dimension: patient_rec_number {
    type: string
    sql: ${TABLE}.patient_rec_number ;;
  }

  dimension: patient_type {
    type: number
    sql: ${TABLE}.patient_type ;;
  }

  dimension: photo {
    type: string
    sql: ${TABLE}.photo ;;
  }

  dimension_group: placed {
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
    sql: ${TABLE}.placed_at ;;
  }

  dimension: pos_mode {
    type: string
    sql: ${TABLE}.pos_mode ;;
  }

  dimension: preferred_payment_method {
    type: number
    sql: ${TABLE}.preferred_payment_method ;;
  }

  dimension: processing_register_id {
    type: number
    sql: ${TABLE}.processing_register_id ;;
  }

  dimension: referral_discount_type {
    type: number
    sql: ${TABLE}.referral_discount_type ;;
  }

  dimension: referral_discount_value {
    type: number
    sql: ${TABLE}.referral_discount_value ;;
  }

  dimension: refund_type {
    type: string
    sql: ${TABLE}.refund_type ;;
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

  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: shipping_amount {
    type: number
    sql: ${TABLE}.shipping_amount ;;
    value_format_name: usd
  }

  dimension: shipping_method_id {
    type: number
    sql: ${TABLE}.shipping_method_id ;;
  }

  dimension: shipping_method_name {
    type: string
    sql: ${TABLE}.shipping_method_name ;;
  }

  dimension: shipping_tracking_number {
    type: string
    sql: ${TABLE}.shipping_tracking_number ;;
  }

  dimension: signature {
    type: string
    sql: ${TABLE}.signature ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: sum_discount {
    type: number
    sql: ${TABLE}.sum_discount ;;
    value_format_name: usd
  }

  dimension: sum_free_discount {
    type: number
    sql: ${TABLE}.sum_free_discount ;;
  }

  dimension: sum_income {
    type: number
    sql: ${TABLE}.sum_income ;;
    value_format_name: usd
  }

  dimension: sum_tax {
    type: number
    sql: ${TABLE}.sum_tax ;;
    value_format_name: usd
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

  dimension: tax_tier_version_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.tax_tier_version_id ;;
  }

  dimension: tip_amount {
    type: number
    sql: ${TABLE}.tip_amount ;;
    value_format_name: usd
  }

  dimension: total_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
    value_format_name: usd
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: vehicle {
    type: string
    sql: ${TABLE}.vehicle ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: sum_total_amount {
    type: sum
    sql: ${total_amount} ;;
    value_format_name: usd
  }

  measure: sum_amount {
    type: sum
    sql: ${amount} ;;
    value_format_name: usd
  }

  measure: sum_total_discounts {
    type: sum
    sql:  ${sum_discount} ;;
    value_format_name: usd
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      cashier_name,
      register_name,
      courier_name,
      courier_register_name,
      office_zip_name,
      shipping_method_name,
      register.id,
      register.name,
      register.application_name,
      tax_tier_versions.id,
      tax_tier_versions.name
    ]
  }
}
