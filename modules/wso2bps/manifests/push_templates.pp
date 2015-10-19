define wso2bps::push_templates ($directory, $target, $owner, $group) {
  file { "${target}/repository/${name}":
    ensure  => present,
    owner   => $owner,
    group   => $group,
    mode    => '0755',
    content => template("${directory}/${name}.erb"),
  }
}
