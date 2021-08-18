view: refund_products {
  sql_table_name: refund_products ;;
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

  dimension: is_destroyed {
    type: yesno
    sql: ${TABLE}.is_destroyed ;;
  }

  dimension: marketplace {
    type: number
    sql: ${TABLE}.marketplace ;;
  }

  dimension: net_weight {
    type: number
    sql: ${TABLE}.net_weight ;;
  }

  dimension: office_id {
    type: number
    sql: ${TABLE}.office_id ;;
  }

  dimension: office_name {
    type: string
    sql: ${TABLE}.office_name ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_item_id {
    type: number
    sql: ${TABLE}.order_item_id ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number ;;
  }

  dimension: order_type {
    type: string
    sql: ${TABLE}.order_type ;;
  }

  dimension: product_category_id {
    type: number
    sql: ${TABLE}.product_category_id ;;
  }

  dimension: product_category_name {
    type: string
    sql: ${TABLE}.product_category_name ;;
  }

  dimension: product_checkin_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_checkin_id ;;
  }

  dimension: product_checkin_uid {
    type: string
    sql: ${TABLE}.product_checkin_uid ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: product_type_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_type_id ;;
  }

  dimension: product_type_name {
    type: string
    sql: ${TABLE}.product_type_name ;;
  }

  dimension: refund_amount {
    type: number
    sql: ${TABLE}.refund_amount ;;
  }

  dimension: refund_qty {
    type: number
    sql: ${TABLE}.refund_qty ;;
  }

  dimension_group: refunded {
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
    sql: ${TABLE}.refunded_at ;;
  }

  dimension: refunded_by_user_id {
    type: number
    sql: ${TABLE}.refunded_by_user_id ;;
  }

  dimension: refunded_user_name {
    type: string
    sql: ${TABLE}.refunded_user_name ;;
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

  measure: number_of_refund_products {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      product_name,
      product_type_name,
      product_category_name,
      office_name,
      refunded_user_name,
      register_name,
      products.prod_name,
      products.wm_product_id,
      products.brand_product_strain_name,
      product_types.id,
      product_types.name,
      product_checkins.id,
      product_checkins.vendor_name,
      register.id,
      register.name,
      register.application_name
    ]
  }
}
