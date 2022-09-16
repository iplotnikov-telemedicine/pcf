include: "package_quantity.view"

view: package_quantity_ext {
  extends: [package_quantity]

  measure: total_cost_available {
    type: number
    sql:
    SUM(CASE WHEN ${product_checkins.is_metrc} AND ${product_checkins.is_under_package_control} THEN
      ${quantity_available} * ${product_checkins.cost_per_unit}
    ELSE
      NULL
    END) ;;
  }

}
