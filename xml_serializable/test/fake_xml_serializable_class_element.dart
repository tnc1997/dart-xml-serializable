import 'fake_class_element.dart';
import 'fake_xml_serializable_library_element.dart';

class FakeXmlSerializableClassElement extends FakeClassElement {
  FakeXmlSerializableClassElement()
      : super(
          library: FakeXmlSerializableLibraryElement(),
          name: 'XmlSerializable',
        );
}
