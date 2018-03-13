view: notifications {
  sql_table_name: public.notifications ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: comment_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.comment_id ;;
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

  dimension: legacy_id {
    type: string
    sql: ${TABLE}.legacy_id ;;
  }

  dimension: read {
    type: yesno
    sql: ${TABLE}.read ;;
  }

  dimension: recipient_id {
    type: number
    sql: ${TABLE}.recipient_id ;;
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
    drill_fields: [id, comments.id, events.id]
  }
}
