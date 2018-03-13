view: queue_classic_jobs {
  sql_table_name: public.queue_classic_jobs ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: args {
    type: string
    sql: ${TABLE}.args ;;
  }

  dimension_group: locked {
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
    sql: ${TABLE}.locked_at ;;
  }

  dimension: method {
    type: string
    sql: ${TABLE}.method ;;
  }

  dimension: q_name {
    type: string
    sql: ${TABLE}.q_name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, q_name]
  }
}
