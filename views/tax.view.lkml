view: tax {
  sql_table_name: tax ;;
  drill_fields: [parent_tax_id]

  dimension: parent_tax_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.parent_tax_id ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
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
    type: number
    sql: ${TABLE}.location_type ;;
  }

  dimension: mj_sales_tax_custom_rate {
    type: number
    sql: ${TABLE}.mj_sales_tax_custom_rate ;;
  }

  dimension: mj_sales_tax_is_custom {
    type: yesno
    sql: ${TABLE}.mj_sales_tax_is_custom ;;
  }

  dimension: mj_sales_tax_rate {
    type: number
    sql: ${TABLE}.mj_sales_tax_rate ;;
  }

  dimension: mj_tax_custom_rate {
    type: number
    sql: ${TABLE}.mj_tax_custom_rate ;;
  }

  dimension: mj_tax_is_custom {
    type: yesno
    sql: ${TABLE}.mj_tax_is_custom ;;
  }

  dimension: mj_tax_rate {
    type: number
    sql: ${TABLE}.mj_tax_rate ;;
  }

  dimension: sales_tax_custom_rate {
    type: number
    sql: ${TABLE}.sales_tax_custom_rate ;;
  }

  dimension: sales_tax_is_custom {
    type: yesno
    sql: ${TABLE}.sales_tax_is_custom ;;
  }

  dimension: sales_tax_rate {
    type: number
    sql: ${TABLE}.sales_tax_rate ;;
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

  dimension: tax_name {
    type: string
    sql: ${TABLE}.tax_name ;;
  }

  dimension: tax_profile_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.tax_profile_id ;;
  }

  dimension: tax_tier_version_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.tax_tier_version_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      parent_tax_id,
      tax_name,
      location_name,
      tax_profile.id,
      tax_profile.name,
      tax_tier_versions.id,
      tax_tier_versions.name
    ]
  }
}
