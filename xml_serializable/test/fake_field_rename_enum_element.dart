import 'fake_enum_element.dart';
import 'fake_field_element.dart';
import 'fake_library_element.dart';

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
          library: FakeLibraryElement(
            identifier:
                'package:xml_annotation/src/annotations/xml_serializable.dart',
          ),
          name: 'FieldRename',
        );
}
