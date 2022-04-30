import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlSerializableXmlElementBuilderGenerator',
    () {
      group(
        'generateBuilder',
        () {
          test(
            'should generate a builder with a name if constructed with a name',
            () {
              expect(
                XmlSerializableXmlElementBuilderGenerator('name')
                    .generateBuilder('value'),
                equals(
                    'builder.element(\'name\', nest: () { value.buildXmlChildren(builder, namespaces: namespaces); });'),
              );
            },
          );

          test(
            'should generate a builder with a name and namespace if constructed with a name and namespace',
            () {
              expect(
                XmlSerializableXmlElementBuilderGenerator(
                  'name',
                  namespace: 'https://www.example.com',
                ).generateBuilder('value'),
                equals(
                  'builder.element(\'name\', namespace: \'https://www.example.com\', nest: () { value.buildXmlChildren(builder, namespaces: namespaces); });',
                ),
              );
            },
          );

          test(
            'should generate a builder with a name and is self closing if constructed with a name and is self closing',
            () {
              expect(
                XmlSerializableXmlElementBuilderGenerator(
                  'name',
                  isSelfClosing: true,
                ).generateBuilder('value'),
                equals(
                  'builder.element(\'name\', isSelfClosing: true, nest: () { value.buildXmlChildren(builder, namespaces: namespaces); });',
                ),
              );
            },
          );

          test(
            'should generate a null-aware builder if constructed with a nullable type',
            () {
              expect(
                NullableXmlSerializableXmlElementBuilderGenerator(
                  'name',
                  includeIfNull: false,
                ).generateBuilder('value'),
                equals(
                  'if (value != null) { builder.element(\'name\', nest: () { value.buildXmlChildren(builder, namespaces: namespaces); }); }',
                ),
              );
            },
          );

          test(
            'should generate a null-aware builder if constructed with a nullable type and include if null',
            () {
              expect(
                NullableXmlSerializableXmlElementBuilderGenerator(
                  'name',
                  includeIfNull: true,
                ).generateBuilder('value'),
                equals(
                  'builder.element(\'name\', nest: () { if (value != null) { value.buildXmlChildren(builder, namespaces: namespaces); } });',
                ),
              );
            },
          );
        },
      );
    },
  );
}
