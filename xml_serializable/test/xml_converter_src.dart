import 'package:source_gen_test/source_gen_test.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

@ShouldGenerate(r'''
void _$AnnotatedClassConvertibleFieldBuildXmlChildren(AnnotatedClassConvertibleField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { const AttributeDateTimeConverter().buildXmlChildren(valueSerialized, builder, namespaces: namespaces); });
}

AnnotatedClassConvertibleField _$AnnotatedClassConvertibleFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!;
return AnnotatedClassConvertibleField(value: const AttributeDateTimeConverter().fromXmlElement(value));
}

List<XmlAttribute> _$AnnotatedClassConvertibleFieldToXmlAttributes(AnnotatedClassConvertibleField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$AnnotatedClassConvertibleFieldToXmlChildren(AnnotatedClassConvertibleField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), const AttributeDateTimeConverter().toXmlAttributes(valueSerialized, namespaces: namespaces), const AttributeDateTimeConverter().toXmlChildren(valueSerialized, namespaces: namespaces));
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable()
@AttributeDateTimeConverter()
class AnnotatedClassConvertibleField {
  @annotation.XmlElement()
  DateTime value;

  AnnotatedClassConvertibleField({required this.value});
}

@ShouldGenerate(r'''
void _$AnnotatedClassInconvertibleFieldBuildXmlChildren(AnnotatedClassInconvertibleField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { builder.text(valueSerialized); });
}

AnnotatedClassInconvertibleField _$AnnotatedClassInconvertibleFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!.getText()!;
return AnnotatedClassInconvertibleField(value: value);
}

List<XmlAttribute> _$AnnotatedClassInconvertibleFieldToXmlAttributes(AnnotatedClassInconvertibleField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$AnnotatedClassInconvertibleFieldToXmlChildren(AnnotatedClassInconvertibleField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), [], [XmlText(valueSerialized)]);
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable()
@AttributeDateTimeConverter()
class AnnotatedClassInconvertibleField {
  @annotation.XmlElement()
  String value;

  AnnotatedClassInconvertibleField({required this.value});
}

@ShouldGenerate(r'''
void _$AnnotatedClassNullableConvertibleFieldBuildXmlChildren(AnnotatedClassNullableConvertibleField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { if (valueSerialized != null) { const AttributeDateTimeConverter().buildXmlChildren(valueSerialized, builder, namespaces: namespaces); } });
}

AnnotatedClassNullableConvertibleField _$AnnotatedClassNullableConvertibleFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value');
return AnnotatedClassNullableConvertibleField(value: value != null ? const AttributeDateTimeConverter().fromXmlElement(value) : null);
}

List<XmlAttribute> _$AnnotatedClassNullableConvertibleFieldToXmlAttributes(AnnotatedClassNullableConvertibleField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$AnnotatedClassNullableConvertibleFieldToXmlChildren(AnnotatedClassNullableConvertibleField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), valueSerialized != null ? const AttributeDateTimeConverter().toXmlAttributes(valueSerialized, namespaces: namespaces) : [], valueSerialized != null ? const AttributeDateTimeConverter().toXmlChildren(valueSerialized, namespaces: namespaces) : []);
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable()
@AttributeDateTimeConverter()
class AnnotatedClassNullableConvertibleField {
  @annotation.XmlElement()
  DateTime? value;

  AnnotatedClassNullableConvertibleField({this.value});
}

@ShouldGenerate(r'''
void _$AnnotatedFieldConvertibleFieldBuildXmlChildren(AnnotatedFieldConvertibleField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { const ElementDateTimeConverter().buildXmlChildren(valueSerialized, builder, namespaces: namespaces); });
}

AnnotatedFieldConvertibleField _$AnnotatedFieldConvertibleFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!;
return AnnotatedFieldConvertibleField(value: const ElementDateTimeConverter().fromXmlElement(value));
}

List<XmlAttribute> _$AnnotatedFieldConvertibleFieldToXmlAttributes(AnnotatedFieldConvertibleField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$AnnotatedFieldConvertibleFieldToXmlChildren(AnnotatedFieldConvertibleField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), const ElementDateTimeConverter().toXmlAttributes(valueSerialized, namespaces: namespaces), const ElementDateTimeConverter().toXmlChildren(valueSerialized, namespaces: namespaces));
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable()
class AnnotatedFieldConvertibleField {
  @annotation.XmlElement()
  @ElementDateTimeConverter()
  DateTime value;

  AnnotatedFieldConvertibleField({required this.value});
}

@ShouldGenerate(r'''
void _$AnnotatedFieldInconvertibleFieldBuildXmlChildren(AnnotatedFieldInconvertibleField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { builder.text(valueSerialized); });
}

AnnotatedFieldInconvertibleField _$AnnotatedFieldInconvertibleFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!.getText()!;
return AnnotatedFieldInconvertibleField(value: value);
}

List<XmlAttribute> _$AnnotatedFieldInconvertibleFieldToXmlAttributes(AnnotatedFieldInconvertibleField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$AnnotatedFieldInconvertibleFieldToXmlChildren(AnnotatedFieldInconvertibleField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), [], [XmlText(valueSerialized)]);
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable()
class AnnotatedFieldInconvertibleField {
  @annotation.XmlElement()
  @ElementDateTimeConverter()
  String value;

  AnnotatedFieldInconvertibleField({required this.value});
}

@ShouldGenerate(r'''
void _$AnnotatedFieldNullableConvertibleFieldBuildXmlChildren(AnnotatedFieldNullableConvertibleField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { if (valueSerialized != null) { const ElementDateTimeConverter().buildXmlChildren(valueSerialized, builder, namespaces: namespaces); } });
}

