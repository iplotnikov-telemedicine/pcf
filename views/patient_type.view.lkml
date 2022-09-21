view: patient_type {
  sql_table_name: {% if _model._name == 'pcf_company' %}@{schema_name}.{% endif %}patient_type ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: image {
    type: string
    sql: ${TABLE}.image ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.`key` ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: number_of_patient_types {
    type: count
    drill_fields: [id, name]
  }
}
