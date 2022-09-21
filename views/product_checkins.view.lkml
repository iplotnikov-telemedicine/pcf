view: product_checkins {
  sql_table_name: {% if _model._name == 'pcf_company' %}@{schema_name}.{% endif %}product_checkins ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: available_qty {
    type: number
    sql: ${TABLE}.available_qty ;;
  }

  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
  }

  dimension: batch_id {
    type: string
    sql: ${TABLE}.batch_id ;;
  }

  dimension_group: best_by {
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
    sql: ${TABLE}.best_by_date ;;
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


  measure: last_checkin_at {
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
    sql: MAX(${date_raw}) ;;
  }


  dimension_group: deleted {
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
    sql: ${TABLE}.deleted_at ;;
  }

  dimension: facility_id {
    type: number
    sql: ${TABLE}.facility_id ;;
  }

  dimension_group: harvest {
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
    sql: ${TABLE}.harvest_date ;;
  }

  dimension: has_lab_result {
    type: yesno
    sql: ${TABLE}.has_lab_result ;;
  }

  dimension: is_finished {
    type: yesno
    sql: ${TABLE}.is_finished ;;
  }

  dimension: is_form_modified {
    type: yesno
    sql: ${TABLE}.is_form_modified ;;
  }

  dimension: is_metrc {
    type: yesno
    sql: ${TABLE}.is_metrc ;;
  }

  dimension: is_special {
    type: yesno
    sql: ${TABLE}.is_special ;;
  }

  dimension: is_under_package_control {
    type: yesno
    sql: ${TABLE}.is_under_package_control ;;
  }

  dimension: lab_result_id {
    type: number
    sql: ${TABLE}.lab_result_id ;;
  }

  dimension: metrc_initial_quantity {
    type: number
    sql: ${TABLE}.metrc_initial_quantity ;;
  }

  dimension: metrc_variance {
    type: number
    sql: ${TABLE}.metrc_variance ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: office_id {
    type: number
    sql: ${TABLE}.office_id ;;
  }

  dimension: opc {
    type: string
    sql: ${TABLE}.opc ;;
  }

  dimension_group: packaged {
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
    sql: ${TABLE}.packaged_date ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: cost_per_unit {
    type: number
    sql: ${price} / nullif(${qty}, 0) ;;
    value_format_name: usd
  }


  measure: price_sum {
    type: sum
    sql: ${TABLE}.price ;;
  }

  measure: qty_sum {
    type: sum
    sql: ${TABLE}.qty ;;
  }

  dimension: producer_id {
    type: number
    sql: ${TABLE}.producer_id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: production_run {
    type: string
    sql: ${TABLE}.production_run ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
  }

  dimension: sale_qty {
    type: number
    sql: ${TABLE}.sale_qty ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
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

  dimension: uid {
    type: string
    sql: ${TABLE}.uid ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: vendor_id {
    type: number
    sql: ${TABLE}.vendor_id ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }

  dimension: vendor_type {
    type: yesno
    sql: ${TABLE}.vendor_type ;;
  }

  measure: number_of_product_checkins {
    type: count
    drill_fields: [detail*]
  }

  dimension: external_barcode {
    type:  string
    sql: ${TABLE}.external_barcode ;;
  }
  # measure: starting_amount {
  #   type: number
  #   sql:  ${qty_sum} - ${order_items.sum_order_item_quantity_sold_before_date_start};;
  # }

  # measure: ending_amount {
  #   type: number
  #   sql:  ${starting_amount}
  #     + ${product_transactions.quantity_increased_by}
  #     - ${product_transactions.quantity_decreased_by}
  #     - ${order_items.sum_order_item_quantity_sold_in_range};;
  # }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      vendor_name,
      products.prod_name,
      products.wm_product_id,
      products.brand_product_strain_name,
      product_transactions.count,
      refunded_quantity.count,
      refund_products.count,
      warehouse_order_items.count
    ]
  }
}
