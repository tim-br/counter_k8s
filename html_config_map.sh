#!/bin/bash

# Define paths to your files
HTML_FILE="./web/index.html"
CSS_FILE="./web/css/style.css"
JS_FILE="./web/js/script.js"

# Output to ConfigMap YAML file
cat <<EOF > caddy-html-configmap.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: caddy-html
data:
  index.html: |
$(sed 's/^/    /' $HTML_FILE)
  style.css: |
$(sed 's/^/    /' $CSS_FILE)
  script.js: |
$(sed 's/^/    /' $JS_FILE)
EOF

echo "ConfigMap YAML has been generated: caddy-html-configmap.yaml"
