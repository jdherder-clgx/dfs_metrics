- dashboard: dsf_metrics_dashboard
  title: DSF Metrics
  layout: newspaper
  description: DSF Metrics from doc_preprod source.
  elements:
  - title: Scheduled Next 10 Days
    name: Scheduled Next 10 Days
    model: dsf_metrics
    explore: __DSF_queue_Next_X_days
    type: table
    fields:
    - __DSF_queue_Next_X_days.NAME
    - __DSF_queue_Next_X_days.OWNER
    - __DSF_queue_Next_X_days.SCHEDULED_RUN_DATE
    - __DSF_queue_Next_X_days.STATUS
    - __DSF_queue_Next_X_days.WORKFLOW
    sorts:
    - __DSF_queue_Next_X_days.SCHEDULED_RUN_DATE desc
    limit: 500
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_labels:
      __DSF_queue_Next_X_days.SCHEDULED_RUN_DATE: Scheduled Date
    refresh: 10 minutes
    row: 7
    col: 0
    width: 12
    height: 7
  - title: Running!
    name: Running!
    model: dsf_metrics
    explore: __DSF_queue_Running_jobs
    type: table
    fields:
    - __DSF_queue_Running_jobs.NAME
    - __DSF_queue_Running_jobs.OWNER
    - __DSF_queue_Running_jobs.STATUS
    - __DSF_queue_Running_jobs.WORKFLOW
    - __DSF_queue_Running_jobs.CUSTOMER_NAME
    - __DSF_queue_Running_jobs.SCHEDULED_RUN_DATE
    limit: 500
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_labels:
      __DSF_queue_Running_jobs.SCHEDULED_RUN_DATE: Scheduled Date
    refresh: 1 minute
    row: 0
    col: 0
    width: 10
    height: 7
  - name: Overdue
    title: Overdue
    model: dsf_metrics
    explore: __DSF_queue_Overdue_jobs
    type: table
    fields:
    - __DSF_queue_Overdue_jobs.NAME
    - __DSF_queue_Overdue_jobs.OWNER
    - __DSF_queue_Overdue_jobs.SCHEDULED_RUN_DATE
    - __DSF_queue_Overdue_jobs.HOURS_OVERDUE
    - __DSF_queue_Overdue_jobs.STATUS
    - __DSF_queue_Overdue_jobs.WORKFLOW
    filters:
      __DSF_queue_Overdue_jobs.NAME: "-EMPTY"
    sorts:
    - __DSF_queue_Overdue_jobs.SCHEDULED_RUN_DATE desc
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_labels:
      __DSF_queue_Overdue_jobs.SCHEDULED_RUN_DATE: Scheduled Date
    refresh: 10 minutes
    row: 0
    col: 15
    width: 9
    height: 7
  - title: Completed Last 7 Days
    name: Completed Last 7 Days
    model: dsf_metrics
    explore: __DSF_queue_Completed_jobs
    type: table
    fields:
    - __DSF_queue_Completed_jobs.NAME
    - __DSF_queue_Completed_jobs.OWNER
    - __DSF_queue_Completed_jobs.COMPLETED_DATE
    - __DSF_queue_Completed_jobs.WORKFLOW
    - __DSF_queue_Completed_jobs.STATUS
    - __DSF_queue_Completed_jobs.CUSTOMER_NAME
    sorts:
    - __DSF_queue_Completed_jobs.COMPLETED_DATE desc
    limit: 500
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    refresh: 10 minutes
    row: 7
    col: 12
    width: 12
    height: 7
  - title: DSF Job Execution Status
    name: DSF Job Execution Status
    model: dsf_metrics
    explore: __DSF_queue_success_fail
    type: looker_pie
    fields:
    - __DSF_queue_success_fail.EXECUTION_STATUS
    - __DSF_queue_success_fail.PERCENTAGE
    sorts:
    - __DSF_queue_success_fail.PERCENTAGE desc
    limit: 500
    value_labels: legend
    label_type: labPer
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      Failed: "#c71d65"
    series_labels:
      Successful: Success
      Failed: Fail
    refresh: 10 minutes
    row: 0
    col: 10
    width: 5
    height: 7
  filters:
  - name: Overdue jobs
    title: Overdue jobs
    type: field_filter
    default_value: "-EMPTY"
    allow_multiple_values: true
    required: false
    model: dsf_metrics
    explore: __DSF_queue_Overdue_jobs
    listens_to_filters: []
    field: __DSF_queue_Overdue_jobs.NAME
