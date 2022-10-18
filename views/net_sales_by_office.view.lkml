view: net_sales_by_office {
  derived_table: {
    explore_source: orders_with_details {
      timezone: query_timezone
      column: office_id {}
      column: office_name {field: offices.office_name}
      column: sum_net_sales { field: order_items.sum_net_sales }
      column: sum_order_item_quantity {field: order_items.sum_order_item_quantity}
      filters: [offices.office_name: "-%DO NOT USE%, -%DEFECTIVE%"]
      bind_all_filters: yes
    }
  }
  dimension: office_id {
    primary_key: yes
    type: number
    description: ""
  }
  dimension: office_name {
    type: string
    description: ""
  }
  dimension: sum_net_sales {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: sum_order_item_quantity {
    description: ""
    value_format: "#,##0"
    type: number
  }
}
