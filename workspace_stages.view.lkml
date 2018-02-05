view: workspace_stages {
  sql_table_name: public.workspace_stages ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: default {
    type: yesno
    sql: ${TABLE}."default" ;;
  }

  dimension: description_long {
    type: string
    sql: ${TABLE}.description_long ;;
  }

  dimension: description_short {
    type: string
    sql: ${TABLE}.description_short ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: position {
    type: number
    sql: ${TABLE}.position ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, workspaces.count]
  }
}
