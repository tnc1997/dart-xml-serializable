import 'fake_class_element.dart';
import 'fake_constructor_element.dart';
import 'fake_element_annotation.dart';
import 'fake_library_element.dart';
import 'fake_xml_text_dart_object.dart';

class FakeXmlTextElementAnnotation extends FakeElementAnnotation {
  FakeXmlTextElementAnnotation()
      : super(
          element: FakeConstructorElement(
            FakeClassElement(
              library: FakeLibraryElement(
                identifier:
                    'package:xml_annotation/src/annotations/xml_text.dart',
              ),
              name: 'XmlText',
            ),
            FakeLibraryElement(
              identifier:
                  'package:xml_annotation/src/annotations/xml_text.dart',
            ),
          ),
          value: FakeXmlTextDartObject(),
        );
}
