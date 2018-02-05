view: users {
  sql_table_name: public.users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: active_license {
    type: yesno
    sql: ${TABLE}.active_license ;;
  }

  dimension: admin {
    type: yesno
    sql: ${TABLE}.admin ;;
  }

  dimension: auth_method {
    type: string
    sql: ${TABLE}.auth_method ;;
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

  dimension_group: current_sign_in {
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
    sql: ${TABLE}.current_sign_in_at ;;
  }

  dimension: current_sign_in_ip {
    type: string
    sql: ${TABLE}.current_sign_in_ip ;;
  }

  dimension_group: deactivated {
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
    sql: ${TABLE}.deactivated_at ;;
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

  dimension: dept {
    type: string
    sql: ${TABLE}.dept ;;
  }

  dimension: developer {
    type: yesno
    sql: ${TABLE}.developer ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: encrypted_password {
    type: string
    sql: ${TABLE}.encrypted_password ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: image_content_type {
    type: string
    sql: ${TABLE}.image_content_type ;;
  }

  dimension: image_file_name {
    type: string
    sql: ${TABLE}.image_file_name ;;
  }

  dimension: image_file_size {
    type: number
    sql: ${TABLE}.image_file_size ;;
  }

  dimension_group: image_updated {
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
    sql: ${TABLE}.image_updated_at ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension_group: last_sign_in {
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
    sql: ${TABLE}.last_sign_in_at ;;
  }

  dimension: last_sign_in_ip {
    type: string
    sql: ${TABLE}.last_sign_in_ip ;;
  }

  dimension: ldap_group_id {
    type: string
    sql: ${TABLE}.ldap_group_id ;;
  }

  dimension: legacy_id {
    type: string
    sql: ${TABLE}.legacy_id ;;
  }

  dimension: legacy_password_digest {
    type: string
    sql: ${TABLE}.legacy_password_digest ;;
  }

  dimension: legacy_password_salt {
    type: string
    sql: ${TABLE}.legacy_password_salt ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension_group: reset_password_sent {
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
    sql: ${TABLE}.reset_password_sent_at ;;
  }

  dimension: reset_password_token {
    type: string
    sql: ${TABLE}.reset_password_token ;;
  }

  dimension: roles {
    type: string
    sql: ${TABLE}.roles ;;
  }

  dimension: session_index {
    type: string
    sql: ${TABLE}.session_index ;;
  }

  dimension: sign_in_count {
    type: number
    sql: ${TABLE}.sign_in_count ;;
  }

  dimension: subscribed_to_emails {
    type: yesno
    sql: ${TABLE}.subscribed_to_emails ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
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

  dimension: user_type {
    type: string
    sql: ${TABLE}.user_type ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      username,
      first_name,
      last_name,
      image_file_name,
      authentication_api_tokens.count,
      csv_files.count,
      dashboard_items.count,
      data_source_tests.count,
      group_memberships.count,
      hdfs_imports.count,
      imports.count,
      job_subscriptions.count,
      memberships.count,
      open_workfile_events.count,
      uploads.count
    ]
  }
}
