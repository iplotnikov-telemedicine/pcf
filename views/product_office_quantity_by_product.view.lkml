# If necessary, uncomment the line below to include explore_source.
include: "product_office_quantity.view"

view: product_office_quantities_by_product {
  derived_table: {
    explore_source: product_office_quantity {
      column: product_id {}
      column: item_type {}
      column: total_item_quantity {}
    }
  }

  dimension: product_id {
    description: ""
    type: number
  }

  dimension: item_type {
    description: ""
  }

  dimension: total_item_quantity {
    description: ""
    type: number
  }
}