view: data_sources {
  sql_table_name: public.data_sources ;;

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

  dimension: db_name {
    type: string
    sql: ${TABLE}.db_name ;;
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

  dimension: hive {
    type: yesno
    sql: ${TABLE}.hive ;;
  }

  dimension: hive_hadoop_version {
    type: string
    sql: ${TABLE}.hive_hadoop_version ;;
  }

  dimension: hive_kerberos {
    type: yesno
    sql: ${TABLE}.hive_kerberos ;;
  }

  dimension: hive_kerberos_keytab_location {
    type: string
    sql: ${TABLE}.hive_kerberos_keytab_location ;;
  }

  dimension: hive_kerberos_principal {
    type: string
    sql: ${TABLE}.hive_kerberos_principal ;;
  }

  dimension: host {
    type: string
    sql: ${TABLE}.host ;;
  }

  dimension: is_hawq {
    type: yesno
    sql: ${TABLE}.is_hawq ;;
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

  dimension: shared {
    type: yesno
    sql: ${TABLE}.shared ;;
  }

  dimension: ssl {
    type: yesno
    sql: ${TABLE}.ssl ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      db_name,
      databases.count,
      data_source_accounts.count,
      data_source_tests.count
    ]
  }
}
