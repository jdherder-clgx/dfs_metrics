view: activities {
  sql_table_name: public.activities ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: entity_id {
    type: number
    sql: ${TABLE}.entity_id ;;
  }

  dimension: entity_type {
    type: string
    sql: ${TABLE}.entity_type ;;
  }

  dimension: event_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.event_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, events.id]
  }
}
