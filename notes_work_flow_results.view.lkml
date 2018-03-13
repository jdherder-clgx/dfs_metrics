view: notes_work_flow_results {
  sql_table_name: public.notes_work_flow_results ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: note_id {
    type: number
    sql: ${TABLE}.note_id ;;
  }

  dimension: result_id {
    type: string
    sql: ${TABLE}.result_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
