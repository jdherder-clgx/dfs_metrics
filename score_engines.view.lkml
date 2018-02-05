view: score_engines {
  sql_table_name: public.score_engines ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: approver_id {
    type: number
    sql: ${TABLE}.approver_id ;;
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

  dimension: deploy_target_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.deploy_target_id ;;
  }

  dimension: deployed_engine_id {
    type: string
    sql: ${TABLE}.deployed_engine_id ;;
  }

  dimension: deployed_pfa_version {
    type: number
    sql: ${TABLE}.deployed_pfa_version ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: governance_stage_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.governance_stage_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
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
      workspaces.image_file_name,
      workspaces.id,
      workspaces.name,
      deploy_targets.id,
      deploy_targets.name,
      governance_stages.id,
      governance_stages.name,
      score_engine_pfas.count
    ]
  }
}
