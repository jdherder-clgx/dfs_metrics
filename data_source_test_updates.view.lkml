view: data_source_test_updates {
  sql_table_name: public.data_source_test_updates ;;

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

  dimension: data_source_test_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.data_source_test_id ;;
  }

  dimension: details {
    type: string
    sql: ${TABLE}.details ;;
  }

  dimension: metadata {
    type: string
    sql: ${TABLE}.metadata ;;
  }

  dimension: update_type {
    type: string
    sql: ${TABLE}.update_type ;;
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
    drill_fields: [id, data_source_tests.id]
  }
}
