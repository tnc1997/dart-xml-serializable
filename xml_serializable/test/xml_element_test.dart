import 'package:source_gen_test/source_gen_test.dart';
import 'package:xml_serializable/xml_serializable.dart';

Future<void> main() async {
  initializeBuildLogTracking();

  testAnnotatedElements(
    await initializeLibraryReaderForDirectory(
      'test',
      'xml_element_src.dart',
    ),
    const XmlSerializableGenerator(),
    expectedAnnotatedTests: [
      'BoolField',
      'CustomField',
      'DateTimeField',
      'DoubleField',
      'DurationField',
      'DynamicField',
      'EnumField',
      'IntField',
      'IterableField',
      'ListField',
      'NumField',
      'SetField',
      'StringField',
      'UriField',
      'NullableBoolField',
      'NullableCustomField',
      'NullableDateTimeField',
      'NullableDoubleField',
      'NullableDurationField',
      'NullableEnumField',
      'NullableIntField',
      'NullableIterableField',
      'NullableListField',
      'NullableNumField',
      'NullableSetField',
      'NullableStringField',
      'NullableUriField',
      'ImportPrefix',
      'InheritanceSubclass',
      'NonDefaultName',
      'NonDefaultNamespace',
      'NonDefaultNameAndNonDefaultNamespace',
      'NonDefaultIsSelfClosing',
      'NonDefaultIncludeIfNull',
      'OverrideFieldRename',
    ],
    formatOutput: (code) => code,
  );
}
