# If necessary, uncomment the line below to include explore_source.
# include: "blue_fire.model.lkml"

view: quantity_by_product {
  derived_table: {
    explore_source: products {
      column: product_id { field: product_office_quantity.product_id }
      column: total_quantity { field: product_office_quantity.total_quantity }
      bind_filters: {
        to_field: product_office_quantity.product_id
        from_field: products.prod_id
      }
    }
  }
  dimension: product_id {
    primary_key: yes
    description: ""
    type: number
  }

  dimension: total_quantity {
    description: ""
    type: number
  }
}


# If necessary, uncomment the line below to include explore_source.
# include: "shift_statistics.model.lkml"
