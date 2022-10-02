import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

import '../fake_dart_type.dart';
import '../fake_enum_element.dart';
import '../fake_field_element.dart';

void main() {
  group('EnumSerializerGenerator', () {
    group('generateSerializer', () {
      test('should generate a serializer if constructed with a type', () {
        final addedMembers = <String>{};
        expect(
          EnumSerializerGenerator(
            type: FakeDartType(
              element: FakeEnumElement('Foo', [
                FakeFieldElement(
                  name: 'a',
                  isEnumConstant: true,
                ),
                FakeFieldElement(
                  name: 'b',
                  isEnumConstant: true,
                ),
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
            'const _\$FooEnumMap = { Foo.a: \'a\', Foo.b: \'b\' };',
          }),
        );
      });

      test(
          'should generate a null-aware serializer if constructed with a nullable type',
          () {
        final addedMembers = <String>{};
        expect(
          EnumSerializerGenerator(
            type: FakeDartType(
              element: FakeEnumElement('Foo', [
                FakeFieldElement(
                  name: 'a',
                  isEnumConstant: true,
                ),
                FakeFieldElement(
                  name: 'b',
                  isEnumConstant: true,
                ),
              ]),
              nullabilitySuffix: NullabilitySuffix.question,
            ),
          ).generateSerializer('value', addedMembers),
          equals(
            r'_$FooEnumMap[value]',
          ),
        );
        expect(
          addedMembers,
          equals({
            'const _\$FooEnumMap = { Foo.a: \'a\', Foo.b: \'b\' };',
          }),
        );
      });
    });

    group('generateDeserializer', () {
      test('should generate a deserializer if constructed with a type', () {
        final addedMembers = <String>{};
        expect(
          EnumSerializerGenerator(
            type: FakeDartType(
              element: FakeEnumElement('Foo', [
                FakeFieldElement(
                  name: 'a',
                  isEnumConstant: true,
                ),
                FakeFieldElement(
                  name: 'b',
                  isEnumConstant: true,
                ),
              ]),
            ),
          ).generateDeserializer('value', addedMembers),
          equals(
            '_\$FooEnumMap.entries.singleWhere((e) => e.value == value, orElse: () => throw ArgumentError(\'`\$value` is not one of the supported values: \${_\$FooEnumMap.values.join(\', \')}\')).key',
          ),
        );
        expect(
          addedMembers,
          equals({
            'const _\$FooEnumMap = { Foo.a: \'a\', Foo.b: \'b\' };',
          }),
        );
      });

      test(
          'should generate a null-aware deserializer if constructed with a nullable type',
          () {
        final addedMembers = <String>{};
        expect(
          EnumSerializerGenerator(
            type: FakeDartType(
              element: FakeEnumElement('Foo', [
                FakeFieldElement(
                  name: 'a',
                  isEnumConstant: true,
                ),
                FakeFieldElement(
                  name: 'b',
                  isEnumConstant: true,
                ),
              ]),
              nullabilitySuffix: NullabilitySuffix.question,
            ),
          ).generateDeserializer('value', addedMembers),
          equals(
            'value != null ? _\$FooEnumMap.entries.singleWhere((e) => e.value == value, orElse: () => throw ArgumentError(\'`\$value` is not one of the supported values: \${_\$FooEnumMap.values.join(\', \')}\')).key : null',
          ),
        );
        expect(
          addedMembers,
          equals({
            'const _\$FooEnumMap = { Foo.a: \'a\', Foo.b: \'b\' };',
          }),
        );
      });
    });
  });
}
