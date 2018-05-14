view: ___test {


    derived_table: {
      sql:
          select
            j.order_name as NAME
          , j.schedule_date_time as NEXT_RUN_DATE
          from "public"."job" j

              ;;     }


        dimension: NAME {
          type: string
          sql: ${TABLE}.NAME ;;
        }


        dimension: NEXT_RUN_DATE {
          type: date_time
          sql: ${TABLE}.NEXT_RUN_DATE ;;
        }


        # MEASURE required for  CHART
        #measure: DURATION {
        #  hidden:  no
        #  type: sum
        #  sql: ${TABLE}.DURATION ;;
        #}

      } #END
