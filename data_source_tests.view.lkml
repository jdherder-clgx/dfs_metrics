view: data_source_tests {
  sql_table_name: public.data_source_tests ;;

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

  dimension: data_source_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.data_source_id ;;
  }

  dimension: data_source_type {
    type: string
    sql: ${TABLE}.data_source_type ;;
  }

  dimension: details {
    type: string
    sql: ${TABLE}.details ;;
  }

  dimension: test_type {
    type: number
    sql: ${TABLE}.test_type ;;
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
      users.id,
      users.username,
      users.first_name,
      users.last_name,
      users.image_file_name,
      data_sources.id,
      data_sources.name,
      data_sources.db_name,
      data_source_test_updates.count
    ]
  }
}
