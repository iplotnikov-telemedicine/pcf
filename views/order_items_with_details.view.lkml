include: "order_items.view"

view: order_items_with_details {
  extends: [order_items]

  dimension: cart_discount_per_item {
    type: number
    sql: ${order_items.total_amount}/${orders.total_amount} * ${orders.sum_discount} ;;
    value_format_name: usd
  }

}
