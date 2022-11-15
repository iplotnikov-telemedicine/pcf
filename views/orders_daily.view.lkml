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
      column: total_cash_sales { field: orders.total_cash_sales }
      column: number_of_cash_transactions { field: orders.number_of_cash_transactions }
      column: sum_minutes_wait_time_store { field: orders.sum_minutes_wait_time_store }
      column: sum_minutes_wait_time_delivery { field: orders.sum_minutes_wait_time_delivery }
      column: count_of_orders { field: orders.count_of_orders }
      column: delivery_orders_count { field: orders.delivery_orders_count }
      column: office_id { field: offices.office_id }
      column: office_name { field: offices.office_name }
      bind_filters: {
        from_field: orders_daily.report_date
        to_field: orders.confirmed_date
      }
      # bind_all_filters: yes
    }
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
}
