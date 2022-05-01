import 'stringable_serializer_generator.dart';

class DateTimeSerializerGenerator extends StringableSerializerGenerator {
  const DateTimeSerializerGenerator({bool isNullable = false})
      : super(
          'toIso8601String()',
          'DateTime.parse',
          isNullable: isNullable,
        );
}

class NullableDateTimeSerializerGenerator extends DateTimeSerializerGenerator {
  const NullableDateTimeSerializerGenerator() : super(isNullable: true);
}
