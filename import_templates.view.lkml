view: import_templates {
  sql_table_name: public.import_templates ;;

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

  dimension: destination_id {
    type: number
    sql: ${TABLE}.destination_id ;;
  }

  dimension: destination_name {
    type: string
    sql: ${TABLE}.destination_name ;;
  }

  dimension: row_limit {
    type: number
    sql: ${TABLE}.row_limit ;;
  }

  dimension: source_id {
    type: number
    sql: ${TABLE}.source_id ;;
  }

  dimension: truncate {
    type: yesno
    sql: ${TABLE}.truncate ;;
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
    drill_fields: [id, destination_name]
  }
}
