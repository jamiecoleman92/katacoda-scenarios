#!/bin/bash

mkdir test
git clone git@github.com:jamiecoleman92/kube-java-tutorial.git
docker pull jamielcoleman/kubejavasample:ping
docker pull jamielcoleman/kubejavasample:name
cd kube-java-tutorial


