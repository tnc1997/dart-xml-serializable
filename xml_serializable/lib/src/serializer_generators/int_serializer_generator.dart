import 'stringable_serializer_generator.dart';

class IntSerializerGenerator extends StringableSerializerGenerator {
  const IntSerializerGenerator({bool isNullable = false})
      : super(
          'toString()',
          'int.parse',
          isNullable: isNullable,
        );
}

class NullableIntSerializerGenerator extends IntSerializerGenerator {
  const NullableIntSerializerGenerator() : super(isNullable: true);
}
