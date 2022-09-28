view: customer_frequency {
  derived_table: {
    sql:
      select
          wo.id as order_id,
          MONTH(CONVERT_TZ(wo.confirmed_at ,'UTC','America/Los_Angeles')) + YEAR(CONVERT_TZ(wo.confirmed_at ,'UTC','America/Los_Angeles'))*100 as month_year,
          pt.pat_id as patient_id,
          po.patient_month_orders_num as patient_month_orders_num,
          count(DISTINCT pr.prod_id) as unique_products_in_order,
          count(DISTINCT b.id) as unique_brands_in_order,
          count(DISTINCT pc.id) as unique_categories_in_order,
          sum(woi.qty + woi.qty_free) as order_item_qty,
          avg(woi.paid_amount - woi.tax - IF(woi.paid_amount, woi.returned_amount - (woi.returned_amount * woi.tax / woi.paid_amount),  0)) as item_net_sales,
          sum(woi.paid_amount - woi.tax - IF(woi.paid_amount, woi.returned_amount - (woi.returned_amount * woi.tax / woi.paid_amount),  0)) as order_net_sales
      from warehouse_order_items as woi
          left join warehouse_orders as wo on woi.order_id = wo.id
          left join patients pt on wo.patient_id = pt.pat_id
          left join (select patient_id,
                            MONTH(CONVERT_TZ(confirmed_at ,'UTC','America/Los_Angeles'))
                                + YEAR(CONVERT_TZ(confirmed_at ,'UTC','America/Los_Angeles'))*100 as month_year,
                            count(id) as patient_month_orders_num
                    from warehouse_orders
                    where patient_id is not null and CONVERT_TZ(confirmed_at ,'UTC','America/Los_Angeles') >= {{ date_from._parameter_value }}
                        and CONVERT_TZ(confirmed_at ,'UTC','America/Los_Angeles') < {{ date_to._parameter_value }}
                    group by patient_id, MONTH(CONVERT_TZ(confirmed_at ,'UTC','America/Los_Angeles'))
                        + YEAR(CONVERT_TZ(confirmed_at ,'UTC','America/Los_Angeles'))*100)
              po on wo.patient_id = po.patient_id and MONTH(CONVERT_TZ(wo.confirmed_at ,'UTC','America/Los_Angeles'))
                  + YEAR(CONVERT_TZ(wo.confirmed_at ,'UTC','America/Los_Angeles'))*100 = po.month_year
          left join products pr on woi.product_id = pr.prod_id
          left join brands b on pr.brand_id = b.id
          left join product_categories pc on pr.prod_category_id = pc.id
      where wo.patient_id is not null and CONVERT_TZ(wo.confirmed_at ,'UTC','America/Los_Angeles') >= {{ date_from._parameter_value }}
          and CONVERT_TZ(wo.confirmed_at ,'UTC','America/Los_Angeles') < {{ date_to._parameter_value }}
      group by
          month_year,
          patient_id,
          order_id;;
  }


  parameter: date_from {
    type: date
    default_value: "2021-01-01"
  }
  parameter: date_to {
    type: date
    default_value: "2022-01-01"
  }


  dimension: order_id {
    primary_key: yes
    type: number
    value_format: "0"
    sql: ${TABLE}.order_id ;;
  }
  dimension: month_year {
    type: number
    value_format: "0"
    sql: ${TABLE}.month_year ;;
  }
  dimension: patient_id {
    type: number
    value_format: "0"
    sql:  ${TABLE}.patient_id ;;
  }
  dimension: patient_month_orders_num {
    type: number
    value_format: "0"
    sql:  ${TABLE}.patient_month_orders_num ;;
  }
  dimension: patient_month_orders_tier {
    type: tier
    tiers: [0, 4, 7, 10, 13, 16, 19, 25, 31, 37, 42, 66, 100]
    style: integer
    sql: ${patient_month_orders_num} ;;
  }


  measure: count_orders {
    type: count_distinct
    value_format: "0"
    sql: ${TABLE}.order_id ;;
  }
  measure: avg_unique_products_in_order {
    type: average
    value_format: "0.#"
    sql:  ${TABLE}.unique_products_in_order ;;
  }
  measure: avg_unique_brands_in_order {
    type: average
    value_format: "0.#"
    sql:  ${TABLE}.unique_brands_in_order ;;
  }
  measure: avg_unique_categories_in_order {
    type: average
    value_format: "0.#"
    sql:  ${TABLE}.unique_categories_in_order ;;
  }
  measure: avg_order_item_qty {
    type: average
    value_format: "0.#"
    sql: ${TABLE}.order_item_qty ;;
  }
  measure: avg_order_net_sales {
    type: average
    value_format: "$0.0"
    sql: ${TABLE}.order_net_sales ;;
  }
  measure: avg_item_net_sales {
    type: average
    value_format: "$0.0"
    sql: ${TABLE}.item_net_sales ;;
  }
  measure: sum_net_sales {
    type: sum
    value_format: "$#,##0"
    sql: ${TABLE}.order_net_sales ;;
  }
  measure: count_unique_patients {
    type: count_distinct
    value_format: "0"
    sql: ${patient_id} ;;
  }
}
