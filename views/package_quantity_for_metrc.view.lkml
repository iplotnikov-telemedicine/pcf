# If necessary, uncomment the line below to include explore_source.
# include: "pcf.model.lkml"

view: package_quantity_for_metrc {
  derived_table: {
    explore_source: package_quantity_for_metrc {
      column: uid { field: product_checkins.uid }
      column: total_quantity_available {}
    }
  }
  dimension: uid {
    description: ""
    type: string
  }
  dimension: total_quantity_available {
    description: ""
    type: number
  }
}
