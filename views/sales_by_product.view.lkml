# If necessary, uncomment the line below to include explore_source.
# include: "kushagram.model.lkml"

view: sales_by_product {
  derived_table: {
    explore_source: order_items {
      timezone: query_timezone
      column: id { field: order_items.product_id }
      column: order_item_id { field: order_items.id}
      column: product_cost { field: order_items.product_cost }
      column: office_id { field: orders.office_id }
      column: confirmed_date { field: orders.confirmed_date}
      column: num_days { field: orders.num_days }
      column: sum_order_item_quantity { field: order_items.sum_order_item_quantity }
      column: sum_net_sales { field: order_items.sum_net_sales }
      column: avg_unit_price { field: order_items.avg_unit_price }
      column: amount_sum { field: order_items.amount_sum }
      column: quantity_sum { field: order_items.quantity_sum }

      bind_filters: {
        from_field: sales_by_product.date_filter
        to_field: orders.confirmed_date
      }
      bind_filters: {
        from_field: orders.confirmed_at
        to_field: orders.confirmed_at
      }
    }
  }
  filter: date_filter {
    type: date
    sql: ${TABLE}.confirmed_date between {% date_start date_filter %} and {% date_end date_filter %} ;;
  }
  dimension: primary_key {
    primary_key: yes
    sql: ${TABLE}.order_item_id ;;
  }
  dimension: id {
    description: ""
    type: number
  }
  dimension: office_id {
    type: number
    sql: ${TABLE}.office_id;;
  }
  dimension: confirmed_date {
    type: date
    sql: ${TABLE}.confirmed_date;;
  }
  dimension: product_cost {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: sum_order_item_quantity {
    description: ""
    type: number
  }
  dimension: sum_net_sales {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: avg_unit_price {
    description: ""
    type: number
  }
  dimension: amount_sum {
    description: ""
    type: number
  }
  dimension: quantity_sum {
    description: ""
    type: number
  }
}
