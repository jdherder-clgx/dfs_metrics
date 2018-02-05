view: workfiles {
  sql_table_name: public.workfiles ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: additional_data {
    type: string
    sql: ${TABLE}.additional_data ;;
  }

  dimension: content_type {
    type: string
    sql: ${TABLE}.content_type ;;
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

  dimension_group: deleted {
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
    sql: ${TABLE}.deleted_at ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: execution_location_id {
    type: number
    sql: ${TABLE}.execution_location_id ;;
  }

  dimension: execution_location_type {
    type: string
    sql: ${TABLE}.execution_location_type ;;
  }

  dimension: file_name {
    type: string
    sql: ${TABLE}.file_name ;;
  }

  dimension: image_content_type {
    type: string
    sql: ${TABLE}.image_content_type ;;
  }

  dimension: image_file_name {
    type: string
    sql: ${TABLE}.image_file_name ;;
  }

  dimension: image_file_size {
    type: number
    sql: ${TABLE}.image_file_size ;;
  }

  dimension_group: image_updated {
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
    sql: ${TABLE}.image_updated_at ;;
  }

  dimension: latest_workfile_version_id {
    type: number
    sql: ${TABLE}.latest_workfile_version_id ;;
  }

  dimension: legacy_id {
    type: string
    sql: ${TABLE}.legacy_id ;;
  }

  dimension: link_url {
    type: string
    sql: ${TABLE}.link_url ;;
  }

  dimension: owner_id {
    type: number
    sql: ${TABLE}.owner_id ;;
  }

  dimension: python_execution_input_metadata {
    type: string
    sql: ${TABLE}.python_execution_input_metadata ;;
  }

  dimension: python_execution_output_metadata {
    type: string
    sql: ${TABLE}.python_execution_output_metadata ;;
  }

  dimension: ready_for_python_execute {
    type: yesno
    sql: ${TABLE}.ready_for_python_execute ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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

  dimension_group: user_modified {
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
    sql: ${TABLE}.user_modified_at ;;
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
      image_file_name,
      file_name,
      workspaces.image_file_name,
      workspaces.id,
      workspaces.name,
      notes_workfiles.count,
      open_workfile_events.count,
      running_workfiles.count,
      workfile_drafts.count,
      workfile_execution_locations.count,
      workfile_versions.count,
      worklet_parameters.count
    ]
  }
}
