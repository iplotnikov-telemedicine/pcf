view: adjustments_by_checkin {
  derived_table: {
    sql: SELECT
            product_transactions.product_checkin_id ,
            COALESCE(SUM(CASE WHEN ( product_transactions.type = 12) THEN product_transactions.qty  ELSE NULL END), 0) AS `increased_by`,
            COALESCE(SUM(CASE WHEN ( product_transactions.type = 13) THEN product_transactions.qty  ELSE NULL END), 0) AS `decreased_by`
        FROM product_transactions  AS product_transactions
        WHERE (product_transactions.type ) IN (12, 13) AND (product_transactions.product_checkin_id ) IS NOT NULL
          AND product_transactions.date between {% date_start order_items_by_checkin.date_filter %}
          AND {% date_end order_items_by_checkin.date_filter %}
        GROUP BY
            1 ;;
  }
  dimension: product_checkin_id {
    description: ""
    type: number
  }
  dimension: increased_by {
    description: ""
    type: number
  }
  dimension: decreased_by {
    description: ""
    type: number
  }
}
