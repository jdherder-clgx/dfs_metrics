view: schema_migrations {
  sql_table_name: public.schema_migrations ;;

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
