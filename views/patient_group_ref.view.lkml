# The name of this view in Looker is "Patient Group Ref"
view: patient_group_ref {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: {% if _model._name == 'pcf_company' %}@{schema_name}.{% endif %}patient_group_ref ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Group ID" in Explore.

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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
    drill_fields: [id]
  }
}
