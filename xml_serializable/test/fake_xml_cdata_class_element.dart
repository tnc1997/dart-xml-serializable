import 'fake_class_element.dart';
import 'fake_xml_cdata_library_element.dart';

class FakeXmlCDATAClassElement extends FakeClassElement {
  FakeXmlCDATAClassElement()
      : super(
          library: FakeXmlCDATALibraryElement(),
          name: 'XmlCDATA',
        );
}
