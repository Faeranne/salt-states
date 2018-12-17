base:
  '*':
    - users
    - development
    - dotfiles
  'roles:desktop':
    - match: grain
    - keybase
    - slack
    - yubikey
    - kubuntu
  'roles:laptop':
    - match: grain
    - keybase
    - slack
    - yubikey
    - gnome
  'roles:gaming':
    - match: grain
    - games
    - discord
  'roles:streaming':
    - match: grain
    - obs
  'manufacturer:System76':
    - match: grain
    - system76
