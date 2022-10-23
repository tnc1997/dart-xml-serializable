import 'package:analyzer/dart/constant/value.dart';
import 'package:test/fake.dart';

import 'fake_dart_object.dart';

class FakeXmlValueDartObject extends Fake implements DartObject {
  final String? _value;

  FakeXmlValueDartObject(String value) : _value = value;

  @override
  DartObject? getField(String name) {
    switch (name) {
      case 'value':
        return FakeDartObject(value: _value);
      default:
        return null;
    }
  }
}
