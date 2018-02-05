view: deploy_targets {
  sql_table_name: public.deploy_targets ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: deploy_environment_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.deploy_environment_id ;;
  }

  dimension: deploy_service_type_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.deploy_service_type_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      deploy_service_types.name,
      deploy_service_types.id,
      deploy_environments.id,
      deploy_environments.name,
      score_engines.count
    ]
  }
}
