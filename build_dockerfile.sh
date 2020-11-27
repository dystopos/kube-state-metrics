#!/bin/bash
docker build --no-cache -t dystopos/kube_stat_metrics_arm:2.1 .
docker push dystopos/kube_stat_metrics_arm:2.1