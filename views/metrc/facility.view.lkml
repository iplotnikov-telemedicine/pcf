# The name of this view in Looker is "Facility"
view: facility {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: metrc.facility ;;
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
  # This dimension will be called "Alias" in Explore.

  dimension: alias {
    type: string
    sql: ${TABLE}.alias ;;
  }

  dimension: can_assign_locations_to_packages {
    type: yesno
    sql: ${TABLE}.can_assign_locations_to_packages ;;
  }

  dimension: company_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.company_id ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension: is_medical {
    type: yesno
    sql: ${TABLE}.is_medical ;;
  }

  dimension: is_retail {
    type: yesno
    sql: ${TABLE}.is_retail ;;
  }

  dimension: license_number {
    type: string
    sql: ${TABLE}.license_number ;;
  }

  dimension: license_type {
    type: string
    sql: ${TABLE}.license_type ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: synced {
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
    sql: ${TABLE}.synced_at ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      display_name,
      name,
      company.id,
      manifest.count,
      package.count
    ]
  }
}
