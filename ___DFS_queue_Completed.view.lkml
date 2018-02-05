view: ___DFS_queue_Completed {

    derived_table: {
    sql:  select name as NAME
      ,username as OWNER
      --,next_run as SCHEDULED_RUN_DATE
      ,last_run as RUN_DATE
      --,jr.finished_at as COMPLETED_DATE
      ,j.end_run as COMPLETED_DATE
      ,DATE_PART('day',   j.end_run - last_run) * 24 +  DATE_PART('minute', j.end_run - last_run) as DURATION   /* difference in minutes */
      ,jr.succeeded as COMPLETED_SUCCESFULLY
      --,status as STATUS
      --,enabled as ENABLED
      ,description as DESCRIPTION
      from public.jobs j
      inner join public.users u on j.owner_id = u.id
      inner join public.job_results jr on jr.id = j.id
      --where last_run >= NOW() - '30 day'::interval     /* Last x days */
      --where next_run between CURRENT_DATE + interval '0 hour' and NOW() + '10 day'::interval  /*Midnight and next x days */
      WHERE '[2017-01-01, 2018-03-01)'::daterange @> last_run::date   /* RANGE starts with [ ends with ), ::date converts timestamp to date */
      order by LAST_RUN desc ;;     }



      dimension: NAME {
        type: string
        sql: ${TABLE}.NAME ;;
      }

      dimension: OWNER {
        type: string
        sql: ${TABLE}.OWNER ;;
      }
      dimension: RUN_DATE {
        type: date_time
        sql: ${TABLE}.RUN_DATE ;;
      }
      dimension: COMPLETED_DATE {
        type: date_time
        sql: ${TABLE}.COMPLETED_DATE ;;
      }
      dimension: COMPLETED_SUCCESFULLY {
        type: yesno
        sql: ${TABLE}.COMPLETED_SUCCESFULLY ;;
      }
      dimension: DESCRIPTION {
        type: string
        sql: ${TABLE}.DESCRIPTION ;;
      }

  # MEASURE required for  CHART
  measure: DURATION {
    hidden:  no
    type: sum
     sql: ${TABLE}.DURATION ;;
  }

    } #END
