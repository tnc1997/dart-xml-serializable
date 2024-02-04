import 'package:xml_annotation/xml_annotation.dart';

import 'fake_dart_object.dart';
import 'fake_interface_type.dart';
import 'fake_xml_cdata_class_element.dart';

class FakeXmlCDATADartObject extends FakeDartObject<XmlCDATA> {
  FakeXmlCDATADartObject({
    super.value,
  }) : super(
          type: FakeInterfaceType(
            element: FakeXmlCDATAClassElement(),
          ),
        );
}
