view: datasets {
  sql_table_name: public.datasets ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: edc_workspace_id {
    type: string
    sql: ${TABLE}.edc_workspace_id ;;
  }

  dimension: hdfs_data_source_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.hdfs_data_source_id ;;
  }

  dimension: legacy_id {
    type: string
    sql: ${TABLE}.legacy_id ;;
  }

  dimension: master_table {
    type: yesno
    sql: ${TABLE}.master_table ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }

  dimension: schema_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.schema_id ;;
  }

  dimension_group: stale {
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
    sql: ${TABLE}.stale_at ;;
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
      name,
      schemas.id,
      schemas.name,
      hdfs_data_sources.id,
      hdfs_data_sources.name,
      hdfs_data_sources.username,
      workspaces.image_file_name,
      workspaces.id,
      workspaces.name,
      associated_datasets.count,
      datasets_notes.count,
      tableau_workbook_publications.count,
      worklet_parameters.count
    ]
  }
}
