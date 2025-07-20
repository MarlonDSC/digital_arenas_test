import 'dart:async';

abstract class Hooks {
  const Hooks._();
  
  static FutureOr<void> beforeEach(String title, [List<String>? tags]) {
    // Add logic for beforeEach
  }
  
  static FutureOr<void> beforeAll() {
    // Add logic for beforeAll
  }
  
  static FutureOr<void> afterEach(
    String title,
    bool success, [
    List<String>? tags,
  ]) {
    // Add logic for afterEach
  }
  
  static FutureOr<void> afterAll() {
    // Add logic for afterAll
  }
}
