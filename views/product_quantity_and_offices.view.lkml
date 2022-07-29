include: "product_office_quantity.view"

view: product_quantity_and_offices {
  extends: [product_office_quantity]

  measure: total_quantity {
    type: number
    sql:  COALESCE(SUM(${quantity}), 0);;
  }

  measure: shelf_quantity {
    type: number
    sql:  COALESCE(SUM(CASE ${offices.is_storage} WHEN 0 THEN ${quantity} END), 0);;
  }

  measure: storage_quantity {
    type: number
    sql:  COALESCE(SUM(CASE ${offices.is_storage} WHEN 1 THEN ${quantity} END), 0);;
  }

}
