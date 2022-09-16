# If necessary, uncomment the line below to include explore_source.
# include: "any_company.model.lkml"

view: monthly_patients {
  derived_table: {
    explore_source: service_history {
      timezone: query_timezone
      column: new_patient_count {}
      column: rep_patient_count {}
      column: total_patient_count {}
      column: created_month {}
    }
  }
  dimension: new_patient_count {
    description: ""
    type: number
  }
  dimension: rep_patient_count {
    description: ""
    type: number
  }
  dimension: total_patient_count {
    description: ""
    type: number
  }
  dimension: created_month {
    description: ""
    type: date_month
  }
}
