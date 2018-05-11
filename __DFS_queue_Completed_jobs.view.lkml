
view: __DFS_queue_Completed_jobs {


  derived_table: {
    sql:

SET search_path TO public;

    select
      j.order_name as NAME
    , bu.contact_name as OWNER
    , j.schedule_date_time as NEXT_RUN_DATE
    , je.end_date as COMPLETED_DATE
    , je.job_status as STATUS
    , customer_name as CUSTOMER_NAME
    , aw.name  as WORKFLOW  /* alpine_workflow name of the type of extract */
    from public.job j
    inner join public.job_execution je on je.job_id = j.id
    inner join public.business_unit bu on bu.id = j.business_unit_id
    inner join public.customer c on c.id = bu.customer_id
    inner join public.alpine_workflow aw on aw.id = j.workflow_id
    where  '[2017-01-01, 2028-03-01)'::daterange @> je.end_date::date  /* RANGE starts with [ ends with ), ::date converts timestamp to date */
    and je.job_status = 'JOB_COMPLETED'
    order by je.end_date desc
        ;;     }


      dimension: NAME {
        type: string
        sql: ${TABLE}.NAME ;;
      }

      dimension: OWNER {
        type: string
        sql: ${TABLE}.OWNER ;;
      }
      dimension: NEXT_RUN_DATE {
        type: date_time
        sql: ${TABLE}.NEXT_RUN_DATE ;;
      }
      dimension: COMPLETED_DATE {
        type: date_time
        sql: ${TABLE}.COMPLETED_DATE ;;
      }
      dimension: STATUS {
        type: string
        sql: ${TABLE}.STATUS ;;
      }
      dimension: CUSTOMER_NAME {
        type: string
        sql: ${TABLE}.CUSTOMER_NAME ;;
      }
      dimension: WORKFLOW {
        type: string
        sql: ${TABLE}.WORKFLOW ;;
      }

      # MEASURE required for  CHART
      #measure: DURATION {
        #  hidden:  no
        #  type: sum
        #  sql: ${TABLE}.DURATION ;;
        #}

    } #END
