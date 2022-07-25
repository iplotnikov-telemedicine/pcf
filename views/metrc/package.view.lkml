# The name of this view in Looker is "Package"
view: package {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: metrc.package ;;
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
  # This dimension will be called "Base Quantity" in Explore.

  dimension: base_quantity {
    type: number
    sql: ${TABLE}.base_quantity ;;
  }

  dimension: batch_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.batch_id ;;
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

  dimension_group: finished {
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
    sql: ${TABLE}.finished_date ;;
  }

  dimension: is_donation {
    type: yesno
    sql: ${TABLE}.is_donation ;;
  }

  dimension: is_finished {
    type: yesno
    sql: ${TABLE}.is_finished ;;
  }

  dimension: is_transferred_out {
    type: yesno
    sql: ${TABLE}.is_transferred_out ;;
  }

  dimension_group: lab_testing_state {
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
    sql: ${TABLE}.lab_testing_state_date ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension_group: last_modified {
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
    sql: ${TABLE}.last_modified ;;
  }

  dimension: manifest_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.manifest_id ;;
  }

  dimension: metrc_id {
    type: number
    sql: ${TABLE}.metrc_id ;;
  }

  dimension: metrc_item_id {
    type: number
    sql: ${TABLE}.metrc_item_id ;;
  }

  dimension: metrc_location_name {
    type: string
    sql: ${TABLE}.metrc_location_name ;;
  }

  dimension_group: packaged {
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
    sql: ${TABLE}.packaged_date ;;
  }

  dimension: product_category_name {
    type: string
    sql: ${TABLE}.product_category_name ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension_group: received_date {
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
    sql: ${TABLE}.received_date_time ;;
  }

  dimension: received_from_facility_license_number {
    type: string
    sql: ${TABLE}.received_from_facility_license_number ;;
  }

  dimension: received_from_facility_name {
    type: string
    sql: ${TABLE}.received_from_facility_name ;;
  }

  dimension: received_from_manifest_number {
    type: string
    sql: ${TABLE}.received_from_manifest_number ;;
  }

  dimension: receiver_wholesale_price {
    type: number
    sql: ${TABLE}.receiver_wholesale_price ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_receiver_wholesale_price {
    type: sum
    sql: ${receiver_wholesale_price} ;;
  }

  measure: average_receiver_wholesale_price {
    type: average
    sql: ${receiver_wholesale_price} ;;
  }

  dimension: shipper_wholesale_price {
    type: number
    sql: ${TABLE}.shipper_wholesale_price ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

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

  dimension: transfer_id {
    type: number
    sql: ${TABLE}.transfer_id ;;
  }

  dimension: unit_of_measure {
    type: string
    sql: ${TABLE}.unit_of_measure ;;
  }

  dimension: unit_of_measure_abbreviation {
    type: string
    sql: ${TABLE}.unit_of_measure_abbreviation ;;
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
      received_from_facility_name,
      metrc_location_name,
      product_name,
      product_category_name,
      batch.id,
      facility.display_name,
      facility.name,
      facility.id,
      manifest.from_facility_name,
      manifest.id,
      company.id
    ]
  }
}
