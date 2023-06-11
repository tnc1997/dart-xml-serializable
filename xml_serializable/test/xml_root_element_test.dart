import 'package:source_gen_test/source_gen_test.dart';
import 'package:xml_serializable/xml_serializable.dart';

Future<void> main() async {
  initializeBuildLogTracking();

  testAnnotatedElements(
    await initializeLibraryReaderForDirectory(
      'test',
      'xml_root_element_src.dart',
    ),
    const XmlSerializableGenerator(),
    expectedAnnotatedTests: [
      'HappyPath',
      'NonDefaultName',
      'NonDefaultNamespace',
      'NonDefaultNameAndNonDefaultNamespace',
      'CreateMixin',
    ],
    formatOutput: (code) => code,
  );
}
