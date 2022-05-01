import 'package:analyzer/dart/element/type.dart';

import '../extensions/dart_type_extensions.dart';
import '../serializer_generators/bool_serializer_generator.dart';
import '../serializer_generators/date_time_serializer_generator.dart';
import '../serializer_generators/double_serializer_generator.dart';
import '../serializer_generators/duration_serializer_generator.dart';
import '../serializer_generators/dynamic_serializer_generator.dart';
import '../serializer_generators/int_serializer_generator.dart';
import '../serializer_generators/iterable_serializer_generator.dart';
import '../serializer_generators/num_serializer_generator.dart';
import '../serializer_generators/serializer_generator.dart';
import '../serializer_generators/string_serializer_generator.dart';
import '../serializer_generators/uri_serializer_generator.dart';

/// Creates a [SerializerGenerator] from a [DartType].
typedef SerializerGeneratorFactory = SerializerGenerator Function(
  DartType type,
);

/// Creates a [SerializerGenerator] from a [DartType] that represents a [bool], [DateTime], [double], [Duration], [dynamic], [int], [Iterable], [List], [num], [Set], [String], or [Uri].
SerializerGenerator serializerGeneratorFactory(DartType type) {
  if (type is ParameterizedType && type.isDartCoreIterable) {
    return IterableSerializerGenerator(
      serializerGeneratorFactory(type.typeArguments.single),
      isNullable: type.isNullable,
    );
  } else if (type is ParameterizedType && type.isDartCoreList) {
    return ListSerializerGenerator(
      serializerGeneratorFactory(type.typeArguments.single),
      isNullable: type.isNullable,
    );
  } else if (type is ParameterizedType && type.isDartCoreSet) {
    return SetSerializerGenerator(
      serializerGeneratorFactory(type.typeArguments.single),
      isNullable: type.isNullable,
    );
  } else if (type.isDartCoreBool) {
    return BoolSerializerGenerator(isNullable: type.isNullable);
  } else if (type.isDartCoreDateTime) {
    return DateTimeSerializerGenerator(isNullable: type.isNullable);
  } else if (type.isDartCoreDouble) {
    return DoubleSerializerGenerator(isNullable: type.isNullable);
  } else if (type.isDartCoreDuration) {
    return DurationSerializerGenerator(isNullable: type.isNullable);
  } else if (type.isDynamic) {
    return const DynamicSerializerGenerator();
  } else if (type.isDartCoreInt) {
    return IntSerializerGenerator(isNullable: type.isNullable);
  } else if (type.isDartCoreNum) {
    return NumSerializerGenerator(isNullable: type.isNullable);
  } else if (type.isDartCoreString) {
    return const StringSerializerGenerator();
  } else if (type.isDartCoreUri) {
    return UriSerializerGenerator(isNullable: type.isNullable);
  }

  throw ArgumentError.value(
    type,
    'type',
    'The type `$type` is not supported. Change the type `$type` to `bool`, `DateTime`, `double`, `Duration`, `dynamic`, `int`, `Iterable`, `List`, `num`, `Set`, `String`, or `Uri`.',
  );
}
