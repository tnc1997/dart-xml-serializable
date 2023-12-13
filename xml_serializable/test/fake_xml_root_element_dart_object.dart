import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:test/fake.dart';

import 'fake_class_element.dart';
import 'fake_dart_object.dart';
import 'fake_interface_type.dart';
import 'fake_library_element.dart';

class FakeXmlRootElementDartObject extends Fake implements DartObject {
  @override
  final DartType type = FakeInterfaceType(
    element: FakeClassElement(
      library: FakeLibraryElement(
        identifier:
            'package:xml_annotation/src/annotations/xml_root_element.dart',
      ),
      name: 'XmlRootElement',
    ),
  );

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
