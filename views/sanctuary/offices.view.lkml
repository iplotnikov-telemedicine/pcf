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
        sql: ${office_id} = 6639 ;;
        label: "The Sanctuary 3rd ST."
      }
      when: {
        sql: ${office_id} = 8831 ;;
        label: "The Sanctuary NLV"
      }
    }
  }
}
