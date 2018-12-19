#!/bin/bash

mkdir test
git clone https://github.com/jamiecoleman92/kube-java-tutorial.git
cd kube-java-tutorial
docker pull jamielcoleman/kubejavasample:ping
docker pull jamielcoleman/kubejavasample:name


