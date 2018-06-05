user_hiro:
  user.present:
    - name: hiro
    - fullname: Hiro Protagonist
    - shell: /bin/bash
    - home: /home/hiro
    - uid: 10000
    - gid_from_name: True

hiro_key:
  ssh_auth.present:
    - name: hiro
    - user: hiro
    - source: salt://user/keys/hiro_rsa.pub