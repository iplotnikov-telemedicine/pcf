view: tax_sales_rates {
  sql_table_name: {% if _model._name == 'pcf_company' %}@{schema_name}.{% endif %}tax_sales_rates ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: is_approved {
    type: yesno
    sql: ${TABLE}.is_approved ;;
  }

  dimension: location_key {
    type: string
    sql: ${TABLE}.location_key ;;
  }

  dimension: location_name {
    type: string
    sql: ${TABLE}.location_name ;;
  }

  dimension: location_type {
    type: string
    sql: ${TABLE}.location_type ;;
  }

  dimension: mmj_rate {
    type: number
    sql: ${TABLE}.mmj_rate ;;
  }

  dimension: non_mmj_rate {
    type: number
    sql: ${TABLE}.non_mmj_rate ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
  }

  dimension: sales_tax_id {
    type: number
    sql: ${TABLE}.sales_tax_id ;;
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

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, location_name]
  }
}
