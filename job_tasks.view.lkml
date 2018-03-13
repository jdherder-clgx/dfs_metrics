view: job_tasks {
  sql_table_name: public.job_tasks ;;

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

  dimension: index {
    type: number
    sql: ${TABLE}.index ;;
  }

  dimension: job_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.job_id ;;
  }

  dimension: killable_id {
    type: string
    sql: ${TABLE}.killable_id ;;
  }

  dimension: payload_id {
    type: number
    sql: ${TABLE}.payload_id ;;
  }

  dimension: payload_result_id {
    type: string
    sql: ${TABLE}.payload_result_id ;;
  }

  dimension: payload_type {
    type: string
    sql: ${TABLE}.payload_type ;;
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

  measure: count {
    type: count
    drill_fields: [id, jobs.name, jobs.id]
  }
}
