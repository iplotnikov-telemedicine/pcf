view: package_splits {
  sql_table_name: package_splits ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: child_package_id {
    type: number
    sql: ${TABLE}.child_package_id ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: inherited_payment {
    type: number
    sql: ${TABLE}.inherited_payment ;;
  }

  dimension: parent_package_id {
    type: number
    sql: ${TABLE}.parent_package_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, account.id, account.name]
  }
}
