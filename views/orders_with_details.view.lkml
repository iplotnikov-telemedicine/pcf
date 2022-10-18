include: "orders.view"

view: orders_with_details {
  extends: [orders]

  filter: date_filter {
    type: date
    sql: ${confirmed_date}  between date_add({% date_start date_filter %}, interval -1 day) and {% date_end date_filter %} ;;
  }

  measure: items {
    type: list
    list_field: order_items.json_details
  }

  measure: taxes {
    type: list
    list_field: tax_payment_flat.json_details
  }

}
