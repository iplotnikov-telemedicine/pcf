# If necessary, uncomment the line below to include explore_source.
# include: "sanctuary.model.lkml"

view: offices {
  derived_table: {
    explore_source: order_items {
      column: office_id { field: orders.office_id }
    }
  }

  dimension: office_id {
    type: number
  }

  dimension: name {
    case: {
      when: {
        sql: ${office_id} = 11379 ;;
        label: "Kolas - Blumenfeld"
      }
      when: {
        sql: ${office_id} = 11380 ;;
        label: "Kolas - Lodi"
      }
      when: {
        sql: ${office_id} = 11914 ;;
        label: "Kolas - Fruitridge/South Watt"
      }
    }
  }
}
