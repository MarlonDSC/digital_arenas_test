#!/bin/bash

# Generate mocks from the root folder
echo "Generating mocks..."
dart run build_runner build --delete-conflicting-outputs

echo "Mocks generated successfully!" 