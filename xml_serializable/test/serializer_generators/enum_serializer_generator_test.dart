import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:test/test.dart';
import 'package:xml_serializable/src/serializer_generators/enum_serializer_generator.dart';

import '../fake_class_element.dart';
import '../fake_enum_class_element.dart';
import '../fake_interface_type.dart';
import '../fake_xml_value_annotation.dart';

void main() {
  group('EnumSerializerGenerator', () {
    group('generateSerializer', () {
      test('should generate a serializer if constructed with a type', () {
        final addedMembers = <String>{};
        expect(
          EnumSerializerGenerator(
            type: FakeInterfaceType(
              element2: FakeEnumClassElement('Foo', [
                FakeConstFieldElement('a'),
                FakeConstFieldElement('b'),
              ]),
            ),
          ).generateSerializer('value', addedMembers),
          equals(
            r'_$FooEnumMap[value]!',
          ),
        );
        expect(
          addedMembers,
          equals({
            'const _\$FooEnumMap = {\n'
                '  Foo.a: \'a\',  Foo.b: \'b\',\n'
                '};'
          }),
        );
      });

      test(
          'should generate a null-aware serializer if constructed with a nullable type',
          () {
        final addedMembers = <String>{};
        expect(
          EnumSerializerGenerator(
            type: FakeInterfaceType(
              nullabilitySuffix: NullabilitySuffix.question,
              element2: FakeEnumClassElement('Foo', [
                FakeConstFieldElement('a'),
                FakeConstFieldElement('b'),
              ]),
            ),
          ).generateSerializer('value', addedMembers),
          equals(
            r'_$FooEnumMap[value]',
          ),
        );
        expect(
          addedMembers,
          equals({
            'const _\$FooEnumMap = {\n'
                '  Foo.a: \'a\',  Foo.b: \'b\',\n'
                '};'
          }),
        );
      });
    });

    group('generateDeserializer', () {
      test('should generate a deserializer if constructed with a type', () {
        final addedMembers = <String>{};
        expect(
          EnumSerializerGenerator(
            type: FakeInterfaceType(
              element2: FakeEnumClassElement('Foo', [
                FakeConstFieldElement('a'),
                FakeConstFieldElement('b'),
              ]),
            ),
          ).generateDeserializer('value', addedMembers),
          equals(r'annotation.$enumDecode(_$FooEnumMap, value)'),
        );
        expect(
          addedMembers,
          equals({
            'const _\$FooEnumMap = {\n'
                '  Foo.a: \'a\',  Foo.b: \'b\',\n'
                '};'
          }),
        );
      });

      test(
          'should generate a null-aware deserializer if constructed with a nullable type',
          () {
        final addedMembers = <String>{};
        expect(
          EnumSerializerGenerator(
            type: FakeInterfaceType(
              nullabilitySuffix: NullabilitySuffix.question,
              element2: FakeEnumClassElement('Foo', [
                FakeConstFieldElement('a', [FakeXmlValueAnnotation('abc')]),
                FakeConstFieldElement('b'),
              ]),
            ),
          ).generateDeserializer('value', addedMembers),
          equals(r'annotation.$enumDecodeNullable(_$FooEnumMap, value)'),
        );
        expect(
          addedMembers,
          equals({
            'const _\$FooEnumMap = {\n'
                '  Foo.a: \'abc\',  Foo.b: \'b\',\n'
                '};'
          }),
        );
      });

      test('should throw an exception if type is wrong', () {
        final addedMembers = <String>{};
        expect(
          () => EnumSerializerGenerator(
            type: FakeInterfaceType(
              nullabilitySuffix: NullabilitySuffix.question,
              element2: FakeClassElement(name: 'Foo', fields: []),
            ),
          ).generateDeserializer('value', addedMembers),
          throwsA(isA<TypeError>()),
        );
      });
    });
  });
}
