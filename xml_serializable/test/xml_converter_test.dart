import 'package:source_gen_test/source_gen_test.dart';
import 'package:xml_serializable/xml_serializable.dart';

Future<void> main() async {
  initializeBuildLogTracking();

  testAnnotatedElements(
    await initializeLibraryReaderForDirectory(
      'test',
      'xml_converter_src.dart',
    ),
    const XmlSerializableGenerator(),
    expectedAnnotatedTests: [
      'ClassAnnotationAttributeField',
      'ClassAnnotationElementField',
      'ClassAnnotationInconvertibleElementField',
      'ClassAnnotationIterableElementField',
      'ClassAnnotationNullableElementField',
      'FieldAnnotationAttributeField',
      'FieldAnnotationElementField',
      'FieldAnnotationInconvertibleElementField',
      'FieldAnnotationIterableElementField',
      'FieldAnnotationNullableElementField',
      'NullableClassAnnotationElementField',
      'NullableClassAnnotationNullableElementField',
      'NullableFieldAnnotationElementField',
      'NullableFieldAnnotationNullableElementField',
      'NullableSerializableConverterElementField',
      'NullableSerializableConverterNullableElementField',
      'OverrideClassAnnotation',
      'SerializableConverterAttributeField',
      'SerializableConverterElementField',
      'SerializableConverterInconvertibleElementField',
      'SerializableConverterIterableElementField',
      'SerializableConverterNullableElementField',
    ],
    formatOutput: (code) => code,
  );
}
