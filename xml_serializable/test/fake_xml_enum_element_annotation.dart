import 'package:xml_annotation/xml_annotation.dart';

import 'fake_class_element.dart';
import 'fake_constructor_element.dart';
import 'fake_element_annotation.dart';
import 'fake_library_element.dart';
import 'fake_xml_enum_dart_object.dart';

class FakeXmlEnumElementAnnotation extends FakeElementAnnotation {
  FakeXmlEnumElementAnnotation({
    FieldRename? fieldRename,
  }) : super(
          element: FakeConstructorElement(
            enclosingElement: FakeClassElement(
              library: FakeLibraryElement(
                identifier:
                    'package:xml_annotation/src/annotations/xml_enum.dart',
              ),
              name: 'XmlEnum',
            ),
            library: FakeLibraryElement(
              identifier:
                  'package:xml_annotation/src/annotations/xml_enum.dart',
            ),
          ),
          value: FakeXmlEnumDartObject(
            fieldRename: fieldRename,
          ),
        );
}
