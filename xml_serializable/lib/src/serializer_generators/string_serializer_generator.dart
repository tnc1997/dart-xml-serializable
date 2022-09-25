import 'serializer_generator.dart';

class StringSerializerGenerator extends SerializerGenerator {
  const StringSerializerGenerator();

  @override
  String generateSerializer(String expression, Set<String> addedMembers) {
    return expression;
  }

  @override
  String generateDeserializer(String expression, Set<String> addedMembers) {
    return expression;
  }
}
