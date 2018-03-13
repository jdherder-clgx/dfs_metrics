view: deploy_service_types {
  sql_table_name: public.deploy_service_types ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, deploy_targets.count]
  }
}
