import 'fake_class_element.dart';
import 'fake_constructor_element.dart';
import 'fake_element_annotation.dart';
import 'fake_library_element.dart';
import 'fake_xml_value_dart_object.dart';

class FakeXmlValueAnnotation extends FakeElementAnnotation {
  FakeXmlValueAnnotation(String name)
      : super(
          element: FakeConstructorElement(
            FakeClassElement(
              library: FakeLibraryElement(
                identifier:
                    'package:xml_annotation/src/annotations/xml_value.dart',
              ),
              name: 'XmlValue',
            ),
            FakeLibraryElement(
              identifier:
                  'package:xml_annotation/src/annotations/xml_value.dart',
            ),
          ),
          value: FakeXmlValueDartObject(name: name),
        );
}
