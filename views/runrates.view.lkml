# If necessary, uncomment the line below to include explore_source.
# include: "shift_statistics.model.lkml"

view: runrates {
  derived_table: {
    explore_source: products {
      column: prod_id {}
      column: prod_name { field: products.name }
      column: prod_price {}
      column: total_quantity { field: quantity_by_product.total_quantity }
      column: brand_name { field: brands.brand_name }
      column: parent_category { field: product_categories_by_level.parent_category }
      column: sum_order_item_quantity { field: order_items.sum_order_item_quantity }
      column: num_days { field: orders.num_days }
      bind_all_filters: yes
    }
  }
  dimension: prod_id {
    description: ""
    type: number
  }
  dimension: prod_name {
    description: ""
  }
  dimension: prod_price {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: total_quantity {
    description: ""
    type: number
  }
  dimension: brand_name {
    description: ""
  }
  dimension: parent_category {
    description: ""
  }
  dimension: sum_order_item_quantity {
    description: ""
    type: number
  }
  dimension: num_days {
    description: ""
    type: number
  }
}
