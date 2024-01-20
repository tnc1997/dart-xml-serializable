import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

import '../fake_library_element.dart';

void main() {
  group(
    'LibraryElementExtensions',
    () {
      group(
        'isXmlAnnotation',
        () {
          test(
            'should return true if the library is the xml_annotation library',
            () {
              expect(
                FakeLibraryElement(
                  identifier: 'package:xml_annotation/xml_annotation.dart',
                ).isXmlAnnotation,
                isTrue,
              );
            },
          );

          test(
            'should return false if the library is not the xml_annotation library',
            () {
              expect(
                FakeLibraryElement().isXmlAnnotation,
                isFalse,
              );
            },
          );
        },
      );
    },
  );
}
