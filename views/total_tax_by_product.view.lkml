# If necessary, uncomment the line below to include explore_source.
# include: "pcf.model.lkml"

view: total_tax_by_product {
  derived_table: {
    explore_source: product_with_tax {
      column: product_id {field: product_with_tax.id}
      column: product_name {field: product_with_tax.name}
      column: tax_tier_1_retail_price {}
      column: tax_tier_1_total_tax {}
      column: tax_tier_2_retail_price {}
      column: tax_tier_2_total_tax {}
      column: tax_tier_3_retail_price {}
      column: tax_tier_3_total_tax {}
      column: sales_price {}
      filters: {
        field: product_with_tax.deleted_date
        value: "NULL"
      }
    }
  }
  dimension: product_id {
    description: ""
    type: number
  }
  dimension: product_name {
    description: ""
  }
  dimension: tax_tier_1_retail_price {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: tax_tier_1_total_tax {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: tax_tier_2_retail_price {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: tax_tier_2_total_tax {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: tax_tier_3_retail_price {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: tax_tier_3_total_tax {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: sales_price {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
}
