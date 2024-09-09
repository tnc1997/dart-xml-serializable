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
                  'builder.element(\'name\', nest: () { value.buildXmlChildren(builder, namespaces: namespaces); });',
                ),
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
            'should generate a builder with an escaped name if constructed with a name that contains a reserved character',
            () {
              expect(
                XmlSerializableXmlElementBuilderGenerator('\$name')
                    .generateBuilder('value'),
                equals(
                  'builder.element(r\'\$name\', nest: () { value.buildXmlChildren(builder, namespaces: namespaces); });',
                ),
              );
            },
          );

          test(
            'should generate a builder with an escaped name and namespace if constructed with a name and namespace that contain a reserved character',
            () {
              expect(
                XmlSerializableXmlElementBuilderGenerator(
                  '\$name',
                  namespace: '\$https://www.example.com',
                ).generateBuilder('value'),
                equals(
                  'builder.element(r\'\$name\', namespace: r\'\$https://www.example.com\', nest: () { value.buildXmlChildren(builder, namespaces: namespaces); });',
                ),
              );
            },
          );

          test(
            'should generate a null-aware builder if constructed with a nullable type',
            () {
              expect(
                XmlSerializableXmlElementBuilderGenerator(
                  'name',
                  isNullable: true,
                ).generateBuilder('value'),
                equals(
                  'builder.element(\'name\', nest: () { if (value != null) { value.buildXmlChildren(builder, namespaces: namespaces); } });',
                ),
              );
            },
          );

          test(
            'should generate a null-aware builder if constructed with a nullable type and exclude if null',
            () {
              expect(
                XmlSerializableXmlElementBuilderGenerator(
                  'name',
                  includeIfNull: false,
                  isNullable: true,
                ).generateBuilder('value'),
                equals(
                  'if (value != null) { builder.element(\'name\', nest: () { value.buildXmlChildren(builder, namespaces: namespaces); }); }',
                ),
              );
            },
          );
        },
      );
    },
  );
}
