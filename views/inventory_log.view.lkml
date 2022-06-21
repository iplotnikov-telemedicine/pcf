view: inventory_log {

  sql_table_name: inventory_log ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: storage_id {
    type: number
    sql: ${TABLE}.storage_id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: item_type {
    type: string
    sql: REPLACE(${TABLE}.item_type, 'pp_', '') ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: is_increased {
    type: yesno
    sql: ${quantity} > 0 ;;
  }

  dimension: package_id {
    type: number
    sql: ${TABLE}.batch_id ;;
  }

  dimension: order_item_id {
    type: number
    sql: ${TABLE}.order_item_id ;;
  }

  dimension: unit_of_weight {
    type: string
    sql:
    CASE item_type
      WHEN 'gram' THEN 1
      WHEN 'pp_eighth' THEN 3.5
      WHEN 'pp_quarter' THEN 7
      WHEN 'pp_half' THEN 14
      WHEN 'pp_ounce' THEN 28
      WHEN 'joint' THEN 1
      ELSE 1
    END ;;
  }

  dimension: unit_quantity {
    type:  number
    sql:  ${unit_of_weight} * ${quantity} ;;
  }

  measure: total_unit_quantity {
    type: sum
    sql: ${unit_quantity} ;;
  }

  measure: total_qty_increased_by {
    type: sum
    sql: ${unit_quantity} ;;
    filters: [is_increased: "yes"]
  }

  measure: total_qty_decreased_by {
    type: sum
    sql: ${unit_quantity} ;;
    filters: [is_increased: "no"]
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

  measure: quantity_at_the_first_date {
    type: sum
    sql: ${quantity} ;;
    filters: [event_type_name: "Package Create"]

  }

  measure: last_date {
    type: date
    sql: MAX(${created_raw}) ;;
  }

  measure: first_date {
    type: date
    sql: MIN(${created_raw}) ;;
  }

  measure: count {
    type: count
  }
  # measure: stocked_days {
  #   type: number
  #   sql: DATE_DIFF(${first_created}, ${last_created}) ;;
  #   value_format_name: decimal_1
  # }

  measure: storage_turnover {
    type: sum
    sql: ${quantity} ;;
    filters: [offices.is_storage: "Yes"]
  }

  measure: shelf_turnover {
    type: sum
    sql: ${quantity} ;;
    filters: [offices.is_storage: "No"]
  }

  measure: quantity_at_the_last_date {
    type: sum
    sql: ${quantity} ;;
  }

  measure: average_inventory {
    type: number
    sql: (${quantity_at_the_first_date} + ${quantity_at_the_last_date}) / 2 ;;
  }

  dimension: event_type_name {
    case: {
      when: {
        sql: ${TABLE}.event_type = 1 ;;
        label: "Initial"
      }
      when: {
        sql: ${TABLE}.event_type = 2 ;;
        label: "Package Create"
      }
      when: {
        sql: ${TABLE}.event_type = 3 ;;
        label: "Package Edit"
      }
      when: {
        sql: ${TABLE}.event_type = 4 ;;
        label: "Package Remove"
      }
      when: {
        sql: ${TABLE}.event_type = 5 ;;
        label: "Write Off"
      }
      when: {
        sql: ${TABLE}.event_type = 6 ;;
        label: "Prerolls Create"
      }
      when: {
        sql: ${TABLE}.event_type = 7 ;;
        label: "Prepacks create"
      }
      when: {
        sql: ${TABLE}.event_type = 8 ;;
        label: "Prepacks Unpack"
      }
      when: {
        sql: ${TABLE}.event_type = 9 ;;
        label: "Transfer"
      }
      when: {
        sql: ${TABLE}.event_type = 10 ;;
        label: "Transfer To Another Product"
      }
      when: {
        sql: ${TABLE}.event_type = 11 ;;
        label: "Order Item Add"
      }
      when: {
        sql: ${TABLE}.event_type = 12 ;;
        label: "Oreder Item Edit"
      }
      when: {
        sql: ${TABLE}.event_type = 13 ;;
        label: "Order Item Return"
      }
      when: {
        sql: ${TABLE}.event_type = 14 ;;
        label: "Order Item Remove"
      }
      when: {
        sql: ${TABLE}.event_type = 15 ;;
        label: "Order Return"
      }
      when: {
        sql: ${TABLE}.event_type = 16 ;;
        label: "Order Hold"
      }
      when: {
        sql: ${TABLE}.event_type = 17 ;;
        label: "Order Change Storage"
      }
      when: {
        sql: ${TABLE}.event_type = 18 ;;
        label: "Import"
      }
      when: {
        sql: ${TABLE}.event_type = 19 ;;
        label: "Package Return"
      }
      when: {
        sql: ${TABLE}.event_type = 20 ;;
        label: "Adjustment"
      }
      when: {
        sql: ${TABLE}.event_type = 21 ;;
        label: "Order Item Refund"
      }
      when: {
        sql: ${TABLE}.event_type = 22 ;;
        label: "Order Item Confirm"
      }
      when: {
        sql: ${TABLE}.event_type = 23 ;;
        label: "Wipe"
      }
      when: {
        sql: ${TABLE}.event_type = 24 ;;
        label: "Update From Metrc"
      }
      when: {
        sql: ${TABLE}.event_type = 25 ;;
        label: "Prerolls Unpack"
      }
      when: {
        sql: ${TABLE}.event_type = 26 ;;
        label: "Deduct Package Quantity"
      }
    }
  }
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: inventory_log {
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