AnnotatedFieldNullableConvertibleField _$AnnotatedFieldNullableConvertibleFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value');
return AnnotatedFieldNullableConvertibleField(value: value != null ? const ElementDateTimeConverter().fromXmlElement(value) : null);
}

List<XmlAttribute> _$AnnotatedFieldNullableConvertibleFieldToXmlAttributes(AnnotatedFieldNullableConvertibleField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$AnnotatedFieldNullableConvertibleFieldToXmlChildren(AnnotatedFieldNullableConvertibleField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), valueSerialized != null ? const ElementDateTimeConverter().toXmlAttributes(valueSerialized, namespaces: namespaces) : [], valueSerialized != null ? const ElementDateTimeConverter().toXmlChildren(valueSerialized, namespaces: namespaces) : []);
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable()
class AnnotatedFieldNullableConvertibleField {
  @annotation.XmlElement()
  @ElementDateTimeConverter()
  DateTime? value;

  AnnotatedFieldNullableConvertibleField({this.value});
}

@ShouldGenerate(r'''
void _$OverrideAnnotatedClassBuildXmlChildren(OverrideAnnotatedClass instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { const ElementDateTimeConverter().buildXmlChildren(valueSerialized, builder, namespaces: namespaces); });
}

OverrideAnnotatedClass _$OverrideAnnotatedClassFromXmlElement(XmlElement element) {
final value = element.getElement('value')!;
return OverrideAnnotatedClass(value: const ElementDateTimeConverter().fromXmlElement(value));
}

List<XmlAttribute> _$OverrideAnnotatedClassToXmlAttributes(OverrideAnnotatedClass instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$OverrideAnnotatedClassToXmlChildren(OverrideAnnotatedClass instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), const ElementDateTimeConverter().toXmlAttributes(valueSerialized, namespaces: namespaces), const ElementDateTimeConverter().toXmlChildren(valueSerialized, namespaces: namespaces));
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable()
@AttributeDateTimeConverter()
class OverrideAnnotatedClass {
  @annotation.XmlElement()
  @ElementDateTimeConverter()
  DateTime value;

  OverrideAnnotatedClass({required this.value});
}

class AttributeDateTimeConverter implements annotation.XmlConverter<DateTime> {
  const AttributeDateTimeConverter();

  @override
  void buildXmlChildren(
    DateTime instance,
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    builder.attribute('year', '${instance.year}');
    builder.attribute('month', '${instance.month}');
    builder.attribute('day', '${instance.day}');
  }

  @override
  DateTime fromXmlElement(
    XmlElement element,
  ) {
    return DateTime(
      int.parse(element.getAttribute('year')!),
      int.parse(element.getAttribute('month')!),
      int.parse(element.getAttribute('day')!),
    );
  }

  @override
  List<XmlAttribute> toXmlAttributes(
    DateTime instance, {
    Map<String, String?> namespaces = const {},
  }) {
    return [
      XmlAttribute(
        XmlName('year'),
        '${instance.year}',
      ),
      XmlAttribute(
        XmlName('month'),
        '${instance.month}',
      ),
      XmlAttribute(
        XmlName('day'),
        '${instance.day}',
      ),
    ];
  }

  @override
  List<XmlNode> toXmlChildren(
    DateTime instance, {
    Map<String, String?> namespaces = const {},
  }) {
    return const [];
  }
}

class ElementDateTimeConverter implements annotation.XmlConverter<DateTime> {
  const ElementDateTimeConverter();

  @override
  void buildXmlChildren(
    DateTime instance,
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    builder.element(
      'year',
      nest: () {
        builder.text('${instance.year}');
      },
    );

    builder.element(
      'month',
      nest: () {
        builder.text('${instance.month}');
      },
    );

    builder.element(
      'day',
      nest: () {
        builder.text('${instance.day}');
      },
    );
  }

  @override
  DateTime fromXmlElement(
    XmlElement element,
  ) {
    return DateTime(
      int.parse(element.getElement('year')!.getText()!),
      int.parse(element.getElement('month')!.getText()!),
      int.parse(element.getElement('day')!.getText()!),
    );
  }

  @override
  List<XmlAttribute> toXmlAttributes(
    DateTime instance, {
    Map<String, String?> namespaces = const {},
  }) {
    return const [];
  }

  @override
  List<XmlNode> toXmlChildren(
    DateTime instance, {
    Map<String, String?> namespaces = const {},
  }) {
    return [
      XmlElement(
        XmlName('year'),
        const [],
        [
          XmlText('${instance.year}'),
        ],
      ),
      XmlElement(
        XmlName('month'),
        const [],
        [
          XmlText('${instance.month}'),
        ],
      ),
      XmlElement(
        XmlName('day'),
        const [],
        [
          XmlText('${instance.day}'),
        ],
      ),
    ];
  }
}
