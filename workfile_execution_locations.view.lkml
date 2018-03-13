view: workfile_execution_locations {
  sql_table_name: public.workfile_execution_locations ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: execution_location_id {
    type: number
    sql: ${TABLE}.execution_location_id ;;
  }

  dimension: execution_location_type {
    type: string
    sql: ${TABLE}.execution_location_type ;;
  }

  dimension: workfile_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.workfile_id ;;
  }

  dimension: workfile_type {
    type: string
    sql: ${TABLE}.workfile_type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, workfiles.image_file_name, workfiles.id, workfiles.file_name]
  }
}
