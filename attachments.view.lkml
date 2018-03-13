view: attachments {
  sql_table_name: public.attachments ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: note_id {
    type: number
    sql: ${TABLE}.note_id ;;
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
    drill_fields: [id, contents_file_name]
  }
}
