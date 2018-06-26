connection: "doc_preprod"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

datagroup: dfs_metrics_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log ;;
  max_cache_age: "1 hour"
}

persist_with: dfs_metrics_default_datagroup

#  MODEL name:  dsf_metrics

#  EXPLORE name: DFS METRICS

#  DFS queue Next X days

#  DFS queue Success or Failure overview

#  DFS queue Overdue jobs

#  DFS queue Running jobs

#  DFS queue Completed jobs


# Create an explorable item based on the "__DFS_queue_Next_X_days" view
explore: __DSF_queue_Next_X_days {

# Give the explore a user-friendly name in the Explore menu
  label: "DSF queue Next X days"
}


# Create an explorable item based on the "__DFS_queue_success_fail" view
explore: __DSF_queue_success_fail {

# Give the explore a user-friendly name in the Explore menu
  label: "DSF queue Success or Failure"
}


# Create an explorable item based on the "__DFS_queue_Overdue_jobs" view
explore: __DSF_queue_Overdue_jobs {

# Give the explore a user-friendly name in the Explore menu
  label: "DSF queue Overdue jobs"
}


# Create an explorable item based on the "__DFS_queue_Running_jobs" view
explore: __DSF_queue_Running_jobs {

# Give the explore a user-friendly name in the Explore menu
  label: "DSF queue Running jobs"
}


# Create an explorable item based on the "__DFS_queue_Completed_jobs" view
explore: __DSF_queue_Completed_jobs {

# Give the explore a user-friendly name in the Explore menu
  label: "DSF queue Completed jobs"
}



# #  # Create an explorable item based on the "__DFS_a_test" view
#   explore: __DFS_a_test {

#   # Give the explore a user-friendly name in the Explore menu
#     label: "a test"
#   }

#END
