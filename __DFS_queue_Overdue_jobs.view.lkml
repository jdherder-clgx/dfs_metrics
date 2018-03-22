
view: __DFS_queue_Overdue_jobs {

  derived_table: {
    sql:

    select
      j.order_name as NAME
    , bu.contact_name as OWNER
    , j.schedule_date_time as SCHEDULED_RUN_DATE
    , DATE_PART('day',   NOW() - j.schedule_date_time) * 24 +  DATE_PART('hour', NOW() - j.schedule_date_time) as HOURS_OVERDUE
    -- need last_run as "LAST RUN DATE" je.execution_date
    , je.job_status as STATUS
    , customer_name as CUSTOMER_NAME
    , aw.name  as WORKFLOW  /* alpine_workflow name of the type of extract */
    from public.job j
    inner join public.job_execution je on je.id = j.id
    inner join public.business_unit bu on bu.id = j.business_unit_id
    inner join public.customer c on c.id = bu.customer_id
    inner join public.alpine_workflow aw on aw.id = j.workflow_id
    where j.schedule_date_time < NOW()
    and je.job_status <> 'FILE_TRANSFER_COMPLETED'
    order by j.schedule_date_time desc
        ;;  }

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
      # dimension: LAST_RUN_DATE {
      #     type: date_time
      #     sql: ${TABLE}.LAST_RUN_DATE ;;
      #   }
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

    } #END
