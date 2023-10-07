import 'fake_class_element.dart';
import 'fake_constructor_element.dart';
import 'fake_element_annotation.dart';
import 'fake_library_element.dart';
import 'fake_xml_cdata_dart_object.dart';

class FakeXmlCDATAElementAnnotation extends FakeElementAnnotation {
  FakeXmlCDATAElementAnnotation()
      : super(
          element: FakeConstructorElement(
            enclosingElement3: FakeClassElement(
              library: FakeLibraryElement(
                identifier:
                    'package:xml_annotation/src/annotations/xml_cdata.dart',
              ),
              name: 'XmlCDATA',
            ),
            library: FakeLibraryElement(
              identifier:
                  'package:xml_annotation/src/annotations/xml_cdata.dart',
            ),
          ),
          value: FakeXmlCDATADartObject(),
        );
}
