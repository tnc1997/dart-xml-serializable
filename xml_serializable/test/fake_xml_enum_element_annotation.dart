import 'package:xml_annotation/xml_annotation.dart';

import 'fake_constructor_element_element_annotation.dart';
import 'fake_interface_type.dart';
import 'fake_property_accessor_element_element_annotation.dart';
import 'fake_xml_enum_class_element.dart';
import 'fake_xml_enum_dart_object.dart';

class FakeXmlEnumConstructorElementElementAnnotation
    extends FakeConstructorElementElementAnnotation {
  FakeXmlEnumConstructorElementElementAnnotation({
    required XmlEnum value,
  }) : super(
          enclosingElement: FakeXmlEnumClassElement(),
          value: FakeXmlEnumDartObject(
            value: value,
          ),
        );
}

class FakeXmlEnumPropertyAccessorElementElementAnnotation
    extends FakePropertyAccessorElementElementAnnotation {
  FakeXmlEnumPropertyAccessorElementElementAnnotation({
    required XmlEnum value,
  }) : super(
          returnType: FakeInterfaceType(
            element: FakeXmlEnumClassElement(),
          ),
          value: FakeXmlEnumDartObject(
            value: value,
          ),
        );
}
