#!/bin/bash
set -ueo pipefail

docker build --tag "implicix-dotnet8" .
