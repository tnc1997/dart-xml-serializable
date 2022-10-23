import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:test/fake.dart';

import 'fake_class_element.dart';
import 'fake_dart_object.dart';
import 'fake_interface_type.dart';
import 'fake_library_element.dart';

class FakeXmlValueDartObject extends Fake implements DartObject {
  @override
  final DartType type = FakeInterfaceType(
    element2: FakeClassElement(
      library: FakeLibraryElement(
        identifier: 'package:xml_annotation/src/annotations/xml_value.dart',
      ),
      name: 'XmlValue',
    ),
  );

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
