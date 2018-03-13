view: workspace_data_sources {
  sql_table_name: public.workspace_data_sources ;;

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

  dimension: polymorphic_data_source_id {
    type: number
    sql: ${TABLE}.polymorphic_data_source_id ;;
  }

  dimension: polymorphic_data_source_type {
    type: string
    sql: ${TABLE}.polymorphic_data_source_type ;;
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
    drill_fields: [id, workspaces.image_file_name, workspaces.id, workspaces.name]
  }
}
