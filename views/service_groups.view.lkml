view: service_groups {
  sql_table_name: {% if _model._name == 'pcf_company' %}@{schema_name}.{% endif %}service_groups ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: number_of_service_groups {
    type: count
    drill_fields: [id, name]
  }
}
