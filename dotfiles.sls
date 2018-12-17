dot-files:
  git.latest:
    - name: git@github.com:mrmakeit/dotfiles.git
    - target: /home/blixa/.dotfiles/
    - user: blixa
rcm:
  pkg:
    - installed
rcup:
  cmd.run:
    - user: blixa
    - onchanges:
      - git: git@github.com:mrmakeit/dotfiles.git
      - pkg: rcm
    - require:
      - pkg: rcm
