view: monthly_refunds {
  derived_table: {
    explore_source: order_items {
      timezone: query_timezone
      column: returned_month { field: order_item_refunds.returned_month }
      column: sum_refund_wo_tax { field: order_item_refunds.sum_refund_wo_tax }
    }
  }
  dimension: returned_month {
    description: ""
    type: date_month
  }
  dimension: sum_refund_wo_tax {
    description: ""
    value_format: "$#,##0"
    type: number
  }
}
