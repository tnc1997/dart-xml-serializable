import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:test/fake.dart';

import 'fake_class_element.dart';
import 'fake_interface_type.dart';
import 'fake_library_element.dart';

class FakeXmlCDATADartObject extends Fake implements DartObject {
  @override
  final DartType type = FakeInterfaceType(
    element: FakeClassElement(
      library: FakeLibraryElement(
        identifier: 'package:xml_annotation/src/annotations/xml_cdata.dart',
      ),
      name: 'XmlCDATA',
    ),
  );
}
