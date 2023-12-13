import 'fake_class_element.dart';
import 'fake_constructor_element.dart';
import 'fake_element_annotation.dart';
import 'fake_library_element.dart';
import 'fake_xml_root_element_dart_object.dart';

class FakeXmlRootElementElementAnnotation extends FakeElementAnnotation {
  FakeXmlRootElementElementAnnotation({
    String? name,
    String? namespace,
    bool? isSelfClosing,
  }) : super(
          element: FakeConstructorElement(
            enclosingElement: FakeClassElement(
              library: FakeLibraryElement(
                identifier:
                    'package:xml_annotation/src/annotations/xml_root_element.dart',
              ),
              name: 'XmlRootElement',
            ),
            library: FakeLibraryElement(
              identifier:
                  'package:xml_annotation/src/annotations/xml_root_element.dart',
            ),
          ),
          value: FakeXmlRootElementDartObject(
            name: name,
            namespace: namespace,
            isSelfClosing: isSelfClosing,
          ),
        );
}
