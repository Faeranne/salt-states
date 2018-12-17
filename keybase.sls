keybase:
  pkgrepo.managed:
    - humanname: Keybase.io
    - name: deb http://prerelease.keybase.io/deb stable main
    - file: /etc/apt/sources.list.d/keybase.list
    - dist: stable
    - keyid: 656D16C7
    - keyserver: pgp.mit.edu
    - require_in:
      - pkg: keybase
  pkg.latest:
    - name: keybase
    - refresh: True
{% if not salt['file.directory_exists']('/home/blixa/.password-store') %}
provision:
  file.managed:
    - name: /home/blixa/provision.sh
    - source: https://gist.githubusercontent.com/mrmakeit/fcb9d4dccc1de8a5f4b561809552810b/raw
    - source_hash: 5cd7437e80d869afcfb1f47b72a79e9ba84d09e47227c5bdadaaaa77952bac14
    - user: blixa
    - group: blixa
    - mode: 0700
{% endif %}
