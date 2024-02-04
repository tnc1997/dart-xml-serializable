import 'package:xml_annotation/xml_annotation.dart';

import 'fake_dart_object.dart';
import 'fake_interface_type.dart';
import 'fake_xml_converter_class_element.dart';

class FakeXmlConverterDartObject<T> extends FakeDartObject<XmlConverter<T>> {
  FakeXmlConverterDartObject({
    super.value,
  }) : super(
          type: FakeInterfaceType(
            element: FakeXmlConverterClassElement(),
          ),
        );
}
