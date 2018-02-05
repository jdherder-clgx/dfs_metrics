view: workfile_drafts {
  sql_table_name: public.workfile_drafts ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: base_version {
    type: number
    sql: ${TABLE}.base_version ;;
  }

  dimension: content {
    type: string
    sql: ${TABLE}.content ;;
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

  dimension: legacy_id {
    type: string
    sql: ${TABLE}.legacy_id ;;
  }

  dimension: owner_id {
    type: number
    sql: ${TABLE}.owner_id ;;
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

  dimension: workfile_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.workfile_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, workfiles.image_file_name, workfiles.id, workfiles.file_name]
  }
}
