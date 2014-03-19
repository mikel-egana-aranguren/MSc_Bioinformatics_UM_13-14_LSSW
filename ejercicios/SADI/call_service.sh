#!/bin/sh

curl -s -H Content-Type:text/turtle -H Accept:text/turtle  -X POST --data-binary @exampleInput.ttl http://localhost:9090/