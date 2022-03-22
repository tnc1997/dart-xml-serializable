import 'stringable_serializer_generator.dart';

class NumSerializerGenerator extends StringableSerializerGenerator {
  const NumSerializerGenerator({bool isNullable = false})
      : super(
          'toString()',
          'num.parse',
          isNullable: isNullable,
        );
}

class NullableNumSerializerGenerator extends NumSerializerGenerator {
  const NullableNumSerializerGenerator() : super(isNullable: true);
}
