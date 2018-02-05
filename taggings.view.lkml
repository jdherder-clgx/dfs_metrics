view: taggings {
  sql_table_name: public.taggings ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: context {
    type: string
    sql: ${TABLE}.context ;;
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

  dimension: tag_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.tag_id ;;
  }

  dimension: taggable_id {
    type: number
    sql: ${TABLE}.taggable_id ;;
  }

  dimension: taggable_type {
    type: string
    sql: ${TABLE}.taggable_type ;;
  }

  dimension: tagger_id {
    type: number
    sql: ${TABLE}.tagger_id ;;
  }

  dimension: tagger_type {
    type: string
    sql: ${TABLE}.tagger_type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, tags.id, tags.name]
  }
}
