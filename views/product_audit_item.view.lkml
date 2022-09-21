# The name of this view in Looker is "Product Audit Item"
view: product_audit_item {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: {% if _model._name == 'pcf_company' %}@{schema_name}.{% endif %}product_audit_item ;;
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
  # This dimension will be called "Audit ID" in Explore.

  dimension: audit_id {
    type: number
    sql: ${TABLE}.audit_id ;;
  }

  dimension: item_type {
    type: string
    sql: ${TABLE}.item_type ;;
  }

  dimension: package_id {
    type: number
    sql: ${TABLE}.package_id ;;
  }

  dimension: package_uid {
    type: string
    sql: ${TABLE}.package_uid ;;
  }

  dimension: product_category_id {
    type: number
    sql: ${TABLE}.product_category_id ;;
  }

  dimension: product_category_name {
    type: string
    sql: ${TABLE}.product_category_name ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_is_branded {
    type: yesno
    sql: ${TABLE}.product_is_branded ;;
  }

  dimension: product_is_metrc {
    type: yesno
    sql: ${TABLE}.product_is_metrc ;;
  }

  dimension: product_is_mmj {
    type: yesno
    sql: ${TABLE}.product_is_mmj ;;
  }

  dimension: product_is_under_package_control {
    type: yesno
    sql: ${TABLE}.product_is_under_package_control ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: product_strain {
    type: yesno
    sql: ${TABLE}.product_strain ;;
  }

  dimension: qty_actual {
    type: number
    sql: ${TABLE}.qty_actual ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_qty_actual {
    type: sum
    sql: ${qty_actual} ;;
  }

  measure: average_qty_actual {
    type: average
    sql: ${qty_actual} ;;
  }

  dimension: qty_adjusted {
    type: number
    sql: ${TABLE}.qty_adjusted ;;
  }

  dimension: qty_expected {
    type: number
    sql: ${TABLE}.qty_expected ;;
  }

  measure: count {
    type: count
    drill_fields: [id, product_category_name, product_name]
  }
}
