import 'serializer_generator.dart';

class DynamicSerializerGenerator extends SerializerGenerator {
  const DynamicSerializerGenerator();

  @override
  String generateSerializer(String expression) {
    return expression;
  }

  @override
  String generateDeserializer(String expression) {
    return expression;
  }
}
