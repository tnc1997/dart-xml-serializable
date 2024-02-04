import 'fake_class_element.dart';
import 'fake_xml_enum_library_element.dart';

class FakeXmlEnumClassElement extends FakeClassElement {
  FakeXmlEnumClassElement()
      : super(
          library: FakeXmlEnumLibraryElement(),
          name: 'XmlEnum',
        );
}
