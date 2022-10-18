connection: "kg"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "/my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
# include: "//viz_multiple_value/"

explore: sales_by_product {
  join: products {
    relationship: one_to_one
    sql_on: ${sales_by_product.id} = ${products.id};;
  }
  join: quantity_by_product {
    relationship: one_to_one
    type: left_outer
    sql_on: ${sales_by_product.id} = ${quantity_by_product.product_id};;
  }
  join: offices {
    relationship: many_to_one
    type: inner
    sql_on: ${sales_by_product.office_id} = ${offices.office_id} ;;
  }
  join: brands {
    relationship: many_to_one
    sql_on: ${products.brand_id} = ${brands.id} ;;
  }
  join: product_vendors {
    relationship: many_to_one
    sql_on: ${products.vendor_id} = ${product_vendors.id} ;;
  }
  join: product_categories_by_level {
    relationship: many_to_one
    sql_on: ${products.id} = ${product_categories_by_level.id} ;;
  }

}

explore: orders_with_details {
  join: latest_patient_orders {
    relationship: many_to_one
    type: inner
    sql_on: ${orders_with_details.confirmed_raw} = ${latest_patient_orders.latest_order_confirmed}
      and ${orders_with_details.patient_id} = ${latest_patient_orders.patient_id}
      and ${latest_patient_orders.has_orders_after_date} = 'No' ;;
  }
  join: patients {
    relationship: many_to_one
    sql_on: ${orders_with_details.patient_id} = ${patients.id} ;;
  }
  join: order_items {
    relationship: one_to_many
    type: inner
    sql_on: ${orders_with_details.id} = ${order_items.order_id} ;;
  }
  join: tax_payment_flat {
    relationship: one_to_one
    sql_on: ${orders_with_details.id} = ${tax_payment_flat.order_id} ;;
  }
  join: products {
    relationship: many_to_one
    sql_on: ${order_items.product_id} = ${products.id};;
  }
  join: brands {
    relationship: many_to_one
    sql_on: ${products.brand_id} = ${brands.id} ;;
  }
  join: product_categories_by_level {
    relationship: many_to_one
    sql_on: ${order_items.product_id} = ${product_categories_by_level.id} ;;
  }
  join: offices {
    relationship: many_to_one
    type: inner
    sql_on: ${orders_with_details.office_id} = ${offices.office_id} ;;
    fields: [office_name, office_is_active]
  }
  join: net_sales_by_office {
    relationship: many_to_one
    type: inner
    sql_on: ${orders_with_details.office_id} = ${net_sales_by_office.office_id} ;;
  }
}

explore: product_quantity_and_offices {
  join: offices {
    type: inner
    relationship: many_to_one
    sql_on: ${product_quantity_and_offices.office_id} = ${offices.office_id};;
  }
}

explore: products {
  from: products

  join: sales_by_product {
    type: inner
    relationship: one_to_one
    sql_on: ${products.id}  = ${sales_by_product.id} ;;
  }

  join: product_office_quantity {
    type: inner
    relationship: one_to_many
    sql_on:  ${products.id}  = ${product_office_quantity.product_id} ;;
  }

  join: runrates {
    type: inner
    relationship: one_to_one
    sql_on:  ${products.id}  = ${runrates.prod_id} ;;
  }

  join: quantity_by_product {
    type: inner
    relationship: one_to_many
    sql_on:  ${products.id}  = ${quantity_by_product.product_id} ;;
  }

  join: product_categories {
    type: inner
    relationship: many_to_one
    sql_on: ${products.prod_category_id} = ${product_categories.id};;
  }

  join: active_products {
    relationship: one_to_one
    type: left_outer
    sql_on: ${products.id} = ${active_products.prod_id} ;;
  }

  join: patients {
    relationship: many_to_one
    sql_on: ${orders.patient_id} = ${patients.id} ;;
  }

  join: order_items {
    relationship: one_to_many
    sql_on: ${products.id} = ${order_items.product_id} ;;
  }

  join: orders {
    relationship: many_to_one
    type: inner
    sql_on: ${order_items.order_id} = ${orders.id} ;;
  }

  join: patient_offices {
    from: offices
    relationship: many_to_one
    sql_on: ${patients.office_id} = ${patient_offices.office_id} ;;
  }

  join: brands {
    relationship: many_to_one
    sql_on: ${products.brand_id} = ${brands.id} ;;
  }

  join: product_categories_by_level {
    type: inner
    relationship: many_to_one
    sql_on: ${products.id} = ${product_categories_by_level.id} ;;
  }

}

