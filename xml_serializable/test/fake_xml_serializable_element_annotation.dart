import 'fake_class_element.dart';
import 'fake_constructor_element.dart';
import 'fake_element_annotation.dart';
import 'fake_library_element.dart';
import 'fake_xml_serializable_dart_object.dart';

class FakeXmlSerializableElementAnnotation extends FakeElementAnnotation {
  FakeXmlSerializableElementAnnotation()
      : super(
          element: FakeConstructorElement(
            FakeClassElement(
              library: FakeLibraryElement(
                identifier:
                    'package:xml_annotation/src/annotations/xml_serializable.dart',
              ),
              name: 'XmlSerializable',
            ),
            FakeLibraryElement(
              identifier:
                  'package:xml_annotation/src/annotations/xml_serializable.dart',
            ),
          ),
          value: FakeXmlSerializableDartObject(),
        );
}
