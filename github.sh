#!/bin/bash
curl https://api.github.com/events | jq -r '.[].payload.commits[]?.message'