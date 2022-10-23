import 'fake_class_element.dart';
import 'fake_constructor_element.dart';
import 'fake_element_annotation.dart';
import 'fake_library_element.dart';
import 'fake_xml_value_dart_object.dart';

class FakeXmlValueElementAnnotation extends FakeElementAnnotation {
  FakeXmlValueElementAnnotation(String value)
      : super(
          element: FakeConstructorElement(
            enclosingElement3: FakeClassElement(
              library: FakeLibraryElement(
                identifier:
                    'package:xml_annotation/src/annotations/xml_value.dart',
              ),
              name: 'XmlValue',
            ),
            library: FakeLibraryElement(
              identifier:
                  'package:xml_annotation/src/annotations/xml_value.dart',
            ),
          ),
          value: FakeXmlValueDartObject(value),
        );
}
