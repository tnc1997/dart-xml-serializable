import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:test/fake.dart';

import 'fake_class_element.dart';
import 'fake_dart_object.dart';
import 'fake_interface_type.dart';
import 'fake_library_element.dart';

class FakeXmlElementDartObject extends Fake implements DartObject {
  @override
  final DartType type = FakeInterfaceType(
    element2: FakeClassElement(
      library: FakeLibraryElement(
        identifier: 'package:xml_annotation/src/annotations/xml_element.dart',
      ),
      name: 'XmlElement',
    ),
  );

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
