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
  value: "4546,5722,6745,7539,8907,7740,10241"
}

constant: schema_name {
  export: override_optional
  value: "{% if companies.company._parameter_value == 'pcf' %}
  ext_indica_c4546_company{% elsif companies.company._parameter_value == 'flavors' %}
  ext_indica_c5722_company{% elsif companies.company._parameter_value == 'phenos' %}
  ext_indica_c6745_company{% elsif companies.company._parameter_value == 'bluefire' %}
  ext_indica_c7539_company{% elsif companies.company._parameter_value == 'packs' %}
  ext_indica_c7740_company{% elsif companies.company._parameter_value == 'firehouseca' %}
  ext_indica_c8907_company{% elsif companies.company._parameter_value == 'scflavors' %}
  ext_indica_c10241_company{% else %}
    {% if _user_attributes['companies'] != null and _user_attributes['companies'] != '' %}
    ext_indica_c{{_user_attributes['companies']| split: ',' | strip | first}}_company
    {% else %}ext_indica_c4546_company{% endif %}
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