explore: product_categories {
  join: products {
    type: inner
    relationship: many_to_one
    sql_on: ${products.prod_category_id} = ${product_categories.id};;
  }

  join: brands {
    relationship: many_to_one
    sql_on: ${products.brand_id} = ${brands.id} ;;
  }

  join: product_categories_1 {
    from: product_categories
    fields: [id, name]
    relationship: many_to_one
    sql_on: ${product_categories.rgt} < ${product_categories_1.rgt}
      and ${product_categories.lft} > ${product_categories_1.lft}
      and ${product_categories.level} = ${product_categories_1.level} + 1 ;;
  }

  join: product_categories_2 {
    from: product_categories
    fields: [id, name]
    relationship: many_to_one
    sql_on: ${product_categories_1.rgt} < ${product_categories_2.rgt}
          and ${product_categories_1.lft} > ${product_categories_2.lft}
          and ${product_categories_1.level} = ${product_categories_2.level} + 1 ;;
  }

}

explore: monthly_sales {

  join: monthly_patients {
    relationship: one_to_one
    sql_on: ${monthly_sales.confirmed_month} = ${monthly_patients.created_month} ;;
  }

  join: monthly_refunds {
    relationship: one_to_one
    sql_on: ${monthly_sales.confirmed_month} = ${monthly_refunds.returned_month} ;;
  }

}

explore: service_history {

  join: users {
    type: inner
    relationship: many_to_one
    sql_on: ${service_history.user_id} = ${users.id} ;;
  }

  join: services {
    type: inner
    relationship: many_to_one
    sql_on: ${service_history.service_id} = ${services.id} ;;
  }

  join: service_company_ref {
    type: inner
    relationship: many_to_one
    sql_on: ${services.id} = ${service_company_ref.service_id} ;;
  }

  join: orders {
    type: inner
    relationship: many_to_one
    sql_on: ${service_history.order_id} = ${orders.id} ;;
  }

}


explore: order_items {
  from: order_items_with_details

  join: products {
    relationship: many_to_one
    sql_on: ${products.id} = ${order_items.product_id};;
  }

  join: brands {
    relationship: many_to_one
    sql_on: ${products.brand_id} = ${brands.id} ;;
  }

  join: orders {
    type: inner
    relationship: many_to_one
    sql_on: ${orders.id} = ${order_items.order_id} ;;
  }

  join: discounts {
    relationship: many_to_one
    sql_on: ${discounts.id} = ${order_items.discount_id} ;;
  }

  join: order_item_discounts {
    from: discounts
    relationship: many_to_one
    sql_on: ${discounts.id} = ${order_items.discount_id} and ${discounts.discount_apply_type} = "item";;
  }

  join: discount_amount_by_id {
    relationship: one_to_one
    sql_on: ${discounts.id} = ${discount_amount_by_id.id} ;;
  }

  join: offices {
    type: inner
    relationship: many_to_one
    sql_on: ${orders.office_id} = ${offices.office_id} ;;
  }

  join: patients {
    type: inner
    relationship: many_to_one
    sql_on: ${orders.patient_id} = ${patients.id} ;;
  }

  join: tax_payment {
    relationship: one_to_one
    sql_on: ${order_items.id} = ${tax_payment.order_item_id} ;;
  }

  join: order_item_refunds {
    from: order_items
    relationship: one_to_one
    sql_on: ${order_item_refunds.id} = ${order_items.id} AND ${order_item_refunds.is_returned} = 1;;
  }

  join: staff {
    type: inner
    from: users
    relationship: many_to_one
    sql_on: ${staff.id} = ${orders.cashier_id} ;;
  }

  join: sf_guard_user_group {
    relationship: many_to_many
    sql_on: ${staff.id} = ${sf_guard_user_group.user_id} ;;
  }

  join: staff_category {
    from: sf_guard_group
    relationship: many_to_one
    type: inner
    sql_on: ${sf_guard_user_group.group_id} = ${staff_category.id} ;;
  }

  join: discount_preset {
    relationship: many_to_one
    sql_on: ${orders.id} = ${discount_preset.id} ;;
  }

  join: order_discounts {
    from: discounts
    relationship: many_to_one
    sql_on: ${discounts.id} = ${orders.discount_id} and ${discounts.discount_apply_type} = "cart";;
  }

  join: notes {
    relationship: many_to_one
    sql_on:  ${patients.id} = ${notes.patient_id};;
  }

  join: company {
    relationship: one_to_many
    sql_on: ${offices.office_comp_id} = ${company.id} ;;
  }

  join: product_categories {
    relationship: many_to_one
    sql_on: ${products.category_id} = ${product_categories.id} ;;
  }

  join: product_checkins {
    relationship: many_to_one
    sql_on: ${product_checkins.id} = ${order_items.product_checkin_id} ;;
  }

  join: recommendations {
    relationship: many_to_one
    sql_on: ${orders.patient_id} = ${recommendations.rec_pat_id}
          AND ${recommendations.rec_valid_from_date} <= ${orders.confirmed_raw}
          AND ${recommendations.rec_valid_to_raw} >= ${orders.confirmed_raw};;
  }
#          AND ${recommendations.is_current};;

  join: returning_patients {
    relationship: one_to_one
    type: inner
    sql_on: ${patients.id} = ${returning_patients.id} ;;
  }

  join: refunds {
    from: order_items
    relationship: many_to_one
    sql_on: ${refunds.order_id} = ${orders.id} ;;
  }

  join: register_log {
    relationship: one_to_one
    sql_on: ${service_history.id} = ${register_log.service_history_id} ;;
  }

  join: service_history {
    relationship: many_to_one
    sql_on: ${orders.id} = ${service_history.order_id} ;;
  }

  join: tax_excise {
    relationship: one_to_many
    sql_on: ${orders.tax_tier_version_id} = ${tax_excise.tax_tier_version_id} ;;
  }

  join: users {
    relationship: many_to_one
    sql_on: ${users.id} = ${orders.cashier_id} ;;
  }
}

