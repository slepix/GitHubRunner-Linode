#cloud-config
package_update: true
packages:
  - jq

users:
  - name: gitrunner
    shell: /bin/bash
    groups:
      - sudo
    sudo:
      - ALL=(ALL) NOPASSWD:ALL

runcmd:
  - export RUNNER_CFG_PAT=${githubpat}
  - su gitrunner -c "cd /home/gitrunner && curl -s https://raw.githubusercontent.com/actions/runner/main/scripts/create-latest-svc.sh | bash -s ${githubuser}/${githubrepo}" 