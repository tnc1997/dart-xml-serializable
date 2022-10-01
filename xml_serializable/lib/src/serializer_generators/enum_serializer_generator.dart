import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';

import '../enum_utils.dart';
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

    if (type.isNullableType) {
      return '${constMapName(type)}[$expression]';
    } else {
      return '${constMapName(type)}[$expression]!';
    }
  }

  @override
  String generateDeserializer(String expression, Set<String> addedMembers) {
    final memberContent = enumValueMapFromType(type);

    String functionName;
    if (type.isNullableType) {
      functionName = r'$enumDecodeNullable';
    } else {
      functionName = r'$enumDecode';
    }

    if (memberContent != null) {
      addedMembers.add(memberContent);
    }

    final args = [
      constMapName(type),
      expression,
    ];

    return 'annotation.$functionName(${args.join(', ')})';
  }
}

extension on DartType {
  bool get isNullableType =>
      isDynamic || nullabilitySuffix == NullabilitySuffix.question;
}
