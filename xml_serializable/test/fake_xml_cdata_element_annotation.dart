import 'package:xml_annotation/xml_annotation.dart';

import 'fake_constructor_element_element_annotation.dart';
import 'fake_interface_type.dart';
import 'fake_property_accessor_element_element_annotation.dart';
import 'fake_xml_cdata_class_element.dart';
import 'fake_xml_cdata_dart_object.dart';

class FakeXmlCDATAConstructorElementElementAnnotation
    extends FakeConstructorElementElementAnnotation {
  FakeXmlCDATAConstructorElementElementAnnotation({
    required XmlCDATA value,
  }) : super(
          enclosingElement3: FakeXmlCDATAClassElement(),
          value: FakeXmlCDATADartObject(
            value: value,
          ),
        );
}

class FakeXmlCDATAPropertyAccessorElementElementAnnotation
    extends FakePropertyAccessorElementElementAnnotation {
  FakeXmlCDATAPropertyAccessorElementElementAnnotation({
    required XmlCDATA value,
  }) : super(
          returnType: FakeInterfaceType(
            element: FakeXmlCDATAClassElement(),
          ),
          value: FakeXmlCDATADartObject(
            value: value,
          ),
        );
}
