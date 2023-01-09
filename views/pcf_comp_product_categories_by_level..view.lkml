view: pcf_comp_product_categories_by_level {
  derived_table: {
    explore_source: product_categories {
      column: id { field: products.id }
      column: prod_name { field: products.name }
      column: level { field: product_categories.level }
      column: cat_name { field: product_categories.name }
      column: cat_name_1 { field: product_categories_1.name }
      column: cat_name_2 { field: product_categories_2.name }
      bind_filters: {
        to_field: companies.company
        from_field: companies.company
      }
    }
  }
  dimension: id {
    description: ""
    type: number
  }
  dimension: prod_name {
    description: "Product Name"
    sql: ${TABLE}.prod_name ;;
  }
  dimension: level {
    description: ""
  }
  dimension: cat_name {
    description: ""
  }
  dimension: cat_name_1 {
    description: ""
  }
  dimension: cat_name_2 {
    description: ""
  }

  dimension: parent_category {
    sql: CASE ${level} WHEN 1 THEN ${cat_name}
      WHEN 2 THEN ${cat_name_1}
      WHEN 3 THEN ${cat_name_2}
      ELSE NULL
      END ;;
  }

  dimension: sub_category_1 {
    sql: CASE ${level} WHEN 1 THEN NULL
      WHEN 2 THEN ${cat_name}
      WHEN 3 THEN ${cat_name_1}
      ELSE NULL
      END ;;
  }

  dimension: sub_category_2 {
    sql: CASE ${level} WHEN 1 THEN NULL
          WHEN 2 THEN NULL
          WHEN 3 THEN ${cat_name}
          ELSE NULL
          END ;;
  }
}
