import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlTextXmlElementBuilderGenerator',
    () {
      group(
        'generateBuilder',
        () {
          test(
            'should generate a builder with a name if constructed with a name',
            () {
              expect(
                XmlTextXmlElementBuilderGenerator('name')
                    .generateBuilder('value'),
                equals(
                  'builder.element(\'name\', nest: () { builder.text(value); });',
                ),
              );
            },
          );

          test(
            'should generate a builder with a name and namespace if constructed with a name and namespace',
            () {
              expect(
                XmlTextXmlElementBuilderGenerator(
                  'name',
                  namespace: 'https://www.example.com',
                ).generateBuilder('value'),
                equals(
                  'builder.element(\'name\', namespace: \'https://www.example.com\', nest: () { builder.text(value); });',
                ),
              );
            },
          );

          test(
            'should generate a builder with a name and is self closing if constructed with a name and is self closing',
            () {
              expect(
                XmlTextXmlElementBuilderGenerator(
                  'name',
                  isSelfClosing: true,
                ).generateBuilder('value'),
                equals(
                  'builder.element(\'name\', isSelfClosing: true, nest: () { builder.text(value); });',
                ),
              );
            },
          );

          test(
            'should generate a null-aware builder if constructed with a nullable type',
            () {
              expect(
                NullableXmlTextXmlElementBuilderGenerator(
                  'name',
                  includeIfNull: false,
                ).generateBuilder('value'),
                equals(
                  'if (value != null) { builder.element(\'name\', nest: () { builder.text(value); }); }',
                ),
              );
            },
          );

          test(
            'should generate a null-aware builder if constructed with a nullable type and include if null',
            () {
              expect(
                NullableXmlTextXmlElementBuilderGenerator(
                  'name',
                  includeIfNull: true,
                ).generateBuilder('value'),
                equals(
                  'builder.element(\'name\', nest: () { if (value != null) { builder.text(value); } });',
                ),
              );
            },
          );
        },
      );
    },
  );
}
