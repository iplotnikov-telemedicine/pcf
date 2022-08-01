# If necessary, uncomment the line below to include explore_source.
# include: "pcf.model.lkml"

view: package_quantity_calculated {
  derived_table: {
    explore_source: product_transactions {
      column: product_checkin_id {}
      column: item_type {}
      column: quantity_checked_in {}
      column: quantity_decreased_by {}
      column: quantity_increased_by {}
      column: quantity_returned {}
      column: quantity_sold {}
      column: quantity_unlinked {}
      column: quantity_adjusted_from_metrc {}
      bind_all_filters: yes
    }
  }
  dimension: product_checkin_id {
    description: ""
    type: number
  }
  dimension: item_type {
    description: ""
    type: string
  }
  dimension: quantity_checked_in {
    description: ""
    type: number
  }
  dimension: quantity_decreased_by {
    description: ""
    type: number
  }
  dimension: quantity_increased_by {
    description: ""
    type: number
  }
  dimension: quantity_returned {
    description: ""
    type: number
  }
  dimension: quantity_sold {
    description: ""
    type: number
  }
  dimension: quantity_unlinked {
    description: ""
    type: number
  }
  dimension: quantity_adjusted_from_metrc {
    description: ""
    type: number
  }
  dimension: quantity_available {
    description: ""
    type: number
    sql: ${quantity_checked_in}
    + ${quantity_adjusted_from_metrc}
    + ${quantity_decreased_by}
    + ${quantity_increased_by}
    + ${quantity_sold}
    + ${quantity_returned}
    + ${quantity_unlinked}
    ;;
  }
}
