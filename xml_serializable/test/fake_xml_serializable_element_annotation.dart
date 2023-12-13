import 'package:xml_annotation/xml_annotation.dart';

import 'fake_class_element.dart';
import 'fake_constructor_element.dart';
import 'fake_element_annotation.dart';
import 'fake_library_element.dart';
import 'fake_xml_serializable_dart_object.dart';

class FakeXmlSerializableElementAnnotation extends FakeElementAnnotation {
  FakeXmlSerializableElementAnnotation({
    bool? createMixin,
    FieldRename? fieldRename,
  }) : super(
          element: FakeConstructorElement(
            enclosingElement: FakeClassElement(
              library: FakeLibraryElement(
                identifier:
                    'package:xml_annotation/src/annotations/xml_serializable.dart',
              ),
              name: 'XmlSerializable',
            ),
            library: FakeLibraryElement(
              identifier:
                  'package:xml_annotation/src/annotations/xml_serializable.dart',
            ),
          ),
          value: FakeXmlSerializableDartObject(
            createMixin: createMixin,
            fieldRename: fieldRename,
          ),
        );
}
