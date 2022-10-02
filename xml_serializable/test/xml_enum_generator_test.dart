import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

import 'fake_build_step.dart';
import 'fake_constant_reader.dart';
import 'fake_enum_element.dart';
import 'fake_field_element.dart';
import 'fake_library_element.dart';
import 'fake_xml_enum_element_annotation.dart';

void main() {
  group(
    'XmlEnumGenerator',
    () {
      const generator = XmlEnumGenerator();

      test(
        'should generate enum value map if the enum has an `XmlEnum` attribute',
        () {
          expect(
            generator.generateForAnnotatedElement(
              FakeEnumElement(
                fields: [
                  FakeFieldElement(
                    name: 'foo',
                    isEnumConstant: true,
                  ),
                  FakeFieldElement(
                    name: 'bar',
                    isEnumConstant: true,
                  ),
                ],
                metadata: [
                  FakeXmlEnumElementAnnotation(),
                ],
                name: 'FooBar',
              ),
              FakeConstantReader(),
              FakeBuildStep(),
            ),
            equals(
              '''const _\$FooBarEnumMap = { FooBar.foo: 'foo', FooBar.bar: 'bar' };''',
            ),
          );
        },
      );

      test(
        'should throw an invalid generation source error if the library is not non nullable by default',
        () {
          expect(
            () {
              generator.generateForAnnotatedElement(
                FakeEnumElement(
                  library: FakeLibraryElement(
                    isNonNullableByDefault: false,
                  ),
                  metadata: [
                    FakeXmlEnumElementAnnotation(),
                  ],
                ),
                FakeConstantReader(),
                FakeBuildStep(),
              );
            },
            throwsA(isA<InvalidGenerationSourceError>()),
          );
        },
      );

      test(
        'should throw an invalid generation source error if the element is not an enum element',
        () {
          expect(
            () {
              generator.generateForAnnotatedElement(
                FakeFieldElement(),
                FakeConstantReader(),
                FakeBuildStep(),
              );
            },
            throwsA(isA<InvalidGenerationSourceError>()),
          );
        },
      );
    },
  );
}
