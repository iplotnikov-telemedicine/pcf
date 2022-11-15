include: "order_items.view"

view: order_items_with_details {
  extends: [order_items]

  dimension: cart_discount_per_item {
    type: number
    sql: ${order_items.total_amount}/${orders.total_amount} * ${orders.sum_discount} ;;
    value_format_name: usd
  }

  dimension: refund_sdp_excise_tax {
    type: number
    sql: COALESCE(IF(${products.is_excise} = 1, (${tax_payment.excise_tax} * ${returned_amount}) / ${paid_amount}, 0 ), 0) ;;
  }

  measure: refund_sdp_excise_tax_sum {
    type: sum
    sql: ${refund_sdp_excise_tax} ;;
  }

  dimension: refund_nsdp_excise_tax {
    type: number
    sql: COALESCE(IF(${products.is_excise} = 1, 0, (${tax_payment.excise_tax} * ${returned_amount}) / ${paid_amount}), 0) ;;
  }

  measure: refund_nsdp_excise_tax_sum {
    type: sum
    sql: ${refund_nsdp_excise_tax} ;;
  }

  measure: total_tax_refunded {
    type: number
    sql: ${total_returned_amount} - ${sum_refund_wo_tax} ;;
  }

}
