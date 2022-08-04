
view: total_over_daily {
  derived_table: {
    explore_source: register_log {
      timezone: query_timezone
      column: total_over {field: register_log.total_over}
      column: report_date {field: register_log.created_date}
      column: office_id {field: register.office_id}
      # bind_all_filters: yes
      filters: {
        field: register.office_id
        value: "NOT NULL"
      }
      filters: {
        field: register_log.type
        value: "4"
      }
    }
  }
  dimension: office_id {
    primary_key: yes
    type: number
  }

  dimension: report_date {
    primary_key: yes
    type: date
  }

  dimension: total_over {
    description: "Total cash differences for a day"
    type: number
    value_format_name: usd
  }

}
