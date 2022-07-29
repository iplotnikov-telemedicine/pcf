view: product_transactions {
  sql_table_name: product_transactions ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: base_weight {
    type: number
    sql: ${TABLE}.base_weight ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: doctor_id {
    type: number
    sql: ${TABLE}.doctor_id ;;
  }

  dimension: item_type {
    type: string
    sql: ${TABLE}.item_type ;;
  }

  dimension: is_adjustment_increase {
    type: yesno
    sql: ${TABLE}.type = 12;;
  }

  measure: quantity_increased_by {
    type: sum
    sql:  ${qty} ;;
  #   sql: CASE WHEN ${date_raw} between {% date_start order_items.date_filter %}
  # and {% date_end order_items.date_filter %} THEN ${qty} END ;;
    filters: [is_adjustment_increase: "yes"]
  }

  dimension: is_adjustment_decrease {
    type: yesno
    sql: ${TABLE}.type = 13;;
  }

  measure: quantity_decreased_by {
    type: sum
    sql: -${qty} ;;
  #   sql: CASE WHEN ${date_raw} between {% date_start order_items.date_filter %}
  # and {% date_end order_items.date_filter %} THEN ${qty} END ;;
    filters: [is_adjustment_decrease: "yes"]
  }

  dimension: is_sold {
    type: yesno
    sql: ${TABLE}.type = 3;;
  }

  measure: quantity_sold {
    type: sum
    sql:  -${qty} ;;
    #   sql: CASE WHEN ${date_raw} between {% date_start order_items.date_filter %}
    # and {% date_end order_items.date_filter %} THEN ${qty} END ;;
    filters: [is_sold: "yes"]
  }

  dimension: is_unlinked {
    description: "Transferred to another product"
    type: yesno
    sql: ${TABLE}.type = 10;;
  }

  measure: quantity_unlinked {
    type: sum
    sql:  -${qty} ;;
    #   sql: CASE WHEN ${date_raw} between {% date_start order_items.date_filter %}
    # and {% date_end order_items.date_filter %} THEN ${qty} END ;;
    filters: [is_unlinked: "yes"]
  }

  dimension: is_returned {
    type: yesno
    sql: ${TABLE}.type = 9 ;;
  }

  measure: quantity_returned {
    type: sum
    sql:  ${qty} ;;
    #   sql: CASE WHEN ${date_raw} between {% date_start order_items.date_filter %}
    # and {% date_end order_items.date_filter %} THEN ${qty} END ;;
    filters: [is_returned: "yes"]
  }

  # dimension: is_hold {
  #   type: yesno
  #   sql: ${TABLE}.type in (16) ;;
  # }

  # measure: quantity_hold {
  #   type: sum
  #   sql:  -${qty} ;;
  #   #   sql: CASE WHEN ${date_raw} between {% date_start order_items.date_filter %}
  #   # and {% date_end order_items.date_filter %} THEN ${qty} END ;;
  #   filters: [is_hold: "yes"]
  # }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: office_id {
    type: number
    sql: ${TABLE}.office_id ;;
  }

  dimension: office_to_id {
    type: number
    sql: ${TABLE}.office_to_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: price_per {
    type: string
    sql: ${TABLE}.price_per ;;
  }

  dimension: product_checkin_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_checkin_id ;;
  }

  dimension: product_checkin_to_id {
    type: number
    sql: ${TABLE}.product_checkin_to_id ;;
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

  dimension: product_to_id {
    type: number
    sql: ${TABLE}.product_to_id ;;
  }

  dimension: product_to_name {
    type: string
    sql: ${TABLE}.product_to_name ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
  }

  dimension: qty_free {
    type: number
    sql: ${TABLE}.qty_free ;;
  }

  dimension: total_price {
    type: number
    sql: ${TABLE}.total_price ;;
  }

  dimension: transfer_direction {
    type: string
    sql: ${TABLE}.transfer_direction ;;
  }

  dimension: transaction_type {
    type: number
    sql: ${TABLE}.type ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: number_of_product_transaction {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      product_name,
      product_to_name,
      products.prod_name,
      products.wm_product_id,
      products.brand_product_strain_name,
      product_checkins.id,
      product_checkins.vendor_name,
      account_transaction.count,
      adjustment.count
    ]
  }
}
