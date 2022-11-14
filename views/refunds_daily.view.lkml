# If necessary, uncomment the line below to include explore_source.
# include: "kolas.model.lkml"

view: refunds_daily {
  derived_table: {
    explore_source: order_items {
      timezone: query_timezone
      column: report_date { field: order_item_refunds.returned_date }
      column: office_id { field: offices.office_id }
      column: sum_refund_wo_tax { field: order_item_refunds.sum_refund_wo_tax }
      column: refund_sdp_excise_tax_sum { field: order_item_refunds.refund_sdp_excise_tax_sum }
      column: refund_nsdp_excise_tax_sum { field: order_item_refunds.refund_nsdp_excise_tax_sum }
      column: total_tax_refunded { field: order_item_refunds.total_tax_refunded }
      bind_filters: {
        to_field: order_item_refunds.returned_date
        from_field: refunds_daily.report_date
      }
      # bind_all_filters: yes
    }
  }
  dimension: report_date {
    description: ""
    type: date
  }
  dimension: office_id {
    description: ""
    type: number
  }
  dimension: sum_refund_wo_tax {
    description: "Returned Amount wo Tax"
    value_format_name: usd
    type: number
  }
  dimension: refund_sdp_excise_tax_sum {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: refund_nsdp_excise_tax_sum {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: total_tax_refunded {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }

}
