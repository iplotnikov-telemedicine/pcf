view: account_transaction {
  sql_table_name: {% if _model._name == 'pcf_company' %}@{schema_name}.{% endif %}account_transaction ;;
  drill_fields: [transfer_account_transaction_id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: transfer_account_transaction_id {
    type: number
    sql: ${TABLE}.transfer_account_transaction_id ;;
  }

  dimension: account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
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

  dimension: info {
    type: string
    sql: ${TABLE}.info ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: office_id {
    type: number
    sql: ${TABLE}.office_id ;;
  }

  dimension: payment_type {
    type: number
    sql: ${TABLE}.payment_type ;;
  }

  dimension: product_transaction_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_transaction_id ;;
  }

  dimension: rec_expense_category_id {
    type: number
    sql: ${TABLE}.rec_expense_category_id ;;
  }

  dimension: rec_expense_id {
    type: number
    sql: ${TABLE}.rec_expense_id ;;
  }

  dimension: register_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.register_id ;;
  }

  dimension: staff_id {
    type: number
    sql: ${TABLE}.staff_id ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: transfer_account_id {
    type: number
    sql: ${TABLE}.transfer_account_id ;;
  }

  dimension: type {
    type: number
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

  measure: number_of_account_transactions {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      transfer_account_transaction_id,
      account.id,
      account.name,
      product_transactions.id,
      product_transactions.product_name,
      product_transactions.product_to_name,
      register.id,
      register.name,
      register.application_name
    ]
  }
}
