import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlConverterXmlElementBuilderGenerator',
    () {
      group(
        'generateBuilder',
        () {
          test(
            'should generate a builder with a name if constructed with a name',
            () {
              expect(
                XmlConverterXmlElementBuilderGenerator(
                  'name',
                  'TestConverter',
                ).generateBuilder('value'),
                equals(
                  'builder.element(\'name\', nest: () { const TestConverter().buildXmlChildren(value, builder, namespaces: namespaces); });',
                ),
              );
            },
          );

          test(
            'should generate a builder with a name and namespace if constructed with a name and namespace',
            () {
              expect(
                XmlConverterXmlElementBuilderGenerator(
                  'name',
                  'TestConverter',
                  namespace: 'https://www.example.com',
                ).generateBuilder('value'),
                equals(
                  'builder.element(\'name\', namespace: \'https://www.example.com\', nest: () { const TestConverter().buildXmlChildren(value, builder, namespaces: namespaces); });',
                ),
              );
            },
          );

          test(
            'should generate a builder with a name and is self closing if constructed with a name and is self closing',
            () {
              expect(
                XmlConverterXmlElementBuilderGenerator(
                  'name',
                  'TestConverter',
                  isSelfClosing: true,
                ).generateBuilder('value'),
                equals(
                  'builder.element(\'name\', isSelfClosing: true, nest: () { const TestConverter().buildXmlChildren(value, builder, namespaces: namespaces); });',
                ),
              );
            },
          );

          test(
            'should generate a builder with an escaped name if constructed with a name that contains a reserved character',
            () {
              expect(
                XmlConverterXmlElementBuilderGenerator(
                  '\$name',
                  'TestConverter',
                ).generateBuilder('value'),
                equals(
                  'builder.element(r\'\$name\', nest: () { const TestConverter().buildXmlChildren(value, builder, namespaces: namespaces); });',
                ),
              );
            },
          );

          test(
            'should generate a builder with an escaped name and namespace if constructed with a name and namespace that contain a reserved character',
            () {
              expect(
                XmlConverterXmlElementBuilderGenerator(
                  '\$name',
                  'TestConverter',
                  namespace: '\$https://www.example.com',
                ).generateBuilder('value'),
                equals(
                  'builder.element(r\'\$name\', namespace: r\'\$https://www.example.com\', nest: () { const TestConverter().buildXmlChildren(value, builder, namespaces: namespaces); });',
                ),
              );
            },
          );

          test(
            'should generate a null-aware builder if constructed with a nullable type',
            () {
              expect(
                XmlConverterXmlElementBuilderGenerator(
                  'name',
                  'TestConverter',
                  isNullable: true,
                ).generateBuilder('value'),
                equals(
                  'builder.element(\'name\', nest: () { if (value != null) { const TestConverter().buildXmlChildren(value, builder, namespaces: namespaces); } });',
                ),
              );
            },
          );

          test(
            'should generate a null-aware builder if constructed with a nullable type and a nullable converter type',
            () {
              expect(
                XmlConverterXmlElementBuilderGenerator(
                  'name',
                  'TestConverter',
                  isNullable: true,
                  isConverterNullable: true,
                ).generateBuilder('value'),
                equals(
                  'builder.element(\'name\', nest: () { const TestConverter().buildXmlChildren(value, builder, namespaces: namespaces); });',
                ),
              );
            },
          );

          test(
            'should generate a null-aware builder if constructed with a nullable type and exclude if null',
            () {
              expect(
                XmlConverterXmlElementBuilderGenerator(
                  'name',
                  'TestConverter',
                  includeIfNull: false,
                  isNullable: true,
                ).generateBuilder('value'),
                equals(
                  'if (value != null) { builder.element(\'name\', nest: () { const TestConverter().buildXmlChildren(value, builder, namespaces: namespaces); }); }',
                ),
              );
            },
          );
        },
      );
    },
  );
}
