include: "patients.view"

view: patients_with_orders {
  extends: [patients]

  measure: is_repeated {
    type: yesno
    sql: ${orders.count_of_orders} > 1;;
  }

}
