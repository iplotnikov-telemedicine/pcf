view: package_quantity {
  sql_table_name: package_quantity ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }


  dimension: item_type {
    type: string
    sql: ${TABLE}.item_type ;;
  }

  dimension: office_id {
    type: number
    sql: ${TABLE}.office_id ;;
  }

  dimension: package_id {
    type: number
    sql: ${TABLE}.package_id ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: quantity_adjusted {
    type: number
    sql: ${TABLE}.quantity_adjusted ;;
  }

  dimension: quantity_available {
    type: number
    sql: ${TABLE}.quantity_available ;;
  }

  dimension: quantity_hold {
    type: number
    sql: ${TABLE}.quantity_hold ;;
  }

  dimension: quantity_initial {
    type: number
    sql: ${TABLE}.quantity_initial ;;
  }

  dimension: quantity_refunded {
    type: number
    sql: ${TABLE}.quantity_refunded ;;
  }

  dimension: quantity_sold {
    type: number
    sql: ${TABLE}.quantity_sold ;;
  }

  dimension_group: created {
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

  dimension_group: updated {
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


  measure: number_of_package_quantity {
    type: count
    drill_fields: [id, products.prod_name, products.wm_product_id, products.brand_product_strain_name]
  }
}
