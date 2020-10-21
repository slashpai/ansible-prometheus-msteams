# Ansible role prometheus-msteams

[![ansible lint](https://github.com/slashpai/ansible-prometheus-msteams/workflows/ansible%20lint/badge.svg)](https://github.com/slashpai/ansible-prometheus-msteams/actions?query=workflow%3Aansible-lint)

## ansible-prometheus-msteams

To install and configure [prometheus-msteams](https://github.com/prometheus-msteams/prometheus-msteams) for sending notifications from [alertmanager](https://prometheus.io/docs/alerting/latest/alertmanager/) to [microsoft teams](https://www.microsoft.com/en-in/microsoft-365/microsoft-teams/group-chat-software)

## Synopsis

This role was created to install and configure [prometheus-msteams](https://github.com/prometheus-msteams/prometheus-msteams) when I figured out there is no direct way we can use [microsoft teams](https://www.microsoft.com/en-in/microsoft-365/microsoft-teams/group-chat-software) as receiver in [alertmanager config](https://prometheus.io/docs/alerting/latest/configuration/). I didn't find any existing ansible role for this thats how this role was created. This role is created inspired by [ansible-node-exporter](https://github.com/cloudalchemy/ansible-node-exporter)

## Requirements

* Ansible >= 2.9 (Earlier versions may work, but I haven't tested)

## Role Variables

All variables in [default/main.yml](defaults/main.yml) can be overrided

| Name           | Default Value | Description                        |
| -------------- | ------------- | -----------------------------------|
| `prometheus_msteams_version`| 1.4.1| prometheus-msteams version to install|
| `prometheus_msteams_binary_local_dir`| ""| To allow to use local packages from controller machine instead of github packages|
|`prometheus_msteams_template_local_dir`| ""| To allow to use local teams card template on controller machine than from github|
|`prometheus_msteams_config_dir`| "/etc/prometheus_msteams"| Location to store configs |
|`prometheus_msteams_web_listen_address`| "0.0.0.0:2000"| prometheus_msteams listen addrress|
|`prometheus_msteams_request_uri`| "alertmanager" | teams-request-uri |
|`prometheus_msteams_channels`| [] | Channels to which alerts to send from alert manager|

## Dependencies

**Nil**

## Example Playbook

This role is not released in galaxy yet to utilze this role, you can add this repo as a git submodule

```bash
git submodule add -b main https://github.com/slashpai/ansible-prometheus-msteams.git roles/prometheus-msteams
```

```yaml
- hosts: all
  roles:
    - prometheus-msteams
```

To get role updates

```bash
git submodule update --remote
```

Example [playbook](https://github.com/slashpai/msteams_ansible)

## Contributing

**TODO:** To be updated

## License

[MIT](LICENCE)
