view: brands {
  sql_table_name: {% if _model._name == 'pcf_ext' %}ext_indica_{% endif %}c4546_company.brands ;;
  drill_fields: [brand_id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand_id {
    type: number
    sql: ${TABLE}.brand_id ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
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

  dimension: wm_id {
    type: number
    sql: ${TABLE}.wm_id ;;
  }

  dimension: is_internal {
    type: yesno
    sql: ${TABLE}.is_internal ;;
  }

  measure: number_of_brands {
    type: count
    drill_fields: [brand_id, brand_name, products.count]
  }
}
