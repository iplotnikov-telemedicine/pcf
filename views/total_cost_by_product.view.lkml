# If necessary, uncomment the line below to include explore_source.
# include: "scflavors.model.lkml"

view: total_cost_by_product {
  derived_table: {
    explore_source: package_quantity_ext {
      column: product_id { field: product_checkins.product_id }
      column: total_cost_available {}
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
