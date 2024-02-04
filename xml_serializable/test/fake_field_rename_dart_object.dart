import 'package:xml_annotation/xml_annotation.dart';

import 'fake_dart_object.dart';
import 'fake_field_rename_enum_element.dart';
import 'fake_interface_type.dart';

class FakeFieldRenameDartObject extends FakeDartObject<FieldRename> {
  FakeFieldRenameDartObject({
    super.value,
  }) : super(
          type: FakeInterfaceType(
            element: FakeFieldRenameEnumElement(),
          ),
          fields: {
            'index': FakeDartObject(
              value: value?.index,
            ),
            'name': FakeDartObject(
              value: value?.name,
            ),
          },
        );
}
