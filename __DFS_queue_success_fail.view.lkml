view: __DFS_queue_success_fail {

  derived_table: {
    sql:
    -- percentage, two decimal points, succeeded as Successful or Failed
    select
    case when cast(succeeded as varchar) = 'true' then 'Successful'
         else 'Failed'
    end as EXECUTION_STATUS
    , round((COUNT(succeeded) * 100.0 / (select COUNT(*) from public.job_results))::numeric,2) as PERCENTAGE
    FROM       public.job_results jr
    GROUP BY EXECUTION_STATUS        ;;   }


      dimension: EXECUTION_STATUS {
        type: string
        sql: ${TABLE}.EXECUTION_STATUS ;;
      }

# MEASURE required for PIE CHART
      measure: PERCENTAGE {
        type: sum
        value_format: "0.00"
        sql: ${TABLE}.PERCENTAGE ;;
      }


    } # end
