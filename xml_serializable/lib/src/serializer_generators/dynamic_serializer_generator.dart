import 'serializer_generator.dart';

class DynamicSerializerGenerator extends SerializerGenerator {
  const DynamicSerializerGenerator();

  @override
  String generateSerializer(String expression, Set<String> addedMembers) {
    return expression;
  }

  @override
  String generateDeserializer(String expression, Set<String> addedMembers) {
    return expression;
  }
}
