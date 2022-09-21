view: tax_payment_additional {
  sql_table_name: {% if _model._name == 'pcf_company' %}@{schema_name}.{% endif %}tax_payment_additional ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: delivery_tax {
    type: number
    sql: ${TABLE}.delivery_tax ;;
  }

  dimension: tax {
    type: number
    sql: ${TABLE}.tax ;;
  }

  dimension: tax_additional_name {
    type: string
    sql: ${TABLE}.tax_additional_name ;;
  }

  dimension: tax_payment_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.tax_payment_id ;;
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
    drill_fields: [id, tax_additional_name, tax_payment.id]
  }
}
