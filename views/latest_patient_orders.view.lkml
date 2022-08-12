
# If necessary, uncomment the line below to include explore_source.
# include: "kolas.model.lkml"

view: latest_patient_orders {
  derived_table: {
    explore_source: patients_with_orders {
      column: latest_order_confirmed {}
      column: patient_id { field: orders.patient_id }
      column: first_name {}
      column: last_name {}
      # filters: {
      #   field: patients_with_orders.latest_order_confirmed
      #   value: "<= {% has_not_ordered_since._parameter_value %}"
      # }
    }
  }

  dimension: latest_order_confirmed {
    description: ""
  }

  dimension: patient_id {
    description: ""
    type: number
  }

  dimension: first_name {
    description: ""
  }

  dimension: last_name {
    description: ""
  }

  parameter: has_not_ordered_since {
    type: date
  }

  dimension: has_orders_after_date {
    type: yesno
    sql: ${latest_order_confirmed} > {% parameter has_not_ordered_since %} ;;
  }

}
