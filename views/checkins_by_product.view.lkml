# If necessary, uncomment the line below to include explore_source.
# include: "kolas.model.lkml"

  view: checkins_by_product {
# If necessary, uncomment the line below to include explore_source.
# include: "kolas.model.lkml"
      derived_table: {
        explore_source: product_checkins {
          column: product_id {}
          column: last_checkin_at_time {}
          column: price_sum {}
          column: qty_sum {}
        }
      }
      dimension: product_id {
        primary_key: yes
        description: ""
        type: number
      }
      dimension: last_checkin_at_time {
        description: ""
        type: number
      }
      dimension: price_sum {
        description: ""
        type: number
      }
      dimension: qty_sum {
        description: ""
        type: number
      }

  }
