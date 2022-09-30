# If necessary, uncomment the line below to include explore_source.
# include: "kolas.model.lkml"

view: inventory_log_agg {
  derived_table: {
    explore_source: inventory_log {
      column: id {}
      column: product_id {}
      column: order_item_id {}
      column: total_unit_quantity {}
      column: item_type {}
      column: storage_id {}
      column: created_date {}
    }
  }
  dimension: id {
    description: ""
    type: number
  }
  dimension: product_id {
    description: ""
    type: number
  }
  dimension: order_item_id {
    description: ""
    type: number
  }
  dimension: total_unit_quantity {
    description: "Inventory storage quantity"
    type: number
  }
  dimension: item_type {
    description: ""
  }
  dimension: storage_id {
    description: ""
    type: number
  }
  dimension: created_date {
    description: ""
    type: date
  }
  measure: sum_total_unit_quantity {
    type: sum
    value_format: "0"
    sql: ${TABLE}.total_unit_quantity;;
  }
  measure: running_total_unit_quantity {
    type: running_total
    value_format: "0"
    sql: ${TABLE}.total_unit_quantity ;;
  }
}
