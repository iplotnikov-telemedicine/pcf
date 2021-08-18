view: recommendation_data {
  sql_table_name: recommendation_data ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: comp_id {
    type: number
    sql: ${TABLE}.comp_id ;;
  }

  dimension: comp_name {
    type: string
    sql: ${TABLE}.comp_name ;;
  }

  dimension_group: creation {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: yes
    datatype: date
    sql: ${TABLE}.creation_date ;;
  }

  dimension: doc_category {
    type: string
    sql: ${TABLE}.doc_category ;;
  }

  dimension: doc_first_name {
    type: string
    sql: ${TABLE}.doc_first_name ;;
  }

  dimension: doc_id {
    type: number
    sql: ${TABLE}.doc_id ;;
  }

  dimension: doc_last_name {
    type: string
    sql: ${TABLE}.doc_last_name ;;
  }

  dimension: doc_license {
    type: string
    sql: ${TABLE}.doc_license ;;
  }

  dimension: external_status {
    type: string
    sql: ${TABLE}.external_status ;;
  }

  dimension: internal_status {
    type: string
    sql: ${TABLE}.internal_status ;;
  }

  dimension: is_crypted {
    type: yesno
    sql: ${TABLE}.is_crypted ;;
  }

  dimension: office_address {
    type: string
    sql: ${TABLE}.office_address ;;
  }

  dimension: office_city {
    type: string
    sql: ${TABLE}.office_city ;;
  }

  dimension: office_fax {
    type: string
    sql: ${TABLE}.office_fax ;;
  }

  dimension: office_id {
    type: number
    sql: ${TABLE}.office_id ;;
  }

  dimension: office_name {
    type: string
    sql: ${TABLE}.office_name ;;
  }

  dimension: office_phone {
    type: string
    sql: ${TABLE}.office_phone ;;
  }

  dimension: office_state {
    type: string
    sql: ${TABLE}.office_state ;;
  }

  dimension: office_zip {
    type: string
    sql: ${TABLE}.office_zip ;;
  }

  dimension: pat_dmv {
    type: string
    sql: ${TABLE}.pat_dmv ;;
  }

  dimension: pat_first_name {
    type: string
    sql: ${TABLE}.pat_first_name ;;
  }

  dimension: pat_id {
    type: number
    sql: ${TABLE}.pat_id ;;
  }

  dimension: pat_last_name {
    type: string
    sql: ${TABLE}.pat_last_name ;;
  }

  dimension: pat_middle_name {
    type: string
    sql: ${TABLE}.pat_middle_name ;;
  }

  dimension: recommendation_id {
    type: number
    sql: ${TABLE}.recommendation_id ;;
  }

  dimension_group: revoke {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.revoke_date ;;
  }

  measure: number_of_recommendation_data {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      pat_first_name,
      pat_middle_name,
      pat_last_name,
      office_name,
      comp_name,
      doc_first_name,
      doc_last_name
    ]
  }
}
