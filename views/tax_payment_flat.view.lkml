view: tax_payment_flat {

    derived_table: {

    sql:
        SELECT
          order_id,
          # order_item_id,
          # product_id,
          "State Sales Tax" as tax_type,
          sum(state_sales_tax) as tax_amount
        FROM tax_payment
        WHERE state_sales_tax > 0
        GROUP BY 1,2

        UNION ALL

        SELECT
          order_id,
          # order_item_id,
          # product_id,
          "City Sales Tax" as tax_type,
          sum(city_sales_tax) as tax_amount
        FROM tax_payment
        WHERE city_sales_tax > 0
        GROUP BY 1,2

        UNION ALL

        SELECT
          order_id,
          # order_item_id,
          # product_id,
          "City Local Tax" as tax_type,
          sum(city_local_tax) as tax_amount
        FROM tax_payment
        WHERE city_local_tax > 0
        GROUP BY 1,2

      ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  # dimension: order_item_id {
  #   type: number
  #   sql: ${TABLE}.order_item_id ;;
  # }

  # dimension: product_id {
  #   type: number
  #   sql: ${TABLE}.product_id ;;
  # }

  dimension: tax_type {
    type: string
    sql: ${TABLE}.tax_type ;;
  }

  dimension: tax_amount {
    type: number
    sql: ${TABLE}.tax_amount ;;
  }

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${TABLE}.order_id, ${TABLE}.tax_type) ;;
  }

  dimension: json_details {
    sql: JSON_OBJECT('Type', ${tax_type}, 'Amount', round(${tax_amount}, 2)) ;;
  }

}

# view: tax_payment_flat {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
