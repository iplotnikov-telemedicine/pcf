include: "package_quantity.view"

view: package_quantity_ext {
  extends: [package_quantity]

  measure: total_cost_available {
    type: sum
    sql: ${quantity_available} * ${product_checkins.cost_per_unit} ;;
  }

}
