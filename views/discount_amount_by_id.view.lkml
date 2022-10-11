view: discount_amount_by_id {
  derived_table: {
    explore_source: order_items {
      bind_all_filters: yes
      column: id { field: discounts.id }
      column: sum_total_discounts { field: orders.sum_total_discounts }
      column: sum_discount_amount {}
      column: discount_apply_type { field: discounts.discount_apply_type }
      column: sum_net_sales {}
    }
  }

  dimension: id {
    primary_key: yes
    description: "Unique ID for each discount"
    type: number
  }
  dimension: sum_total_discounts {
    # value_format: "$#,##0.00"
    type: number
  }
  dimension: sum_discount_amount {
    # value_format: "$#,##0.00"
    type: number
  }
  dimension: discount_apply_type {
    description: "Discount apply type"
  }
  dimension: sum_net_sales {
    description: "Discount apply type"
  }
  dimension: discount_amount_in_usd {
    type: number
    sql: IF(${discount_apply_type} = 'cart', ${sum_total_discounts}, ${sum_discount_amount}) ;;
    value_format_name: usd
  }

  measure: net_sales_by_discount {
    type:  sum
    sql: ${sum_net_sales} ;;
    value_format_name: usd
  }
}
