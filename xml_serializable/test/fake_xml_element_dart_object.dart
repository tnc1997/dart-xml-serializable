import 'package:analyzer/dart/constant/value.dart';
import 'package:mockito/mockito.dart';

import 'fake_dart_object.dart';

class FakeXmlElementDartObject extends Fake implements DartObject {
  final String? _name;

  final String? _namespace;

  final bool? _isSelfClosing;

  final bool? _includeIfNull;

  FakeXmlElementDartObject({
    String? name,
    String? namespace,
    bool? isSelfClosing,
    bool? includeIfNull,
  })  : _name = name,
        _namespace = namespace,
        _isSelfClosing = isSelfClosing,
        _includeIfNull = includeIfNull;

  @override
  DartObject? getField(String name) {
    switch (name) {
      case 'name':
        return FakeDartObject(value: _name);
      case 'namespace':
        return FakeDartObject(value: _namespace);
      case 'isSelfClosing':
        return FakeDartObject(value: _isSelfClosing);
      case 'includeIfNull':
        return FakeDartObject(value: _includeIfNull);
      default:
        return null;
    }
  }
}
