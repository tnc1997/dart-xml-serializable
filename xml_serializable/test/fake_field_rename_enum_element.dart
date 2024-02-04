import 'fake_enum_element.dart';
import 'fake_field_element.dart';
import 'fake_xml_serializable_library_element.dart';

class FakeFieldRenameEnumElement extends FakeEnumElement {
  FakeFieldRenameEnumElement()
      : super(
          fields: [
            FakeFieldElement(
              name: 'none',
              isEnumConstant: true,
            ),
            FakeFieldElement(
              name: 'kebab',
              isEnumConstant: true,
            ),
            FakeFieldElement(
              name: 'snake',
              isEnumConstant: true,
            ),
            FakeFieldElement(
              name: 'pascal',
              isEnumConstant: true,
            ),
          ],
          library: FakeXmlSerializableLibraryElement(),
          name: 'FieldRename',
        );
}
