view: tax_tier_versions {
  sql_table_name: {% if _model._name == 'pcf_ext' %}ext_indica_{% endif %}c4546_company.tax_tier_versions ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: is_perline_rounding {
    type: yesno
    sql: ${TABLE}.is_perline_rounding ;;
  }

  dimension: is_tax_included {
    type: yesno
    sql: ${TABLE}.is_tax_included ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
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

  dimension: tax_tier_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.tax_tier_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      tax_tier.id,
      tax.count,
      tax_additional.count,
      tax_city_local.count,
      tax_excise.count,
      tax_sales.count,
      tax_tier.count,
      warehouse_orders.count
    ]
  }
}
