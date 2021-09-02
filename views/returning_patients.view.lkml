# If necessary, uncomment the line below to include explore_source.
# include: "pcf.model.lkml"

view: returning_patients {
  derived_table: {
    explore_source: patients {
      column: id {}
      column: is_repeated {}
      column: number_of_patients {}
    }
  }

  dimension: id {
    type: number
    primary_key: yes
  }

  dimension: is_repeated {
    label: "Patients Is Repeated (Yes / No)"
    type: number
  }

  dimension: number_of_patients {
    type: number
  }

  measure: number_of_new_patients {
    type: sum
    sql: IF(${is_repeated} = 0, 1, 0) ;;
  }

  measure: number_of_returning_patients {
    type: sum
    sql: IF(${is_repeated} = 1, 1, 0) ;;
  }
}
