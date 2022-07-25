# The name of this view in Looker is "Manifest"
view: manifest {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: metrc.manifest ;;
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
  # This dimension will be called "Active Packages Quantity" in Explore.

  dimension: active_packages_quantity {
    type: number
    sql: ${TABLE}.active_packages_quantity ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_active_packages_quantity {
    type: sum
    sql: ${active_packages_quantity} ;;
  }

  measure: average_active_packages_quantity {
    type: average
    sql: ${active_packages_quantity} ;;
  }

  dimension: company_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.company_id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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

  dimension: facility_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.facility_id ;;
  }

  dimension: from_facility_license {
    type: string
    sql: ${TABLE}.from_facility_license ;;
  }

  dimension: from_facility_name {
    type: string
    sql: ${TABLE}.from_facility_name ;;
  }

  dimension: has_accepted_transfer {
    type: yesno
    sql: ${TABLE}.has_accepted_transfer ;;
  }

  dimension: number {
    type: string
    sql: ${TABLE}.number ;;
  }

  dimension: packages_quantity {
    type: number
    sql: ${TABLE}.packages_quantity ;;
  }

  dimension: pending_packages_quantity {
    type: number
    sql: ${TABLE}.pending_packages_quantity ;;
  }

  dimension_group: received {
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
    sql: ${TABLE}.received_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      from_facility_name,
      company.id,
      facility.display_name,
      facility.name,
      facility.id,
      package.count
    ]
  }
}
