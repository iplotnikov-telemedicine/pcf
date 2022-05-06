# If necessary, uncomment the line below to include explore_source.
# include: "sanctuary.model.lkml"

view: offices_derived {
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
        sql: ${office_id} = 2184 ;;
        label: "DTPG"
      }
    }
  }
}
