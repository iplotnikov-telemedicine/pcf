include: "orders.view"

view: orders_ext {
  extends: [orders]

  measure:  sum_net_cash_sales {
    type: number
    sql:  ${total_cash_sales} / ${sum_all_methods_sales} * ${order_items.sum_net_sales};;
    value_format_name: usd
  }

  measure:  sum_net_credit_card_sales {
    type: number
    sql:  ${total_credit_card_sales} / ${sum_all_methods_sales} * ${order_items.sum_net_sales};;
    value_format_name: usd
  }

  measure:  sum_net_check_sales {
    type: number
    sql:  ${total_check_sales} / ${sum_all_methods_sales} * ${order_items.sum_net_sales};;
    value_format_name: usd
  }

  measure:  sum_net_cc_terminal_sales {
    type: number
    sql:  ${total_cc_terminal_sales} / ${sum_all_methods_sales} * ${order_items.sum_net_sales};;
    value_format_name: usd
  }

  measure:  sum_net_bonus_sales {
    type: number
    sql:  ${total_bonus_sales} / ${sum_all_methods_sales} * ${order_items.sum_net_sales};;
    value_format_name: usd
  }

  measure:  sum_net_sweede_credits_sales {
    type: number
    sql:  ${sum_applied_sweede_credits} / ${sum_all_methods_sales} * ${order_items.sum_net_sales};;
    value_format_name: usd
  }

  measure:  sum_net_dc_terminal_sales {
    type: number
    sql:  ${total_dc_terminal_sales} / ${sum_all_methods_sales} * ${order_items.sum_net_sales};;
    value_format_name: usd
  }

}
