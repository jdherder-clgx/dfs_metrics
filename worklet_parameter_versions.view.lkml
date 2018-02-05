view: worklet_parameter_versions {
  sql_table_name: public.worklet_parameter_versions ;;

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

  dimension: event_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.event_id ;;
  }

  dimension: owner_id {
    type: number
    sql: ${TABLE}.owner_id ;;
  }

  dimension: result_id {
    type: string
    sql: ${TABLE}.result_id ;;
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

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  dimension: worklet_parameter_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.worklet_parameter_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, events.id, worklet_parameters.id, worklet_parameters.variable_name]
  }
}
