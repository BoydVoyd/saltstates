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

{% for user, data in pillar.get('admin_users', {}).items() %}
user_{{user}}:
  user.present:
    - name: {{ user }}
    - fullname: {{data['fullname']}}
    - shell: {{data['shell']}}
    - home: {{data['home']}}
    - uid: {{data['uid']}}
    - gid_from_name: {{data['gid_from_name']}}
    - groups: {{data['groups']}}

{{ user }}_key:
  ssh_auth.present:
    - name: {{ data['ssh_key']}}
    - user: {{ user }}

  