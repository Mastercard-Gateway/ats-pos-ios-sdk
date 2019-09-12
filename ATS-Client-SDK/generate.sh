#!/bin/sh

if which sourcery >/dev/null; then
    # Domain Generation
#    ( cd ATS-Client-SDK/Domain && sourcery )
    sourcery --config DomainObjects.sourcery.yml
    # Mock Generation
#    ( cd ATS-Client-SDKTests/Mocks && sourcery)
    sourcery --config Mocks.sourcery.yml

else
    echo "warning: Sourcery not installed, download from https://github.com/krzysztofzablocki/Sourcery"
fi
