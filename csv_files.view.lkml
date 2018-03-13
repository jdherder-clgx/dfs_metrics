view: csv_files {
  sql_table_name: public.csv_files ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: column_names {
    type: string
    sql: ${TABLE}.column_names ;;
  }

  dimension: contents_content_type {
    type: string
    sql: ${TABLE}.contents_content_type ;;
  }

  dimension: contents_file_name {
    type: string
    sql: ${TABLE}.contents_file_name ;;
  }

  dimension: contents_file_size {
    type: number
    sql: ${TABLE}.contents_file_size ;;
  }

  dimension_group: contents_updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.contents_updated_at ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: delimiter {
    type: string
    sql: ${TABLE}.delimiter ;;
  }

  dimension: has_header {
    type: yesno
    sql: ${TABLE}.has_header ;;
  }

  dimension: import_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.import_id ;;
  }

  dimension: new_table {
    type: yesno
    sql: ${TABLE}.new_table ;;
  }

  dimension: to_table {
    type: string
    sql: ${TABLE}.to_table ;;
  }

  dimension: truncate {
    type: yesno
    sql: ${TABLE}.truncate ;;
  }

  dimension: types {
    type: string
    sql: ${TABLE}.types ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_uploaded {
    type: yesno
    sql: ${TABLE}.user_uploaded ;;
  }

  dimension: workspace_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.workspace_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      contents_file_name,
      workspaces.image_file_name,
      workspaces.id,
      workspaces.name,
      users.id,
      users.username,
      users.first_name,
      users.last_name,
      users.image_file_name,
      imports.file_name,
      imports.id
    ]
  }
}
