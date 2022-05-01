import 'package:test/test.dart';
import 'package:xml_serializable/xml_serializable.dart';

void main() {
  group(
    'IterableBuilderGenerator',
    () {
      group(
        'generateBuilder',
        () {
          test(
            'should generate a builder if constructed with a type',
            () {
              expect(
                IterableBuilderGenerator(
                  XmlTextBuilderGenerator(),
                ).generateBuilder('value'),
                equals(
                  'for (final value in value) { builder.text(value); }',
                ),
              );
            },
          );

          test(
            'should generate a null-aware builder if constructed with a nullable type',
            () {
              expect(
                NullableIterableBuilderGenerator(
                  XmlTextBuilderGenerator(),
                ).generateBuilder('value'),
                equals(
                  'if (value != null) { for (final value in value) { builder.text(value); } }',
                ),
              );
            },
          );
        },
      );
    },
  );
}
