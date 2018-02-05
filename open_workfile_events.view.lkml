view: open_workfile_events {
  sql_table_name: public.open_workfile_events ;;

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

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
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
      workfiles.image_file_name,
      workfiles.id,
      workfiles.file_name,
      users.id,
      users.username,
      users.first_name,
      users.last_name,
      users.image_file_name
    ]
  }
}
