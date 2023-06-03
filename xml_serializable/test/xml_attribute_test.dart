import 'package:source_gen_test/source_gen_test.dart';
import 'package:xml_serializable/xml_serializable.dart';

Future<void> main() async {
  initializeBuildLogTracking();

  testAnnotatedElements(
    await initializeLibraryReaderForDirectory(
      'test',
      'xml_attribute_src.dart',
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
      'IterableField',
      'NumField',
      'StringField',
      'UriField',
      'NullableBoolField',
      'NullableDateTimeField',
      'NullableDoubleField',
      'NullableDurationField',
      'NullableEnumField',
      'NullableIntField',
      'NullableIterableField',
      'NullableNumField',
      'NullableStringField',
      'NullableUriField',
      'NonDefaultName',
      'NonDefaultNamespace',
      'NonDefaultNameAndNonDefaultNamespace',
      'OverrideFieldRename',
    ],
    formatOutput: (code) => code,
  );
}
