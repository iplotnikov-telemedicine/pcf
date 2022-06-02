view: single_barcodes_by_product {
# If necessary, uncomment the line below to include explore_source.
# include: "kolas.model.lkml"

    derived_table: {
      explore_source: barcode {
        column: product_id {}
        column: max_barcode {}
        column: company_id {}
        filters: {
          field: barcode.count
          value: "1"
        }
      }
    }

    dimension: product_id {
      description: ""
      type: number
    }

    dimension: max_barcode {
      description: ""
      type: number
    }

    dimension: company_id {
      description: ""
      type: number
    }

}

# view: single_barcodes_by_product {
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
