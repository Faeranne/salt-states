{% set packages=pillar.get("packages",{}) %}
{% set versions=packages.get("versions",{}) %}
{% set sources=packages.get("sources",{}) %}
tmux:
  pkg.installed

git:
  pkg.installed

vim:
  pkg.installed

zsh:
  pkg.installed

ca-certificates:
  pkg.installed

xclip:
  pkg.installed

keybase:
  pkgrepo.managed:
    - humanname: thoughtbot
    - name: deb https://apt.thoughtbot.com/debian/ stable main
    - file: /etc/apt/sources.list.d/keybase.list
    - dist: stable
    - keyid: BE7FEF18
    - keyserver: pgp.mit.edu
    - require_in:
      - pkg: rcm
  pkg.latest:
    - name: rcm 
    - refresh: True

/usr/bin/ffsend:
  file.managed:
    - source: https://github.com/timvisee/ffsend/releases/download/v{{ versions.get("ffsend","") }}/ffsend-v{{ versions.get("ffsend","") }}-linux-x64-static
    - user: root
    - group: root
    - mode: 755
    - source_hash: {{ sources.get("ffsend","") }}

/var/salt-versions:
  file.directory:
    - user: root
    - group: root
    - mode: 755

/tmp/exa:
  archive.extracted:
    - source: https://github.com/ogham/exa/releases/download/v{{ versions.get("exa","") }}/exa-linux-x86_64-{{ versions.get("exa","") }}.zip
    - source_hash: {{ sources.get("exa","") }}
    - enforce_toplevel: false
    - onchanges:
      - file: exa-version

exa-version:
  file.managed:
    - name: /var/salt-versions/exa-{{ versions.get("exa","") }}
    - replace: false
    - require:
      - file: /var/salt-versions

/usr/bin/exa:
  file.managed:
    - source: /tmp/exa/exa-linux-x86_64
    - user: root
    - group: root
    - mode: 755
    - onchanges:
      - archive: /tmp/exa
