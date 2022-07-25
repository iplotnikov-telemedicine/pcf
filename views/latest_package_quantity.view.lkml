view: latest_package_quantity {
  derived_table: {
    explore_source: package_quantity_for_metrc {
      column: package_id {}
      column: max_updated {}
      filters: {
        field: package_quantity_for_metrc.package_id
        value: ""
      }
    }
  }
  dimension: package_id {
    description: ""
    type: number
  }
  dimension: max_updated {
    description: ""
    type: number
  }
}