explore: patients_with_orders {
  join: orders {
    type: inner
    relationship: one_to_many
    sql_on: ${patients_with_orders.id} = ${orders.patient_id};;
  }
}

explore: customer_frequency {}

explore: inventory_log {

  join: offices {
    type: inner
    relationship: many_to_one
    sql_on: ${inventory_log.storage_id} = ${offices.office_id} ;;
  }

  join: product_checkins {
    relationship: many_to_one
    sql_on: ${inventory_log.package_id} = ${product_checkins.id};;
  }

  join: products {
    type: inner
    relationship: many_to_one
    sql_on:  ${inventory_log.product_id} = ${products.id} ;;
  }

  join: brands {
    relationship: many_to_one
    sql_on: ${products.brand_id} = ${brands.id} ;;
  }

  join: product_categories {
    relationship: many_to_one
    sql_on: ${products.prod_category_id} = ${product_categories.id};;
  }

  join: product_categories_1 {
    from: product_categories
    fields: [name]
    relationship: many_to_one
    sql_on: ${product_categories.id} <= ${product_categories_1.rgt}
      and ${product_categories.id} >= ${product_categories_1.lft}
      and ${product_categories.level} = ${product_categories_1.level} + 1 ;;
  }

  join: product_categories_2 {
    from: product_categories
    fields: [name]
    relationship: many_to_one
    sql_on: ${product_categories_1.id} <= ${product_categories_2.rgt}
          and ${product_categories_1.id} >= ${product_categories_2.lft}
          and ${product_categories_1.level} = ${product_categories_2.level} + 1 ;;
  }

  join: product_categories_3 {
    from: product_categories
    fields: [name]
    relationship: many_to_one
    sql_on: ${product_categories_2.id} <= ${product_categories_3.rgt}
          and ${product_categories_2.id} >= ${product_categories_3.lft}
          and ${product_categories_2.level} = ${product_categories_3.level} + 1 ;;
  }

  join: product_price_group {
    relationship: many_to_one
    sql_on: ${products.id} = ${product_price_group.product_id};;
  }

  join: product_prices {
    relationship: many_to_one
    sql_on: ${product_price_group.id} = ${product_prices.price_group_id}
      and (${product_prices.weight_type} is NULL
        or ${product_prices.weight_type} = 'gram')
      and (${product_prices.range_from} is NULL
        or ${product_prices.range_from} = 1);;
  }

  join: product_tag_ref {
    relationship: one_to_many
    sql_on: ${products.id} = ${product_tag_ref.product_id};;
  }

  join: product_tag {
    relationship: many_to_many
    sql_on: ${product_tag_ref.tag_id} = ${product_tag.id};;
  }
}

