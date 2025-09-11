import 'package:xml_annotation/xml_annotation.dart';

import 'fake_constructor_element_element_annotation.dart';
import 'fake_interface_type.dart';
import 'fake_property_accessor_element_element_annotation.dart';
import 'fake_xml_text_class_element.dart';
import 'fake_xml_text_dart_object.dart';

class FakeXmlTextConstructorElementElementAnnotation
    extends FakeConstructorElementElementAnnotation {
  FakeXmlTextConstructorElementElementAnnotation({
    required XmlText value,
  }) : super(
          enclosingElement: FakeXmlTextClassElement(),
          value: FakeXmlTextDartObject(
            value: value,
          ),
        );
}

class FakeXmlTextPropertyAccessorElementElementAnnotation
    extends FakePropertyAccessorElementElementAnnotation {
  FakeXmlTextPropertyAccessorElementElementAnnotation({
    required XmlText value,
  }) : super(
          returnType: FakeInterfaceType(
            element: FakeXmlTextClassElement(),
          ),
          value: FakeXmlTextDartObject(
            value: value,
          ),
        );
}
