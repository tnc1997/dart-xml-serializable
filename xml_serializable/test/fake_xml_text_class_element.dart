import 'fake_class_element.dart';
import 'fake_xml_text_library_element.dart';

class FakeXmlTextClassElement extends FakeClassElement {
  FakeXmlTextClassElement()
      : super(
          library: FakeXmlTextLibraryElement(),
          name: 'XmlText',
        );
}
