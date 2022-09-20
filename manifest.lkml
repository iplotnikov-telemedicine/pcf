# project_name: "PCF"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "kolas"
#   override_constant: kolas_company_id {
#     value: "9928"
#   }
# }

constant: pcf_comp_ids {
  value: "4546,5722,6745,7539,8907,7740"
}

constant: schema_name {
  export: override_optional
  value: "{% if companies.company._parameter_value == 'pcf' %}
  c4546_company{% elsif companies.company._parameter_value == 'flavors' %}
  c5722_company{% elsif companies.company._parameter_value == 'phenos' %}
  c6745_company{% elsif companies.company._parameter_value == 'bluefire' %}
  c7539_company{% elsif companies.company._parameter_value == 'packs' %}
  c7740_company{% elsif companies.company._parameter_value == 'firehouseca' %}
  c8907_company{% else %}
  {% if _user_attributes['companies'] != null and _user_attributes['companies'] != '' %}
  c{{_user_attributes['companies']| split: ',' | strip | first}}_company
  {% else %}c4546_company{% endif %}
  {% endif %}"
}

constant: kolas_company_id {
  value: "9928"
  export: override_optional
}

constant: dtpg_company_id {
  value: "3583"
  export: override_optional
}
