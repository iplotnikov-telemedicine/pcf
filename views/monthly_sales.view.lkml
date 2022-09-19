view: monthly_sales {
  derived_table: {
    explore_source: order_items {
      timezone: query_timezone
      column: confirmed_month { field: orders.confirmed_month }
      column: interval_in_days { field: orders.interval_in_days }
      column: sum_gross_sale {}
      column: sum_net_sales {}
      column: sum_order_item_quantity {}
      column: sum_refund_wo_tax {}
      column: sum_internal_products {}
      column: sum_internal_value {}
      column: sum_discount_amount {}
      column: number_of_orders { field: orders.number_of_orders }
      column: sum_excise_w_delivery { field: tax_payment.sum_excise_w_delivery }
    }
  }
  dimension: confirmed_month {
    description: ""
    type: date_month
  }
  dimension: sum_gross_sale {
    description: ""
    value_format: "$#,##0"
    type: number
  }
  dimension: sum_net_sales {
    description: ""
    value_format: "$#,##0"
    type: number
  }
  dimension: sum_order_item_quantity {
    description: ""
    value_format: "#,##0"
    type: number
  }
  dimension: sum_refund_wo_tax {
    description: ""
    value_format: "$#,##0"
    type: number
  }
  dimension: sum_internal_products {
    description: ""
    type: number
  }
  dimension: sum_internal_value {
    description: ""
    value_format: "$#,##0"
    type: number
  }
  dimension: sum_discount_amount {
    description: ""
    value_format: "$#,##0"
    type: number
  }
  dimension: number_of_orders {
    description: ""
    type: number
  }
  dimension: sum_excise_w_delivery {
    description: ""
    value_format: "$#,##0"
    type: number
  }
}
