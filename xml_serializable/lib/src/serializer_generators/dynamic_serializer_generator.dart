import 'serializer_generator.dart';

class DynamicSerializerGenerator extends SerializerGenerator {
  const DynamicSerializerGenerator();

  @override
  String generateSerializer(String expression) => expression;

  @override
  String generateDeserializer(String expression) => expression;
}
