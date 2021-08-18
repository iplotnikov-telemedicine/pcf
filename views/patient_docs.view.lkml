view: patient_docs {
  sql_table_name: patient_docs ;;

  dimension: company_id {
    type: number
    sql: ${TABLE}.company_id ;;
  }

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

  dimension: is_bad_scan {
    type: yesno
    sql: ${TABLE}.is_bad_scan ;;
  }

  dimension: is_missing_pages {
    type: yesno
    sql: ${TABLE}.is_missing_pages ;;
  }

  dimension: pd_category_id {
    type: number
    sql: ${TABLE}.pd_category_id ;;
  }

  dimension: pd_descr {
    type: string
    sql: ${TABLE}.pd_descr ;;
  }

  dimension: pd_file {
    type: string
    sql: ${TABLE}.pd_file ;;
  }

  dimension: pd_id {
    type: number
    sql: ${TABLE}.pd_id ;;
  }

  dimension: pd_is_makedasdeleted {
    type: yesno
    sql: ${TABLE}.pd_is_makedasdeleted ;;
  }

  dimension_group: pd_makedasdeleted {
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
    sql: ${TABLE}.pd_makedasdeleted_date ;;
  }

  dimension: pd_makedasdeleted_reason {
    type: string
    sql: ${TABLE}.pd_makedasdeleted_reason ;;
  }

  dimension: pd_makedasdeleted_username {
    type: string
    sql: ${TABLE}.pd_makedasdeleted_username ;;
  }

  dimension: pd_mime {
    type: string
    sql: ${TABLE}.pd_mime ;;
  }

  dimension: pd_name {
    type: string
    sql: ${TABLE}.pd_name ;;
  }

  dimension: pd_pat_id {
    type: number
    sql: ${TABLE}.pd_pat_id ;;
  }

  dimension: pd_service_id {
    type: number
    sql: ${TABLE}.pd_service_id ;;
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

  measure: number_of_patient_docs {
    type: count
    drill_fields: [pd_name, pd_makedasdeleted_username]
  }
}
