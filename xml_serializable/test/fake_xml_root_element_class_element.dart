import 'fake_class_element.dart';
import 'fake_xml_root_element_library_element.dart';

class FakeXmlRootElementClassElement extends FakeClassElement {
  FakeXmlRootElementClassElement()
      : super(
          library: FakeXmlRootElementLibraryElement(),
          name: 'XmlRootElement',
        );
}
