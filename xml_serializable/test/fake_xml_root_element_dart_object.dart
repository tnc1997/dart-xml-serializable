import 'package:xml_annotation/xml_annotation.dart';

import 'fake_dart_object.dart';
import 'fake_interface_type.dart';
import 'fake_xml_root_element_class_element.dart';

class FakeXmlRootElementDartObject extends FakeDartObject<XmlRootElement> {
  FakeXmlRootElementDartObject({
    super.value,
  }) : super(
          type: FakeInterfaceType(
            element: FakeXmlRootElementClassElement(),
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
          },
        );
}
