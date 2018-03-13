view: tags {
  sql_table_name: public.tags ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: taggings_count {
    type: number
    sql: ${TABLE}.taggings_count ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, taggings.count]
  }
}
