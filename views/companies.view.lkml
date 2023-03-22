view: companies {

  derived_table: {
    sql:
      SELECT *
      FROM ext_indica_backend.companies
      WHERE comp_id in
      {% if _user_attributes['companies'] != null and _user_attributes['companies'] != "" %}
        ({{_user_attributes['companies']}})
        {% else %}
        (@{pcf_comp_ids})
        {% endif %}
        ;;
  }

  dimension: comp_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.comp_id ;;
  }

  dimension: domain_prefix {
    hidden: yes
    type: string
    sql: ${TABLE}.domain_prefix ;;
  }

  parameter: company {
    label: "Company Name"
    type: unquoted # do not change!
    suggest_dimension: domain_prefix
    bypass_suggest_restrictions: no
    full_suggestions: yes
  }
}
