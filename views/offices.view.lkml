view: offices {
  sql_table_name: {% if _model._name == 'pcf_company' %}ext_indica_{% endif %}backend.offices ;;
  drill_fields: [office_id]

  dimension: office_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.office_id ;;
  }

  dimension: adult_use_state_license_number {
    type: string
    sql: ${TABLE}.adult_use_state_license_number ;;
  }

  dimension: alt_potify_phone {
    type: string
    sql: ${TABLE}.alt_potify_phone ;;
  }

  dimension: appointments_key {
    type: string
    sql: ${TABLE}.appointments_key ;;
  }

  dimension: approved_business_name {
    type: string
    sql: ${TABLE}.approved_business_name ;;
  }

  dimension: approved_description {
    type: string
    sql: ${TABLE}.approved_description ;;
  }

  dimension: average_delivery_time {
    type: number
    sql: ${TABLE}.average_delivery_time ;;
  }

  dimension: bussiness_name {
    type: string
    sql: ${TABLE}.bussiness_name ;;
  }

  dimension: bussiness_slogan {
    type: string
    sql: ${TABLE}.bussiness_slogan ;;
  }

  dimension: change_decline_action_behaviour {
    type: yesno
    sql: ${TABLE}.change_decline_action_behaviour ;;
  }

  dimension: city_id {
    type: number
    sql: ${TABLE}.city_id ;;
  }

  dimension: collection_group_id {
    type: number
    sql: ${TABLE}.collection_group_id ;;
  }

  dimension: county_id {
    type: number
    sql: ${TABLE}.county_id ;;
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

  dimension: facebook {
    type: string
    sql: ${TABLE}.facebook ;;
  }

  dimension: instagram {
    type: string
    sql: ${TABLE}.instagram ;;
  }

  dimension: is_alt_potify_phone_sms_notification {
    type: yesno
    sql: ${TABLE}.is_alt_potify_phone_sms_notification ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_featured_in_potify {
    type: yesno
    sql: ${TABLE}.is_featured_in_potify ;;
  }

  dimension: is_medical {
    type: yesno
    sql: ${TABLE}.is_medical ;;
  }

  dimension: is_potify {
    type: yesno
    sql: ${TABLE}.is_potify ;;
  }

  dimension: is_potify_phone_sms_notification {
    type: yesno
    sql: ${TABLE}.is_potify_phone_sms_notification ;;
  }

  dimension: is_recreational {
    type: yesno
    sql: ${TABLE}.is_recreational ;;
  }

  dimension: is_storage {
    type: yesno
    sql: ${TABLE}.is_storage ;;
  }

  dimension: is_zenmd {
    type: yesno
    sql: ${TABLE}.is_zenmd ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: logo {
    type: string
    sql: ${TABLE}.logo ;;
  }

  dimension: medical_state_license_number {
    type: string
    sql: ${TABLE}.medical_state_license_number ;;
  }

  dimension: office_access_ip {
    type: string
    sql: ${TABLE}.office_access_ip ;;
  }

  dimension: office_address {
    type: string
    sql: ${TABLE}.office_address ;;
  }

  dimension: office_appointments_enabled {
    type: yesno
    sql: ${TABLE}.office_appointments_enabled ;;
  }

  dimension: office_appointments_message {
    type: string
    sql: ${TABLE}.office_appointments_message ;;
  }

  dimension: office_city {
    type: string
    sql: ${TABLE}.office_city ;;
  }

  dimension: office_city_name {
    type: string
    sql: ${TABLE}.office_city_name ;;
  }

  dimension: office_comp_id {
    type: number
    sql: ${TABLE}.office_comp_id ;;
  }

  dimension: office_county_name {
    type: string
    sql: ${TABLE}.office_county_name ;;
  }

  dimension: office_descr {
    type: string
    sql: ${TABLE}.office_descr ;;
  }

  dimension: office_email {
    type: string
    sql: ${TABLE}.office_email ;;
  }

  dimension: office_fax {
    type: string
    sql: ${TABLE}.office_fax ;;
  }

  dimension: office_friend_new_price {
    type: number
    sql: ${TABLE}.office_friend_new_price ;;
  }

  dimension: office_friend_renewal_price {
    type: number
    sql: ${TABLE}.office_friend_renewal_price ;;
  }

  dimension: office_gmaps_lat {
    type: number
    sql: ${TABLE}.office_gmaps_lat ;;
  }

  dimension: office_gmaps_lng {
    type: number
    sql: ${TABLE}.office_gmaps_lng ;;
  }

  dimension: office_is_accepts_credit_cards {
    type: yesno
    sql: ${TABLE}.office_is_accepts_credit_cards ;;
  }

  dimension: office_is_accepts_debit_cards {
    type: yesno
    sql: ${TABLE}.office_is_accepts_debit_cards ;;
  }

  dimension: office_is_active {
    type: yesno
    sql: ${TABLE}.office_is_active ;;
  }

  dimension: office_is_all_day_verification {
    type: yesno
    sql: ${TABLE}.office_is_all_day_verification ;;
  }

  dimension: office_is_approved {
    type: yesno
    sql: ${TABLE}.office_is_approved ;;
  }

  dimension: office_is_atm {
    type: yesno
    sql: ${TABLE}.office_is_atm ;;
  }

  dimension: office_is_disability_discount {
    type: yesno
    sql: ${TABLE}.office_is_disability_discount ;;
  }

  dimension: office_is_eighteen_plus {
    type: yesno
    sql: ${TABLE}.office_is_eighteen_plus ;;
  }

  dimension: office_is_handicap_access {
    type: yesno
    sql: ${TABLE}.office_is_handicap_access ;;
  }

  dimension: office_is_lab_tested {
    type: yesno
    sql: ${TABLE}.office_is_lab_tested ;;
  }

  dimension: office_is_lounge {
    type: yesno
    sql: ${TABLE}.office_is_lounge ;;
  }

  dimension: office_is_multiple_locations {
    type: yesno
    sql: ${TABLE}.office_is_multiple_locations ;;
  }

  dimension: office_is_offers_physical_cards {
    type: yesno
    sql: ${TABLE}.office_is_offers_physical_cards ;;
  }

  dimension: office_is_security_guard {
    type: yesno
    sql: ${TABLE}.office_is_security_guard ;;
  }

  dimension: office_is_twenty_one_plus {
    type: yesno
    sql: ${TABLE}.office_is_twenty_one_plus ;;
  }

  dimension: office_is_veterans_discount {
    type: yesno
    sql: ${TABLE}.office_is_veterans_discount ;;
  }

  dimension: office_is_walk_ins {
    type: yesno
    sql: ${TABLE}.office_is_walk_ins ;;
  }

  dimension: office_is_wallet_sized_authorizations {
    type: yesno
    sql: ${TABLE}.office_is_wallet_sized_authorizations ;;
  }

  dimension: office_is_wheelchair_accessible {
    type: yesno
    sql: ${TABLE}.office_is_wheelchair_accessible ;;
  }

  dimension_group: office_lastactivity {
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
    sql: ${TABLE}.office_lastactivity ;;
  }

  dimension: office_name {
    alias: [store_name]
    type: string
    sql: ${TABLE}.office_name ;;
    bypass_suggest_restrictions: no
    full_suggestions: yes
    suggest_persist_for: "1 second"
  }

  dimension: office_password {
    type: string
    sql: ${TABLE}.office_password ;;
  }

  dimension: office_phone {
    type: string
    sql: ${TABLE}.office_phone ;;
  }

  dimension: office_state {
    type: string
    sql: ${TABLE}.office_state ;;
  }

  dimension: office_state_name {
    type: string
    sql: ${TABLE}.office_state_name ;;
  }

  dimension: office_verification_phone {
    type: string
    sql: ${TABLE}.office_verification_phone ;;
  }

  dimension: office_verification_site {
    type: string
    sql: ${TABLE}.office_verification_site ;;
  }

  dimension: office_zip {
    type: string
    sql: ${TABLE}.office_zip ;;
  }

  dimension: office_zip_name {
    type: string
    sql: ${TABLE}.office_zip_name ;;
  }

  dimension: photo1 {
    type: string
    sql: ${TABLE}.photo1 ;;
  }

  dimension: photo2 {
    type: string
    sql: ${TABLE}.photo2 ;;
  }

  dimension: photo3 {
    type: string
    sql: ${TABLE}.photo3 ;;
  }

  dimension: photo4 {
    type: string
    sql: ${TABLE}.photo4 ;;
  }

  dimension: potify_cashback {
    type: number
    sql: ${TABLE}.potify_cashback ;;
  }

  dimension: potify_cashback_request {
    type: number
    sql: ${TABLE}.potify_cashback_request ;;
  }

  dimension: potify_cover {
    type: string
    sql: ${TABLE}.potify_cover ;;
  }

  dimension: potify_enable_loyalty_program {
    type: yesno
    sql: ${TABLE}.potify_enable_loyalty_program ;;
  }

  dimension_group: potify_enable_loyalty_program {
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
    sql: ${TABLE}.potify_enable_loyalty_program_at ;;
  }

  dimension: potify_enable_loyalty_program_request {
    type: yesno
    sql: ${TABLE}.potify_enable_loyalty_program_request ;;
  }

  dimension: potify_featured_products {
    type: string
    sql: ${TABLE}.potify_featured_products ;;
  }

  dimension: potify_is_accept_order {
    type: yesno
    sql: ${TABLE}.potify_is_accept_order ;;
  }

  dimension: potify_is_allow_delivery {
    type: yesno
    sql: ${TABLE}.potify_is_allow_delivery ;;
  }

  dimension: potify_is_allow_mail_delivery {
    type: yesno
    sql: ${TABLE}.potify_is_allow_mail_delivery ;;
  }

  dimension: potify_is_allow_online_order {
    type: yesno
    sql: ${TABLE}.potify_is_allow_online_order ;;
  }

  dimension: potify_is_allow_pickup {
    type: yesno
    sql: ${TABLE}.potify_is_allow_pickup ;;
  }

  dimension: potify_is_last_request_declined {
    type: yesno
    sql: ${TABLE}.potify_is_last_request_declined ;;
  }

  dimension: potify_is_phone_calls_enabled {
    type: yesno
    sql: ${TABLE}.potify_is_phone_calls_enabled ;;
  }

  dimension: potify_logo {
    type: string
    sql: ${TABLE}.potify_logo ;;
  }

  dimension: potify_loyalty_request {
    type: yesno
    sql: ${TABLE}.potify_loyalty_request ;;
  }

  dimension: potify_payment_cash {
    type: yesno
    sql: ${TABLE}.potify_payment_cash ;;
  }

  dimension: potify_payment_credit {
    type: yesno
    sql: ${TABLE}.potify_payment_credit ;;
  }

  dimension: potify_payment_debit {
    type: yesno
    sql: ${TABLE}.potify_payment_debit ;;
  }

  dimension: potify_phone {
    type: string
    sql: ${TABLE}.potify_phone ;;
  }

  dimension: potify_support_phone {
    type: string
    sql: ${TABLE}.potify_support_phone ;;
  }

  dimension: priority {
    type: number
    sql: ${TABLE}.priority ;;
  }

  dimension: selling_type {
    type: string
    sql: ${TABLE}.selling_type ;;
  }

  dimension: shop_logo {
    type: string
    sql: ${TABLE}.shop_logo ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
  }

  dimension: state_id {
    type: number
    sql: ${TABLE}.state_id ;;
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

  dimension: timezone_id {
    type: number
    sql: ${TABLE}.timezone_id ;;
  }

  dimension: twitter {
    type: string
    sql: ${TABLE}.twitter ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}.type ;;
  }

  dimension: verification_site_for_rec {
    type: string
    sql: ${TABLE}.verification_site_for_rec ;;
  }

  dimension: video {
    type: string
    sql: ${TABLE}.video ;;
  }

  dimension: wcii_apikey {
    type: string
    sql: ${TABLE}.wcii_apikey ;;
  }

  dimension: yelp {
    type: string
    sql: ${TABLE}.yelp ;;
  }

  dimension: zenmd_cultivation_price {
    type: number
    sql: ${TABLE}.zenmd_cultivation_price ;;
  }

  dimension: zenmd_pocketsize_price {
    type: number
    sql: ${TABLE}.zenmd_pocketsize_price ;;
  }

  dimension: zenmd_print_id_price {
    type: number
    value_format_name: id
    sql: ${TABLE}.zenmd_print_id_price ;;
  }

  dimension: zenmd_regular_price {
    type: number
    sql: ${TABLE}.zenmd_regular_price ;;
  }

  dimension: zenmd_renewal_cultivation_price {
    type: number
    sql: ${TABLE}.zenmd_renewal_cultivation_price ;;
  }

  dimension: zenmd_renewal_regular_price {
    type: number
    sql: ${TABLE}.zenmd_renewal_regular_price ;;
  }

  dimension: zenmd_replacement_price {
    type: number
    sql: ${TABLE}.zenmd_replacement_price ;;
  }

  dimension: zip_id {
    type: number
    sql: ${TABLE}.zip_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      office_id,
      office_name,
      bussiness_name,
      office_state_name,
      office_county_name,
      office_city_name,
      office_zip_name,
      approved_business_name
    ]
  }
}
