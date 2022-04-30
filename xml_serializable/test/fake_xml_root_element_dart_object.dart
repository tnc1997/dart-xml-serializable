import 'package:analyzer/dart/constant/value.dart';
import 'package:mockito/mockito.dart';

import 'fake_dart_object.dart';

class FakeXmlRootElementDartObject extends Fake implements DartObject {
  final String? _name;

  final String? _namespace;

  final bool? _isSelfClosing;

  FakeXmlRootElementDartObject({
    String? name,
    String? namespace,
    bool? isSelfClosing,
  })  : _name = name,
        _namespace = namespace,
        _isSelfClosing = isSelfClosing;

  @override
  DartObject? getField(String name) {
    switch (name) {
      case 'name':
        return FakeDartObject(value: _name);
      case 'namespace':
        return FakeDartObject(value: _namespace);
      case 'isSelfClosing':
        return FakeDartObject(value: _isSelfClosing);
      default:
        return null;
    }
  }
}
