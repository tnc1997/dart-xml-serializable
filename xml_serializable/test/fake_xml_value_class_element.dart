import 'fake_class_element.dart';
import 'fake_xml_value_library_element.dart';

class FakeXmlValueClassElement extends FakeClassElement {
  FakeXmlValueClassElement()
      : super(
          library: FakeXmlValueLibraryElement(),
          name: 'XmlValue',
        );
}
