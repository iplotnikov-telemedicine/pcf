# If necessary, uncomment the line below to include explore_source.
# include: "any_company.model.lkml"

view: monthly_refunds {
  derived_table: {
    explore_source: order_items {
      timezone: query_timezone
      column: returned_month { field: order_item_refunds.returned_month }
      column: sum_refund_wo_tax { field: order_item_refunds.sum_refund_wo_tax }
      column: sum_refund_wo_tax { field: order_item_refunds.sum_refund_wo_tax }
      column: refund_sdp_excise_tax_sum { field: order_item_refunds.refund_sdp_excise_tax_sum }
      column: refund_nsdp_excise_tax_sum { field: order_item_refunds.refund_nsdp_excise_tax_sum }
      bind_filters: {
        to_field: order_items.returned_month
        from_field: monthly_sales.confirmed_month
      }
    }
  }
  dimension: returned_month {
    description: ""
    type: date_month
  }
  dimension: sum_refund_wo_tax {
    description: ""
    value_format: "$#,##0.00"
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

}



# dimension: refund_sdp_excise_tax {
#   type: number
#   sql: COALESCE(IF(${products.is_excise} = 1, (${tax_payment.excise_tax} * ${returned_amount}) / ${paid_amount}, 0 ), 0) ;;
# }

# dimension: refund_nsdp_excise_tax {
#   type: number
#   sql: COALESCE(IF(${products.is_excise} = 1, 0, (${tax_payment.excise_tax} * ${returned_amount}) / ${paid_amount}), 0) ;;
# }
