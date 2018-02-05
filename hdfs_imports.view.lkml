view: hdfs_imports {
  sql_table_name: public.hdfs_imports ;;

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

  dimension: file_name {
    type: string
    sql: ${TABLE}.file_name ;;
  }

  dimension_group: finished {
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
    sql: ${TABLE}.finished_at ;;
  }

  dimension: hdfs_entry_id {
    type: number
    sql: ${TABLE}.hdfs_entry_id ;;
  }

  dimension: success {
    type: yesno
    sql: ${TABLE}.success ;;
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

  dimension: upload_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.upload_id ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      file_name,
      users.id,
      users.username,
      users.first_name,
      users.last_name,
      users.image_file_name,
      uploads.id,
      uploads.contents_file_name
    ]
  }
}
