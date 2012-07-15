salt:
  cmd.wait:
    - name: ./env/bin/pip install -r requirements.txt -q
    - user: {{ pillar['user'] }}
    - cwd: /home/{{ pillar['user'] }}/salt
    - watch:
      - file: salt
  file.managed:
    - name: /home/{{ pillar['user'] }}/salt/requirements.txt
    - source: salt://salt/requirements.txt
    - template: jinja
    - context:
      salt_version: "0.10.1"
      index_url: {{ pillar['index_url'] }}
