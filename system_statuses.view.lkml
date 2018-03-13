view: system_statuses {
  sql_table_name: public.system_statuses ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: correct_mac_address {
    type: yesno
    sql: ${TABLE}.correct_mac_address ;;
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

  dimension: expired {
    type: yesno
    sql: ${TABLE}.expired ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
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

  dimension: user_count_exceeded {
    type: yesno
    sql: ${TABLE}.user_count_exceeded ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
