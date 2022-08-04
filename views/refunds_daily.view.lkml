# If necessary, uncomment the line below to include explore_source.
# include: "kolas.model.lkml"

view: refunds_daily {
  derived_table: {
    explore_source: order_items {
      timezone: query_timezone
      column: report_date { field: order_item_refunds.returned_date }
      column: sum_refund_wo_tax { field: order_item_refunds.sum_refund_wo_tax }
      column: office_id { field: offices.office_id }
      # bind_all_filters: yes
    }
  }
  dimension: report_date {
    description: ""
    type: date
  }
  dimension: sum_refund_wo_tax {
    description: "Returned Amount wo Tax"
    value_format_name: usd
    type: number
  }
  dimension: office_id {
    description: ""
    type: number
  }
}
