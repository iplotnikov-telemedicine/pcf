view: product_office_quantity {
  sql_table_name: product_office_qty ;;

  dimension: id {
    type: number
    sql: ${TABLE}.poq_id ;;
  }

  dimension: item_type {
    type: string
    sql: ${TABLE}.poq_item_type ;;
  }

  dimension: office_id {
    type: number
    sql: ${TABLE}.poq_office_id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.poq_prod_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.poq_qty ;;
  }

  dimension: reserved_qty {
    type: number
    sql: ${TABLE}.reserved_qty ;;
  }

  dimension_group: sync_created {
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
    sql: ${TABLE}.sync_created_at ;;
  }

  dimension_group: sync_updated {
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
    sql: ${TABLE}.sync_updated_at ;;
  }

  measure: number_of_product_office_quantity {
    type: count
    drill_fields: []
  }
}
