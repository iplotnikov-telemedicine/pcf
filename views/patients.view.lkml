view: patients {
  sql_table_name: patients ;;


  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.pat_id ;;
  }

  dimension: agile_crm_id {
    type: string
    sql: ${TABLE}.agile_crm_id ;;
  }

  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
  }

  dimension: buyer_status {
    type: string
    sql: ${TABLE}.buyer_status ;;
  }

  dimension: current_rec_doc_id {
    type: number
    sql: ${TABLE}.current_rec_doc_id ;;
  }

  dimension: current_rec_number {
    type: string
    sql: ${TABLE}.current_rec_number ;;
  }

  dimension_group: current_rec_valid_to {
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
    sql: ${TABLE}.current_rec_valid_to ;;
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

  dimension_group: email_consent_given {
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
    sql: ${TABLE}.email_consent_given_at ;;
  }

  dimension: email_consent_signature {
    type: string
    sql: ${TABLE}.email_consent_signature ;;
  }

  dimension: email_is_consented {
    type: yesno
    sql: ${TABLE}.email_is_consented ;;
  }

  dimension: is_crypted {
    type: yesno
    sql: ${TABLE}.is_crypted ;;
  }

  dimension: is_from_shop {
    type: yesno
    sql: ${TABLE}.is_from_shop ;;
  }

  dimension: is_not_call {
    type: yesno
    sql: ${TABLE}.is_not_call ;;
  }

  dimension: is_not_send_email {
    type: yesno
    sql: ${TABLE}.is_not_send_email ;;
  }

  dimension: is_not_send_mail {
    type: yesno
    sql: ${TABLE}.is_not_send_mail ;;
  }

  dimension: is_not_send_sms {
    type: yesno
    sql: ${TABLE}.is_not_send_sms ;;
  }

  dimension: is_tax_exempt {
    type: yesno
    sql: ${TABLE}.is_tax_exempt ;;
  }

  dimension: is_twilio_lookup {
    type: yesno
    sql: ${TABLE}.is_twilio_lookup ;;
  }

  dimension: is_typist_work {
    type: yesno
    sql: ${TABLE}.is_typist_work ;;
  }

  dimension: address1 {
    type: string
    sql: ${TABLE}.pat_address1 ;;
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.pat_address2 ;;
  }

  dimension: address_lat {
    type: number
    sql: ${TABLE}.pat_address_lat ;;
  }

  dimension: address_lon {
    type: number
    sql: ${TABLE}.pat_address_lon ;;
  }

  dimension: alt_phone {
    type: string
    sql: ${TABLE}.pat_alt_phone ;;
  }

  dimension: alt_phone_twilio_lookup {
    type: string
    sql: ${TABLE}.pat_alt_phone_twilio_lookup ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.pat_amount ;;
  }

  dimension: blacklist_reason {
    type: string
    sql: ${TABLE}.pat_blacklist_reason ;;
  }

  dimension: city_id {
    type: number
    sql: ${TABLE}.pat_city_id ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.pat_city_name ;;
  }

  dimension: county_id {
    type: number
    sql: ${TABLE}.pat_county_id ;;
  }

  dimension: county_name {
    type: string
    sql: ${TABLE}.pat_county_name ;;
  }

  dimension_group: created_at {
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
    sql: ${TABLE}.pat_created_at_date ;;
  }

  dimension: deleted_by_doc_id {
    type: number
    sql: ${TABLE}.pat_deleted_by_doc_id ;;
  }

  dimension: dhc {
    type: string
    sql: ${TABLE}.pat_dhc ;;
  }

  dimension: dmv {
    type: string
    sql: ${TABLE}.pat_dmv ;;
  }

  dimension: dmv_alt {
    type: string
    sql: ${TABLE}.pat_dmv_alt ;;
  }

  dimension_group: dob {
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
    sql: ${TABLE}.pat_dob ;;
  }

  dimension: age {
    type: number
    sql: DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), ${dob_raw})), '%Y')+0;;
  }

  dimension: age_tier {
    type: tier
    tiers: [21, 26, 31, 36, 41, 46, 51, 56, 61, 66, 71, 76, 81, 86, 91, 95]
    style: integer
    sql: ${age} ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.pat_email ;;
  }

  dimension: ethnicity {
    type: string
    sql: ${TABLE}.pat_ethnicity ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.pat_fax ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.pat_first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.pat_gender ;;
  }

  dimension: general_intake {
    type: string
    sql: ${TABLE}.pat_general_intake ;;
  }

  dimension: h_phone1 {
    type: string
    sql: ${TABLE}.pat_h_phone1 ;;
  }

  dimension: h_phone2 {
    type: string
    sql: ${TABLE}.pat_h_phone2 ;;
  }

  dimension: h_phone3 {
    type: string
    sql: ${TABLE}.pat_h_phone3 ;;
  }

  dimension: has_intake_for_approving {
    type: yesno
    sql: ${TABLE}.pat_has_intake_for_approving ;;
  }

  dimension: height {
    type: string
    sql: ${TABLE}.pat_height ;;
  }

  dimension: insurance {
    type: string
    sql: ${TABLE}.pat_insurance ;;
  }

  dimension: is_appointment {
    type: yesno
    sql: ${TABLE}.pat_is_appointment ;;
  }

  dimension: is_blacklist {
    type: yesno
    sql: ${TABLE}.pat_is_blacklist ;;
  }

  dimension: is_cancer {
    type: yesno
    sql: ${TABLE}.pat_is_cancer ;;
  }

  dimension: is_compassion {
    type: yesno
    sql: ${TABLE}.pat_is_compassion ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.pat_is_deleted ;;
  }

  dimension: is_disabled {
    type: yesno
    sql: ${TABLE}.pat_is_disabled ;;
  }

  dimension: is_facebooked {
    type: yesno
    sql: ${TABLE}.pat_is_facebooked ;;
  }

  dimension: is_former_staff {
    type: yesno
    sql: ${TABLE}.pat_is_former_staff ;;
  }

  dimension: is_hidden {
    type: yesno
    sql: ${TABLE}.pat_is_hidden ;;
  }

  dimension: is_marked_as_deleted {
    type: yesno
    sql: ${TABLE}.pat_is_markedasdeleted ;;
  }

  dimension: is_military {
    type: yesno
    sql: ${TABLE}.pat_is_military ;;
  }

  dimension: is_needs_cultivation {
    type: yesno
    sql: ${TABLE}.pat_is_needs_cultivation ;;
  }

  dimension: is_nonpatient {
    type: yesno
    sql: ${TABLE}.pat_is_nonpatient ;;
  }

  dimension: is_seniou {
    type: yesno
    sql: ${TABLE}.pat_is_seniou ;;
  }

  dimension: is_ssi {
    type: yesno
    sql: ${TABLE}.pat_is_ssi ;;
  }

  dimension: is_staff {
    type: yesno
    sql: ${TABLE}.pat_is_staff ;;
  }

  dimension: is_veteran {
    type: yesno
    sql: ${TABLE}.pat_is_veteran ;;
  }

  dimension: is_vip {
    type: yesno
    sql: ${TABLE}.pat_is_vip ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.pat_last_name ;;
  }

  dimension_group: last_visit {
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
    sql: ${TABLE}.pat_last_visit_date ;;
  }

  dimension: lng {
    type: string
    sql: ${TABLE}.pat_lng ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.pat_location_id ;;
  }

  dimension: m_phone1 {
    type: string
    sql: ${TABLE}.pat_m_phone1 ;;
  }

  dimension: m_phone2 {
    type: string
    sql: ${TABLE}.pat_m_phone2 ;;
  }

  dimension: m_phone3 {
    type: string
    sql: ${TABLE}.pat_m_phone3 ;;
  }

  dimension_group: markedasdeleted {
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
    sql: ${TABLE}.pat_markedasdeleted_date ;;
  }

  dimension: markedasdeleted_reason {
    type: string
    sql: ${TABLE}.pat_markedasdeleted_reason ;;
  }

  dimension: markedasdeleted_username {
    type: string
    sql: ${TABLE}.pat_markedasdeleted_username ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}.pat_middle_name ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.pat_notes ;;
  }

  dimension: o_phone1 {
    type: string
    sql: ${TABLE}.pat_o_phone1 ;;
  }

  dimension: o_phone2 {
    type: string
    sql: ${TABLE}.pat_o_phone2 ;;
  }

  dimension: o_phone3 {
    type: string
    sql: ${TABLE}.pat_o_phone3 ;;
  }

  dimension: office_id {
    type: number
    sql: ${TABLE}.pat_office_id ;;
  }

  dimension: passport {
    type: string
    sql: ${TABLE}.pat_passport ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.pat_phone ;;
  }

  dimension: phone_twilio_lookup {
    type: string
    sql: ${TABLE}.pat_phone_twilio_lookup ;;
  }

  dimension: photo {
    type: string
    sql: ${TABLE}.pat_photo ;;
  }

  dimension: race {
    type: string
    sql: ${TABLE}.pat_race ;;
  }

  dimension: ref_points {
    type: number
    sql: ${TABLE}.pat_ref_points ;;
  }

  dimension: skype {
    type: string
    sql: ${TABLE}.pat_skype ;;
  }

  dimension: ssn {
    type: string
    sql: ${TABLE}.pat_ssn ;;
  }

  dimension: stamp {
    type: string
    sql: ${TABLE}.pat_stamp ;;
  }

  dimension: state_id {
    type: number
    sql: ${TABLE}.pat_state_id ;;
  }

  dimension: state_name {
    type: string
    sql: ${TABLE}.pat_state_name ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.pat_status ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.pat_user_id ;;
  }

  dimension: user_info {
    type: string
    sql: ${TABLE}.pat_user_info ;;
  }

  dimension: weight {
    type: number
    sql: ${TABLE}.pat_weight ;;
  }

  dimension: zip_id {
    type: number
    sql: ${TABLE}.pat_zip_id ;;
  }

  dimension: zip_name {
    type: string
    sql: ${TABLE}.pat_zip_name ;;
  }

  dimension_group: phone_consent_given {
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
    sql: ${TABLE}.phone_consent_given_at ;;
  }

  dimension: phone_consent_signature {
    type: string
    sql: ${TABLE}.phone_consent_signature ;;
  }

  dimension: phone_is_consented {
    type: yesno
    sql: ${TABLE}.phone_is_consented ;;
  }

  dimension: potify_earned_cashback {
    type: number
    sql: ${TABLE}.potify_earned_cashback ;;
  }

  dimension: potify_id {
    type: number
    sql: ${TABLE}.potify_id ;;
  }

  dimension: potify_spent_cashback {
    type: number
    sql: ${TABLE}.potify_spent_cashback ;;
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
    sql: ${TABLE}.sync_created_at ;;
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
    sql: ${TABLE}.sync_updated_at ;;
  }

  dimension: tax_profile_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.tax_profile_id ;;
  }

  dimension: tax_tier_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.tax_tier_id ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}.type ;;
  }

  dimension: unsubscribe_hash {
    type: string
    sql: ${TABLE}.unsubscribe_hash ;;
  }

  measure: is_repeated {
    type: yesno
    sql: CASE WHEN ${orders.count_of_orders} > 1 THEN TRUE ELSE FALSE END ;;
  }

  measure: number_of_patients {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      first_name,
      middle_name,
      last_name,
      state_name,
      city_name,
      zip_name,
      markedasdeleted_username,
      county_name,
      tax_profile.id,
      tax_profile.name,
      tax_tier.id
    ]
  }
}
