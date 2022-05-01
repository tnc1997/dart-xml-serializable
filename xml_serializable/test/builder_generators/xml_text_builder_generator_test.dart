import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlTextBuilderGenerator',
    () {
      group(
        'generateBuilder',
        () {
          test(
            'should generate a builder if constructed with a type',
            () {
              expect(
                XmlTextBuilderGenerator().generateBuilder('value'),
                equals(
                  'builder.text(value);',
                ),
              );
            },
          );

          test(
            'should generate a null-aware builder if constructed with a nullable type',
            () {
              expect(
                NullableXmlTextBuilderGenerator().generateBuilder('value'),
                equals(
                  'if (value != null) { builder.text(value); }',
                ),
              );
            },
          );
        },
      );
    },
  );
}
