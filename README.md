<p align="left">
  <a href="https://github.com/slashpai/ansible-prometheus-msteams/actions?query=workflow%3Aansible-lint"><img alt="ansible-lint status" src="https://github.com/slashpai/ansible-prometheus-msteams/workflows/ansible%20lint/badge.svg"></a>
</p>

ansible-prometheus-msteams
=========

To install and configure [prometheus-msteams](https://github.com/prometheus-msteams/prometheus-msteams).

Requirements
------------

* Ansible >= 2.9

Role Variables
--------------

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

Dependencies
------------

Nil

Example Playbook
----------------

This role is not released in galaxy yet to utilze this role, you can add this repo as a git submodule

```bash
git submodule add git@github.com:slashpai/ansible-prometheus-msteams.git roles/prometheus-msteams
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

License
-------

MIT
