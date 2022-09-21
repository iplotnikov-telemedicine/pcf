view: tax_excise {
  sql_table_name: {% if _model._name == 'pcf_company' %}@{schema_name}.{% endif %}tax_excise ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: is_applied_to_discounted_sdp {
    type: yesno
    sql: ${TABLE}.is_applied_to_discounted_sdp ;;
  }

  dimension: is_enabled {
    type: yesno
    sql: ${TABLE}.is_enabled ;;
  }

  dimension: is_included_city_local_tax_sdp {
    type: yesno
    sql: ${TABLE}.is_included_city_local_tax_sdp ;;
  }

  dimension: is_included_delivery_fee_nsdp {
    type: yesno
    sql: ${TABLE}.is_included_delivery_fee_nsdp ;;
  }

  dimension: is_included_delivery_fee_sdp {
    type: yesno
    sql: ${TABLE}.is_included_delivery_fee_sdp ;;
  }

  dimension: rate_nsdp {
    type: number
    sql: ${TABLE}.rate_nsdp ;;
  }

  dimension: rate_sdp {
    type: number
    sql: ${TABLE}.rate_sdp ;;
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

  dimension: tax_tier_version_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.tax_tier_version_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, tax_tier_versions.id, tax_tier_versions.name]
  }
}
