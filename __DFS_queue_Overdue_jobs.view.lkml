
view: __DFS_queue_Overdue_jobs {

  derived_table: {
    sql:         select name as NAME
      ,username as OWNER
      ,next_run as SCHEDULED_RUN_DATE
      ,DATE_PART('day',   NOW() - next_run) * 24 +  DATE_PART('hour', NOW() - next_run) as HOURS_OVERDUE   /* difference in hours */
      ,last_run as LAST_RUN_DATE
      ,status as STATUS
      ,enabled as ENABLED
      ,description as DESCRIPTION
      from public.jobs j
      inner join public.users u on u.id  = j.owner_id
      where next_run < NOW()
      and enabled = true
      order by next_run desc  ;;  }

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
      dimension: HOURS_OVERDUE {
        type: number
        sql: ${TABLE}.HOURS_OVERDUE ;;
      }
      dimension: LAST_RUN_DATE {
        type: date_time
        sql: ${TABLE}.LAST_RUN_DATE ;;
      }
      dimension: STATUS {
        type: string
        sql: ${TABLE}.STATUS ;;
      }
      dimension: ENABLED {
        type: yesno
        sql: ${TABLE}.ENABLED ;;
      }
      dimension: DESCRIPTION {
        type: string
        sql: ${TABLE}.DESCRIPTION ;;
      }

    } #END
