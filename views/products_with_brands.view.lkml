include: "products.view"

view: products_with_brands {
  extends: [products]

  dimension: is_internal_product {
    type: yesno
    sql: ${brands.is_internal} ;;
  }


}
