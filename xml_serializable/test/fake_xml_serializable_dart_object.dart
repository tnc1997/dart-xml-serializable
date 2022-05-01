import 'package:analyzer/dart/constant/value.dart';
import 'package:test/fake.dart';

import 'fake_dart_object.dart';

class FakeXmlSerializableDartObject extends Fake implements DartObject {
  final bool? _createMixin;

  FakeXmlSerializableDartObject({bool? createMixin})
      : _createMixin = createMixin;

  @override
  DartObject? getField(String name) {
    switch (name) {
      case 'createMixin':
        return FakeDartObject(value: _createMixin);
      default:
        return null;
    }
  }
}
