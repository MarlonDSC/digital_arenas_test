#!/bin/bash

# Load environment variables
if [ -f .env ]; then
    export $(cat .env | grep -v '#' | sed 's/\r$//' | xargs)
else
    echo "Error: .env file not found"
    exit 1
fi

# Build the test apps
patrol build ios --target integration_test/features/auth/sign_up/sign_up_test.dart --release

# Create a zip archive of the test files
pushd build/ios_integ/Build/Products
zip -r ios_tests.zip Release-iphoneos Runner_iphoneos*.xctestrun
popd

# Run the tests on Firebase Test Lab
gcloud firebase test ios run \
    --test build/ios_integ/Build/Products/ios_tests.zip \
    --device "${IOS_DEVICE_1}" \
    --device "${IOS_DEVICE_2}" \
    --timeout "${TEST_TIMEOUT}" 