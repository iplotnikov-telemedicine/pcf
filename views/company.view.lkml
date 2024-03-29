view: company {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: {% if _model._name == 'pcf_company' %}ext_indica_{% endif %}backend.companies ;;
  #
  # # Define your dimensions and measures here, like this:
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.comp_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.comp_name ;;
  }

}
