import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlRootElementBuilderGenerator',
    () {
      group(
        'generateBuilder',
        () {
          test(
            'should generate a builder with a name if constructed with a name',
            () {
              expect(
                XmlRootElementBuilderGenerator('name').generateBuilder('value'),
                equals(
                  'builder.element(\'name\', namespaces: namespaces, nest: () { value.buildXmlChildren(builder, namespaces: namespaces); });',
                ),
              );
            },
          );

          test(
            'should generate a builder with a name and namespace if constructed with a name and namespace',
            () {
              expect(
                XmlRootElementBuilderGenerator(
                  'name',
                  namespace: 'https://www.example.com',
                ).generateBuilder('value'),
                equals(
                  'builder.element(\'name\', namespace: \'https://www.example.com\', namespaces: namespaces, nest: () { value.buildXmlChildren(builder, namespaces: namespaces); });',
                ),
              );
            },
          );

          test(
            'should generate a builder with a name and is self closing if constructed with a name and is self closing',
            () {
              expect(
                XmlRootElementBuilderGenerator(
                  'name',
                  isSelfClosing: true,
                ).generateBuilder('value'),
                equals(
                  'builder.element(\'name\', namespaces: namespaces, isSelfClosing: true, nest: () { value.buildXmlChildren(builder, namespaces: namespaces); });',
                ),
              );
            },
          );

          test(
            'should generate a null-aware builder if constructed with a nullable type',
            () {
              expect(
                NullableXmlRootElementBuilderGenerator('name')
                    .generateBuilder('value'),
                equals(
                  'if (value != null) { builder.element(\'name\', namespaces: namespaces, nest: () { value.buildXmlChildren(builder, namespaces: namespaces); }); }',
                ),
              );
            },
          );
        },
      );
    },
  );
}
