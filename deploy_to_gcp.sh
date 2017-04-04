#!/bin/bash

set -e

date=$(date "+%Y%m%d%H%M")
cluster_name="codeship-gcloud-test-${date}"
#IMAGE=gcr.io/projectp-162904/alpine
PROJECT=projectp-162904
DEFAULT_ZONE=us-central1-a

# Authenticate with the Google Services
codeship_google authenticate

# Set the default zone to use
gcloud config set compute/zone $DEFAULT_ZONE
gcloud config set project $PROJECT

# Starting an Instance in Google Compute Engine
gcloud compute instances create testmachine

# Stopping an Instance in Google Compute Engine
gcloud compute instances delete testmachine -q


#echo "Starting a small cluster with a single instance"
#gcloud container clusters create "${cluster_name}" \
#  --num-nodes 1 \
#  --machine-type g1-small
#
#echo "Shutting everything down again"
##gcloud container clusters delete "${cluster_name}" -q
#
#
#gcloud docker -- pull gcr.io/projectp-162904/alpine:latest
