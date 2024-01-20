import 'package:analyzer/dart/element/element.dart';
import 'package:test/fake.dart';

import 'fake_library_element.dart';

class FakeXmlElementConverterClassElement extends Fake implements ClassElement {
  @override
  final library = FakeLibraryElement(
    identifier: 'package:xml_annotation/src/annotations/xml_element_converter.dart',
  );

  @override
  final metadata = [];

  @override
  final name = 'XmlElementConverter';

  @override
  final List<TypeParameterElement> typeParameters;

  FakeXmlElementConverterClassElement({
    List<TypeParameterElement>? typeParameters,
  }) : typeParameters = typeParameters ?? [];
}
