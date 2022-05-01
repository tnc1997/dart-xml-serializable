import 'package:analyzer/dart/constant/value.dart';
import 'package:test/fake.dart';

import 'fake_dart_object.dart';

class FakeXmlAttributeDartObject extends Fake implements DartObject {
  final String? _name;

  final String? _namespace;

  FakeXmlAttributeDartObject({
    String? name,
    String? namespace,
  })  : _name = name,
        _namespace = namespace;

  @override
  DartObject? getField(String name) {
    switch (name) {
      case 'name':
        return FakeDartObject(value: _name);
      case 'namespace':
        return FakeDartObject(value: _namespace);
      default:
        return null;
    }
  }
}
