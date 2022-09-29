# If necessary, uncomment the line below to include explore_source.
# include: "flavours.model.lkml"

view: product_categories_by_level {
  derived_table: {
    # persist_for: "24 hours"
    # indexes: ["id"]
    explore_source: product_categories {
      column: id { field: products.id }
      column: prod_name { field: products.name }
      column: level { field: product_categories.level }
      column: cat_name { field: product_categories.name }
      column: cat_name_1 { field: product_categories_1.name }
      column: cat_name_2 { field: product_categories_2.name }
    }
  }
  dimension: id {
    description: ""
    type: number
  }
  dimension: prod_name {
    description: "Product Name"
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









# view: product_categories_by_level {
#   derived_table: {
#     sql:
#     select
#       p.prod_id,
#       p.prod_name,
#       replace(pc.name, 'Root Category', NULL) as cat_name,
#       replace(pc1.name, 'Root Category', NULL) as cat1_name,
#       replace(pc2.name, 'Root Category', NULL) as cat2_name,
#       CASE
#           WHEN pc.level=1 THEN pc.name
#           WHEN pc.level=2 THEN pc1.name
#           WHEN pc.level=3 THEN pc2.name
#           END as parent_category,
#       CASE
#           WHEN pc.level=1 THEN NULL
#           WHEN pc.level=2 THEN pc.name
#           WHEN pc.level=3 THEN pc1.name
#           END as sub_category_1,
#         CASE
#           WHEN pc.level=1 THEN NULL
#           WHEN pc.level=2 THEN NULL
#           WHEN pc.level=3 THEN pc.name
#           END as sub_category_2
#     from products p
#     inner join product_categories pc on p.prod_category_id = pc.id
#     left join product_categories pc1 on pc.rgt < pc1.rgt and pc.lft > pc1.lft and pc.level = pc1.level + 1
#     left join product_categories pc2 on pc1.rgt < pc2.rgt and pc1.lft > pc2.lft and pc1.level = pc2.level + 1;;
#     sql_trigger_value: SELECT MAX(prod_id) FROM products;;
#   }


# }
