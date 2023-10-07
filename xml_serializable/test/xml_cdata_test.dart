import 'package:source_gen_test/source_gen_test.dart';
import 'package:xml_serializable/xml_serializable.dart';

Future<void> main() async {
  initializeBuildLogTracking();

  testAnnotatedElements(
    await initializeLibraryReaderForDirectory(
      'test',
      'xml_cdata_src.dart',
    ),
    const XmlSerializableGenerator(),
    expectedAnnotatedTests: [
      'BoolField',
      'DateTimeField',
      'DoubleField',
      'DurationField',
      'DynamicField',
      'EnumField',
      'IntField',
      'NumField',
      'StringField',
      'UriField',
      'NullableBoolField',
      'NullableDateTimeField',
      'NullableDoubleField',
      'NullableDurationField',
      'NullableEnumField',
      'NullableIntField',
      'NullableNumField',
      'NullableStringField',
      'NullableUriField',
    ],
    formatOutput: (code) => code,
  );
}
