# If necessary, uncomment the line below to include explore_source.
# include: "kushagram.model.lkml"

view: sales_by_product {
  derived_table: {
    explore_source: order_items {
      column: id { field: order_items.product_id }
      column: product_cost { field: order_items.product_cost }
      column: sum_order_item_quantity { field: order_items.sum_order_item_quantity }
      column: sum_net_sales { field: order_items.sum_net_sales }
      column: avg_unit_price { field: order_items.avg_unit_price }
      column: amount_sum { field: order_items.amount_sum }
      column: quantity_sum { field: order_items.quantity_sum }
      bind_filters: {
        from_field: orders.confirmed_at
        to_field: orders.confirmed_at
      }
    }
  }
  dimension: id {
    description: ""
    type: number
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
