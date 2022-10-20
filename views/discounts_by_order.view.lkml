# If necessary, uncomment the line below to include explore_source.
# include: "kolas.model.lkml"

view: discounts_by_order {
  derived_table: {
    explore_source: product_transactions {
      column: id { field: orders.id }
      column: item_discount_amount { field: order_items.sum_discount_amount }
      column: total_discount_amount { field: orders.sum_discount }
      bind_all_filters: yes
    }
  }
  dimension: id {
    description: ""
    type: number
  }
  dimension: item_discount_amount {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: total_discount_amount {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: cart_discount_amount {
    description: ""
    value_format: "$#,##0.00"
    type: number
    sql:  ${total_discount_amount} - ${item_discount_amount} ;;
  }
}
