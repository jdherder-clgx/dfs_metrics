view: notebook_executions {
  sql_table_name: public.notebook_executions ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: alpine_context {
    type: string
    sql: ${TABLE}.alpine_context ;;
  }

  dimension: notebook_id {
    type: number
    sql: ${TABLE}.notebook_id ;;
  }

  dimension: results {
    type: string
    sql: ${TABLE}.results ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
