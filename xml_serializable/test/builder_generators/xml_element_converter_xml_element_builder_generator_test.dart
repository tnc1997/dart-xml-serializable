import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlElementConverterXmlElementBuilderGenerator',
    () {
      group(
        'generateBuilder',
        () {
          test(
            'should generate a builder with a name if constructed with a name',
            () {
              expect(
                XmlElementConverterXmlElementBuilderGenerator(
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
                XmlElementConverterXmlElementBuilderGenerator(
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
                XmlElementConverterXmlElementBuilderGenerator(
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
            'should generate a null-aware builder if constructed with a nullable type',
            () {
              expect(
                NullableXmlElementConverterXmlElementBuilderGenerator(
                  'name',
                  'TestConverter',
                  includeIfNull: false,
                ).generateBuilder('value'),
                equals(
                  'if (value != null) { builder.element(\'name\', nest: () { const TestConverter().buildXmlChildren(value, builder, namespaces: namespaces); }); }',
                ),
              );
            },
          );

          test(
            'should generate a null-aware builder if constructed with a nullable type and include if null',
            () {
              expect(
                NullableXmlElementConverterXmlElementBuilderGenerator(
                  'name',
                  'TestConverter',
                  includeIfNull: true,
                ).generateBuilder('value'),
                equals(
                  'builder.element(\'name\', nest: () { if (value != null) { const TestConverter().buildXmlChildren(value, builder, namespaces: namespaces); } });',
                ),
              );
            },
          );
        },
      );
    },
  );
}
