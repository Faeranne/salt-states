slack:
  pkgrepo.managed:
    - humanname: slack
    - name: deb https://packagecloud.io/slacktechnologies/slack/debian/ jessie main
    - file: /etc/apt/sources.list.d/slack.list
    - dist: jessie
    - keyid: 038651BD
    - keyserver: pgp.mit.edu
    - require_in:
      - pkg: slack-desktop
  pkg.latest:
    - name: slack-desktop
    - refresh: True
