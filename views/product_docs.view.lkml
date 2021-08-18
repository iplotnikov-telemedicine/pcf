view: product_documents {
  sql_table_name: product_docs ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: descr {
    type: string
    sql: ${TABLE}.descr ;;
  }

  dimension: file {
    type: string
    sql: ${TABLE}.file ;;
  }

  dimension: is_makedasdeleted {
    type: yesno
    sql: ${TABLE}.is_makedasdeleted ;;
  }

  dimension: makedasdeleted_username {
    type: string
    sql: ${TABLE}.makedasdeleted_username ;;
  }

  dimension: mime {
    type: string
    sql: ${TABLE}.mime ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: size {
    type: number
    sql: ${TABLE}.size ;;
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

  measure: number_of_product_documents {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      makedasdeleted_username,
      products.prod_name,
      products.wm_product_id,
      products.brand_product_strain_name
    ]
  }
}
