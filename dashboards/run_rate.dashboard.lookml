# - dashboard: run_rate_report
#   title: Run Rate Report
#   layout: newspaper
#   preferred_viewer: dashboards-next
#   description: ''
#   elements:
#   - title: Category
#     name: Category
#     model: trybasa
#     explore: products
#     type: looker_grid
#     fields: [order_items.sum_order_item_quantity, orders.num_days, on_hand_quantity,
#       product_categories.name]
#     filters: {}
#     sorts: [product_categories.name desc]
#     limit: 20
#     column_limit: 50
#     dynamic_fields: [{category: table_calculation, expression: "${order_items.sum_order_item_quantity}\
#           \ * ${products.prod_price}", label: COGS, value_format: !!null '', value_format_name: usd,
#         _kind_hint: measure, table_calculation: cogs, _type_hint: number, is_disabled: true},
#       {category: table_calculation, expression: "${order_items.sum_order_item_quantity}\
#           \ / ${orders.num_days} * 30", label: 30 Day Runrate Units, value_format: !!null '',
#         value_format_name: decimal_0, _kind_hint: measure, table_calculation: 30_day_runrate_units,
#         _type_hint: number}, {category: table_calculation, expression: "${cogs} /\
#           \ ${orders.num_days} * 30", label: 30 Day Runrate COGS, value_format: !!null '',
#         value_format_name: usd, _kind_hint: measure, table_calculation: 30_day_runrate_cogs,
#         _type_hint: number, is_disabled: true}, {category: table_calculation, expression: "${on_hand_quantity}\
#           \ * ${products.prod_price}", label: COGS On Hand, value_format: !!null '',
#         value_format_name: usd, _kind_hint: measure, table_calculation: cogs_on_hand,
#         _type_hint: number, is_disabled: true}, {category: measure, expression: !!null '',
#         label: On Hand Quantity, value_format: !!null '', value_format_name: !!null '',
#         based_on: quantity_by_product.total_quantity, _kind_hint: measure, measure: on_hand_quantity,
#         type: sum, _type_hint: number}, {category: table_calculation, expression: "floor(${on_hand_quantity}\
#           \ / (${order_items.sum_order_item_quantity} / ${orders.num_days}))\n\n#\
#           \ On Hand qty divide by/(Qty sold/Number Of Days) ", label: Days Till Dry,
#         value_format: !!null '', value_format_name: '', _kind_hint: measure, table_calculation: days_till_dry,
#         _type_hint: number}]
#     query_timezone: America/Los_Angeles
#     show_view_names: false
#     show_row_numbers: true
#     transpose: false
#     truncate_text: true
#     hide_totals: false
#     hide_row_totals: false
#     size_to_fit: true
#     table_theme: white
#     limit_displayed_rows: false
#     enable_conditional_formatting: false
#     header_text_alignment: left
#     header_font_size: '12'
#     rows_font_size: '12'
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     hidden_fields: [max_number_of_days, orders.number_of_days, orders.days_date_range_filtered,
#       orders_date_range.days_date_range_filtered, orders.num_days, 30_day_runrate_units]
#     show_sql_query_menu_options: false
#     column_order: ["$$$_row_numbers_$$$", product_categories.name, on_hand_quantity,
#       order_items.sum_order_item_quantity, days_till_dry]
#     show_totals: true
#     show_row_totals: true
#     truncate_header: false
#     series_labels:
#       products.prod_id: Product ID
#       brands.brand_name: Brand
#       products.prod_name: Product Name
#       product_categories.name: Category
#       products.prod_price: Cost per Unit
#       order_items.number_of_order_items: Qty sold
#       cogs: Total COGS
#       30_day_runrate_units: 30 day Runrate Units
#       quantity_by_product.total_quantity: Units on Hand
#       products.brand_name_refined: Brand
#       order_items.sum_order_item_quantity: QTY sold
#       product_categories_by_level.parent_category: Category
#       on_hand_quantity: On Hand
#     series_column_widths:
#       products.prod_name: 326
#       order_items.total_order_item_quantity_filtered: 124
#     series_cell_visualizations:
#       order_items.number_of_order_items:
#         is_active: false
#     defaults_version: 1
#     listen:
#       Confirmed At: orders.confirmed_at
#       Brand Name: brands.brand_name
#     row: 0
#     col: 0
#     width: 24
#     height: 7
#   - title: Product
#     name: Product
#     model: trybasa
#     explore: products
#     type: looker_grid
#     fields: [products.id, products.name, products.product_cost, brands.brand_name,
#       orders.num_days, product_categories.name, order_items.sum_order_item_quantity,
#       on_hand_quantity]
#     filters: {}
#     sorts: [products.id desc]
#     limit: 20
#     dynamic_fields: [{category: table_calculation, expression: "${order_items.sum_order_item_quantity}\
#           \ * ${products.product_cost}", label: COGS, value_format: !!null '', value_format_name: usd,
#         _kind_hint: measure, table_calculation: cogs, _type_hint: number}, {category: table_calculation,
#         expression: "${order_items.sum_order_item_quantity} / ${orders.num_days} *\
#           \ 30", label: 30 Day Runrate Units, value_format: !!null '', value_format_name: decimal_0,
#         _kind_hint: measure, table_calculation: 30_day_runrate_units, _type_hint: number},
#       {category: table_calculation, expression: "${cogs} / ${orders.num_days} * 30",
#         label: 30 Day Runrate COGS, value_format: !!null '', value_format_name: usd,
#         _kind_hint: measure, table_calculation: 30_day_runrate_cogs, _type_hint: number},
#       {category: table_calculation, expression: "${on_hand_quantity} * ${products.product_cost}",
#         label: COGS On Hand, value_format: !!null '', value_format_name: usd, _kind_hint: measure,
#         table_calculation: cogs_on_hand, _type_hint: number}, {category: measure,
#         expression: !!null '', label: On Hand Quantity, value_format: !!null '', value_format_name: !!null '',
#         based_on: quantity_by_product.total_quantity, _kind_hint: measure, measure: on_hand_quantity,
#         type: sum, _type_hint: number}]
#     query_timezone: America/Los_Angeles
#     show_view_names: false
#     show_row_numbers: true
#     transpose: false
#     truncate_text: true
#     hide_totals: false
#     hide_row_totals: false
#     size_to_fit: true
#     table_theme: white
#     limit_displayed_rows: false
#     enable_conditional_formatting: false
#     header_text_alignment: left
#     header_font_size: '12'
#     rows_font_size: '12'
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     show_sql_query_menu_options: false
#     column_order: ["$$$_row_numbers_$$$", products.id, brands.brand_name, products.name,
#       product_categories.name, order_items.sum_order_item_quantity, products.product_cost,
#       cogs, 30_day_runrate_units, 30_day_runrate_cogs, on_hand_quantity, cogs_on_hand]
#     show_totals: true
#     show_row_totals: true
#     truncate_header: false
#     series_labels:
#       products.prod_id: Product ID
#       brands.brand_name: Brand
#       products.prod_name: Product Name
#       product_categories.name: Category
#       order_items.number_of_order_items: Qty sold
#       cogs: Total COGS
#       30_day_runrate_units: 30 day Runrate Units
#       quantity_by_product.total_quantity: Units on Hand
#       order_items.sum_order_item_quantity: QTY Sold
#       on_hand_quantity: Units On Hand
#       products.id: Product ID
#       products.name: Product Name
#       products.product_cost: Cost per Unit
#     series_column_widths:
#       products.prod_name: 326
#       order_items.total_order_item_quantity_filtered: 124
#     series_cell_visualizations:
#       order_items.number_of_order_items:
#         is_active: false
#     hidden_fields: [max_number_of_days, orders.number_of_days, orders.days_date_range_filtered,
#       orders_date_range.days_date_range_filtered, orders.num_days]
#     defaults_version: 1
#     y_axes: []
#     listen:
#       Confirmed At: orders.confirmed_at
#       Brand Name: brands.brand_name
#     row: 7
#     col: 0
#     width: 24
#     height: 10
#   filters:
#   - name: Confirmed At
#     title: Confirmed At
#     type: field_filter
#     default_value: 7 day
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: advanced
#       display: popover
#       options: []
#     model: trybasa
#     explore: products
#     listens_to_filters: []
#     field: orders.confirmed_at
#   - name: Brand Name
#     title: Brand Name
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: tag_list
#       display: popover
#       options: []
#     model: trybasa
#     explore: products
#     listens_to_filters: []
#     field: brands.brand_name
