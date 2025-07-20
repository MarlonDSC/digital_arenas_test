#!/bin/bash

# Load environment variables
if [ -f .env ]; then
    export $(cat .env | grep -v '#' | sed 's/\r$//' | xargs)
else
    echo "Error: .env file not found"
    exit 1
fi

# Build the test APKs
patrol build android --target integration_test/features/auth/sign_up/sign_up_test.dart

# Run the tests on Firebase Test Lab
gcloud firebase test android run \
    --type instrumentation \
    --use-orchestrator \
    --app build/app/outputs/apk/debug/app-debug.apk \
    --test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk \
    --timeout "${TEST_TIMEOUT}" \
    --device "${ANDROID_DEVICE_1}" \
    --device "${ANDROID_DEVICE_2}" \
    --record-video \
    --environment-variables clearPackageData=true 