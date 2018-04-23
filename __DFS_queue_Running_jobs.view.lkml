
view: __DFS_queue_Running_jobs {

  derived_table: {
    sql:
select
  j.order_name as NAME
, bu.contact_name as OWNER
, j.schedule_date_time as SCHEDULED_RUN_DATE
, je.job_status as STATUS
, customer_name as CUSTOMER_NAME
, aw.name  as WORKFLOW  /* alpine_workflow name of the type of extract */
from public.job j
inner join public.job_execution je on je.job_id = j.id
inner join public.business_unit bu on bu.id = j.business_unit_id
inner join public.customer c on c.id = bu.customer_id
inner join public.alpine_workflow aw on aw.id = j.workflow_id
where
--j.schedule_date_time >=  CURRENT_DATE + interval '0 hour'  /* scheduled for today */
--and
je.execution_date between CURRENT_DATE + interval '0 hour'  and NOW()   /* execution today */
and j.deleted_at is null /* omit deleted jobs */
and je.job_status <> 'JOB_COMPLETED'
--and je.id = (select MAX(x.id) from public.job_execution x where x.job_id = j.id ) /* the most current task status */
order by  j.schedule_date_time desc
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
      dimension: CUSTOMER_NAME {
        type: string
        sql: ${TABLE}.CUSTOMER_NAME ;;
      }
      dimension: WORKFLOW {
        type: string
        sql: ${TABLE}.WORKFLOW ;;
      }
    } #END
