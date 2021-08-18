view: purchasing_limit_patient_limit_operations {
  sql_table_name: purchasing_limit_patient_limit_operations ;;
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

  dimension: limit_action {
    type: string
    sql: ${TABLE}.limit_action ;;
  }

  dimension: order_item_id {
    type: number
    sql: ${TABLE}.order_item_id ;;
  }

  dimension: order_item_qty {
    type: number
    sql: ${TABLE}.order_item_qty ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
  }

  dimension: patient_is_medical {
    type: yesno
    sql: ${TABLE}.patient_is_medical ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_measurement_type {
    type: string
    sql: ${TABLE}.product_measurement_type ;;
  }

  dimension: product_net_weight {
    type: number
    sql: ${TABLE}.product_net_weight ;;
  }

  dimension: product_twcc {
    type: number
    sql: ${TABLE}.product_twcc ;;
  }

  dimension: product_type_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_type_id ;;
  }

  dimension_group: purchase {
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
    sql: ${TABLE}.purchase_date ;;
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

  measure: number_of_purchasing_limit_patient_limit_operations {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      products.prod_name,
      products.wm_product_id,
      products.brand_product_strain_name,
      product_types.id,
      product_types.name
    ]
  }
}
