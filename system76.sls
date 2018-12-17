system76:
  pkgrepo.managed:
    - ppa: system76-dev/stable
    - require_in:
      - pkg: system76-driver
  pkg.latest:
    - name: system76-driver
    - refresh: True
