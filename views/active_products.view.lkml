# If necessary, uncomment the line below to include explore_source.
# include: "shift_statistics.model.lkml"

view: active_products {
  derived_table: {
    explore_source: products {
      column: prod_id {}
      filters: {
        field: orders.confirmed_at
        value: "2 weeks"
      }
    }
  }
  dimension: prod_id {
    description: ""
    type: number
  }
}
