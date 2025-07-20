part of '../fixture_helper.dart';


///
/// Example:
/// 
/// JsonReader().decode(JsonReader.validGenerateTokenDto);
class JsonReader implements Fixture<Map<String, dynamic>> {
  static const String validGenerateTokenDto = 'generate_token_dto/valid.json';
  static const String validGenerateToken = 'generate_token/valid.json';
  static const String loginUserDtoValid = 'login_user_dto/valid.json';

  @override
  Map<String, dynamic> decode(String fileName) {
    final jsonString = _fixtureString('/file/json/$fileName');
    return json.decode(jsonString) as Map<String, dynamic>;
  }
}