explore: product_with_tax {

  always_filter: {
    filters: [companies.company: "NULL"]
  }
  # "{{_user_attributes['default_domain_prefix']}}"

  join: companies {
    relationship: one_to_many
    sql_on: 1<>1 ;;
  }

  join: brands {
    relationship: many_to_one
    sql_on: ${product_with_tax.brand_id} = ${brands.brand_id} ;;
  }

  join: product_price_group {
    relationship: many_to_one
    sql_on: ${product_with_tax.id} = ${product_price_group.product_id};;
  }

  join: product_prices {
    relationship: many_to_one
    sql_on: ${product_price_group.id} = ${product_prices.price_group_id}
      and (${product_prices.weight_type} is NULL
        or ${product_prices.weight_type} = 'gram')
      and (${product_prices.range_from} is NULL
        or ${product_prices.range_from} = 1);;
  }

  join: tax_tier {
    type: inner
    relationship: many_to_one
    sql_on: 1=1 ;;
  }

  join: tax_tier_versions {
    type: inner
    relationship: one_to_many
    sql_on: ${tax_tier.tax_tier_version_id} = ${tax_tier_versions.id} ;;
  }

  join: tax_excise {
    type: inner
    relationship: one_to_one
    sql_on: ${tax_tier_versions.id} = ${tax_excise.tax_tier_version_id} ;;
  }

  join: tax_city_local {
    type: inner
    relationship: one_to_one
    sql_on: ${tax_tier_versions.id} = ${tax_city_local.tax_tier_version_id} ;;
  }

  join: tax_sales {
    type: inner
    relationship: one_to_one
    sql_on: ${tax_tier_versions.id} = ${tax_sales.tax_tier_version_id} ;;
  }

  join: tax_city_local_rates {
    type: inner
    relationship: one_to_many
    sql_on: ${tax_city_local.id} = ${tax_city_local_rates.city_local_tax_id}
      and ${tax_city_local_rates.location_type} = 'city';;
  }

  join: tax_sales_rates {
    type: inner
    relationship: one_to_many
    sql_on: ${tax_sales.id} = ${tax_sales_rates.sales_tax_id}
      and ${tax_sales_rates.location_type} = 'state';;
  }
}

explore: product_transactions {

  join: product_checkins {
    relationship: many_to_one
    type: inner
    sql_on: ${product_transactions.product_checkin_id} = ${product_checkins.id}
          AND ${product_checkins.uid} IS NOT NULL AND ${product_checkins.uid} <> ''
          {% if product_transactions.date_filter._in_query %}
          AND ${product_checkins.date_raw} <= {% date_start product_transactions.date_filter %}
          {% else %}
          1 = 1
          {% endif %};;
          # AND ${product_transactions.date_raw} >= ${product_checkins.date_raw};;
    }

    join: products {
      type: inner
      relationship: many_to_one
      sql_on:  ${product_transactions.product_id} = ${products.id} ;;
    }

    join: total_tax_by_product {
      type: left_outer
      relationship: one_to_one
      sql_on:  ${products.id} = ${total_tax_by_product.product_id} ;;
    }

    join: brands {
      relationship: many_to_one
      sql_on: ${products.brand_id} = ${brands.id} ;;
    }

    join: product_categories_by_level {
      relationship: many_to_one
      sql_on: ${products.id} = ${product_categories_by_level.id} ;;
    }

    join: offices {
      relationship: many_to_one
      sql_on: ${product_transactions.office_id} = ${offices.office_id} ;;
    }

    join: product_categories {
      relationship: many_to_one
      sql_on: ${products.prod_category_id} = ${product_categories.id};;
    }

    join: package_quantity {
      relationship: one_to_many
      sql_on: ${product_checkins.id} = ${package_quantity.package_id};;
    }

    join: product_price_group {
      relationship: many_to_one
      sql_on: ${products.id} = ${product_price_group.product_id};;
    }

    join: product_prices {
      relationship: many_to_one
      sql_on: ${product_price_group.id} = ${product_prices.price_group_id}
              and (${product_prices.weight_type} is NULL
                or ${product_prices.weight_type} = 'gram')
              and (${product_prices.range_from} is NULL
                or ${product_prices.range_from} = 1);;
    }
  }

