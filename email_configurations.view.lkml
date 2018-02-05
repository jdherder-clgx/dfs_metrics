view: email_configurations {
  sql_table_name: public.email_configurations ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: email_enabled {
    type: yesno
    sql: ${TABLE}.email_enabled ;;
  }

  dimension: email_from {
    type: string
    sql: ${TABLE}.email_from ;;
  }

  dimension: email_reply_to {
    type: string
    sql: ${TABLE}.email_reply_to ;;
  }

  dimension: smtp_address {
    type: string
    sql: ${TABLE}.smtp_address ;;
  }

  dimension: smtp_authentication {
    type: string
    sql: ${TABLE}.smtp_authentication ;;
  }

  dimension: smtp_domain {
    type: string
    sql: ${TABLE}.smtp_domain ;;
  }

  dimension: smtp_enable_starttls_auto {
    type: yesno
    sql: ${TABLE}.smtp_enable_starttls_auto ;;
  }

  dimension: smtp_openssl_verify_mode {
    type: string
    sql: ${TABLE}.smtp_openssl_verify_mode ;;
  }

  dimension: smtp_password {
    type: string
    sql: ${TABLE}.smtp_password ;;
  }

  dimension: smtp_port {
    type: string
    sql: ${TABLE}.smtp_port ;;
  }

  dimension: smtp_user_name {
    type: string
    sql: ${TABLE}.smtp_user_name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, smtp_user_name]
  }
}
