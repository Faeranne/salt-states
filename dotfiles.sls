dot-files:
  git.latest:
    - name: git@github.com:mrmakeit/dotfiles.git
    - target: /home/blixa/.dotfiles/
    - user: blixa
rcm:
  pkgrepo.managed:
    - humanname: thoughtbot
    - name: deb https://apt.thoughtbot.com/debian/ stable main
    - file: /etc/apt/sources.list.d/keybase.list
    - dist: stable
    - keyid: BE7FEF18
    - keyserver: keys.gnupg.net
    - require_in:
      - pkg: rcm
  pkg.latest:
    - name: rcm 
    - refresh: True

rcup:
  cmd.run:
    - user: blixa
    - onchanges:
      - git: git@github.com:mrmakeit/dotfiles.git
      - pkg: rcm
    - require:
      - pkg: rcm
