import 'package:analyzer/dart/element/element.dart';
import 'package:test/fake.dart';

import 'fake_library_element.dart';

class FakeXmlConverterClassElement extends Fake implements ClassElement {
  @override
  final library = FakeLibraryElement(
    identifier: 'package:xml_annotation/src/annotations/xml_converter.dart',
  );

  @override
  final metadata = [];

  @override
  final name = 'XmlConverter';

  @override
  final List<TypeParameterElement> typeParameters;

  FakeXmlConverterClassElement({
    List<TypeParameterElement>? typeParameters,
  }) : typeParameters = typeParameters ?? [];
}
