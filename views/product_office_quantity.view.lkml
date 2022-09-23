view: product_office_quantity {
  sql_table_name: {% if _model._name == 'pcf_company' %}@{schema_name}.{% endif %}product_office_qty ;;

  dimension: id {
    type: number
    sql: ${TABLE}.poq_id ;;
    primary_key: yes
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

  measure: total_quantity {
    type: sum
    sql: ${quantity} ;;
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

  dimension: weight_of_item {
    type: number
    sql:
    CASE poq_item_type
      WHEN 'gram' THEN 1
      WHEN 'pp_eighth' THEN 3.5
      WHEN 'pp_quarter' THEN 7
      WHEN 'pp_half' THEN 14
      WHEN 'pp_ounce' THEN 28
      WHEN 'joint' THEN 1
      ELSE 1
    END ;;
  }

  dimension: item_quantity {
    type:  number
    sql: ${quantity} * ${weight_of_item} ;;
  }

  measure: total_item_quantity {
    type: sum
    sql:  ${item_quantity} ;;
  }

  # measure: storage_total_item_quantity {
  #   type: sum
  #   sql:  ${item_quantity} ;;
  #   filters: [offices.is_storage: "yes"]
  # }

  # measure: shelf_total_item_quantity {
  #   type: sum
  #   sql:  ${item_quantity} ;;
  #   filters: [offices.is_storage: "no"]
  # }

  measure: number_of_product_office_quantity {
    type: count
    drill_fields: []
  }
}
