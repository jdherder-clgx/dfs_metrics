view: score_engine_pfas {
  sql_table_name: public.score_engine_pfas ;;

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

  dimension: pfa_id {
    type: number
    sql: ${TABLE}.pfa_id ;;
  }

  dimension: score_engine_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.score_engine_id ;;
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
    drill_fields: [id, score_engines.id, score_engines.name]
  }
}
