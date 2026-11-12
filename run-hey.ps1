# Lab 1 - Step 5 load test with hey (Windows PowerShell).
# Equivalent to the slide command:
#   hey -z 60s -c 50 -m POST -T application/json -d '{"instances": [[5.1,3.5,1.4,0.2]]}' http://localhost:8080/predict
# The JSON body is read from payload.json (-D) to avoid PowerShell quote-stripping.
# Requires: kubectl port-forward svc/iris-api 8080:80  (running in another terminal)
param([string]$Duration = "60s", [int]$Concurrency = 50)

$hey = Join-Path $PSScriptRoot "bin\hey.exe"
& $hey -z $Duration -c $Concurrency -m POST -T application/json `
    -D (Join-Path $PSScriptRoot "payload.json") `
    http://localhost:8080/predict
