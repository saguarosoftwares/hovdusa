#!/bin/bash

yarn build

medusa migrations run

medusa $1
