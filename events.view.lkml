view: events {
  sql_table_name: public.events ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}.action ;;
  }

  dimension: actor_id {
    type: number
    sql: ${TABLE}.actor_id ;;
  }

  dimension: actor_sign_in_ip {
    type: string
    sql: ${TABLE}.actor_sign_in_ip ;;
  }

  dimension: additional_data {
    type: string
    sql: ${TABLE}.additional_data ;;
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

  dimension: insight {
    type: yesno
    sql: ${TABLE}.insight ;;
  }

  dimension: legacy_id {
    type: string
    sql: ${TABLE}.legacy_id ;;
  }

  dimension: legacy_type {
    type: string
    sql: ${TABLE}.legacy_type ;;
  }

  dimension: promoted_by_id {
    type: number
    sql: ${TABLE}.promoted_by_id ;;
  }

  dimension_group: promotion {
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
    sql: ${TABLE}.promotion_time ;;
  }

  dimension: published {
    type: yesno
    sql: ${TABLE}.published ;;
  }

  dimension: target1_id {
    type: number
    sql: ${TABLE}.target1_id ;;
  }

  dimension: target1_type {
    type: string
    sql: ${TABLE}.target1_type ;;
  }

  dimension: target2_id {
    type: number
    sql: ${TABLE}.target2_id ;;
  }

  dimension: target2_type {
    type: string
    sql: ${TABLE}.target2_type ;;
  }

  dimension: target3_id {
    type: number
    sql: ${TABLE}.target3_id ;;
  }

  dimension: target3_type {
    type: string
    sql: ${TABLE}.target3_type ;;
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
      workspaces.image_file_name,
      workspaces.id,
      workspaces.name,
      activities.count,
      comments.count,
      notifications.count,
      worklet_parameter_versions.count
    ]
  }
}
