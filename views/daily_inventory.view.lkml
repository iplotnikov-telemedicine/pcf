view: daily_inventory {
  sql_table_name: test.daily_inventory ;;

  dimension: primary_key {
    primary_key:  yes
    sql: CONCAT(${TABLE}.report_date, ${TABLE}.comp_id, ${TABLE}.office_id, ${TABLE}.product_id) ;;
  }

  dimension: report_date {
    description: ""
    type: date
    sql: ${TABLE}.report_date ;;
  }

  dimension: comp_id {
    description: ""
    type: number
    sql: ${TABLE}.comp_id ;;
  }

  dimension: domain_prefix {
    description: ""
    type: string
    sql: ${TABLE}.domain_prefix ;;
  }

  dimension: office_id {
    description: ""
    type: number
    sql: ${TABLE}.office_id ;;
  }

  dimension: office_name {
    description: ""
    type: string
    sql: ${TABLE}.office_name;;
  }

  dimension: product_id {
    description: ""
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: prod_name {
    description: ""
    type: string
    sql: ${TABLE}.prod_name;;
  }

  dimension: brand_id {
    description: ""
    type: number
    sql: ${TABLE}.brand_id ;;
  }

  dimension: brand_name {
    description: ""
    type: string
    sql: ${TABLE}.brand_name;;
  }

  measure: check_in {
    description: ""
    type: sum
    sql: ${TABLE}.check_in ;;
  }

  measure: transfer_in {
    description: ""
    type: sum
    sql: ${TABLE}.transfer_in ;;
  }

  measure: transfer_out {
    description: ""
    type: sum
    sql: ${TABLE}.transfer_out ;;
  }

  measure: transfer_in_another_product {
    description: ""
    type: sum
    sql: ${TABLE}.transfer_in_another_product ;;
  }

  measure: transfer_out_another_product {
    description: ""
    type: sum
    sql: ${TABLE}.transfer_out_another_product ;;
  }

  measure: adjusted_increase {
    description: ""
    type: sum
    sql: ${TABLE}.adjusted_increase ;;
  }

  measure: adjusted_decrease {
    description: ""
    type: sum
    sql: ${TABLE}.adjusted_decrease ;;
  }

  measure: sell {
    description: ""
    type: sum
    sql: ${TABLE}.sell ;;
  }

  measure: return {
    description: ""
    type: sum
    sql: ${TABLE}.return ;;
  }

  measure: inventory_turnover {
    description: ""
    type: sum
    sql: ${TABLE}.inventory_turnover ;;
  }

  measure: end_of_day_inventory {
    description: ""
    type: sum
    sql: ${TABLE}.end_of_day_inventory ;;
  }
}
