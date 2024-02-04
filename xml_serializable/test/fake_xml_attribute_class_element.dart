import 'fake_class_element.dart';
import 'fake_xml_attribute_library_element.dart';

class FakeXmlAttributeClassElement extends FakeClassElement {
  FakeXmlAttributeClassElement()
      : super(
          library: FakeXmlAttributeLibraryElement(),
          name: 'XmlAttribute',
        );
}
