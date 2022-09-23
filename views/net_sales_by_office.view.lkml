view: net_sales_by_office {
  derived_table: {
    explore_source: orders_with_details {
      timezone: query_timezone
      column: office_id {}
      column: sum_net_sales { field: order_items.sum_net_sales }
      column: sum_applied_potify_credits {}
      bind_all_filters: yes
    }
  }
  dimension: office_id {
    type: number
    description: ""
  }
  dimension: sum_net_sales {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
}
