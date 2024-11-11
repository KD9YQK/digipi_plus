#!/bin/bash
echo "Building Services..."
sleep 1

if [ -f saves/plus.uhf ]; then
    python3 helper.py uhf-node
    python3 helper.py uhf-tnc
fi

if [ -f saves/plus.pcsi ]; then
    python3 helper.py 'pcsi'
fi

if [ -f saves/plus.openwebrx ]; then
    python3 helper.py 'openwebrx-digipi'
fi

if [ -f saves/plus.sdr_igate ]; then
    python3 helper.py 'rtlsdr-igate'
fi

if [ -f saves/plus.xastir ]; then
    python3 helper.py 'xastir'
fi
