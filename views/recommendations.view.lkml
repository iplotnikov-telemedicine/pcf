view: recommendations {
  sql_table_name: recommendations ;;

  dimension_group: deleted {
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
    sql: ${TABLE}.deleted_at ;;
  }

  dimension: is_crypted {
    type: yesno
    sql: ${TABLE}.is_crypted ;;
  }

  dimension: is_current {
    type: yesno
    sql: ${TABLE}.is_current ;;
  }

  dimension: is_validated_by_mask {
    type: yesno
    sql: ${TABLE}.is_validated_by_mask ;;
  }

  dimension: is_zenmd_ref {
    type: yesno
    sql: ${TABLE}.is_zenmd_ref ;;
  }

  dimension: limits_exemption {
    type: string
    sql: ${TABLE}.limits_exemption ;;
  }

  dimension: pocketsize_number {
    type: string
    sql: ${TABLE}.pocketsize_number ;;
  }

  dimension_group: rec_created {
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
    sql: ${TABLE}.rec_created_at ;;
  }

  dimension: rec_delete_note {
    type: string
    sql: ${TABLE}.rec_delete_note ;;
  }

  dimension: rec_doc_id {
    type: number
    sql: ${TABLE}.rec_doc_id ;;
  }

  dimension: rec_doctor_name {
    type: string
    sql: ${TABLE}.rec_doctor_name ;;
  }

  dimension: rec_exam_form_id {
    type: number
    sql: ${TABLE}.rec_exam_form_id ;;
  }

  dimension: rec_id {
    type: number
    sql: ${TABLE}.rec_id ;;
  }

  dimension: rec_indica_doc_id {
    type: number
    sql: ${TABLE}.rec_indica_doc_id ;;
  }

  dimension: rec_insert_signature {
    type: yesno
    sql: ${TABLE}.rec_insert_signature ;;
  }

  dimension: rec_is_approved {
    type: yesno
    sql: ${TABLE}.rec_is_approved ;;
  }

  dimension: rec_is_copy {
    type: yesno
    sql: ${TABLE}.rec_is_copy ;;
  }

  dimension: rec_is_denied {
    type: yesno
    sql: ${TABLE}.rec_is_denied ;;
  }

  dimension: rec_is_edited {
    type: yesno
    sql: ${TABLE}.rec_is_edited ;;
  }

  dimension: rec_is_revoked {
    type: yesno
    sql: ${TABLE}.rec_is_revoked ;;
  }

  dimension: rec_length {
    type: number
    sql: ${TABLE}.rec_length ;;
  }

  dimension: rec_limit_exemp {
    type: string
    sql: ${TABLE}.rec_limit_exemp ;;
  }

  dimension: rec_number {
    type: string
    sql: ${TABLE}.rec_number ;;
  }

  dimension: json_details {
    sql: CASE WHEN ${rec_number} > 0 THEN JSON_OBJECT('File ID', ${rec_number}, 'Type', ${rec_type}) END;;
  }

  dimension: rec_office_address {
    type: string
    sql: ${TABLE}.rec_office_address ;;
  }

  dimension: rec_office_id {
    type: number
    sql: ${TABLE}.rec_office_id ;;
  }

  dimension: rec_pat_id {
    type: number
    sql: ${TABLE}.rec_pat_id ;;
  }

  dimension_group: rec_revoke {
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
    sql: ${TABLE}.rec_revoke_date ;;
  }

  dimension: rec_revoke_reason {
    type: string
    sql: ${TABLE}.rec_revoke_reason ;;
  }

  dimension: rec_revoke_user_id {
    type: number
    sql: ${TABLE}.rec_revoke_user_id ;;
  }

  dimension: rec_revoke_user_name {
    type: string
    sql: ${TABLE}.rec_revoke_user_name ;;
  }

  dimension: rec_type {
    type: string
    sql: ${TABLE}.rec_type ;;
  }

  dimension_group: rec_valid_from {
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
    sql: ${TABLE}.rec_valid_from ;;
  }

  dimension_group: rec_valid_to {
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
    sql: ${TABLE}.rec_valid_to ;;
  }

  dimension: rec_verification_provider {
    type: number
    sql: ${TABLE}.rec_verification_provider ;;
  }

  dimension: rec_verification_provider_data {
    type: string
    sql: ${TABLE}.rec_verification_provider_data ;;
  }

  dimension_group: revoke_scheduled {
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
    sql: ${TABLE}.revoke_scheduled_at ;;
  }

  dimension: without_controls {
    type: yesno
    sql: ${TABLE}.without_controls ;;
  }

  measure: number_of_recommendations {
    type: count
    drill_fields: [rec_revoke_user_name, rec_doctor_name]
  }
}
