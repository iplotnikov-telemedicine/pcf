# If necessary, uncomment the line below to include explore_source.
# include: "kolas.model.lkml"

view: orders_daily {
  derived_table: {
    explore_source: order_items {
      timezone: query_timezone
      column: report_date { field: orders.confirmed_date }
      column: sum_gross_sale { field: order_items.sum_gross_sale }
      column: total_tax { field: orders.total_tax }
      column: sum_total_discounts { field: orders.sum_total_discounts }
      column: sum_total_amount { field: orders.sum_total_amount }
      column: total_credit_card_sales { field: orders.total_credit_card_sales }
      column: number_of_credit_card_transactions { field: orders.number_of_credit_card_transactions }
      column: number_of_cc_terminal_transactions { field: orders.number_of_cc_terminal_transactions }
      column: total_cash_sales { field: orders.total_cash_sales }
      column: number_of_cash_transactions { field: orders.number_of_cash_transactions }
      column: sum_minutes_wait_time_store { field: orders.sum_minutes_wait_time_store }
      column: sum_minutes_wait_time_delivery { field: orders.sum_minutes_wait_time_delivery }
      column: count_of_orders { field: orders.count_of_orders }
      column: delivery_orders_count { field: orders.delivery_orders_count }
      column: office_id { field: offices.office_id }
      column: office_name { field: offices.office_name }
      column: total_check_sales { field: orders.total_check_sales}
      column: total_cc_terminal_sales { field: orders.total_cc_terminal_sales}
      column: total_bonus_sales { field: orders.total_bonus_sales}
      column: sum_applied_sweede_credits { field: orders.sum_applied_sweede_credits}
      column: total_dc_terminal_sales { field: orders.total_dc_terminal_sales}
      column: sum_all_methods_sales { field: orders.sum_all_methods_sales}
      # column: sum_net_sales { field: order_items.sum_net_sales }
      column: sum_refund_wo_tax {field:order_items.sum_refund_wo_tax}
      bind_filters: {
        from_field: orders_daily.report_date
        to_field: orders.confirmed_date
      }
      # bind_all_filters: yes
    }
  }
  dimension: refunds_wo_tax {
    description: ""
    type: number
    sql: ${refunds_daily.sum_refund_wo_tax} ;;
  }
  dimension: report_date {
    description: ""
    type: date
  }
  dimension: sum_gross_sale {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: sum_refund_wo_tax {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  # dimension: sum_net_sales {
  #   description: ""
  #   value_format: "$#,##0.00"
  #   type: number
  # }
  dimension: total_tax {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: sum_total_discounts {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: sum_total_amount {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: total_credit_card_sales {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: number_of_credit_card_transactions {
    description: ""
    type: number
  }
  dimension: number_of_cc_terminal_transactions {
    description: ""
    type: number
  }
  dimension: total_cash_sales {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: number_of_cash_transactions {
    description: ""
    type: number
  }
  dimension: sum_minutes_wait_time_store {
    description: ""
    type: number
  }
  dimension: sum_minutes_wait_time_delivery {
    description: ""
    type: number
  }
  dimension: count_of_orders {
    type: number
  }
  dimension: delivery_orders_count {
    type: number
  }
  dimension: office_id {
    description: ""
    type: number
  }
  filter: office_name {
    description: ""
    type: string
  }
  dimension: sum_all_methods_sales {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: total_check_sales {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: total_cc_terminal_sales {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: total_bonus_sales {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: sum_applied_sweede_credits {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: total_dc_terminal_sales {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  measure:  total_sum_all_methods_sales {
    type: sum
    sql:  ${sum_all_methods_sales};;
    value_format_name: usd
  }
  measure:  sum_cash_sales {
    hidden: yes
    type: sum
    sql:  ${total_cash_sales};;
    value_format_name: usd
  }
  measure:  sum_net_cash_sales {
    label: "Total Cash Net Sales"
    type: number
    sql:  ${sum_cash_sales} / ${total_sum_gross_sale} * ${total_sum_net_sales};;
    value_format_name: usd
  }
  measure:  sum_credit_card_sales {
    hidden: yes
    type: sum
    sql:  ${total_credit_card_sales};;
    value_format_name: usd
  }
  measure:  sum_net_credit_card_sales {
    label: "Total Credit Card Net Sales"
    type: number
    sql:  ${sum_credit_card_sales} / ${total_sum_gross_sale} * ${total_sum_net_sales};;
    value_format_name: usd
  }
  measure:  sum_check_sales {
    hidden: yes
    type: sum
    sql:  ${total_check_sales};;
    value_format_name: usd
  }
  measure:  sum_net_check_sales {
    label: "Total Check Net Sales"
    type: number
    sql:  ${total_check_sales} / ${total_sum_gross_sale} * ${total_sum_net_sales};;
    value_format_name: usd
  }
  measure:  sum_cc_terminal_sales {
    hidden: yes
    type: sum
    sql:  ${total_cc_terminal_sales};;
    value_format_name: usd
  }
  measure:  sum_net_cc_terminal_sales {
    label: "Total CC Terminal Net Sales"
    type: number
    sql:  ${sum_cc_terminal_sales} / ${total_sum_gross_sale} * ${total_sum_net_sales};;
    value_format_name: usd
  }
  measure:  sum_bonus_sales {
    hidden: yes
    type: sum
    sql:  ${total_bonus_sales};;
    value_format_name: usd
  }
  measure:  sum_net_bonus_sales {
    label: "Total Bonus Net Sales"
    type: number
    sql:  ${sum_bonus_sales} / ${total_sum_gross_sale} * ${total_sum_net_sales};;
    value_format_name: usd
  }
  measure:  sum_sweede_credits_sales {
    hidden: yes
    type: sum
    sql:  ${sum_applied_sweede_credits};;
    value_format_name: usd
  }
  measure:  sum_net_sweede_credits_sales {
    label: "Total Sweede Credits Net Sales"
    type: number
    sql:  ${sum_sweede_credits_sales} / ${total_sum_gross_sale} * ${total_sum_net_sales};;
    value_format_name: usd
  }
  measure:  sum_dc_terminal_sales {
    hidden: yes
    type: sum
    sql:  ${total_dc_terminal_sales};;
    value_format_name: usd
  }
  measure:  sum_net_dc_terminal_sales {
    label: "Total DC Terminal Net Sales"
    type: number
    sql:  ${sum_dc_terminal_sales} / ${total_sum_gross_sale} * ${total_sum_net_sales};;
    value_format_name: usd
  }
  measure:  total_sum_refunds_wo_tax {
    type: sum
    sql: ${refunds_wo_tax};;
    value_format_name: usd
  }
  measure:  total_sum_gross_sale {
    type: sum
    sql: ${sum_gross_sale};;
    value_format_name: usd
  }
  measure:  total_sum_net_sales {
    type: number
    sql: ${total_sum_gross_sale} - ${total_sum_refunds_wo_tax};;
    value_format_name: usd
  }
}
