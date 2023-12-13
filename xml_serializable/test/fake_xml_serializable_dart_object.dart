import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:test/fake.dart';
import 'package:xml_annotation/xml_annotation.dart';

import 'fake_class_element.dart';
import 'fake_dart_object.dart';
import 'fake_field_rename_dart_object.dart';
import 'fake_interface_type.dart';
import 'fake_library_element.dart';

class FakeXmlSerializableDartObject extends Fake implements DartObject {
  @override
  final DartType type = FakeInterfaceType(
    element: FakeClassElement(
      library: FakeLibraryElement(
        identifier:
            'package:xml_annotation/src/annotations/xml_serializable.dart',
      ),
      name: 'XmlSerializable',
    ),
  );

  final bool? _createMixin;

  final FieldRename? _fieldRename;

  FakeXmlSerializableDartObject({
    bool? createMixin,
    FieldRename? fieldRename,
  })  : _createMixin = createMixin,
        _fieldRename = fieldRename;

  @override
  DartObject? getField(String name) {
    switch (name) {
      case 'createMixin':
        return FakeDartObject(value: _createMixin);
      case 'fieldRename':
        return FakeFieldRenameDartObject(
          index: _fieldRename?.index,
          name: _fieldRename?.name,
        );
      default:
        return null;
    }
  }
}
