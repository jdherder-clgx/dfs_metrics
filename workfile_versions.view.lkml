view: workfile_versions {
  sql_table_name: public.workfile_versions ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: commit_message {
    type: string
    sql: ${TABLE}.commit_message ;;
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

  dimension: legacy_id {
    type: string
    sql: ${TABLE}.legacy_id ;;
  }

  dimension: modifier_id {
    type: number
    sql: ${TABLE}.modifier_id ;;
  }

  dimension: notebook_preview_html_content_type {
    type: string
    sql: ${TABLE}.notebook_preview_html_content_type ;;
  }

  dimension: notebook_preview_html_file_name {
    type: string
    sql: ${TABLE}.notebook_preview_html_file_name ;;
  }

  dimension: notebook_preview_html_file_size {
    type: number
    sql: ${TABLE}.notebook_preview_html_file_size ;;
  }

  dimension_group: notebook_preview_html_updated {
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
    sql: ${TABLE}.notebook_preview_html_updated_at ;;
  }

  dimension: owner_id {
    type: number
    sql: ${TABLE}.owner_id ;;
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

  dimension: version_num {
    type: number
    sql: ${TABLE}.version_num ;;
  }

  dimension: workfile_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.workfile_id ;;
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
      notebook_preview_html_file_name,
      workfiles.image_file_name,
      workfiles.id,
      workfiles.file_name
    ]
  }
}
