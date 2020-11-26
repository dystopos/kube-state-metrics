#!/bin/bash
docker build --no-cache -t dystopos/kube_stat_metrics_arm .
docker push dystopos/kube_stat_metrics_arm