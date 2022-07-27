connection: "metrc"

include: "/views/metrc/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: package {
  sql_always_where: ${company.external_id} = 4546;;

  join: facility {
    relationship: many_to_one
    sql_on: ${package.facility_id} = ${facility.id} ;;
  }

  join: manifest {
    relationship: many_to_one
    sql_on: ${package.manifest_id} = ${manifest.id} ;;
  }

  join: batch {
    relationship: many_to_one
    sql_on: ${package.batch_id} = ${batch.id} ;;
  }

  join: company {
    relationship: many_to_one
    sql_on: ${package.company_id} = ${company.id} ;;
  }

}
