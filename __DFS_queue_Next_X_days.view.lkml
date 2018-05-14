
view: __DFS_queue_Next_X_days {

  derived_table: {
    sql:
      select
     j.order_name as NAME
    , bu.contact_name as OWNER
    , j.schedule_date_time as SCHEDULED_RUN_DATE
    --, je.job_status as STATUS
    --, case when je.execution_date < CURRENT_DATE then null
    --  else je.execution_date
    --  end as "EXECUTION_DATE"
    , case when je.end_date < CURRENT_DATE then null
      else je.job_status
      end  as STATUS
    , j.order_name  as ORDER_NAME
    , c.customer_name as CUSTOMER_NAME
    , aw.name  as WORKFLOW  /* alpine_workflow name of the type of extract */
    from public.job j
    inner join public.job_execution je on je.job_id = j.id
    inner join public.business_unit bu on bu.id = j.business_unit_id
    inner join public.customer c on c.id = bu.customer_id
    inner join public.alpine_workflow aw on aw.id = j.workflow_id
    where
    j.schedule_date_time between CURRENT_DATE + interval '0 hour' and NOW() + '10 day'::interval  /* Next 10 days j.schedule_date_time*/
    --and je.execution_date between CURRENT_DATE + interval '0 hour' and NOW() + '10 day'::interval  /* Next 10 days - filters only completed jobs */
    and j.deleted_at is  null /* omit deleted jobs */
    ---
    and je.id = (select MAX(x.id) from public.job_execution x where x.job_id = j.id )
    ---
    order by j.id, j.schedule_date_time desc
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
        type: date_time
        sql: ${TABLE}.SCHEDULED_RUN_DATE ;;
      }
      #dimension: LAST_RUN_DATE {
        #  type: date_time
        #  sql: ${TABLE}.LAST_RUN_DATE ;;
        #}
      dimension: STATUS {
        type: string
        sql: ${TABLE}.STATUS ;;
      }
      dimension: ORDER_NAME {
        type: string
        sql: ${TABLE}.ORDER_NAME ;;
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
