#!/bin/bash

npm run build

medusa migrations run

medusa $1