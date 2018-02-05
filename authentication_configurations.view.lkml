view: authentication_configurations {
  sql_table_name: public.authentication_configurations ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: allowed_clock_drift_in_seconds {
    type: number
    sql: ${TABLE}.allowed_clock_drift_in_seconds ;;
  }

  dimension: attr_map_idp_admin_role {
    type: string
    sql: ${TABLE}.attr_map_idp_admin_role ;;
  }

  dimension: attr_map_idp_admin_role_application_admin {
    type: string
    sql: ${TABLE}.attr_map_idp_admin_role_application_admin ;;
  }

  dimension: attr_map_idp_admin_role_data_administrator {
    type: string
    sql: ${TABLE}.attr_map_idp_admin_role_data_administrator ;;
  }

  dimension: attr_map_idp_admin_role_none {
    type: string
    sql: ${TABLE}.attr_map_idp_admin_role_none ;;
  }

  dimension: attr_map_idp_app_role {
    type: string
    sql: ${TABLE}.attr_map_idp_app_role ;;
  }

  dimension: attr_map_idp_app_role_analytics_developer {
    type: string
    sql: ${TABLE}.attr_map_idp_app_role_analytics_developer ;;
  }

  dimension: attr_map_idp_app_role_business_user {
    type: string
    sql: ${TABLE}.attr_map_idp_app_role_business_user ;;
  }

  dimension: attr_map_idp_app_role_collaborator {
    type: string
    sql: ${TABLE}.attr_map_idp_app_role_collaborator ;;
  }

  dimension: attr_map_idp_app_role_data_analyst {
    type: string
    sql: ${TABLE}.attr_map_idp_app_role_data_analyst ;;
  }

  dimension: attr_map_idp_dept {
    type: string
    sql: ${TABLE}.attr_map_idp_dept ;;
  }

  dimension: attr_map_idp_email {
    type: string
    sql: ${TABLE}.attr_map_idp_email ;;
  }

  dimension: attr_map_idp_first_name {
    type: string
    sql: ${TABLE}.attr_map_idp_first_name ;;
  }

  dimension: attr_map_idp_last_name {
    type: string
    sql: ${TABLE}.attr_map_idp_last_name ;;
  }

  dimension: attr_map_idp_title {
    type: string
    sql: ${TABLE}.attr_map_idp_title ;;
  }

  dimension: attr_map_idp_username {
    type: string
    sql: ${TABLE}.attr_map_idp_username ;;
  }

  dimension: idp_metadata {
    type: string
    sql: ${TABLE}.idp_metadata ;;
  }

  dimension: idp_metadata_source {
    type: string
    sql: ${TABLE}.idp_metadata_source ;;
  }

  dimension: idp_metadata_url {
    type: string
    sql: ${TABLE}.idp_metadata_url ;;
  }

  dimension: saml_admin_role_mapping_external_script_path {
    type: string
    sql: ${TABLE}.saml_admin_role_mapping_external_script_path ;;
  }

  dimension: saml_admin_role_mapping_method {
    type: string
    sql: ${TABLE}.saml_admin_role_mapping_method ;;
  }

  dimension: saml_app_role_mapping_external_script_path {
    type: string
    sql: ${TABLE}.saml_app_role_mapping_external_script_path ;;
  }

  dimension: saml_app_role_mapping_method {
    type: string
    sql: ${TABLE}.saml_app_role_mapping_method ;;
  }

  dimension: saml_auth_configured {
    type: yesno
    sql: ${TABLE}.saml_auth_configured ;;
  }

  dimension: saml_custom_sp_entity_id {
    type: string
    sql: ${TABLE}.saml_custom_sp_entity_id ;;
  }

  dimension: saml_require_signed_assertions_from_idp {
    type: yesno
    sql: ${TABLE}.saml_require_signed_assertions_from_idp ;;
  }

  dimension: saml_sign_out_success_url {
    type: string
    sql: ${TABLE}.saml_sign_out_success_url ;;
  }

  dimension: saml_sign_own_sp_assertions {
    type: yesno
    sql: ${TABLE}.saml_sign_own_sp_assertions ;;
  }

  dimension: saml_sp_certificate {
    type: string
    sql: ${TABLE}.saml_sp_certificate ;;
  }

  dimension: saml_sp_private_key_file_path {
    type: string
    sql: ${TABLE}.saml_sp_private_key_file_path ;;
  }

  dimension: send_slo_request_to_idp_on_logout {
    type: yesno
    sql: ${TABLE}.send_slo_request_to_idp_on_logout ;;
  }

  dimension: username_source_in_saml_response {
    type: string
    sql: ${TABLE}.username_source_in_saml_response ;;
  }

  measure: count {
    type: count
    drill_fields: [id, attr_map_idp_first_name, attr_map_idp_last_name, attr_map_idp_username]
  }
}
