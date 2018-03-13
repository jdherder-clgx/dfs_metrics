view: __DFS_queue_success_fail {

  derived_table: {
    sql:
    -- percentage, two decimal points, succeeded as Successful or Failed
SELECT
case when cast(succeeded as varchar) = 'true' then 'Successful'
     else 'Failed'
end as EXECUTION_STATUS
,SUM(case when cast(succeeded as varchar) = 'true' then 1 else 0 END) as SUCCESSFUL,
SUM(case when cast(succeeded as varchar) = 'false' then 1 else 0 END) as FAILED
, round((COUNT(succeeded) * 100.0 / (select COUNT(*) from public.job_results))::numeric,2) as PERCENTAGE
FROM       public.job_results
GROUP BY EXECUTION_STATUS      ;;   }


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

# MEASURE required for PIE CHART
      measure: SUCCESSFUL {
        type: sum
        sql: ${TABLE}.SUCCESSFUL ;;
      }

# MEASURE required for PIE CHART
      measure: FAILED {
        type: sum
        sql: ${TABLE}.FAILED ;;
      }


    } # end
