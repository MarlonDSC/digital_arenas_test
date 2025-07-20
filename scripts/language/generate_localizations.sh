#!/bin/bash

echo "🌍 Generating localization files..."
echo ""

# Generate localization extension
echo "📝 Generating localization extension..."
dart run localization_extension_gen.dart

echo ""

# Generate test localization helper
echo "🧪 Generating test localization helper..."
dart run test_localization_helper_gen.dart

echo ""
echo "✨ All localization files generated successfully!"