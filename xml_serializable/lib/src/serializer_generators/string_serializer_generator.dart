import 'serializer_generator.dart';

class StringSerializerGenerator extends SerializerGenerator {
  const StringSerializerGenerator();

  @override
  String generateSerializer(String expression) {
    return expression;
  }

  @override
  String generateDeserializer(String expression) {
    return expression;
  }
}
