import 'fake_class_element.dart';
import 'fake_xml_converter_library_element.dart';

class FakeXmlConverterClassElement extends FakeClassElement {
  FakeXmlConverterClassElement()
      : super(
          library: FakeXmlConverterLibraryElement(),
          name: 'XmlConverter',
        );
}
