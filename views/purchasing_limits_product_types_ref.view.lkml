view: purchasing_limits_product_types_ref {
  sql_table_name: purchasing_limits_product_types_ref ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: product_type_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_type_id ;;
  }

  dimension: purchasing_limit_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.purchasing_limit_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, purchasing_limits.id, purchasing_limits.limit_name, product_types.id, product_types.name]
  }
}
