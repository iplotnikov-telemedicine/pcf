include: "products.view"

view: product_with_tax {
  extends: [products]

  dimension: is_excise_applied {
    type: yesno
    sql: ${product_with_tax.is_marijuana_product} ;;
  }

  dimension: is_self_distributed {
    type: yesno
    sql: ${product_with_tax.is_excise} ;;
  }

  dimension: sales_price {
    type: number
    sql: ${product_prices.price} ;;
    value_format_name: usd
  }

  dimension: city_local_tax_rate {
    type: number
    sql:
    CASE WHEN ${product_with_tax.is_marijuana_product}
      THEN ${tax_city_local_rates.mmj_rate}
      ELSE ${tax_city_local_rates.non_mmj_rate}
    END ;;
  }

  dimension: base_for_city_local {
    type: number
    sql: ${sales_price} ;;
  }

  dimension: tax_city_local {
    type: number
    sql: ${base_for_city_local} * ${city_local_tax_rate} ;;
    value_format_name: usd
  }

  dimension: excise_rate {
    type: number
    sql:
    CASE WHEN ${is_excise_applied} THEN
      CASE WHEN ${is_self_distributed} THEN
        ${tax_excise.rate_sdp}
      ELSE
        ${tax_excise.rate_nsdp}
      END
    ELSE
      0
    END;;
  }

  dimension: base_for_excise {
    type: number
    sql:
    CASE WHEN ${tax_excise.is_included_city_local_tax_sdp} THEN
      ${sales_price} + ${tax_city_local}
    ELSE
      ${sales_price}
    END;;
  }

  dimension: tax_excise {
    type: number
    sql: ${base_for_excise} * ${excise_rate} ;;
    value_format_name: usd
  }

  dimension: tax_sales_rate {
    type: number
    sql:
    CASE WHEN ${product_with_tax.is_marijuana_product}
      THEN ${tax_sales_rates.mmj_rate}
      ELSE ${tax_sales_rates.non_mmj_rate}
    END ;;
  }

  dimension: base_for_tax_sales {
    type: number
    sql:
    CASE WHEN ${tax_sales.is_included_excise_tax} THEN
      ${sales_price} + ${tax_city_local} + ${tax_excise}
    ELSE
      ${sales_price} + ${tax_city_local}
    END;;
  }

  dimension: tax_sales {
    type: number
    sql: ${base_for_tax_sales} * ${tax_sales_rate} ;;
    value_format_name: usd
  }

  dimension: total_tax {
    type: number
    sql:  ${tax_city_local} + ${tax_excise} + ${tax_sales} ;;
    value_format_name: usd
  }

  measure: tax_tier_1_total_tax {
    type: min
    sql:  ${total_tax} ;;
    value_format_name: usd
    filters: [tax_tier.id: "1"]
  }

  measure: tax_tier_2_total_tax {
    type: min
    sql:  ${total_tax} ;;
    value_format_name: usd
    filters: [tax_tier.id: "2"]
  }

  measure: tax_tier_3_total_tax {
    type: min
    sql:  ${total_tax} ;;
    value_format_name: usd
    filters: [tax_tier.id: "3"]
  }

  measure: tax_tier_1_retail_price {
    type: number
    sql:  ${sales_price} + ${tax_tier_1_total_tax} ;;
    value_format_name: usd
  }

  measure: tax_tier_2_retail_price {
    type: number
    sql:  ${sales_price} + ${tax_tier_1_total_tax} ;;
    value_format_name: usd
  }

  measure: tax_tier_3_retail_price {
    type: number
    sql:  ${sales_price} + ${tax_tier_1_total_tax} ;;
    value_format_name: usd
  }

  dimension: retail_price {
    alias: [otd_price]
    type: number
    sql:  ${sales_price} + ${total_tax} ;;
    value_format_name: usd
  }
}
