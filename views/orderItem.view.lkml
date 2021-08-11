view: orderItem {
  sql_table_name: warehouse_order_items ;;

  label: "Order Items"

  dimension: order_item_id {
    description: "Unique ID for each order item"
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: order_id {
    description: "Unique ID for each order"
    label: "Order ID"
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: product_id {
    description: "Unique ID for each product"
    label: "Product ID"
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_name {
    description: "Product Name"
    label: "Product Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: price_type {
    description: "Products price type"
    label: "Price Type"
    type: string
    sql: ${TABLE}.price_type ;;
  }

  dimension: price_per {
    description: "Product Price Per (Unit)"
    label: "Product Price Per"
    type: string
    sql: ${TABLE}.price_per ;;
  }

  dimension: charge_by {
    description: "Product charge by"
    label: "Product charge by"
    type: string
    sql: ${TABLE}.charge_by ;;
  }

  dimension: price {
    description: "Product Cost"
    label: "Product Cost"
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: quantity {
    description: "Product Quantity"
    label: "Product Quantity"
    type: number
    sql: ${TABLE}.qty ;;
  }

  dimension: quantity_free {
    description: "Free quantity"
    label: "Free quantity"
    type: number
    sql: ${TABLE}.qty_free ;;
  }

  dimension: amount {
    description: "Order Item Amount"
    label: "Amount"
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: tax {
    description: "Order Item Tax"
    label: "Order Item Tax"
    type: number
    sql: ${TABLE}.tax ;;
  }

  dimension: discount_value {
    description: "Discount value in %"
    label: "Discount (%)"
    type: number
    sql: ${TABLE}.discount_value ;;
  }

  dimension: discount_amount {
    description: "Discount Amount"
    label: "Discount ($)"
    type: number
    sql: ${TABLE}.discount_amount ;;
  }

  dimension: is_free {
    description: "Is Free"
    label: "Order Item Is Free"
    type: yesno
    sql: ${TABLE}.is_free ;;
  }

  dimension: free_discount {
    description: "Free discount"
    label: "Discount of free oreder item"
    type: number
    sql: ${TABLE}.free_discount ;;
  }

  dimension: is_charge_by_order {
    description: "Product Name"
    label: "Product Name"
    type: yesno
    sql: ${TABLE}.is_charge_by_order ;;
  }

  dimension: income {
    description: "Order Item Income"
    label: "Income"
    type: number
    sql: ${TABLE}.income ;;
  }

  dimension: item_type {
    description: "Item type (gram, pc)"
    label: "Unit type"
    type: string
    sql: ${TABLE}.item_type ;;
  }

  dimension: count {
    description: "Count of Order Item"
    label: "Item Count"
    type: number
    sql: ${TABLE}.count ;;
  }

  dimension: special_id {
    type: number
    sql: ${TABLE}.special_id ;;
  }

  dimension: special_item_id {
    type: number
    sql: ${TABLE}.special_item_id ;;
  }

  dimension: is_half_eighth {
    description: "Is Half Eighth"
    label: "Is Half Eighth"
    type: yesno
    sql: ${TABLE}.is_half_eighth ;;
  }

  dimension: is_returned {
    description: "Is Returned"
    label: "Is Returned"
    type: yesno
    sql: ${TABLE}.is_returned ;;
  }

  dimension: returned_amount {
    description: "Returned Amount"
    label: "Returned Amount"
    type: number
    sql: ${TABLE}.returned_amount ;;
  }

  dimension: dicount_type {
    description: "Discount Type"
    label: "Discount Type"
    type: number
    sql: ${TABLE}.discount_type ;;
  }

  dimension: free_amount {
    description: "Free Amount"
    label: "Free Amount"
    type: number
    sql: ${TABLE}.free_amount ;;
  }

  dimension: paid_amount {
    description: "Paid Amount"
    label: "Paid Amount"
    type: number
    sql: ${TABLE}.paid_amount ;;
  }

  dimension: created_at {
    description: "Created"
    label: "Created"
    type: string
    sql: ${TABLE}.sync_created_at ;;
  }

  dimension: updated_at {
    description: "Updated At"
    label: "Updated At"
    type: string
    sql: ${TABLE}.sync_updated_at ;;
  }

  dimension: product_checkin_id {
    label: "Package ID"
    type: number
    sql: ${TABLE}.product_checkin_id ;;
  }

  dimension: is_excise {
    label: "Is excise"
    type: yesno
    sql: ${TABLE}.is_excise ;;
  }

  dimension: return_date {
    label: "Return Date"
    type: string
    sql: ${TABLE}.returned_at ;;
  }

  dimension: is_marijuana_product {
    label: "Is Marijuana"
    type: yesno
    sql: ${TABLE}.is_marijuana_product ;;
  }

  dimension: product_is_tax_exempt {
    label: "Is Tax Exempt"
    type: yesno
    sql: ${TABLE}.product_is_tax_exempt ;;
  }

  dimension: is_metrc {
    label: "Is Metrc"
    type: yesno
    sql: ${TABLE}.is_metrc ;;
  }

  dimension: is_under_package_control {
    label: "Is product Under Package Control"
    type: yesno
    sql: ${TABLE}.is_under_package_control ;;
  }

  dimension: base_amount {
    label: "Base Amount"
    type: number
    sql: ${TABLE}.base_amount ;;
  }

  dimension: dicount_id {
    label: "Discount ID"
    type: number
    sql: ${TABLE}.discount_id ;;
  }

  dimension: delivery_tax {
    label: "Delivery Tax"
    type: number
    sql: ${TABLE}.delivery_tax ;;
  }

  dimension: dicount_count {
    label: "Discount Count"
    type: number
    sql: ${TABLE}.discount_count ;;
  }

  dimension: is_exchanged {
    label: "Is Exchanged"
    type: yesno
    sql: ${TABLE}.is_exchanged ;;
  }

  dimension: exchanged_at {
    label: "Exchange Date"
    type: string
    sql: ${TABLE}.exchanged_at ;;
  }

  dimension: order_item_count {
    label: "Total order item Count"
    type: number
    sql: (${quantity} + ${quantity_free}) * ${count};;
  }

  dimension: sum_order_items {
    label: "Sum order items"
    type: number
    sql: SUM(${order_item_count}) ;;
  }

  dimension: gross_sale {
    label: "Gross sale"
    type: number
    sql: ${paid_amount} - ${tax} ;;
  }

  dimension: sum_gross_sales {
    label: "SUM Gross sale"
    type: number
    sql: SUM(${paid_amount} - ${tax}) ;;
  }

  measure: sum_order_item{
    type: sum
    sql: SUM(${order_item_count}) ;;
  }

  measure: sum_gross_sale {
    type: sum
    sql: ${gross_sale} ;;
    value_format_name: usd
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

# view: orederitem {
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
