view: data_source_accounts {
  sql_table_name: public.data_source_accounts ;;

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

  dimension: data_source_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.data_source_id ;;
  }

  dimension: db_username {
    type: string
    sql: ${TABLE}.db_username ;;
  }

  dimension: encrypted_db_password {
    type: string
    sql: ${TABLE}.encrypted_db_password ;;
  }

  dimension: invalid_credentials {
    type: yesno
    sql: ${TABLE}.invalid_credentials ;;
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

  dimension: workspace_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.workspace_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      db_username,
      data_sources.id,
      data_sources.name,
      data_sources.db_name,
      workspaces.image_file_name,
      workspaces.id,
      workspaces.name,
      data_source_account_permissions.count
    ]
  }
}
