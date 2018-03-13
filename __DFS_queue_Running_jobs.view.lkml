
view: __DFS_queue_Running_jobs {

  derived_table: {
    sql:  select name as NAME
      ,username as OWNER
      ,next_run as SCHEDULED_RUN_DATE
      ,last_run as LAST_RUN_DATE
      ,status as STATUS
      ,description as DESCRIPTION
      from public.jobs j
      inner join public.users u on u.id  = j.owner_id
      where status = 'running'
      order by next_run desc ;;  }

      dimension: NAME {
        type: string
        sql: ${TABLE}.NAME ;;
      }
      dimension: OWNER {
        type: string
        sql: ${TABLE}.OWNER ;;
      }
      dimension: SCHEDULED_RUN_DATE {
        type: number
        sql: ${TABLE}.SCHEDULED_RUN_DATE ;;
      }
      dimension: LAST_RUN_DATE {
        type: date_time
        sql: ${TABLE}.LAST_RUN_DATE ;;
      }
      dimension: STATUS {
        type: string
        sql: ${TABLE}.STATUS ;;
      }
      dimension: DESCRIPTION {
        type: string
        sql: ${TABLE}.DESCRIPTION ;;
      }

    } #END