explore: order_items_CDTFA {
  view_name: order_items
  from: order_items_with_details
  sql_always_where: DATE(CONVERT_TZ(orders.sync_created_at ,'UTC','America/Los_Angeles')) >= cast('2019-01-01' as DATETIME)
                    AND DATE(CONVERT_TZ(orders.sync_created_at ,'UTC','America/Los_Angeles')) <= cast('2021-12-31' as DATETIME)
                    AND (orders.office_zip_name ) IN ('94022', '94023', '94024', '94028', '94035', '94039', '94040', '94041', '94042', '94043', '94085',
                    '94086', '94087', '94088', '94089', '94090', '94301', '94302', '94303', '94304', '94305', '94306', '94308', '94309', '94310', '94501',
                    '94502', '94505', '94506', '94507', '94509', '94511', '94513', '94514', '94516', '94517', '94518', '94519', '94520', '94521', '94522',
                    '94523', '94524', '94525', '94526', '94527', '94528', '94529', '94530', '94531', '94536', '94537', '94538', '94539', '94540', '94541',
                    '94542', '94543', '94544', '94545', '94546', '94547', '94548', '94549', '94550', '94551', '94552', '94553', '94555', '94556', '94557',
                    '94560', '94561', '94563', '94564', '94565', '94566', '94568', '94569', '94570', '94572', '94575', '94577', '94578', '94579', '94580',
                    '94582', '94583', '94586', '94587', '94588', '94595', '94596', '94597', '94598', '94601', '94602', '94603', '94604', '94605', '94606',
                    '94607', '94608', '94609', '94610', '94611', '94612', '94613', '94614', '94615', '94617', '94618', '94619', '94620', '94621', '94622',
                    '94623', '94624', '94625', '94627', '94643', '94649', '94659', '94660', '94661', '94662', '94666', '94701', '94702', '94703', '94704',
                    '94705', '94706', '94707', '94708', '94709', '94710', '94712', '94720', '94801', '94802', '94803', '94804', '94805', '94806', '94807',
                    '94808', '94820', '94850', '94875', '95002', '95008', '95009', '95011', '95013', '95014', '95015', '95020', '95021', '95023', '95026',
                    '95030', '95031', '95032', '95033', '95035', '95036', '95037', '95038', '95042', '95044', '95046', '95050', '95051', '95052', '95053',
                    '95054', '95055', '95056', '95070', '95071', '95101', '95102', '95103', '95106', '95108', '95109', '95110', '95111', '95112', '95113',
                    '95114', '95115', '95116', '95117', '95118', '95119', '95120', '95121', '95122', '95123', '95124', '95125', '95126', '95127', '95128',
                    '95129', '95130', '95131', '95132', '95133', '95134', '95135', '95136', '95137', '95138', '95139', '95140', '95141', '95142', '95148',
                    '95150', '95151', '95152', '95153', '95154', '95155', '95156', '95157', '95158', '95159', '95160', '95161', '95164', '95170', '95171',
                    '95172', '95173', '95190', '95191', '95192', '95193', '95194', '95196', '95219', '95377', '95391');;

  join: products {
    relationship: many_to_one
    sql_on: ${products.id} = ${order_items.product_id};;
  }

  join: orders {
  relationship: many_to_one
  sql_on: ${orders.id} = ${order_items.order_id} ;;
  }

  join: discounts {
    relationship: many_to_one
    sql_on: ${discounts.id} = ${order_items.discount_id} ;;
  }

  join: patients {
    relationship: many_to_one
    sql_on: ${orders.patient_id} = ${patients.id} ;;
  }

  join: tax_payment {
    relationship: one_to_one
    sql_on: ${order_items.id} = ${tax_payment.order_item_id} ;;
  }

  join: staff {
    from: users
    relationship: many_to_one
    sql_on: ${staff.id} = ${orders.cashier_id} ;;
  }

  join: product_checkins {
    relationship: many_to_one
    sql_on: ${product_checkins.id} = ${order_items.product_checkin_id} ;;
  }

  join: recommendations {
    relationship: many_to_one
    sql_on: ${orders.patient_id} = ${recommendations.rec_pat_id}
            AND ${recommendations.rec_valid_from_date} <= ${orders.confirmed_raw}
            AND ${recommendations.rec_valid_to_raw} >= ${orders.confirmed_raw};;
  }

  join: tax_excise {
    relationship: one_to_many
    sql_on: ${orders.tax_tier_version_id} = ${tax_excise.tax_tier_version_id} ;;
  }
}
