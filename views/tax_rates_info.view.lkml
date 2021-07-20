view: tax_rates_info {
  sql_table_name: tax_rates_info ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: city_mj_sales_tax_rate {
    type: number
    sql: ${TABLE}.city_mj_sales_tax_rate ;;
  }

  dimension: city_mj_tax_rate {
    type: number
    sql: ${TABLE}.city_mj_tax_rate ;;
  }

  dimension: city_sales_tax_rate {
    type: number
    sql: ${TABLE}.city_sales_tax_rate ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: county_mj_sales_tax_rate {
    type: number
    sql: ${TABLE}.county_mj_sales_tax_rate ;;
  }

  dimension: county_mj_tax_rate {
    type: number
    sql: ${TABLE}.county_mj_tax_rate ;;
  }

  dimension: county_sales_tax_rate {
    type: number
    sql: ${TABLE}.county_sales_tax_rate ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: state_mj_sales_tax_rate {
    type: number
    sql: ${TABLE}.state_mj_sales_tax_rate ;;
  }

  dimension: state_mj_tax_rate {
    type: number
    sql: ${TABLE}.state_mj_tax_rate ;;
  }

  dimension: state_sales_tax_rate {
    type: number
    sql: ${TABLE}.state_sales_tax_rate ;;
  }

  dimension: tax_tier_data {
    type: string
    sql: ${TABLE}.tax_tier_data ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
