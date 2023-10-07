import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'XmlCDATABuilderGenerator',
    () {
      group(
        'generateBuilder',
        () {
          test(
            'should generate a builder if constructed with a type',
            () {
              expect(
                XmlCDATABuilderGenerator().generateBuilder('value'),
                equals(
                  'builder.cdata(value);',
                ),
              );
            },
          );

          test(
            'should generate a null-aware builder if constructed with a nullable type',
            () {
              expect(
                NullableXmlCDATABuilderGenerator().generateBuilder('value'),
                equals(
                  'if (value != null) { builder.cdata(value); }',
                ),
              );
            },
          );
        },
      );
    },
  );
}
