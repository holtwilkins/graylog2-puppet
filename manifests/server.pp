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
  $package_version            = $graylog2::server::params::package_version,
  $manage_service_ensure      = $graylog2::server::params::manage_service_ensure,
  $manage_service_enable      = $graylog2::server::params::manage_service_enable,
  $config_file   = $graylog2::server::params::config_file,
  $daemon_username            = $graylog2::server::params::daemon_username,
  $run           = $graylog2::server::params::run,
  $is_master     = $graylog2::server::params::is_master,
  $node_id_file  = $graylog2::server::params::node_id_file,
  $password_secret            = undef,
  $root_username = $graylog2::server::params::root_username,
  $root_password_sha2         = $graylog2::server::params::root_password_sha2,
  $plugin_dir                 = $graylog2::server::params::plugin_dir,
  $rest_listen_uri            = $graylog2::server::params::rest_listen_uri,
  $rest_transport_uri         = undef,
  $rest_enable_cors           = undef,
  $elasticsearch_config_file  = undef,
  $elasticsearch_max_docs_per_index            = $graylog2::server::params::elasticsearch_max_docs_per_index,
  $elasticsearch_max_number_of_indices         = $graylog2::server::params::elasticsearch_max_number_of_indices,
  $retention_strategy         = $graylog2::server::params::retention_strategy,
  $elasticsearch_shards       = $graylog2::server::params::elasticsearch_shards,
  $elasticsearch_replicas     = $graylog2::server::params::elasticsearch_replicas,
  $elasticsearch_index_prefix = $graylog2::server::params::elasticsearch_index_prefix,
  $allow_leading_wildcard_searches             = $graylog2::server::params::allow_leading_wildcard_searches,
  $elasticsearch_analyzer     = $graylog2::server::params::elasticsearch_analyzer,
  $elasticsearch_transport_tcp_port = undef,
  $elasticsearch_network_host = undef,
  $elasticsearch_discovery_zen_ping_multicast_enabled = undef,
  $elasticsearch_discovery_zen_ping_unicast_hosts = undef,
  $output_batch_size          = $graylog2::server::params::output_batch_size,
  $processbuffer_processors   = $graylog2::server::params::processbuffer_processors,
  $outputbuffer_processors    = $graylog2::server::params::outputbuffer_processors,
  $processor_wait_strategy    = $graylog2::server::params::processor_wait_strategy,
  $ring_size     = $graylog2::server::params::ring_size,
  $mongodb_useauth            = $graylog2::server::params::mongodb_useauth,
  $mongodb_user  = undef,
  $mongodb_password           = undef,
  $mongodb_host  = $graylog2::server::params::mongodb_host,
  $mongodb_replica_set        = undef,
  $mongodb_database           = $graylog2::server::params::mongodb_database,
  $mongodb_port  = $graylog2::server::params::mongodb_port,
  $mongodb_max_connections    = $graylog2::server::params::mongodb_max_connections,
  $mongodb_threads_allowed_to_block_multiplier = $graylog2::server::params::mongodb_threads_allowed_to_block_multiplier,
  $transport_email_enabled    = $graylog2::server::params::transport_email_enabled,
  $transport_email_hostname   = $graylog2::server::params::transport_email_hostname,
  $transport_email_port       = $graylog2::server::params::transport_email_port,
  $transport_email_use_auth   = $graylog2::server::params::transport_email_use_auth,
  $transport_email_use_tls    = $graylog2::server::params::transport_email_use_tls,
  $transport_email_use_ssl    = $graylog2::server::params::transport_email_use_ssl,
  $transport_email_auth_username               = $graylog2::server::params::transport_email_auth_username,
  $transport_email_auth_password               = $graylog2::server::params::transport_email_auth_password,
  $transport_email_subject_prefix              = $graylog2::server::params::transport_email_subject_prefix,
  $transport_email_from_email = $graylog2::server::params::transport_email_from_email,
) inherits graylog2::server::params {

  anchor {'graylog2::server::start': }->
  class {'graylog2::server::package':
    package      => $graylog2::server::params::package_name,
    version      => $package_version,
  } ->
  class {'graylog2::server::configure':
    config_file                         => $config_file,
    daemon_username                     => $daemon_username,
    run                                 => $run,
    is_master                           => $is_master,
    node_id_file                        => $node_id_file,
    password_secret                     => $password_secret,
    root_username                       => $root_username,
    root_password_sha2                  => $root_password_sha2,
    plugin_dir                          => $plugin_dir,
    rest_listen_uri                     => $rest_listen_uri,
    rest_transport_uri                  => $rest_transport_uri,
    rest_enable_cors                    => $rest_enable_cors,
    elasticsearch_config_file           => $elasticsearch_config_file,
    elasticsearch_max_docs_per_index    => $elasticsearch_max_docs_per_index,
    elasticsearch_max_number_of_indices => $elasticsearch_max_number_of_indices,
    retention_strategy                  => $retention_strategy,
    elasticsearch_shards                => $elasticsearch_shards,
    elasticsearch_replicas              => $elasticsearch_replicas,
    elasticsearch_index_prefix          => $elasticsearch_index_prefix,
    allow_leading_wildcard_searches     => $allow_leading_wildcard_searches,
    elasticsearch_analyzer              => $elasticsearch_analyzer,
    elasticsearch_transport_tcp_port => $elasticsearch_transport_tcp_port,
    elasticsearch_network_host          => $elasticsearch_network_host,
    elasticsearch_discovery_zen_ping_multicast_enabled => $elasticsearch_discovery_zen_ping_multicast_enabled,
    elasticsearch_discovery_zen_ping_unicast_hosts => $elasticsearch_discovery_zen_ping_unicast_hosts,
    output_batch_size                   => $output_batch_size,
    processbuffer_processors            => $processbuffer_processors,
    outputbuffer_processors             => $outputbuffer_processors,
    processor_wait_strategy             => $processor_wait_strategy,
    ring_size                           => $ring_size,
    mongodb_useauth                     => $mongodb_useauth,
    mongodb_user                        => $mongodb_user,
    mongodb_password                    => $mongodb_password,
    mongodb_host                        => $mongodb_host,
    mongodb_replica_set                 => $mongodb_replica_set,
    mongodb_database                    => $mongodb_database,
    mongodb_port                        => $mongodb_port,
    mongodb_max_connections             => $mongodb_max_connections,
    mongodb_threads_allowed_to_block_multiplier => $mongodb_threads_allowed_to_block_multiplier,
    transport_email_enabled             => $transport_email_enabled,
    transport_email_hostname            => $transport_email_hostname,
    transport_email_port                => $transport_email_port,
    transport_email_use_auth            => $transport_email_use_auth,
    transport_email_use_tls             => $transport_email_use_tls,
    transport_email_use_ssl             => $transport_email_use_ssl,
    transport_email_auth_username       => $transport_email_auth_username,
    transport_email_auth_password       => $transport_email_auth_password,
    transport_email_subject_prefix      => $transport_email_subject_prefix,
    transport_email_from_email          => $transport_email_from_email,
  }~>
  class {'graylog2::server::service':
    service_name          => $graylog2::server::params::service_name,
    manage_service_ensure => $manage_service_ensure,
    manage_service_enable => $manage_service_enable,
  } ->
  anchor {'graylog2::server::end': }

}
