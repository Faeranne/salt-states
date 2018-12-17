{% set roles = grains.get('roles',[]) %}
blixa:
  group.present:
    - gid: 1000
  user.present:
    - fullname: Blixa Morgan
    - shell: /usr/bin/zsh
    - home: /home/blixa
    - uid: 1000
    - gid: 1000
    - groups:
      - adm
      - sudo
      {% if 'desktop' in roles %}
      - plugdev
      - dialout
      {% endif %}
    - optional_groups:
      - sambashare
      - docker
    - password: {{ pillar['password'] }}
