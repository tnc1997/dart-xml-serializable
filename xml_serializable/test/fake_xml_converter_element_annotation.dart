import 'package:xml_annotation/xml_annotation.dart';

import 'fake_constructor_element_element_annotation.dart';
import 'fake_interface_type.dart';
import 'fake_property_accessor_element_element_annotation.dart';
import 'fake_xml_converter_class_element.dart';
import 'fake_xml_converter_dart_object.dart';

class FakeXmlConverterConstructorElementElementAnnotation<T>
    extends FakeConstructorElementElementAnnotation {
  FakeXmlConverterConstructorElementElementAnnotation({
    XmlConverter<T>? value,
  }) : super(
          enclosingElement: FakeXmlConverterClassElement(),
          value: FakeXmlConverterDartObject(
            value: value,
          ),
        );
}

class FakeXmlConverterPropertyAccessorElementElementAnnotation<T>
    extends FakePropertyAccessorElementElementAnnotation {
  FakeXmlConverterPropertyAccessorElementElementAnnotation({
    XmlConverter<T>? value,
  }) : super(
          returnType: FakeInterfaceType(
            element: FakeXmlConverterClassElement(),
          ),
          value: FakeXmlConverterDartObject(
            value: value,
          ),
        );
}
