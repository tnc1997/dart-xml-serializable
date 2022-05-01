import 'fake_class_element.dart';
import 'fake_constructor_element.dart';
import 'fake_element_annotation.dart';
import 'fake_library_element.dart';
import 'fake_xml_element_dart_object.dart';

class FakeXmlElementElementAnnotation extends FakeElementAnnotation {
  FakeXmlElementElementAnnotation({
    String? name,
    String? namespace,
    bool? isSelfClosing,
    bool? includeIfNull,
  }) : super(
          element: FakeConstructorElement(
            FakeClassElement(
              library: FakeLibraryElement(
                identifier:
                    'package:xml_annotation/src/annotations/xml_element.dart',
              ),
              name: 'XmlElement',
            ),
            FakeLibraryElement(
              identifier:
                  'package:xml_annotation/src/annotations/xml_element.dart',
            ),
          ),
          value: FakeXmlElementDartObject(
            name: name,
            namespace: namespace,
            isSelfClosing: isSelfClosing,
            includeIfNull: includeIfNull,
          ),
        );
}
