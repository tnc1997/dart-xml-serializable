import 'package:source_gen_test/source_gen_test.dart';
import 'package:xml_serializable/xml_serializable.dart';

Future<void> main() async {
  initializeBuildLogTracking();

  testAnnotatedElements(
    await initializeLibraryReaderForDirectory(
      'test',
      'xml_enum_src.dart',
    ),
    const XmlEnumGenerator(),
    expectedAnnotatedTests: [
      'HappyPath',
      'KebabFieldRename',
      'NoneFieldRename',
      'PascalFieldRename',
      'SnakeFieldRename',
      'UnsupportedElement',
    ],
    formatOutput: (code) => code,
  );
}
