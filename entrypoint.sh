#!/bin/sh

export GPG_PUBLIC_KEY=$(cat /run/secrets/gpg_public_key);
export B2_ACCOUNT=$(cat /run/secrets/b2_account);
export B2_APPLICATION_KEY=$(cat /run/secrets/b2_application_key);
