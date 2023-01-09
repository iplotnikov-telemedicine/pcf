view: pcf_comp_total_cost_by_product {
  derived_table: {
    explore_source: package_quantity_ext {
      column: product_id { field: product_checkins.product_id }
      column: total_cost_available {}
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
  dimension: total_cost_available {
    description: ""
    type: number
    value_format_name: usd
  }
}
