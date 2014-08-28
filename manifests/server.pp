# == Class: graylog2::server
#
# === Authors
#
# Johannes Graf <graf@synyx.de>
#
# === Copyright
#
# Copyright 2014 synyx GmbH & Co. KG
#
class graylog2::server (
  $package_version = $graylog2::server::params::package_version,
  $service_ensure  = $graylog2::server::params::service_ensure,
  $service_enable  = $graylog2::server::params::service_enable,
  $config_file     = $graylog2::server::params::config_file,
  $daemon_username = $graylog2::server::params::daemon_username,
  $run             = $graylog2::server::params::run,

  $allow_highlighting                                 = $graylog2::server::params::allow_highlighting,
  $allow_leading_wildcard_searches                    = $graylog2::server::params::allow_leading_wildcard_searches,
  $async_eventbus_processors                          = $graylog2::server::params::async_eventbus_processors,
  $dead_letters_enabled                               = $graylog2::server::params::dead_letters_enabled,
  $elasticsearch_analyzer                             = $graylog2::server::params::elasticsearch_analyzer,
  $elasticsearch_cluster_discovery_timeout            = $graylog2::server::params::elasticsearch_cluster_discovery_timeout,
  $elasticsearch_cluster_name                         = $graylog2::server::params::elasticsearch_cluster_name,
  $elasticsearch_config_file                          = $graylog2::server::params::elasticsearch_config_file,
  $elasticsearch_discovery_initial_state_timeout      = $graylog2::server::params::elasticsearch_discovery_initial_state_timeout,
  $elasticsearch_discovery_zen_ping_multicast_enabled = $graylog2::server::params::elasticsearch_discovery_zen_ping_multicast_enabled,
  $elasticsearch_discovery_zen_ping_unicast_hosts     = $graylog2::server::params::elasticsearch_discovery_zen_ping_unicast_hosts,
  $elasticsearch_http_enabled                         = $graylog2::server::params::elasticsearch_http_enabled,
  $elasticsearch_index_prefix                         = $graylog2::server::params::elasticsearch_index_prefix,
  $elasticsearch_max_docs_per_index                   = $graylog2::server::params::elasticsearch_max_docs_per_index,
  $elasticsearch_max_number_of_indices                = $graylog2::server::params::elasticsearch_max_number_of_indices,
  $elasticsearch_network_bind_host                    = $graylog2::server::params::elasticsearch_network_bind_host,
  $elasticsearch_network_host                         = $graylog2::server::params::elasticsearch_network_host,
  $elasticsearch_network_publish_host                 = $graylog2::server::params::elasticsearch_network_publish_host,
  $elasticsearch_node_data                            = $graylog2::server::params::elasticsearch_node_data,
  $elasticsearch_node_master                          = $graylog2::server::params::elasticsearch_node_master,
  $elasticsearch_node_name                            = $graylog2::server::params::elasticsearch_node_name,
  $elasticsearch_replicas                             = $graylog2::server::params::elasticsearch_replicas,
  $elasticsearch_shards                               = $graylog2::server::params::elasticsearch_shards,
  $elasticsearch_transport_tcp_port                   = $graylog2::server::params::elasticsearch_transport_tcp_port,
  $enable_metrics_collection                          = $graylog2::server::params::enable_metrics_collection,
  $groovy_shell_enable                                = $graylog2::server::params::groovy_shell_enable,
  $groovy_shell_port                                  = $graylog2::server::params::groovy_shell_port,
  $http_proxy_uri                                     = $graylog2::server::params::http_proxy_uri,
  $input_cache_max_size                               = $graylog2::server::params::input_cache_max_size,
  $is_master                                          = $graylog2::server::params::is_master,
  $lb_recognition_period_seconds                      = $graylog2::server::params::lb_recognition_period_seconds,
  $ldap_connection_timeout                            = $graylog2::server::params::ldap_connection_timeout,
  $message_cache_commit_interval                      = $graylog2::server::params::message_cache_commit_interval,
  $message_cache_off_heap                             = $graylog2::server::params::message_cache_off_heap,
  $message_cache_spool_dir                            = $graylog2::server::params::message_cache_spool_dir,
  $mongodb_database                                   = $graylog2::server::params::mongodb_database,
  $mongodb_host                                       = $graylog2::server::params::mongodb_host,
  $mongodb_max_connections                            = $graylog2::server::params::mongodb_max_connections,
  $mongodb_password                                   = $graylog2::server::params::mongodb_password,
  $mongodb_port                                       = $graylog2::server::params::mongodb_port,
  $mongodb_replica_set                                = $graylog2::server::params::mongodb_replica_set,
  $mongodb_threads_allowed_to_block_multiplier        = $graylog2::server::params::mongodb_threads_allowed_to_block_multiplier,
  $mongodb_useauth                                    = $graylog2::server::params::mongodb_useauth,
  $mongodb_user                                       = $graylog2::server::params::mongodb_user,
  $node_id_file                                       = $graylog2::server::params::node_id_file,
  $no_retention                                       = $graylog2::server::params::no_retention,
  $output_batch_size                                  = $graylog2::server::params::output_batch_size,
  $outputbuffer_processor_keep_alive_time             = $graylog2::server::params::outputbuffer_processor_keep_alive_time,
  $outputbuffer_processors                            = $graylog2::server::params::outputbuffer_processors,
  $outputbuffer_processor_threads_core_pool_size      = $graylog2::server::params::outputbuffer_processor_threads_core_pool_size,
  $outputbuffer_processor_threads_max_pool_size       = $graylog2::server::params::outputbuffer_processor_threads_max_pool_size,
  $output_flush_interval                              = $graylog2::server::params::output_flush_interval,
  $output_module_timeout                              = $graylog2::server::params::output_module_timeout,
  $password_secret                                    = $graylog2::server::params::password_secret,
  $plugin_dir                                         = $graylog2::server::params::plugin_dir,
  $processbuffer_processors                           = $graylog2::server::params::processbuffer_processors,
  $processor_wait_strategy                            = $graylog2::server::params::processor_wait_strategy,
  $rest_enable_cors                                   = $graylog2::server::params::rest_enable_cors,
  $rest_enable_gzip                                   = $graylog2::server::params::rest_enable_gzip,
  $rest_listen_uri                                    = $graylog2::server::params::rest_listen_uri,
  $rest_transport_uri                                 = $graylog2::server::params::rest_transport_uri,
  $retention_strategy                                 = $graylog2::server::params::retention_strategy,
  $ring_size                                          = $graylog2::server::params::ring_size,
  $root_password_sha2                                 = $graylog2::server::params::root_password_sha2,
  $root_username                                      = $graylog2::server::params::root_username,
  $rules_file                                         = $graylog2::server::params::rules_file,
  $shutdown_timeout                                   = $graylog2::server::params::shutdown_timeout,
  $stale_master_timeout                               = $graylog2::server::params::stale_master_timeout,
  $stream_processing_max_faults                       = $graylog2::server::params::stream_processing_max_faults,
  $stream_processing_timeout                          = $graylog2::server::params::stream_processing_timeout,
  $transport_email_auth_password                      = $graylog2::server::params::transport_email_auth_password,
  $transport_email_auth_username                      = $graylog2::server::params::transport_email_auth_username,
  $transport_email_enabled                            = $graylog2::server::params::transport_email_enabled,
  $transport_email_from_email                         = $graylog2::server::params::transport_email_from_email,
  $transport_email_hostname                           = $graylog2::server::params::transport_email_hostname,
  $transport_email_port                               = $graylog2::server::params::transport_email_port,
  $transport_email_subject_prefix                     = $graylog2::server::params::transport_email_subject_prefix,
  $transport_email_use_auth                           = $graylog2::server::params::transport_email_use_auth,
  $transport_email_use_ssl                            = $graylog2::server::params::transport_email_use_ssl,
  $transport_email_use_tls                            = $graylog2::server::params::transport_email_use_tls,
  $transport_email_web_interface_url                  = $graylog2::server::params::transport_email_web_interface_url,
  $udp_recvbuffer_sizes                               = $graylog2::server::params::udp_recvbuffer_sizes,
  $versionchecks_connection_request_timeout           = $graylog2::server::params::versionchecks_connection_request_timeout,
  $versionchecks_connect_timeout                      = $graylog2::server::params::versionchecks_connect_timeout,
  $versionchecks_socket_timeout                       = $graylog2::server::params::versionchecks_socket_timeout,
  $versionchecks                                      = $graylog2::server::params::versionchecks,
  $versionchecks_uri                                  = $graylog2::server::params::versionchecks_uri,
) inherits graylog2::server::params {

  anchor {'graylog2::server::start': }->
  class {'graylog2::server::package':
    package => $graylog2::server::params::package_name,
    version => $package_version,
  } ->
  class {'graylog2::server::configure':
    config_file     => $config_file,
    daemon_username => $daemon_username,
    run             => $run,

    allow_highlighting                                 => $allow_highlighting,
    allow_leading_wildcard_searches                    => $allow_leading_wildcard_searches,
    async_eventbus_processors                          => $async_eventbus_processors,
    dead_letters_enabled                               => $dead_letters_enabled,
    elasticsearch_analyzer                             => $elasticsearch_analyzer,
    elasticsearch_cluster_discovery_timeout            => $elasticsearch_cluster_discovery_timeout,
    elasticsearch_cluster_name                         => $elasticsearch_cluster_name,
    elasticsearch_config_file                          => $elasticsearch_config_file,
    elasticsearch_discovery_initial_state_timeout      => $elasticsearch_discovery_initial_state_timeout,
    elasticsearch_discovery_zen_ping_multicast_enabled => $elasticsearch_discovery_zen_ping_multicast_enabled,
    elasticsearch_discovery_zen_ping_unicast_hosts     => $elasticsearch_discovery_zen_ping_unicast_hosts,
    elasticsearch_http_enabled                         => $elasticsearch_http_enabled,
    elasticsearch_index_prefix                         => $elasticsearch_index_prefix,
    elasticsearch_max_docs_per_index                   => $elasticsearch_max_docs_per_index,
    elasticsearch_max_number_of_indices                => $elasticsearch_max_number_of_indices,
    elasticsearch_network_bind_host                    => $elasticsearch_network_bind_host,
    elasticsearch_network_host                         => $elasticsearch_network_host,
    elasticsearch_network_publish_host                 => $elasticsearch_network_publish_host,
    elasticsearch_node_data                            => $elasticsearch_node_data,
    elasticsearch_node_master                          => $elasticsearch_node_master,
    elasticsearch_node_name                            => $elasticsearch_node_name,
    elasticsearch_replicas                             => $elasticsearch_replicas,
    elasticsearch_shards                               => $elasticsearch_shards,
    elasticsearch_transport_tcp_port                   => $elasticsearch_transport_tcp_port,
    enable_metrics_collection                          => $enable_metrics_collection,
    groovy_shell_enable                                => $groovy_shell_enable,
    groovy_shell_port                                  => $groovy_shell_port,
    http_proxy_uri                                     => $http_proxy_uri,
    input_cache_max_size                               => $input_cache_max_size,
    is_master                                          => $is_master,
    lb_recognition_period_seconds                      => $lb_recognition_period_seconds,
    ldap_connection_timeout                            => $ldap_connection_timeout,
    message_cache_commit_interval                      => $message_cache_commit_interval,
    message_cache_off_heap                             => $message_cache_off_heap,
    message_cache_spool_dir                            => $message_cache_spool_dir,
    mongodb_database                                   => $mongodb_database,
    mongodb_host                                       => $mongodb_host,
    mongodb_max_connections                            => $mongodb_max_connections,
    mongodb_password                                   => $mongodb_password,
    mongodb_port                                       => $mongodb_port,
    mongodb_replica_set                                => $mongodb_replica_set,
    mongodb_threads_allowed_to_block_multiplier        => $mongodb_threads_allowed_to_block_multiplier,
    mongodb_useauth                                    => $mongodb_useauth,
    mongodb_user                                       => $mongodb_user,
    node_id_file                                       => $node_id_file,
    no_retention                                       => $no_retention,
    output_batch_size                                  => $output_batch_size,
    outputbuffer_processor_keep_alive_time             => $outputbuffer_processor_keep_alive_time,
    outputbuffer_processors                            => $outputbuffer_processors,
    outputbuffer_processor_threads_core_pool_size      => $outputbuffer_processor_threads_core_pool_size,
    outputbuffer_processor_threads_max_pool_size       => $outputbuffer_processor_threads_max_pool_size,
    output_flush_interval                              => $output_flush_interval,
    output_module_timeout                              => $output_module_timeout,
    password_secret                                    => $password_secret,
    plugin_dir                                         => $plugin_dir,
    processbuffer_processors                           => $processbuffer_processors,
    processor_wait_strategy                            => $processor_wait_strategy,
    rest_enable_cors                                   => $rest_enable_cors,
    rest_enable_gzip                                   => $rest_enable_gzip,
    rest_listen_uri                                    => $rest_listen_uri,
    rest_transport_uri                                 => $rest_transport_uri,
    retention_strategy                                 => $retention_strategy,
    ring_size                                          => $ring_size,
    root_password_sha2                                 => $root_password_sha2,
    root_username                                      => $root_username,
    rules_file                                         => $rules_file,
    shutdown_timeout                                   => $shutdown_timeout,
    stale_master_timeout                               => $stale_master_timeout,
    stream_processing_max_faults                       => $stream_processing_max_faults,
    stream_processing_timeout                          => $stream_processing_timeout,
    transport_email_auth_password                      => $transport_email_auth_password,
    transport_email_auth_username                      => $transport_email_auth_username,
    transport_email_enabled                            => $transport_email_enabled,
    transport_email_from_email                         => $transport_email_from_email,
    transport_email_hostname                           => $transport_email_hostname,
    transport_email_port                               => $transport_email_port,
    transport_email_subject_prefix                     => $transport_email_subject_prefix,
    transport_email_use_auth                           => $transport_email_use_auth,
    transport_email_use_ssl                            => $transport_email_use_ssl,
    transport_email_use_tls                            => $transport_email_use_tls,
    transport_email_web_interface_url                  => $transport_email_web_interface_url,
    udp_recvbuffer_sizes                               => $udp_recvbuffer_sizes,
    versionchecks_connection_request_timeout           => $versionchecks_connection_request_timeout,
    versionchecks_connect_timeout                      => $versionchecks_connect_timeout,
    versionchecks_socket_timeout                       => $versionchecks_socket_timeout,
    versionchecks                                      => $versionchecks,
    versionchecks_uri                                  => $versionchecks_uri,
  }~>
  class {'graylog2::server::service':
    service_name   => $graylog2::server::params::service_name,
    service_ensure => $service_ensure,
    service_enable => $service_enable,
  } ->
  anchor {'graylog2::server::end': }

}
