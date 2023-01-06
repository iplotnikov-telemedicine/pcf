view: price_presets {
  sql_table_name: {% if _model._name == 'pcf_company' %}@{schema_name}.{% endif %}price_presets ;;
  drill_fields: [id]

  dimension: id  {
    type: number
    sql: ${TABLE}.id;;
  }
  dimension: name  {
    type: string
    sql: ${TABLE}.name;;
  }
  dimension: price_type {
    type: string
    sql: ${TABLE}.price_type;;
  }
  dimension: is_custom_price {
    type: yesno
    sql: ${TABLE}.is_custom_price;;
  }
  dimension: is_dynamic {
    type: yesno
    sql: ${TABLE}.is_dynamic;;
  }
}
