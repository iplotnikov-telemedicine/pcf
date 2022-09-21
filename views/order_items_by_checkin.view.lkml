
# If necessary, uncomment the line below to include explore_source.
# include: "pcf.model.lkml"

view: order_items_by_checkin {

  derived_table: {
    sql: SELECT
            order_items.product_checkin_id  AS `product_checkin_id`,
            COALESCE(SUM(CASE WHEN order_items.created_at < {% date_start date_filter %}
              THEN ( (order_items.qty + order_items.qty_free) * order_items.count ) END), 0) AS `quantity_sold_before`,
            COALESCE(SUM(CASE WHEN order_items.created_at between {% date_start date_filter %} and {% date_end date_filter %}
              THEN ( (order_items.qty + order_items.qty_free) * order_items.count ) END), 0) AS `quantity_sold`,
            COALESCE(SUM(CASE WHEN order_items.is_returned AND order_items.created_at between {% date_start date_filter %} and {% date_end date_filter %}
              THEN ( (order_items.qty + order_items.qty_free) * order_items.count ) END), 0) AS `quantity_returned`
        FROM {% if _model._name == 'pcf_company' %}@{schema_name}.{% endif %}warehouse_order_items  AS order_items
        INNER JOIN {% if _model._name == 'pcf_company' %}@{schema_name}.{% endif %}product_checkins AS product_checkins
         ON order_items.product_checkin_id = product_checkins.id
          AND order_items.created_at > product_checkins.date
        GROUP BY
            1;;



    # explore_source: order_items {
    #   column: product_checkin_id {}
    #   column: sum_order_item_quantity {}
    #   column: sum_order_item_quantity_returned {}
    #   bind_filters: {
    #     to_field: order_items.created_date
    #     from_field: select_date
    #   }
    # }
  }


  dimension: product_checkin_id {
    description: ""
    type: number
  }

  dimension: quantity_sold_before {
    description: ""
    type: number
  }

  dimension: quantity_sold {
    description: ""
    type: number
  }

  dimension: quantity_returned {
    description: ""
    type: number
  }

  filter: date_filter {
    # lab: "Date Range"
    type: date
    default_value: "45 days"
  }
}
