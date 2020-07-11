#!/bin/sh
cp -rf ../VFatumbot/* VFatumbot/ && az acr build --registry fatumbot --image fatumbot .
