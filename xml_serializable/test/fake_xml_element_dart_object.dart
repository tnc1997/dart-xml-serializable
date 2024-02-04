import 'package:xml_annotation/xml_annotation.dart';

import 'fake_dart_object.dart';
import 'fake_interface_type.dart';
import 'fake_xml_element_class_element.dart';

class FakeXmlElementDartObject extends FakeDartObject<XmlElement> {
  FakeXmlElementDartObject({
    super.value,
  }) : super(
          type: FakeInterfaceType(
            element: FakeXmlElementClassElement(),
          ),
          fields: {
            'name': FakeDartObject(
              value: value?.name,
            ),
            'namespace': FakeDartObject(
              value: value?.namespace,
            ),
            'isSelfClosing': FakeDartObject(
              value: value?.isSelfClosing,
            ),
            'includeIfNull': FakeDartObject(
              value: value?.includeIfNull,
            ),
          },
        );
}
