view: product_transactions {
  sql_table_name: {% if _model._name == 'pcf_company' %}@{schema_name}.{% endif %}product_transactions ;;

  drill_fields: [id]

  filter: date_filter {
    type: date_time
  }

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

  dimension: is_filtered_with_dates {
    hidden: yes
    type: yesno
    sql: {% if date_filter._in_query %}
    ${date_raw} between {% date_start date_filter %} and {% date_end date_filter %}
    {% else %}
    1 = 1
    {% endif %} ;;
  }

  dimension: is_earlier_than_filtered {
    hidden: yes
    type: yesno
    sql: {% if date_filter._in_query %}
          ${date_raw} < {% date_start date_filter %}
          {% else %}
          1 = 1
          {% endif %} ;;
  }

  dimension: is_checked_in {
    type: yesno
    sql: ${TABLE}.type = 1;;
  }

  measure: quantity_checked_in {
    type: sum
    sql:  ${qty} ;;
    filters: [is_checked_in: "yes"]
  }

  dimension: is_adjustment_increase {
    type: yesno
    sql: ${TABLE}.type in (12, 15) ;;
  }

  measure: quantity_increased_by {
    type: sum
    sql:  ${qty} ;;
    filters: [is_adjustment_increase: "yes", is_filtered_with_dates: "yes"]
  }

  measure: quantity_increased_by_earlier {
    hidden: yes
    type: sum
    sql:  ${qty} ;;
    filters: [is_adjustment_increase: "yes", is_earlier_than_filtered: "yes"]
  }

  dimension: is_adjustment_decrease {
    type: yesno
    sql: ${TABLE}.type in (13, 16) ;;
  }

  measure: quantity_decreased_by {
    type: sum
    sql: ${qty} ;;
    filters: [is_adjustment_decrease: "yes", is_filtered_with_dates: "yes"]
  }

  measure: quantity_decreased_by_earlier {
    hidden: yes
    type: sum
    sql: ${qty} ;;
    filters: [is_adjustment_decrease: "yes", is_earlier_than_filtered: "yes"]
  }

  dimension: is_sold {
    type: yesno
    sql: ${TABLE}.type = 3;;
  }

  dimension: is_returned {
    type: yesno
    sql: ${TABLE}.type = 9;;
  }

  measure: quantity_sold {
    type: sum
    sql: ${qty} ;;
    filters: [is_sold: "yes", is_filtered_with_dates: "yes"]
  }

  measure: quantity_sold_earlier {
    hidden: yes
    type: sum
    sql: ${qty} ;;
    filters: [is_sold: "yes", is_earlier_than_filtered: "yes"]
  }

  measure: quantity_sold_within_date_range {
    type: number
    sql: ${quantity_sold} ;;
  }

  dimension: is_unlinked {
    description: "Transferred to another product"
    type: yesno
    sql: ${TABLE}.type = 10;;
  }

  measure: quantity_unlinked {
    type: sum
    sql:  ${qty} ;;
    filters: [is_unlinked: "yes", is_filtered_with_dates: "yes"]
  }

  measure: quantity_unlinked_earlier {
    hidden: yes
    type: sum
    sql:  ${qty} ;;
    filters: [is_unlinked: "yes", is_earlier_than_filtered: "yes"]
  }

  measure: quantity_returned {
    type: sum
    sql:  ${qty} ;;
    filters: [is_returned: "yes", is_filtered_with_dates: "yes"]
  }

  measure: quantity_returned_earlier {
    hidden: yes
    type: sum
    sql:  ${qty} ;;
    filters: [is_returned: "yes", is_earlier_than_filtered: "yes"]
  }


  measure: quantity_at_the_beginning {
    description: "Quantity available at the beginning of filtered range"
    type: number
    sql:  ${quantity_checked_in}
          - ${quantity_decreased_by_earlier}
          + ${quantity_increased_by_earlier}
          - ${quantity_sold_earlier}
          + ${quantity_returned_earlier}
          - ${quantity_unlinked_earlier}
          ;;
  }

  measure: quantity_at_the_end {
    description: "Quantity available at the end of filtered range"
    type: number
    sql: ${quantity_at_the_beginning}
          - ${quantity_decreased_by}
          + ${quantity_increased_by}
          - ${quantity_sold}
          + ${quantity_returned}
          - ${quantity_unlinked}
          ;;
  }

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
    value_format_name: usd
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
    value_format_name: usd
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
