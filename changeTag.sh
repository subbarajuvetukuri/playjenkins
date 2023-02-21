#!/bin/bash
sed "s/tagVersion/$BUILD_NUMBER/g" myweb.yaml > myweb.yaml
