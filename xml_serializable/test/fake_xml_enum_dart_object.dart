import 'package:xml_annotation/xml_annotation.dart';

import 'fake_dart_object.dart';
import 'fake_field_rename_dart_object.dart';
import 'fake_interface_type.dart';
import 'fake_xml_enum_class_element.dart';

class FakeXmlEnumDartObject extends FakeDartObject<XmlEnum> {
  FakeXmlEnumDartObject({
    super.value,
  }) : super(
          type: FakeInterfaceType(
            element: FakeXmlEnumClassElement(),
          ),
          fields: {
            'fieldRename': FakeFieldRenameDartObject(
              value: value?.fieldRename,
            ),
          },
        );
}
