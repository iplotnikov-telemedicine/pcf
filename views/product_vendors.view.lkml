view: product_vendors {
  sql_table_name: {% if _model._name == 'pcf_company' %}@{schema_name}.{% endif %}product_vendors ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: license {
    type: string
    sql: ${TABLE}.license ;;
  }

  dimension: metrc_license {
    type: string
    sql: ${TABLE}.metrc_license ;;
  }

  dimension: metrc_name {
    type: string
    sql: ${TABLE}.metrc_name ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: registration_certificate {
    type: string
    sql: ${TABLE}.registration_certificate ;;
  }

  dimension: skype {
    type: string
    sql: ${TABLE}.skype ;;
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

  dimension: vendor_type {
    type: yesno
    sql: ${TABLE}.vendor_type ;;
  }

  measure: number_of_product_vendors {
    type: count
    drill_fields: [id, name, metrc_name]
  }
}
