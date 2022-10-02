import 'package:analyzer/dart/element/type.dart';

import '../enum_utils.dart';
import '../extensions/dart_type_extensions.dart';
import 'serializer_generator.dart';

class EnumSerializerGenerator extends SerializerGenerator {
  const EnumSerializerGenerator({required this.type});

  final DartType type;

  @override
  String generateSerializer(String expression, Set<String> addedMembers) {
    final memberContent = enumValueMapFromType(type);

    if (memberContent != null) {
      addedMembers.add(memberContent);
    }

    final buffer = StringBuffer();

    buffer.write('_\$${type.element!.name!}EnumMap[$expression]');

    if (!type.isNullable) {
      buffer.write('!');
    }

    return buffer.toString();
  }

  @override
  String generateDeserializer(String expression, Set<String> addedMembers) {
    final memberContent = enumValueMapFromType(type);

    if (memberContent != null) {
      addedMembers.add(memberContent);
    }

    final buffer = StringBuffer();

    if (type.isNullable) {
      buffer.write('$expression != null ? ');
    }

    buffer.write(
      '_\$${type.element!.name!}EnumMap.entries.singleWhere((e) => e.value == $expression, orElse: () => throw ArgumentError(\'`\$$expression` is not one of the supported values: \${_\$${type.element!.name!}EnumMap.values.join(\', \')}\')).key',
    );

    if (type.isNullable) {
      buffer.write(' : null');
    }

    return buffer.toString();
  }
}
