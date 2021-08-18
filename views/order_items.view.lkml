view: warehouse_order_items {
  sql_table_name: warehouse_order_items ;;
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

  dimension: base_amount {
    type: number
    sql: ${TABLE}.base_amount ;;
  }

  dimension: charge_by {
    type: string
    sql: ${TABLE}.charge_by ;;
  }

  dimension: count {
    type: number
    sql: ${TABLE}.count ;;
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

  dimension: delivery_tax {
    type: number
    sql: ${TABLE}.delivery_tax ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.descr ;;
  }

  dimension: discount_amount {
    type: number
    sql: ${TABLE}.discount_amount ;;
  }

  dimension: discount_count {
    type: number
    sql: ${TABLE}.discount_count ;;
  }

  dimension: discount_id {
    type: number
    sql: ${TABLE}.discount_id ;;
  }

  dimension: discount_type {
    type: number
    sql: ${TABLE}.discount_type ;;
  }

  dimension: discount_type_bak {
    type: string
    sql: ${TABLE}.discount_type_bak ;;
  }

  dimension: discount_value {
    type: number
    sql: ${TABLE}.discount_value ;;
  }

  dimension_group: exchanged {
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
    sql: ${TABLE}.exchanged_at ;;
  }

  dimension: free_amount {
    type: number
    sql: ${TABLE}.free_amount ;;
  }

  dimension: free_discount {
    type: number
    sql: ${TABLE}.free_discount ;;
  }

  dimension: income {
    type: number
    sql: ${TABLE}.income ;;
  }

  dimension: is_charge_by_order {
    type: yesno
    sql: ${TABLE}.is_charge_by_order ;;
  }

  dimension: is_exchanged {
    type: yesno
    sql: ${TABLE}.is_exchanged ;;
  }

  dimension: is_excise {
    type: yesno
    sql: ${TABLE}.is_excise ;;
  }

  dimension: is_free {
    type: yesno
    sql: ${TABLE}.is_free ;;
  }

  dimension: is_half_eighth {
    type: yesno
    sql: ${TABLE}.is_half_eighth ;;
  }

  dimension: is_marijuana_product {
    type: yesno
    sql: ${TABLE}.is_marijuana_product ;;
  }

  dimension: is_metrc {
    type: yesno
    sql: ${TABLE}.is_metrc ;;
  }

  dimension: is_returned {
    type: yesno
    sql: ${TABLE}.is_returned ;;
  }

  dimension: is_under_package_control {
    type: yesno
    sql: ${TABLE}.is_under_package_control ;;
  }

  dimension: item_type {
    type: string
    sql: ${TABLE}.item_type ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: paid_amount {
    type: number
    sql: ${TABLE}.paid_amount ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: price_per {
    type: string
    sql: ${TABLE}.price_per ;;
  }

  dimension: price_type {
    type: string
    sql: ${TABLE}.price_type ;;
  }

  dimension: product_checkin_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_checkin_id ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_is_tax_exempt {
    type: yesno
    sql: ${TABLE}.product_is_tax_exempt ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.qty ;;
  }

  dimension: quantity_free {
    type: number
    sql: ${TABLE}.qty_free ;;
  }

  dimension: returned_amount {
    type: number
    sql: ${TABLE}.returned_amount ;;
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

  dimension: special_id {
    type: number
    sql: ${TABLE}.special_id ;;
  }

  dimension: special_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.special_item_id ;;
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

  dimension: tax {
    type: number
    sql: ${TABLE}.tax ;;
  }

  dimension: total_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
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

  dimension: wcii_cart_item {
    type: string
    sql: ${TABLE}.wcii_cart_item ;;
  }

  measure: number_of_order_items {
    type: count
    drill_fields: [detail*]
  }


  dimension: order_item_quantity {
    label: "Total order item Count"
    type: number
    sql: (${quantity} + ${quantity_free}) * ${count};;
  }

  dimension: gross_sale {
    label: "Gross sale"
    type: number
    sql: ${paid_amount} - ${tax} ;;
  }

  measure: total_order_item_quantity {
    type: sum
    sql: ${order_item_quantity} ;;
  }

  measure: sum_gross_sale {
    type: sum
    sql: ${gross_sale} ;;
    value_format_name: usd
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      products.prod_name,
      products.wm_product_id,
      products.brand_product_strain_name,
      special_items.id,
      product_checkins.id,
      product_checkins.vendor_name
    ]
  }
}
