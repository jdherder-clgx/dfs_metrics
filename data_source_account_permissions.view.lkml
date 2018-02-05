view: data_source_account_permissions {
  sql_table_name: public.data_source_account_permissions ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: accessed_id {
    type: number
    sql: ${TABLE}.accessed_id ;;
  }

  dimension: accessed_type {
    type: string
    sql: ${TABLE}.accessed_type ;;
  }

  dimension: data_source_account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.data_source_account_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, data_source_accounts.id, data_source_accounts.db_username]
  }
}
