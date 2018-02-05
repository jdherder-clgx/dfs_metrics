view: imports {
  sql_table_name: public.imports ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cancel_message {
    type: string
    sql: ${TABLE}.cancel_message ;;
  }

  dimension_group: canceled {
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
    sql: ${TABLE}.canceled_at ;;
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

  dimension: destination_dataset_id {
    type: number
    sql: ${TABLE}.destination_dataset_id ;;
  }

  dimension: file_name {
    type: string
    sql: ${TABLE}.file_name ;;
  }

  dimension_group: finished {
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
    sql: ${TABLE}.finished_at ;;
  }

  dimension: import_schedule_id {
    type: number
    sql: ${TABLE}.import_schedule_id ;;
  }

  dimension: legacy_id {
    type: string
    sql: ${TABLE}.legacy_id ;;
  }

  dimension: new_table {
    type: yesno
    sql: ${TABLE}.new_table ;;
  }

  dimension: sample_count {
    type: number
    sql: ${TABLE}.sample_count ;;
  }

  dimension: schema_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.schema_id ;;
  }

  dimension: source_id {
    type: number
    sql: ${TABLE}.source_id ;;
  }

  dimension: source_type {
    type: string
    sql: ${TABLE}.source_type ;;
  }

  dimension_group: started {
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
    sql: ${TABLE}.started_at ;;
  }

  dimension: success {
    type: yesno
    sql: ${TABLE}.success ;;
  }

  dimension: to_table {
    type: string
    sql: ${TABLE}.to_table ;;
  }

  dimension: truncate {
    type: yesno
    sql: ${TABLE}.truncate ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
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
      file_name,
      schemas.id,
      schemas.name,
      users.id,
      users.username,
      users.first_name,
      users.last_name,
      users.image_file_name,
      workspaces.image_file_name,
      workspaces.id,
      workspaces.name,
      csv_files.count
    ]
  }
}
