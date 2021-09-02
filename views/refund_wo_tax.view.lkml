# If necessary, uncomment the line below to include explore_source.
# include: "pcf.model.lkml"

view: refund_wo_tax {
  derived_table: {
    explore_source: order_items {
      column: id {}
      column: paid_amount {}
      column: returned_amount {}
      column: tax {}
      column: refund {}
      column: returned {}

      bind_filters: {
        to_field: refund_wo_tax.returned
        from_field: orders.confirmed
      }
    }
  }
  dimension: id {
    type: number
    primary_key: yes
  }
  dimension: paid_amount {
    type: number
  }
  dimension: returned_amount {
    type: number
  }
  dimension: tax {
    type: number
  }

  dimension: refund {
    type: number
    sql: IF(${paid_amount}, (${returned_amount} - (${returned_amount} * ${tax} / ${paid_amount}) ), 0 ) ;;
  }

  measure: sum_refund {
    type: sum
    sql: ${refund} ;;
  }

  dimension_group: returned {
    type: time
  }

}
