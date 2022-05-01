import 'stringable_serializer_generator.dart';

class UriSerializerGenerator extends StringableSerializerGenerator {
  const UriSerializerGenerator({bool isNullable = false})
      : super(
          'toString()',
          'Uri.parse',
          isNullable: isNullable,
        );
}

class NullableUriSerializerGenerator extends UriSerializerGenerator {
  const NullableUriSerializerGenerator() : super(isNullable: true);
}
