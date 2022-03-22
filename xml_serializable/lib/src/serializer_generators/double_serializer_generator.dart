import 'stringable_serializer_generator.dart';

class DoubleSerializerGenerator extends StringableSerializerGenerator {
  const DoubleSerializerGenerator({bool isNullable = false})
      : super(
          'toString()',
          'double.parse',
          isNullable: isNullable,
        );
}

class NullableDoubleSerializerGenerator extends DoubleSerializerGenerator {
  const NullableDoubleSerializerGenerator() : super(isNullable: true);
}
