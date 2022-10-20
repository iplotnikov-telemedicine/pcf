connection: "speedy_weedy_delivery"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

#  May 1 2021- Oct 3 2022

explore: CDTFA {
  view_name: order_items
  from: order_items_with_details
  sql_always_where: DATE(CONVERT_TZ(orders.sync_created_at ,'UTC','America/Los_Angeles')) >= cast('2021-05-01' as DATETIME)
                    AND DATE(CONVERT_TZ(orders.sync_created_at ,'UTC','America/Los_Angeles')) <= cast('2022-10-03' as DATETIME)
                    AND (orders.office_id ) IN (5005);;

  join: products {
    relationship: many_to_one
    sql_on: ${products.id} = ${order_items.product_id};;
  }

  join: orders {
    relationship: many_to_one
    sql_on: ${orders.id} = ${order_items.order_id} ;;
  }

  join: discounts {
    relationship: many_to_one
    sql_on: ${discounts.id} = ${order_items.discount_id} ;;
  }

  join: patients {
    relationship: many_to_one
    sql_on: ${orders.patient_id} = ${patients.id} ;;
  }

  join: tax_payment {
    relationship: one_to_one
    sql_on: ${order_items.id} = ${tax_payment.order_item_id} ;;
  }

  join: staff {
    from: users
    relationship: many_to_one
    sql_on: ${staff.id} = ${orders.cashier_id} ;;
  }

  join: product_checkins {
    relationship: many_to_one
    sql_on: ${product_checkins.id} = ${order_items.product_checkin_id} ;;
  }

  join: recommendations {
    relationship: many_to_one
    sql_on: ${orders.patient_id} = ${recommendations.rec_pat_id}
            AND ${recommendations.rec_valid_from_date} <= ${orders.confirmed_raw}
            AND ${recommendations.rec_valid_to_raw} >= ${orders.confirmed_raw};;
  }

  join: tax_excise {
    relationship: one_to_many
    sql_on: ${orders.tax_tier_version_id} = ${tax_excise.tax_tier_version_id} ;;
  }
}
