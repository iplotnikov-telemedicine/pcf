view: pcf_comp_quantities_by_product {
  derived_table: {
    explore_source: product_quantity_and_offices {
      column: product_id {}
      column: shelf_quantity {}
      column: storage_quantity {}
      column: total_quantity {}
      bind_filters: {
        to_field: companies.company
        from_field: companies.company
      }
    }
  }
  dimension: product_id {
    description: ""
    type: number
  }
  dimension: shelf_quantity {
    description: ""
    type: number
  }
  dimension: storage_quantity {
    description: ""
    type: number
  }
  dimension: total_quantity {
    description: ""
    type: number
  }
}
