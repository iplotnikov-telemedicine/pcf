view: account_office_ref {
  sql_table_name: {% if _model._name == 'pcf_company' %}@{schema_name}.{% endif %}account ;;
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

  dimension: office_id {
    type: number
    sql: ${TABLE}.office_id ;;
  }

  measure: number_of_office_ref {
    type: count
    drill_fields: [id, account.id, account.name]
  }
}
