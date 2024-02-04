import 'package:xml_annotation/xml_annotation.dart';

import 'fake_dart_object.dart';
import 'fake_interface_type.dart';
import 'fake_xml_value_class_element.dart';

class FakeXmlValueDartObject extends FakeDartObject<XmlValue> {
  FakeXmlValueDartObject({
    required super.value,
  }) : super(
          type: FakeInterfaceType(
            element: FakeXmlValueClassElement(),
          ),
          fields: {
            'value': FakeDartObject(
              value: value!.value,
            ),
          },
        );
}
