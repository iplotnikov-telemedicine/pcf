# If necessary, uncomment the line below to include explore_source.
# include: "pcf.model.lkml"

view: packages {
  derived_table: {
    explore_source: inventory_log {
      column: id { field: inventory_log.package_id }
      column: product_id { field: products.id }
      column: office_id {field: inventory_log.storage_id}
      column: first_date {}
      column: last_date {}
      column: quantity_at_the_first_date {}
      column: quantity_at_the_last_date {}
      filters: {
        field: inventory_log.quantity_at_the_first_date
        value: ">0"
      }
      filters: {
        field: inventory_log.package_id
        value: "NOT NULL"
      }
    }
  }
  dimension: id {
    primary_key: yes
    description: ""
    type: number
  }
  dimension: product_id {
    description: ""
    type: number
  }
  dimension: office_id {
    description: ""
    type: number
  }
  dimension_group: first_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.first_date ;;
  }
  dimension_group: last_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_date ;;
  }
  dimension: quantity_at_the_first_date {
    description: ""
    type: number
  }
  dimension: quantity_at_the_last_date {
    description: ""
    type: number
  }
}
