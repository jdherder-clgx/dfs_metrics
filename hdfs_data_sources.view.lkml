view: hdfs_data_sources {
  sql_table_name: public.hdfs_data_sources ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: connection_parameters {
    type: string
    sql: ${TABLE}.connection_parameters ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: disable_kerberos_impersonation {
    type: yesno
    sql: ${TABLE}.disable_kerberos_impersonation ;;
  }

  dimension: group_list {
    type: string
    sql: ${TABLE}.group_list ;;
  }

  dimension: hdfs_version {
    type: string
    sql: ${TABLE}.hdfs_version ;;
  }

  dimension: high_availability {
    type: yesno
    sql: ${TABLE}.high_availability ;;
  }

  dimension: hive_metastore_location {
    type: string
    sql: ${TABLE}.hive_metastore_location ;;
  }

  dimension: host {
    type: string
    sql: ${TABLE}.host ;;
  }

  dimension: is_hdfs_hive {
    type: yesno
    sql: ${TABLE}.is_hdfs_hive ;;
  }

  dimension: job_tracker_host {
    type: string
    sql: ${TABLE}.job_tracker_host ;;
  }

  dimension: job_tracker_port {
    type: number
    sql: ${TABLE}.job_tracker_port ;;
  }

  dimension_group: last_checked {
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
    sql: ${TABLE}.last_checked_at ;;
  }

  dimension_group: last_online {
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
    sql: ${TABLE}.last_online_at ;;
  }

  dimension: legacy_id {
    type: string
    sql: ${TABLE}.legacy_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: owner_id {
    type: number
    sql: ${TABLE}.owner_id ;;
  }

  dimension: port {
    type: number
    sql: ${TABLE}.port ;;
  }

  dimension: public {
    type: yesno
    sql: ${TABLE}.public ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: third_party_security_enabled {
    type: yesno
    sql: ${TABLE}.third_party_security_enabled ;;
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

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, username, datasets.count, hdfs_entries.count]
  }
}
