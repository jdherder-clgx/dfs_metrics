view: notes_workfiles {
  sql_table_name: public.notes_workfiles ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: legacy_id {
    type: string
    sql: ${TABLE}.legacy_id ;;
  }

  dimension: note_id {
    type: number
    sql: ${TABLE}.note_id ;;
  }

  dimension: workfile_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.workfile_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, workfiles.image_file_name, workfiles.id, workfiles.file_name]
  }
}
