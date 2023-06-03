import 'package:source_gen_test/source_gen_test.dart';
import 'package:xml_serializable/xml_serializable.dart';

Future<void> main() async {
  initializeBuildLogTracking();

  testAnnotatedElements(
    await initializeLibraryReaderForDirectory(
      'test',
      'xml_value_src.dart',
    ),
    const XmlEnumGenerator(),
    expectedAnnotatedTests: [
      'HappyPath',
      'OverrideFieldRename',
    ],
    formatOutput: (code) => code,
  );
}
