include: "patients.view"

view: patients_with_details {
  extends: [patients]

  measure: recommendations {
    type: list
    list_field: recommendations.json_details
  }

}
