view: workspaces {
  sql_table_name: public.workspaces ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: archived {
    type: yesno
    sql: ${TABLE}.archived ;;
  }

  dimension_group: archived {
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
    sql: ${TABLE}.archived_at ;;
  }

  dimension: archiver_id {
    type: number
    sql: ${TABLE}.archiver_id ;;
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

  dimension: has_added_member {
    type: yesno
    sql: ${TABLE}.has_added_member ;;
  }

  dimension: has_added_sandbox {
    type: yesno
    sql: ${TABLE}.has_added_sandbox ;;
  }

  dimension: has_added_workfile {
    type: yesno
    sql: ${TABLE}.has_added_workfile ;;
  }

  dimension: has_changed_settings {
    type: yesno
    sql: ${TABLE}.has_changed_settings ;;
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

  dimension: is_project {
    type: yesno
    sql: ${TABLE}.is_project ;;
  }

  dimension: legacy_id {
    type: string
    sql: ${TABLE}.legacy_id ;;
  }

  dimension: milestones_achieved_count {
    type: number
    sql: ${TABLE}.milestones_achieved_count ;;
  }

  dimension: milestones_count {
    type: number
    sql: ${TABLE}.milestones_count ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: owner_id {
    type: number
    sql: ${TABLE}.owner_id ;;
  }

  dimension: project_status {
    type: string
    sql: ${TABLE}.project_status ;;
  }

  dimension: project_status_reason {
    type: string
    sql: ${TABLE}.project_status_reason ;;
  }

  dimension_group: project_target {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.project_target_date ;;
  }

  dimension: public {
    type: yesno
    sql: ${TABLE}.public ;;
  }

  dimension: sandbox_id {
    type: number
    sql: ${TABLE}.sandbox_id ;;
  }

  dimension: show_sandbox_datasets {
    type: yesno
    sql: ${TABLE}.show_sandbox_datasets ;;
  }

  dimension: stage_reason {
    type: string
    sql: ${TABLE}.stage_reason ;;
  }

  dimension: summary {
    type: string
    sql: ${TABLE}.summary ;;
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

  dimension: workspace_stage_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.workspace_stage_id ;;
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
      name,
      workspace_stages.name,
      workspace_stages.id,
      associated_datasets.count,
      csv_files.count,
      datasets.count,
      data_source_accounts.count,
      events.count,
      imports.count,
      jobs.count,
      memberships.count,
      milestones.count,
      score_engines.count,
      tableau_workbook_publications.count,
      workfiles.count,
      workspace_data_sources.count
    ]
  }
}
