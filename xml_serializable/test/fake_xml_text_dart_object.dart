import 'package:xml_annotation/xml_annotation.dart';

import 'fake_dart_object.dart';
import 'fake_interface_type.dart';
import 'fake_xml_text_class_element.dart';

class FakeXmlTextDartObject extends FakeDartObject<XmlText> {
  FakeXmlTextDartObject({
    super.value,
  }) : super(
          type: FakeInterfaceType(
            element: FakeXmlTextClassElement(),
          ),
        );
}
