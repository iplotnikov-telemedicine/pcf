view: adjustment {
  sql_table_name: {% if _model._name == 'pcf_company' %}@{schema_name}.{% endif %}adjustment ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: adjustment_reason_id {
    type: number
    sql: ${TABLE}.adjustment_reason_id ;;
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

  dimension: external_reason_id {
    type: number
    sql: ${TABLE}.external_reason_id ;;
  }

  dimension: had_under_package_control {
    type: yesno
    sql: ${TABLE}.had_under_package_control ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: product_transaction_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_transaction_id ;;
  }

  dimension: reason_type {
    type: number
    sql: ${TABLE}.reason_type ;;
  }

  dimension: rec_expense_id {
    type: number
    sql: ${TABLE}.rec_expense_id ;;
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

  measure: number_of_adjustment {
    type: count
    drill_fields: [id, product_transactions.id, product_transactions.product_name, product_transactions.product_to_name]
  }
}
