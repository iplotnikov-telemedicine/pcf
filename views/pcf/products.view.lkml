view: products {
  sql_table_name: {% if _model._name == 'pcf_ext' %}ext_indica_{% endif %}c4546_company.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.prod_id ;;
  }

  dimension: brand_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.brand_id ;;
  }

  dimension: brand_product_strain_name {
    type: string
    sql: ${TABLE}.brand_product_strain_name ;;
  }

  dimension_group: deleted {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.deleted_at ;;
  }

  dimension: directions {
    type: string
    sql: ${TABLE}.directions ;;
  }

  dimension: ingredients {
    type: string
    sql: ${TABLE}.ingredients ;;
  }

  dimension: is_city_local_tax_exempt {
    type: yesno
    sql: ${TABLE}.is_city_local_tax_exempt ;;
  }

  dimension: is_marijuana_product {
    type: yesno
    sql: ${TABLE}.is_marijuana_product ;;
  }

  dimension: is_metrc {
    type: yesno
    sql: ${TABLE}.is_metrc ;;
  }

  dimension: is_metrc_compliant {
    type: yesno
    sql: ${TABLE}.is_metrc_compliant ;;
  }

  dimension: is_only_each {
    type: yesno
    sql: ${TABLE}.is_only_each ;;
  }

  dimension: is_preroll {
    type: yesno
    sql: ${TABLE}.is_preroll ;;
  }

  dimension: is_tax_exempt {
    type: yesno
    sql: ${TABLE}.is_tax_exempt ;;
  }

  dimension: is_under_package_control {
    type: yesno
    sql: ${TABLE}.is_under_package_control ;;
  }

  dimension: lab_result_id {
    type: number
    sql: ${TABLE}.lab_result_id ;;
  }

  dimension: marijuana_product_type {
    type: yesno
    sql: ${TABLE}.marijuana_product_type ;;
  }

  dimension: net_weight {
    type: number
    sql: ${TABLE}.net_weight ;;
  }

  dimension: net_weight_measure {
    type: yesno
    sql: ${TABLE}.net_weight_measure ;;
  }

  dimension: potify_brand_product_id {
    type: number
    sql: ${TABLE}.potify_brand_product_id ;;
  }

  dimension: potify_id {
    type: number
    sql: ${TABLE}.potify_id ;;
  }

  dimension: preroll_weight {
    type: number
    sql: ${TABLE}.preroll_weight ;;
  }

  dimension: backend_product_id {
    type: number
    sql: ${TABLE}.prod_backend_product_id ;;
  }

  dimension: prod_balance {
    type: number
    sql: ${TABLE}.prod_balance ;;
    value_format_name: usd
  }

  dimension: category_id {
    type: number
    sql: ${TABLE}.prod_category_id ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.prod_descr ;;
  }

  dimension: eighth_prepack_qty_o {
    type: number
    sql: ${TABLE}.prod_eighth_prepack_qty_o ;;
  }

  dimension: eighth_prepack_qty_w {
    type: number
    sql: ${TABLE}.prod_eighth_prepack_qty_w ;;
  }

  dimension: gram_prepack_qty_o {
    type: number
    sql: ${TABLE}.prod_gram_prepack_qty_o ;;
  }

  dimension: gram_prepack_qty_w {
    type: number
    sql: ${TABLE}.prod_gram_prepack_qty_w ;;
  }

  dimension: half_prepack_qty_o {
    type: number
    sql: ${TABLE}.prod_half_prepack_qty_o ;;
  }

  dimension: half_prepack_qty_w {
    type: number
    sql: ${TABLE}.prod_half_prepack_qty_w ;;
  }


  dimension: is_custom_price {
    type: yesno
    sql: ${TABLE}.prod_is_custom_price ;;
  }

  dimension: is_excise {
    type: yesno
    sql: ${TABLE}.prod_is_excise ;;
  }

  dimension: is_free_shipping {
    type: yesno
    sql: ${TABLE}.prod_is_free_shipping ;;
  }

  dimension: is_hidden {
    type: yesno
    sql: ${TABLE}.prod_is_hidden ;;
  }

  dimension: is_on_shop {
    type: yesno
    sql: ${TABLE}.prod_is_on_shop ;;
  }

  dimension: is_on_weedmaps {
    type: yesno
    sql: ${TABLE}.prod_is_on_weedmaps ;;
  }

  dimension: is_print_label {
    type: yesno
    sql: ${TABLE}.prod_is_print_label ;;
  }

  dimension: is_tax_included {
    type: yesno
    sql: ${TABLE}.prod_is_tax_included ;;
  }

  dimension: is_taxable {
    type: yesno
    sql: ${TABLE}.prod_is_taxable ;;
  }

  dimension: joint_cost {
    type: number
    sql: ${TABLE}.prod_joint_cost ;;
  }

  dimension: joints_qty_o {
    type: number
    sql: ${TABLE}.prod_joints_qty_o ;;
  }

  dimension: joints_qty_w {
    type: number
    sql: ${TABLE}.prod_joints_qty_w ;;
  }

  dimension: lab_type {
    type: string
    sql: ${TABLE}.prod_lab_type ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.prod_name ;;
  }

  dimension: ounce_prepack_qty_o {
    type: number
    sql: ${TABLE}.prod_ounce_prepack_qty_o ;;
  }

  dimension: ounce_prepack_qty_w {
    type: number
    sql: ${TABLE}.prod_ounce_prepack_qty_w ;;
  }

  dimension: photo {
    type: string
    sql: ${TABLE}.prod_photo ;;
  }

  dimension: product_cost {
    type: number
    sql: ${TABLE}.prod_price;;
    value_format_name: usd
  }

  dimension: price {
    label: "Cost"
    type: number
    sql: ${TABLE}.prod_price ;;
  }

  dimension: price_joint {
    type: number
    sql: ${TABLE}.prod_price_joint ;;
  }

  dimension: price_piece {
    type: number
    sql: ${TABLE}.prod_price_piece ;;
  }

  dimension: price_preset_id {
    type: number
    sql: ${TABLE}.prod_price_preset_id ;;
  }

  dimension: price_type {
    type: string
    sql: ${TABLE}.prod_price_type ;;
  }

  # dimension: price_weight_per_eighth {
  #   type: number
  #   sql: ${TABLE}.prod_price_weight_per_eighth ;;
  # }

  # dimension: price_weight_per_gram {
  #   type: number
  #   sql: ${TABLE}.prod_price_weight_per_gram ;;
  # }

  # dimension: prod_price_weight_per_half {
  #   type: number
  #   sql: ${TABLE}.prod_price_weight_per_half ;;
  # }

  # dimension: price_weight_per_ounce {
  #   type: number
  #   sql: ${TABLE}.prod_price_weight_per_ounce ;;
  # }

  # dimension: price_weight_per_quarter {
  #   type: number
  #   sql: ${TABLE}.prod_price_weight_per_quarter ;;
  # }

  dimension: qty_o {
    type: number
    sql: ${TABLE}.prod_qty_o ;;
  }

  dimension: qty_w {
    type: number
    sql: ${TABLE}.prod_qty_w ;;
  }

  dimension: quarter_prepack_qty_o {
    type: number
    sql: ${TABLE}.prod_quarter_prepack_qty_o ;;
  }

  dimension: quarter_prepack_qty_w {
    type: number
    sql: ${TABLE}.prod_quarter_prepack_qty_w ;;
  }

  dimension: sales {
    type: number
    sql: ${TABLE}.prod_sales ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.prod_sku ;;
  }

  dimension: symbol {
    type: string
    sql: ${TABLE}.prod_symbol ;;
  }

  dimension: tax_id_bak {
    type: number
    value_format_name: id
    sql: ${TABLE}.prod_tax_id_bak ;;
  }

  dimension: tax_profile_id {
    type: number
    sql: ${TABLE}.prod_tax_profile_id ;;
  }

  dimension: tax_tier_version_id {
    type: number
    sql: ${TABLE}.prod_tax_tier_version_id ;;
  }

  dimension: tv_photo {
    type: string
    sql: ${TABLE}.prod_tv_photo ;;
  }

  dimension: upc {
    type: string
    sql: ${TABLE}.prod_upc ;;
  }

  dimension: vendor_id {
    type: number
    sql: ${TABLE}.prod_vendor_id ;;
  }

  dimension: product_class {
    type: string
    sql: ${TABLE}.product_class ;;
  }

  dimension: product_type_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_type_id ;;
  }

  dimension: prod_category_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.prod_category_id ;;
  }

  dimension: show_on_leafly {
    type: yesno
    sql: ${TABLE}.show_on_leafly ;;
  }

  dimension: strain {
    type: yesno
    sql: ${TABLE}.strain ;;
  }

  dimension: strain_name {
    type: string
    case: {
      when: {
        sql: ${strain} = 0 ;;
        label: "None"
      }
      when: {
        sql: ${strain} = 1 ;;
        label: "Indica"
      }
      when: {
        sql: ${strain} = 2 ;;
        label: "Sativa"
      }
      when: {
        sql: ${strain} = 3 ;;
        label: "Hybrid"
      }
      when: {
        sql: ${strain} = 4 ;;
        label: "CBD"
      }
    }
  }

  dimension: prod_price_type {
    type:  string
    sql: ${TABLE}.prod_price_type ;;
  }

  dimension: product_id_and_name {
    type: string
    sql: CONCAT(${id}, '-', ${name}) ;;
  }

  dimension_group: sync_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.sync_created_at ;;
  }

  dimension_group: sync_updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.sync_updated_at ;;
  }

  dimension: twcc {
    type: number
    sql: ${TABLE}.twcc ;;
  }

  dimension: wm_product_id {
    type: number
    sql: ${TABLE}.wm_product_id ;;
  }

  dimension: internal_product {
    type: yesno
    sql: IF(${brand_id}, 1, 0) AND ${brand_id} IN (1) ;;
  }

  dimension: external_product {
    type: yesno
    sql: ${brand_id} NOT IN(1) ;;
  }

  dimension: is_internal_product {
    type: yesno
    sql: ${brands.is_internal} ;;
  }

  measure: number_of_products {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      wm_product_id,
      name,
      brand_product_strain_name,
      product_types.id,
      product_types.name,
      brands.brand_id,
      brands.brand_name,
      package_quantity.count,
      product_checkins.count,
      product_docs.count,
      product_prices.count,
      product_transactions.count,
      purchasing_limit_patient_limit_operations.count,
      refunded_quantity.count,
      refund_products.count,
      special_items.count,
      tax_payment.count,
      warehouse_order_items.count
    ]
  }
}
