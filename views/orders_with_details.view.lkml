include: "orders.view"

view: orders_with_details {
  extends: [orders]

  measure: items {
    type: list
    list_field: order_items.json_details
  }

  measure: taxes {
    type: list
    list_field: tax_payment_flat.json_details
  }

}
