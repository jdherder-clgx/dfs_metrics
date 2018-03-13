view: hdfs_entries {
  sql_table_name: public.hdfs_entries ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: content_count {
    type: number
    sql: ${TABLE}.content_count ;;
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

  dimension_group: deleted {
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
    sql: ${TABLE}.deleted_at ;;
  }

  dimension: hdfs_data_source_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.hdfs_data_source_id ;;
  }

  dimension: is_directory {
    type: yesno
    sql: ${TABLE}.is_directory ;;
  }

  dimension: legacy_id {
    type: string
    sql: ${TABLE}.legacy_id ;;
  }

  dimension_group: modified {
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
    sql: ${TABLE}.modified_at ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}.path ;;
  }

  dimension: size {
    type: number
    sql: ${TABLE}.size ;;
  }

  dimension_group: stale {
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
    sql: ${TABLE}.stale_at ;;
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
    drill_fields: [id, hdfs_data_sources.id, hdfs_data_sources.name, hdfs_data_sources.username]
  }
}
