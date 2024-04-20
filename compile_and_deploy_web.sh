#!/bin/bash
sh html_config_map.sh                              
kubectl apply -f caddy-html-configmap.yaml
kubectl rollout restart deployment/caddy-deployment
