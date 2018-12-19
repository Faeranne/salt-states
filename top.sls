base:
  '*':
    - users
    - development
    - dotfiles
    - packages
  'roles:desktop':
    - match: grain
    - keybase
    - slack
    - pass
    - yubikey
    - kubuntu
  'roles:laptop':
    - match: grain
    - keybase
    - slack
    - pass
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
