import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlAttributeBuilderGenerator',
    () {
      group(
        'generateBuilder',
        () {
          test(
            'should generate a builder with a name if constructed with a name',
            () {
              expect(
                XmlAttributeBuilderGenerator('name').generateBuilder('value'),
                equals(
                  'builder.attribute(\'name\', value);',
                ),
              );
            },
          );

          test(
            'should generate a builder with a name and namespace if constructed with a name and namespace',
            () {
              expect(
                XmlAttributeBuilderGenerator(
                  'name',
                  namespace: 'https://www.example.com',
                ).generateBuilder('value'),
                equals(
                  'builder.attribute(\'name\', value, namespace: \'https://www.example.com\');',
                ),
              );
            },
          );

          test(
            'should generate a builder with an escaped name if constructed with a name that contains a reserved character',
            () {
              expect(
                XmlAttributeBuilderGenerator('\$name').generateBuilder('value'),
                equals(
                  'builder.attribute(r\'\$name\', value);',
                ),
              );
            },
          );

          test(
            'should generate a builder with an escaped name and namespace if constructed with a name and namespace that contain a reserved character',
            () {
              expect(
                XmlAttributeBuilderGenerator(
                  '\$name',
                  namespace: '\$https://www.example.com',
                ).generateBuilder('value'),
                equals(
                  'builder.attribute(r\'\$name\', value, namespace: r\'\$https://www.example.com\');',
                ),
              );
            },
          );

          test(
            'should generate a null-aware builder if constructed with a nullable type',
            () {
              expect(
                NullableXmlAttributeBuilderGenerator('name')
                    .generateBuilder('value'),
                equals(
                  'if (value != null) { builder.attribute(\'name\', value); }',
                ),
              );
            },
          );
        },
      );
    },
  );
}
