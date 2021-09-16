view: users {
  sql_table_name: sf_guard_user ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: access_type {
    type: string
    sql: ${TABLE}.access_type ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: agilecrm_contact_id {
    type: number
    sql: ${TABLE}.agilecrm_contact_id ;;
  }

  dimension: algorithm {
    type: string
    sql: ${TABLE}.algorithm ;;
  }

  dimension: autologin_hash {
    type: string
    sql: ${TABLE}.autologin_hash ;;
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

  dimension: dmv {
    type: string
    sql: ${TABLE}.dmv ;;
  }

  dimension: driver_license_number {
    type: string
    sql: ${TABLE}.driver_license_number ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: is_admin {
    type: yesno
    sql: ${TABLE}.is_admin ;;
  }

  dimension: is_dmv_verified {
    type: yesno
    sql: ${TABLE}.is_dmv_verified ;;
  }

  dimension: is_super_admin {
    type: yesno
    sql: ${TABLE}.is_super_admin ;;
  }

  dimension: is_trial_support {
    type: yesno
    sql: ${TABLE}.is_trial_support ;;
  }

  dimension: is_verified {
    type: yesno
    sql: ${TABLE}.is_verified ;;
  }

  dimension_group: last_login {
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
    sql: ${TABLE}.last_login ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: last_office {
    type: string
    sql: ${TABLE}.last_office ;;
  }

  dimension: manager_pin {
    type: string
    sql: ${TABLE}.manager_pin ;;
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobile_phone ;;
  }

  dimension: occupational_driver_license {
    type: string
    sql: ${TABLE}.occupational_driver_license ;;
  }

  dimension: office_access {
    type: string
    sql: ${TABLE}.office_access ;;
  }

  dimension: password {
    type: string
    sql: ${TABLE}.password ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: photo {
    type: string
    sql: ${TABLE}.photo ;;
  }

  dimension: salt {
    type: string
    sql: ${TABLE}.salt ;;
  }

  dimension: staff_category_id {
    type: number
    sql: ${TABLE}.staff_category_id ;;
  }

  dimension: staff_id {
    type: string
    sql: ${TABLE}.staff_id ;;
  }

  dimension: storage_access {
    type: string
    sql: ${TABLE}.storage_access ;;
  }

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

  dimension_group: timetracker_autocheckout {
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
    sql: ${TABLE}.timetracker_autocheckout_time ;;
  }

  dimension: timetracker_hour_rate {
    type: number
    sql: ${TABLE}.timetracker_hour_rate ;;
  }

  dimension: trial_indica_description {
    type: string
    sql: ${TABLE}.trial_indica_description ;;
  }

  dimension: trial_medibook_description {
    type: string
    sql: ${TABLE}.trial_medibook_description ;;
  }

  dimension: trial_photo_url {
    type: string
    sql: ${TABLE}.trial_photo_url ;;
  }

  dimension: trial_title {
    type: string
    sql: ${TABLE}.trial_title ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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

  dimension: user_pin {
    type: string
    sql: ${TABLE}.user_pin ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  dimension: wcii_hash {
    type: string
    sql: ${TABLE}.wcii_hash ;;
  }

  dimension: whmcs_clientid {
    type: number
    value_format_name: id
    sql: ${TABLE}.whmcs_clientid ;;
  }

  dimension: whmcs_email {
    type: string
    sql: ${TABLE}.whmcs_email ;;
  }

  dimension: whmcs_password {
    type: string
    sql: ${TABLE}.whmcs_password ;;
  }

  dimension: full_name {
    type: string
    sql: CONCAT_WS(' ', ${first_name}, ${last_name}, IF(${TABLE}.deleted_at IS NOT NULL, '(deleted)', '')) ;;
  }

  measure: number_of_users {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      username,
      register_log.count,
      warehouse_order_logs.count
    ]
  }
}
