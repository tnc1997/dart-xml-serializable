import 'fake_class_element.dart';
import 'fake_xml_element_library_element.dart';

class FakeXmlElementClassElement extends FakeClassElement {
  FakeXmlElementClassElement()
      : super(
          library: FakeXmlElementLibraryElement(),
          name: 'XmlElement',
        );
}
