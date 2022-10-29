import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';
import 'package:xml_annotation/xml_annotation.dart';
import 'package:xml_serializable/xml_serializable.dart';

import 'fake_build_step.dart';
import 'fake_constant_reader.dart';
import 'fake_enum_element.dart';
import 'fake_field_element.dart';
import 'fake_library_element.dart';
import 'fake_xml_enum_element_annotation.dart';
import 'fake_xml_value_element_annotation.dart';

void main() {
  group(
    'XmlEnumGenerator',
    () {
      const generator = XmlEnumGenerator();

      test(
        'should generate an enum map if the enum has an `XmlEnum` attribute',
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
                    metadata: [
                      FakeXmlValueElementAnnotation('Bar'),
                    ],
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
              '''const \$FooBarEnumMap = { FooBar.foo: 'foo', FooBar.bar: 'Bar' };''',
            ),
          );
        },
      );

      test(
        'should generate an enum map with values encoded to pascal case if the enum has an `XmlEnum` attribute with a `fieldRename` of `pascal`',
        () {
          expect(
            generator.generateForAnnotatedElement(
              FakeEnumElement(
                fields: [
                  FakeFieldElement(
                    enclosingElement3: FakeEnumElement(
                      metadata: [
                        FakeXmlEnumElementAnnotation(
                          fieldRename: FieldRename.pascal,
                        ),
                      ],
                    ),
                    name: 'foo',
                    isEnumConstant: true,
                  ),
                  FakeFieldElement(
                    enclosingElement3: FakeEnumElement(
                      metadata: [
                        FakeXmlEnumElementAnnotation(
                          fieldRename: FieldRename.pascal,
                        ),
                      ],
                    ),
                    metadata: [
                      FakeXmlValueElementAnnotation('bar'),
                    ],
                    name: 'bar',
                    isEnumConstant: true,
                  ),
                ],
                metadata: [
                  FakeXmlEnumElementAnnotation(
                    fieldRename: FieldRename.pascal,
                  ),
                ],
                name: 'FooBar',
              ),
              FakeConstantReader(),
              FakeBuildStep(),
            ),
            equals(
              '''const \$FooBarEnumMap = { FooBar.foo: 'Foo', FooBar.bar: 'bar' };''',
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
