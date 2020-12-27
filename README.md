# Ansible role prometheus-msteams

[![build](https://github.com/slashpai/ansible-prometheus-msteams/workflows/build/badge.svg)](https://github.com/slashpai/ansible-prometheus-msteams/actions?query=workflow%3Abuild)
[![markdown links](https://github.com/slashpai/ansible-prometheus-msteams/workflows/md-links/badge.svg)](https://github.com/slashpai/ansible-prometheus-msteams/actions?query=workflow%3AMD-links)
[![Ansible Role](https://img.shields.io/badge/ansible%20role-slashpai.ansible_prometheus_msteams-purple.svg)](https://galaxy.ansible.com/slashpai/ansible_prometheus_msteams)
[![GitHub tag](https://img.shields.io/github/v/tag/slashpai/ansible-prometheus-msteams.svg?sort=semver)](https://github.com/slashpai/ansible-prometheus-msteams/tags)

## ansible-prometheus-msteams

To install and configure [prometheus-msteams](https://github.com/prometheus-msteams/prometheus-msteams) for sending notifications from [alertmanager](https://prometheus.io/docs/alerting/latest/alertmanager/) to [microsoft teams](https://www.microsoft.com/en-in/microsoft-365/microsoft-teams/group-chat-software)

## Synopsis

This role was created to install and configure [prometheus-msteams](https://github.com/prometheus-msteams/prometheus-msteams) when I figured out there is no direct way we can use [microsoft teams](https://www.microsoft.com/en-in/microsoft-365/microsoft-teams/group-chat-software) as receiver in [alertmanager config](https://prometheus.io/docs/alerting/latest/configuration/). I didn't find any existing ansible role for this thats how this role was created. This role is inspired from [ansible-node-exporter](https://github.com/cloudalchemy/ansible-node-exporter).

## Requirements

* Ansible >= 2.9 (Earlier versions may work, but I haven't tested)

## Role Variables

All variables in [default/main.yml](defaults/main.yml) can be overrided

| Name           | Default Value | Description                        |
| -------------- | ------------- | -----------------------------------|
|`prometheus_msteams_version`| latest| prometheus-msteams version to install|
|`prometheus_msteams_binary_local_dir`| ""| To allow to use local packages from controller machine instead of github packages|
|`prometheus_msteams_template_local_dir`| ""| To allow to use local teams card template on controller machine than from github|
|`prometheus_msteams_config_dir`| "/etc/prometheus_msteams"| Location to store server configs |
|`prometheus_msteams_web_listen_address`| "0.0.0.0:2000"| prometheus_msteams listen addrress|
|`prometheus_msteams_request_uri`| "alertmanager" | teams-request-uri |
|`prometheus_msteams_channels`| [] | Channels to which alerts to send from alert manager|

## Dependencies

Nil

## Usage

### From galaxy

```python
ansible-galaxy install slashpai.ansible_prometheus_msteams
```

### git submodule

To add as submodule to your project instead of pulling from galaxy

```bash
git submodule add -b main https://github.com/slashpai/ansible-prometheus-msteams.git roles/prometheus-msteams
```

To get role updates

```bash
git submodule update --remote
```

## Example Playbook

```yaml
- hosts: all
  roles:
    - slashpai.ansible_prometheus_msteams
```

Example [playbook](https://github.com/slashpai/ansible_playbooks/tree/main/msteams_ansible) using git submodule

## Contributing

* Fork the project on GitHub
* Clone the project
* Add changes (and tests)
* Commit and push
* Create a pull request

## TODO

* Add tests for ubuntu and figure out which inspec version to use due to licencing difference

## License

[MIT](LICENSE)
