import 'package:xml_annotation/xml_annotation.dart';

import 'fake_dart_object.dart';
import 'fake_field_rename_dart_object.dart';
import 'fake_interface_type.dart';
import 'fake_xml_serializable_class_element.dart';

class FakeXmlSerializableDartObject extends FakeDartObject<XmlSerializable> {
  FakeXmlSerializableDartObject({
    super.value,
  }) : super(
          type: FakeInterfaceType(
            element: FakeXmlSerializableClassElement(),
          ),
          fields: {
            'createMixin': FakeDartObject(
              value: value?.createMixin,
            ),
            'fieldRename': FakeFieldRenameDartObject(
              value: value?.fieldRename,
            ),
          },
        );
}
