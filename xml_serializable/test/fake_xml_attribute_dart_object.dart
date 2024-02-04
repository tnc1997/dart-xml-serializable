import 'package:xml_annotation/xml_annotation.dart';

import 'fake_dart_object.dart';
import 'fake_interface_type.dart';
import 'fake_xml_attribute_class_element.dart';

class FakeXmlAttributeDartObject extends FakeDartObject<XmlAttribute> {
  FakeXmlAttributeDartObject({
    super.value,
  }) : super(
          type: FakeInterfaceType(
            element: FakeXmlAttributeClassElement(),
          ),
          fields: {
            'name': FakeDartObject(
              value: value?.name,
            ),
            'namespace': FakeDartObject(
              value: value?.namespace,
            ),
          },
        );
}
