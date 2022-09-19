view: service_company_ref {

  dimension: bundle_deal_image_mobile {
    type: string
    sql: ${TABLE}.bundle_deal_image_mobile ;;
  }

  dimension: bundle_deal_image_web {
    type: string
    sql: ${TABLE}.bundle_deal_image_web ;;
  }

  dimension: company_id {
    type: number
    sql: ${TABLE}.company_id ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: exam_form_template_id {
    type: number
    sql: ${TABLE}.exam_form_template_id ;;
  }

  dimension: icon {
    type: string
    sql: ${TABLE}.icon ;;
  }

  dimension: intake_form_template_id {
    type: number
    sql: ${TABLE}.intake_form_template_id ;;
  }

  dimension: invoice_description {
    type: string
    sql: ${TABLE}.invoice_description ;;
  }

  dimension: is_bundle_deal {
    type: yesno
    sql: ${TABLE}.is_bundle_deal ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: service_id {
    type: number
    sql: ${TABLE}.service_id ;;
  }

  dimension: use_patient_agreement {
    type: yesno
    sql: ${TABLE}.use_patient_agreement ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
