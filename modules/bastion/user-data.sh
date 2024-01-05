#!/bin/bash

echo "${ssh_private_key}" >> ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
