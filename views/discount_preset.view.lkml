# If necessary, uncomment the line below to include explore_source.
# include: "dtla.model.lkml"

view: discount_preset {
  derived_table: {
    explore_source: order_items {
      #bind_all_filters: yes
      column: id { field: orders.id }
      column: discount_id { field: orders.discount_id }
      column: sum_discount { field: orders.sum_discount }
      column: is_bonus_point_as_discount { field: orders.is_bonus_point_as_discount }
      column: method5_amount { field: orders.method5_amount }
      column: sum_discount_amount {}
      column: confirmed_time { field: orders.confirmed_time }
      # filters: {
      #   field: orders.confirmed_time
      #   value: "2 days"
      # }
    }
  }
  dimension: id {
    primary_key: yes
    type: number
  }
  dimension: discount_id {
    type: number
  }
  dimension: sum_discount {
    # value_format: "$#,##0.00"
    type: number
  }
  dimension: is_bonus_point_as_discount {
    label: "Orders Is Bonus Point As Discount (Yes / No)"
    type: yesno
  }
  dimension: method5_amount {
    label: "Orders Payment via Bonus"
    # value_format: "$#,##0.00"
    type: number
  }
  dimension: sum_discount_amount {
    # value_format: "$#,##0.00"
    type: number
  }

  dimension: confirmed_time {
    # value_format: "$#,##0.00"
    type: date_time
  }

  dimension: discount_amount {
    type: number
    sql: COALESCE(IF(${discount_id} IS NULL, 0, ${sum_discount} - IF(${is_bonus_point_as_discount} = 1, ${method5_amount}, 0) - ${sum_discount_amount} ), 0) ;;
  }

  measure: sum_discount_preset {
    type: sum
    sql: ${discount_amount} ;;
    value_format_name: usd
  }
}
