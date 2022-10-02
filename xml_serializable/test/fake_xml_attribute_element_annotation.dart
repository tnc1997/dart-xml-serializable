import 'fake_class_element.dart';
import 'fake_constructor_element.dart';
import 'fake_element_annotation.dart';
import 'fake_library_element.dart';
import 'fake_xml_attribute_dart_object.dart';

class FakeXmlAttributeElementAnnotation extends FakeElementAnnotation {
  FakeXmlAttributeElementAnnotation({
    String? name,
    String? namespace,
  }) : super(
          element: FakeConstructorElement(
            enclosingElement3: FakeClassElement(
              library: FakeLibraryElement(
                identifier:
                    'package:xml_annotation/src/annotations/xml_attribute.dart',
              ),
              name: 'XmlAttribute',
            ),
            library: FakeLibraryElement(
              identifier:
                  'package:xml_annotation/src/annotations/xml_attribute.dart',
            ),
          ),
          value: FakeXmlAttributeDartObject(
            name: name,
            namespace: namespace,
          ),
        );
}
