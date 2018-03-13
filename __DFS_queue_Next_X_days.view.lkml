
view: __DFS_queue_Next_X_days {

  derived_table: {
    sql:  select name as NAME
       ,username as OWNER
       ,next_run as SCHEDULED_RUN_DATE
       ,last_run as LAST_RUN_DATE
       ,status as STATUS
       ,enabled as ENABLED
       ,description as DESCRIPTION
       from public.jobs j
       inner join public.users u on u.id  = j.owner_id
       --where next_run between CURRENT_DATE + interval '0 hour' and NOW() + '10 day'::interval
       --and enabled = true
       order by next_run desc       ;;  }

      dimension: NAME {
        type: string
        sql: ${TABLE}.NAME ;;
      }
      dimension: OWNER {
        type: string
        sql: ${TABLE}.OWNER ;;
      }
      dimension: SCHEDULED_RUN_DATE {
        type: date_time
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
      dimension: ENABLED {
        type: yesno
        sql: ${TABLE}.ENABLED ;;
      }
      dimension: DESCRIPTION {
        type: string
        sql: ${TABLE}.DESCRIPTION ;;
      }

    } #END
