import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:test/fake.dart';

import 'fake_class_element.dart';
import 'fake_dart_object.dart';
import 'fake_enum_class_element.dart';
import 'fake_interface_type.dart';
import 'fake_library_element.dart';

class FakeXmlValueDartObject extends Fake implements DartObject {
  FakeXmlValueDartObject({String? name}) : _name = name;

  final String? _name;

  @override
  bool isNull = false;

  @override
  DartType? get type {
    return FakeInterfaceType(
      element2: FakeClassElement(
        library: FakeLibraryElement(
          identifier: 'package:xml_annotation/src/annotations/xml_value.dart',
        ),
        name: 'XmlValue',
      ),
    );
  }

  @override
  DartObject? getField(String name) {
    switch (name) {
      case 'name':
        return FakeDartObject(value: _name);
      case 'value':
        return FakeDartObject(value: _name);
      default:
        return null;
    }
  }
}
