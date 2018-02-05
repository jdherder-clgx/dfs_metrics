view: worklet_parameters {
  sql_table_name: public.worklet_parameters ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: additional_data {
    type: string
    sql: ${TABLE}.additional_data ;;
  }

  dimension: column {
    type: string
    sql: ${TABLE}."column" ;;
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

  dimension: data_type {
    type: string
    sql: ${TABLE}.data_type ;;
  }

  dimension: dataset_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.dataset_id ;;
  }

  dimension: dataset_path {
    type: string
    sql: ${TABLE}.dataset_path ;;
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

  dimension: hourly_interval {
    type: number
    sql: ${TABLE}.hourly_interval ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension_group: next_run {
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
    sql: ${TABLE}.next_run ;;
  }

  dimension: position {
    type: number
    sql: ${TABLE}.position ;;
  }

  dimension: required {
    type: yesno
    sql: ${TABLE}.required ;;
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

  dimension: use_default {
    type: yesno
    sql: ${TABLE}.use_default ;;
  }

  dimension: variable_name {
    type: string
    sql: ${TABLE}.variable_name ;;
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
      variable_name,
      workfiles.image_file_name,
      workfiles.id,
      workfiles.file_name,
      datasets.id,
      datasets.name,
      worklet_parameter_versions.count
    ]
  }
}
