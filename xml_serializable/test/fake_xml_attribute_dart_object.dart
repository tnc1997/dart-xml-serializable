import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:test/fake.dart';

import 'fake_class_element.dart';
import 'fake_dart_object.dart';
import 'fake_interface_type.dart';
import 'fake_library_element.dart';

class FakeXmlAttributeDartObject extends Fake implements DartObject {
  @override
  final DartType type = FakeInterfaceType(
    element2: FakeClassElement(
      library: FakeLibraryElement(
        identifier: 'package:xml_annotation/src/annotations/xml_attribute.dart',
      ),
      name: 'XmlAttribute',
    ),
  );

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
