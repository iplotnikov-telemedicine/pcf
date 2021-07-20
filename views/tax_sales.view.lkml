view: tax_sales {
  sql_table_name: tax_sales ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: is_applied_based_on_delivery_address {
    type: yesno
    sql: ${TABLE}.is_applied_based_on_delivery_address ;;
  }

  dimension: is_applied_to_discounted_price {
    type: yesno
    sql: ${TABLE}.is_applied_to_discounted_price ;;
  }

  dimension: is_enabled {
    type: yesno
    sql: ${TABLE}.is_enabled ;;
  }

  dimension: is_included_city_local_tax {
    type: yesno
    sql: ${TABLE}.is_included_city_local_tax ;;
  }

  dimension: is_included_delivery_fee {
    type: yesno
    sql: ${TABLE}.is_included_delivery_fee ;;
  }

  dimension: is_included_excise_tax {
    type: yesno
    sql: ${TABLE}.is_included_excise_tax ;;
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
