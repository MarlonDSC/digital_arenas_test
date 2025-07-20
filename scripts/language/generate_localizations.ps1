Write-Output "🌍 Generating localization files..."
Write-Output ""

# Generate localization extension
Write-Output "📝 Generating localization extension..."
dart run scripts/language/localization_extension_gen.dart

Write-Output ""

# Generate test localization helper
Write-Output "🧪 Generating test localization helper..."
dart run scripts/language/test_localization_helper_gen.dart

Write-Output ""
Write-Output "✨ All localization files generated successfully!"