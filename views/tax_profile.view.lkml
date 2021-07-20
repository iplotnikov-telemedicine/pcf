view: tax_profile {
  sql_table_name: tax_profile ;;
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

  measure: count {
    type: count
    drill_fields: [id, name, patients.count, tax.count]
  }
}
