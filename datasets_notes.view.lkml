view: datasets_notes {
  sql_table_name: public.datasets_notes ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: dataset_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.dataset_id ;;
  }

  dimension: legacy_id {
    type: string
    sql: ${TABLE}.legacy_id ;;
  }

  dimension: note_id {
    type: number
    sql: ${TABLE}.note_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, datasets.id, datasets.name]
  }
}
