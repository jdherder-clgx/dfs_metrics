
view: __DFS_queue_Completed_jobs {

  derived_table: {
    sql:
      select
      j.order_name as NAME
    , bu.contact_name as OWNER
    , j.schedule_date_time as RUN_DATE
    , je.execution_date as COMPLETED_DATE
    , case
        when je.job_status = 'FILE_TRANSFER_COMPLETED' then 'Yes'
        when je.job_status = 'FILE_TRANSFER_FAILED' then 'No'
        else 'No'
      end as COMPLETED_SUCCESFULLY

    , c.customer_name as CUSTOMER_NAME

    from public.job j
    inner join public.job_execution je on je.id = j.id
    inner join public.business_unit bu on bu.id = j.business_unit_id
    inner join public.customer c on c.id = bu.customer_id
    inner join public.alpine_workflow aw on aw.id = j.workflow_id
    where  '[2017-01-01, 2028-03-01)'::daterange @> je.execution_date::date  /* RANGE starts with [ ends with ), ::date converts timestamp to date */

    order by je.execution_date desc
        ;;     }



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
      dimension: CUSTOMER_NAME {
        type: string
        sql: ${TABLE}.CUSTOMER_NAME ;;
      }

      # # MEASURE required for  CHART
      # measure: DURATION {
      #   hidden:  no
      #   type: sum
      #   sql: ${TABLE}.DURATION ;;
      # }

    } #END
