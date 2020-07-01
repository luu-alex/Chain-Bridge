#!/usr/bin/env bash
# Copyright 2020 ChainSafe Systems
# SPDX-License-Identifier: LGPL-3.0-only


# Exit on failure
set -ex

PORT=${PORT:-8545}

echo "Running celo-ganache..."
if [[ $SILENT ]]; then
    celo-ganache -q --blockTime 1 -p $PORT --account "0x000000000000000000000000000000000000000000000000000000616c696365,100000000000000000000" --account "0x0000000000000000000000000000000000000000000000000000000000626f62,100000000000000000000" --account "0x00000000000000000000000000000000000000000000000000636861726c6965,100000000000000000000"  --account "0x0000000000000000000000000000000000000000000000000000000064617665,100000000000000000000" --account "0x0000000000000000000000000000000000000000000000000000000000657665,100000000000000000000" &
    # Otherwise CI will run tests before ganache has started
    sleep 3
else
    celo-ganache --blockTime 1 -p $PORT --account "0x000000000000000000000000000000000000000000000000000000616c696365,100000000000000000000" --account "0x0000000000000000000000000000000000000000000000000000000000626f62,100000000000000000000" --account "0x00000000000000000000000000000000000000000000000000636861726c6965,100000000000000000000"  --account "0x0000000000000000000000000000000000000000000000000000000064617665,100000000000000000000" --account "0x0000000000000000000000000000000000000000000000000000000000657665,100000000000000000000"
fi