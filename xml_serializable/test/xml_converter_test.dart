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
      'ClassAnnotationConvertibleElementField',
      'ClassAnnotationInconvertibleElementField',
      'ClassAnnotationNullableConvertibleElementField',
      'FieldAnnotationAttributeField',
      'FieldAnnotationConvertibleElementField',
      'FieldAnnotationInconvertibleElementField',
      'FieldAnnotationNullableConvertibleElementField',
      'OverrideClassAnnotation',
      'SerializableConverterAttributeField',
      'SerializableConverterConvertibleElementField',
      'SerializableConverterInconvertibleElementField',
      'SerializableConverterNullableConvertibleElementField',
    ],
    formatOutput: (code) => code,
  );
}
