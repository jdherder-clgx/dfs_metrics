view: uploads {
  sql_table_name: public.uploads ;;

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

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      contents_file_name,
      users.id,
      users.username,
      users.first_name,
      users.last_name,
      users.image_file_name,
      hdfs_imports.count
    ]
  }
}
