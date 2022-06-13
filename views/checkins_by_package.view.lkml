# If necessary, uncomment the line below to include explore_source.
# include: "kolas.model.lkml"

view: checkins_by_package {
# If necessary, uncomment the line below to include explore_source.
# include: "kolas.model.lkml"
derived_table: {
  explore_source: product_checkins {
    column: package_id {field: product_checkins.batch_id}
    column: checkin_id {field: product_checkins.id}
    column: office_id {field: product_checkins.office_id}
    column: barcode {field: product_checkins.external_barcode}
    column: price_sum {}
    column: qty_sum {}
    }
  }
  dimension: package_id {
    primary_key: yes
    description: ""
    type: number
  }
  dimension: checkin_id {
    description: ""
    type: number
  }
    dimension: office_id {
      description: ""
      type: string
  }
    dimension: barcode {
      description: ""
      type: string
  }
  dimension: price_sum {
    description: ""
    type: number
  }
  dimension: qty_sum {
    description: ""
    type: number
  }

}
