view: services {
  sql_table_name: {% if _model._name == 'pcf_company' %}@{schema_name}.{% endif %}services ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: bundle_deal_image_mobile {
    type: string
    sql: ${TABLE}.bundle_deal_image_mobile ;;
  }

  dimension: bundle_deal_image_web {
    type: string
    sql: ${TABLE}.bundle_deal_image_web ;;
  }

  dimension: company_id {
    type: number
    sql: ${TABLE}.company_id ;;
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: is_bundle_deal {
    type: yesno
    sql: ${TABLE}.is_bundle_deal ;;
  }

  dimension: is_custom {
    type: yesno
    sql: ${TABLE}.is_custom ;;
  }

  dimension: level {
    type: number
    sql: ${TABLE}.level ;;
  }

  measure: total_level {
    type: sum
    sql: ${level} ;;
  }

  measure: average_level {
    type: average
    sql: ${level} ;;
  }

  dimension: lft {
    type: number
    sql: ${TABLE}.lft ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: office_id {
    type: number
    sql: ${TABLE}.office_id ;;
  }

  dimension: project_id {
    type: number
    sql: ${TABLE}.project_id ;;
  }

  dimension: rgt {
    type: number
    sql: ${TABLE}.rgt ;;
  }

  dimension: service_group_id {
    type: number
    sql: ${TABLE}.service_group_id ;;
  }

  dimension: service_key {
    type: string
    sql: ${TABLE}.service_key ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
