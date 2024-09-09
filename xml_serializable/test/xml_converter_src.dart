import 'package:source_gen_test/source_gen_test.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

@ShouldGenerate(r'''
void _$ClassAnnotationAttributeFieldBuildXmlChildren(ClassAnnotationAttributeField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.toIso8601String();
builder.attribute('value', valueSerialized);
}

ClassAnnotationAttributeField _$ClassAnnotationAttributeFieldFromXmlElement(XmlElement element) {
final value = element.getAttribute('value')!;
return ClassAnnotationAttributeField(value: DateTime.parse(value));
}

List<XmlAttribute> _$ClassAnnotationAttributeFieldToXmlAttributes(ClassAnnotationAttributeField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value.toIso8601String();
final valueConstructed = XmlAttribute(XmlName('value'), valueSerialized);
attributes.add(valueConstructed);
return attributes;
}

List<XmlNode> _$ClassAnnotationAttributeFieldToXmlChildren(ClassAnnotationAttributeField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@annotation.XmlSerializable()
@ElementDateTimeConverter()
class ClassAnnotationAttributeField {
  @annotation.XmlAttribute()
  DateTime value;

  ClassAnnotationAttributeField({required this.value});
}

@ShouldGenerate(r'''
void _$ClassAnnotationElementFieldBuildXmlChildren(ClassAnnotationElementField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { const ElementDateTimeConverter().buildXmlChildren(valueSerialized, builder, namespaces: namespaces); });
}

ClassAnnotationElementField _$ClassAnnotationElementFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!;
return ClassAnnotationElementField(value: const ElementDateTimeConverter().fromXmlElement(value));
}

List<XmlAttribute> _$ClassAnnotationElementFieldToXmlAttributes(ClassAnnotationElementField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$ClassAnnotationElementFieldToXmlChildren(ClassAnnotationElementField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), const ElementDateTimeConverter().toXmlAttributes(valueSerialized, namespaces: namespaces), const ElementDateTimeConverter().toXmlChildren(valueSerialized, namespaces: namespaces));
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable()
@ElementDateTimeConverter()
class ClassAnnotationElementField {
  @annotation.XmlElement()
  DateTime value;

  ClassAnnotationElementField({required this.value});
}

@ShouldGenerate(r'''
void _$ClassAnnotationInconvertibleElementFieldBuildXmlChildren(ClassAnnotationInconvertibleElementField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { builder.text(valueSerialized); });
}

ClassAnnotationInconvertibleElementField _$ClassAnnotationInconvertibleElementFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!.getText()!;
return ClassAnnotationInconvertibleElementField(value: value);
}

List<XmlAttribute> _$ClassAnnotationInconvertibleElementFieldToXmlAttributes(ClassAnnotationInconvertibleElementField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$ClassAnnotationInconvertibleElementFieldToXmlChildren(ClassAnnotationInconvertibleElementField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), [], [XmlText(valueSerialized)]);
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable()
@ElementDateTimeConverter()
class ClassAnnotationInconvertibleElementField {
  @annotation.XmlElement()
  String value;

  ClassAnnotationInconvertibleElementField({required this.value});
}

@ShouldGenerate(r'''
void _$ClassAnnotationNullableElementFieldBuildXmlChildren(ClassAnnotationNullableElementField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { if (valueSerialized != null) { const ElementDateTimeConverter().buildXmlChildren(valueSerialized, builder, namespaces: namespaces); } });
}

ClassAnnotationNullableElementField _$ClassAnnotationNullableElementFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value');
return ClassAnnotationNullableElementField(value: value != null ? const ElementDateTimeConverter().fromXmlElement(value) : null);
}

List<XmlAttribute> _$ClassAnnotationNullableElementFieldToXmlAttributes(ClassAnnotationNullableElementField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$ClassAnnotationNullableElementFieldToXmlChildren(ClassAnnotationNullableElementField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), valueSerialized != null ? const ElementDateTimeConverter().toXmlAttributes(valueSerialized, namespaces: namespaces) : [], valueSerialized != null ? const ElementDateTimeConverter().toXmlChildren(valueSerialized, namespaces: namespaces) : []);
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable()
@ElementDateTimeConverter()
class ClassAnnotationNullableElementField {
  @annotation.XmlElement()
  DateTime? value;

  ClassAnnotationNullableElementField({this.value});
}

@ShouldGenerate(r'''
void _$FieldAnnotationAttributeFieldBuildXmlChildren(FieldAnnotationAttributeField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.toIso8601String();
builder.attribute('value', valueSerialized);
}

FieldAnnotationAttributeField _$FieldAnnotationAttributeFieldFromXmlElement(XmlElement element) {
final value = element.getAttribute('value')!;
return FieldAnnotationAttributeField(value: DateTime.parse(value));
}

List<XmlAttribute> _$FieldAnnotationAttributeFieldToXmlAttributes(FieldAnnotationAttributeField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value.toIso8601String();
final valueConstructed = XmlAttribute(XmlName('value'), valueSerialized);
attributes.add(valueConstructed);
return attributes;
}

List<XmlNode> _$FieldAnnotationAttributeFieldToXmlChildren(FieldAnnotationAttributeField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@annotation.XmlSerializable()
class FieldAnnotationAttributeField {
  @annotation.XmlAttribute()
  @ElementDateTimeConverter()
  DateTime value;

  FieldAnnotationAttributeField({required this.value});
}

@ShouldGenerate(r'''
void _$FieldAnnotationElementFieldBuildXmlChildren(FieldAnnotationElementField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { const ElementDateTimeConverter().buildXmlChildren(valueSerialized, builder, namespaces: namespaces); });
}

FieldAnnotationElementField _$FieldAnnotationElementFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!;
return FieldAnnotationElementField(value: const ElementDateTimeConverter().fromXmlElement(value));
}

List<XmlAttribute> _$FieldAnnotationElementFieldToXmlAttributes(FieldAnnotationElementField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$FieldAnnotationElementFieldToXmlChildren(FieldAnnotationElementField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), const ElementDateTimeConverter().toXmlAttributes(valueSerialized, namespaces: namespaces), const ElementDateTimeConverter().toXmlChildren(valueSerialized, namespaces: namespaces));
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable()
class FieldAnnotationElementField {
  @annotation.XmlElement()
  @ElementDateTimeConverter()
  DateTime value;

  FieldAnnotationElementField({required this.value});
}

@ShouldGenerate(r'''
void _$FieldAnnotationInconvertibleElementFieldBuildXmlChildren(FieldAnnotationInconvertibleElementField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { builder.text(valueSerialized); });
}

FieldAnnotationInconvertibleElementField _$FieldAnnotationInconvertibleElementFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!.getText()!;
return FieldAnnotationInconvertibleElementField(value: value);
}

List<XmlAttribute> _$FieldAnnotationInconvertibleElementFieldToXmlAttributes(FieldAnnotationInconvertibleElementField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$FieldAnnotationInconvertibleElementFieldToXmlChildren(FieldAnnotationInconvertibleElementField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), [], [XmlText(valueSerialized)]);
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable()
class FieldAnnotationInconvertibleElementField {
  @annotation.XmlElement()
  @ElementDateTimeConverter()
  String value;

  FieldAnnotationInconvertibleElementField({required this.value});
}

@ShouldGenerate(r'''
void _$FieldAnnotationNullableElementFieldBuildXmlChildren(FieldAnnotationNullableElementField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { if (valueSerialized != null) { const ElementDateTimeConverter().buildXmlChildren(valueSerialized, builder, namespaces: namespaces); } });
}

FieldAnnotationNullableElementField _$FieldAnnotationNullableElementFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value');
return FieldAnnotationNullableElementField(value: value != null ? const ElementDateTimeConverter().fromXmlElement(value) : null);
}

List<XmlAttribute> _$FieldAnnotationNullableElementFieldToXmlAttributes(FieldAnnotationNullableElementField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$FieldAnnotationNullableElementFieldToXmlChildren(FieldAnnotationNullableElementField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), valueSerialized != null ? const ElementDateTimeConverter().toXmlAttributes(valueSerialized, namespaces: namespaces) : [], valueSerialized != null ? const ElementDateTimeConverter().toXmlChildren(valueSerialized, namespaces: namespaces) : []);
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable()
class FieldAnnotationNullableElementField {
  @annotation.XmlElement()
  @ElementDateTimeConverter()
  DateTime? value;

  FieldAnnotationNullableElementField({this.value});
}

@ShouldGenerate(r'''
void _$NullableClassAnnotationElementFieldBuildXmlChildren(NullableClassAnnotationElementField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.toIso8601String();
builder.element('value', nest: () { builder.text(valueSerialized); });
}

NullableClassAnnotationElementField _$NullableClassAnnotationElementFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!.getText()!;
return NullableClassAnnotationElementField(value: DateTime.parse(value));
}

List<XmlAttribute> _$NullableClassAnnotationElementFieldToXmlAttributes(NullableClassAnnotationElementField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NullableClassAnnotationElementFieldToXmlChildren(NullableClassAnnotationElementField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value.toIso8601String();
final valueConstructed = XmlElement(XmlName('value'), [], [XmlText(valueSerialized)]);
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable()
@ElementNullableDateTimeConverter()
class NullableClassAnnotationElementField {
  @annotation.XmlElement()
  DateTime value;

  NullableClassAnnotationElementField({required this.value});
}

@ShouldGenerate(r'''
void _$NullableClassAnnotationNullableElementFieldBuildXmlChildren(NullableClassAnnotationNullableElementField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { const ElementNullableDateTimeConverter().buildXmlChildren(valueSerialized, builder, namespaces: namespaces); });
}

NullableClassAnnotationNullableElementField _$NullableClassAnnotationNullableElementFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value');
return NullableClassAnnotationNullableElementField(value: value != null ? const ElementNullableDateTimeConverter().fromXmlElement(value) : null);
}

List<XmlAttribute> _$NullableClassAnnotationNullableElementFieldToXmlAttributes(NullableClassAnnotationNullableElementField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NullableClassAnnotationNullableElementFieldToXmlChildren(NullableClassAnnotationNullableElementField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), const ElementNullableDateTimeConverter().toXmlAttributes(valueSerialized, namespaces: namespaces), const ElementNullableDateTimeConverter().toXmlChildren(valueSerialized, namespaces: namespaces));
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable()
@ElementNullableDateTimeConverter()
class NullableClassAnnotationNullableElementField {
  @annotation.XmlElement()
  DateTime? value;

  NullableClassAnnotationNullableElementField({this.value});
}

@ShouldGenerate(r'''
void _$NullableFieldAnnotationElementFieldBuildXmlChildren(NullableFieldAnnotationElementField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.toIso8601String();
builder.element('value', nest: () { builder.text(valueSerialized); });
}

NullableFieldAnnotationElementField _$NullableFieldAnnotationElementFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!.getText()!;
return NullableFieldAnnotationElementField(value: DateTime.parse(value));
}

List<XmlAttribute> _$NullableFieldAnnotationElementFieldToXmlAttributes(NullableFieldAnnotationElementField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NullableFieldAnnotationElementFieldToXmlChildren(NullableFieldAnnotationElementField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value.toIso8601String();
final valueConstructed = XmlElement(XmlName('value'), [], [XmlText(valueSerialized)]);
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable()
class NullableFieldAnnotationElementField {
  @annotation.XmlElement()
  @ElementNullableDateTimeConverter()
  DateTime value;

  NullableFieldAnnotationElementField({required this.value});
}

@ShouldGenerate(r'''
void _$NullableFieldAnnotationNullableElementFieldBuildXmlChildren(NullableFieldAnnotationNullableElementField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { const ElementNullableDateTimeConverter().buildXmlChildren(valueSerialized, builder, namespaces: namespaces); });
}

NullableFieldAnnotationNullableElementField _$NullableFieldAnnotationNullableElementFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value');
return NullableFieldAnnotationNullableElementField(value: value != null ? const ElementNullableDateTimeConverter().fromXmlElement(value) : null);
}

List<XmlAttribute> _$NullableFieldAnnotationNullableElementFieldToXmlAttributes(NullableFieldAnnotationNullableElementField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NullableFieldAnnotationNullableElementFieldToXmlChildren(NullableFieldAnnotationNullableElementField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), const ElementNullableDateTimeConverter().toXmlAttributes(valueSerialized, namespaces: namespaces), const ElementNullableDateTimeConverter().toXmlChildren(valueSerialized, namespaces: namespaces));
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable()
class NullableFieldAnnotationNullableElementField {
  @annotation.XmlElement()
  @ElementNullableDateTimeConverter()
  DateTime? value;

  NullableFieldAnnotationNullableElementField({this.value});
}

@ShouldGenerate(r'''
void _$NullableSerializableConverterElementFieldBuildXmlChildren(NullableSerializableConverterElementField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.toIso8601String();
builder.element('value', nest: () { builder.text(valueSerialized); });
}

NullableSerializableConverterElementField _$NullableSerializableConverterElementFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!.getText()!;
return NullableSerializableConverterElementField(value: DateTime.parse(value));
}

List<XmlAttribute> _$NullableSerializableConverterElementFieldToXmlAttributes(NullableSerializableConverterElementField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NullableSerializableConverterElementFieldToXmlChildren(NullableSerializableConverterElementField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value.toIso8601String();
final valueConstructed = XmlElement(XmlName('value'), [], [XmlText(valueSerialized)]);
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable(
  converters: [
    ElementNullableDateTimeConverter(),
  ],
)
class NullableSerializableConverterElementField {
  @annotation.XmlElement()
  DateTime value;

  NullableSerializableConverterElementField({required this.value});
}

@ShouldGenerate(r'''
void _$NullableSerializableConverterNullableElementFieldBuildXmlChildren(NullableSerializableConverterNullableElementField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { const ElementNullableDateTimeConverter().buildXmlChildren(valueSerialized, builder, namespaces: namespaces); });
}

NullableSerializableConverterNullableElementField _$NullableSerializableConverterNullableElementFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value');
return NullableSerializableConverterNullableElementField(value: value != null ? const ElementNullableDateTimeConverter().fromXmlElement(value) : null);
}

List<XmlAttribute> _$NullableSerializableConverterNullableElementFieldToXmlAttributes(NullableSerializableConverterNullableElementField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NullableSerializableConverterNullableElementFieldToXmlChildren(NullableSerializableConverterNullableElementField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), const ElementNullableDateTimeConverter().toXmlAttributes(valueSerialized, namespaces: namespaces), const ElementNullableDateTimeConverter().toXmlChildren(valueSerialized, namespaces: namespaces));
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable(
  converters: [
    ElementNullableDateTimeConverter(),
  ],
)
class NullableSerializableConverterNullableElementField {
  @annotation.XmlElement()
  DateTime? value;

  NullableSerializableConverterNullableElementField({this.value});
}

@ShouldGenerate(r'''
void _$OverrideClassAnnotationBuildXmlChildren(OverrideClassAnnotation instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { const ElementDateTimeConverter().buildXmlChildren(valueSerialized, builder, namespaces: namespaces); });
}

OverrideClassAnnotation _$OverrideClassAnnotationFromXmlElement(XmlElement element) {
final value = element.getElement('value')!;
return OverrideClassAnnotation(value: const ElementDateTimeConverter().fromXmlElement(value));
}

List<XmlAttribute> _$OverrideClassAnnotationToXmlAttributes(OverrideClassAnnotation instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$OverrideClassAnnotationToXmlChildren(OverrideClassAnnotation instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), const ElementDateTimeConverter().toXmlAttributes(valueSerialized, namespaces: namespaces), const ElementDateTimeConverter().toXmlChildren(valueSerialized, namespaces: namespaces));
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable()
@AttributeDateTimeConverter()
class OverrideClassAnnotation {
  @annotation.XmlElement()
  @ElementDateTimeConverter()
  DateTime value;

  OverrideClassAnnotation({required this.value});
}

@ShouldGenerate(r'''
void _$SerializableConverterAttributeFieldBuildXmlChildren(SerializableConverterAttributeField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.toIso8601String();
builder.attribute('value', valueSerialized);
}

SerializableConverterAttributeField _$SerializableConverterAttributeFieldFromXmlElement(XmlElement element) {
final value = element.getAttribute('value')!;
return SerializableConverterAttributeField(value: DateTime.parse(value));
}

List<XmlAttribute> _$SerializableConverterAttributeFieldToXmlAttributes(SerializableConverterAttributeField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value.toIso8601String();
final valueConstructed = XmlAttribute(XmlName('value'), valueSerialized);
attributes.add(valueConstructed);
return attributes;
}

List<XmlNode> _$SerializableConverterAttributeFieldToXmlChildren(SerializableConverterAttributeField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@annotation.XmlSerializable(
  converters: [
    ElementDateTimeConverter(),
  ],
)
class SerializableConverterAttributeField {
  @annotation.XmlAttribute()
  DateTime value;

  SerializableConverterAttributeField({required this.value});
}

@ShouldGenerate(r'''
void _$SerializableConverterElementFieldBuildXmlChildren(SerializableConverterElementField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { const ElementDateTimeConverter().buildXmlChildren(valueSerialized, builder, namespaces: namespaces); });
}

SerializableConverterElementField _$SerializableConverterElementFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!;
return SerializableConverterElementField(value: const ElementDateTimeConverter().fromXmlElement(value));
}

List<XmlAttribute> _$SerializableConverterElementFieldToXmlAttributes(SerializableConverterElementField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$SerializableConverterElementFieldToXmlChildren(SerializableConverterElementField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), const ElementDateTimeConverter().toXmlAttributes(valueSerialized, namespaces: namespaces), const ElementDateTimeConverter().toXmlChildren(valueSerialized, namespaces: namespaces));
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable(
  converters: [
    ElementDateTimeConverter(),
  ],
)
class SerializableConverterElementField {
  @annotation.XmlElement()
  DateTime value;

  SerializableConverterElementField({required this.value});
}

@ShouldGenerate(r'''
void _$SerializableConverterInconvertibleElementFieldBuildXmlChildren(SerializableConverterInconvertibleElementField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { builder.text(valueSerialized); });
}

SerializableConverterInconvertibleElementField _$SerializableConverterInconvertibleElementFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!.getText()!;
return SerializableConverterInconvertibleElementField(value: value);
}

List<XmlAttribute> _$SerializableConverterInconvertibleElementFieldToXmlAttributes(SerializableConverterInconvertibleElementField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$SerializableConverterInconvertibleElementFieldToXmlChildren(SerializableConverterInconvertibleElementField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), [], [XmlText(valueSerialized)]);
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable(
  converters: [
    ElementDateTimeConverter(),
  ],
)
class SerializableConverterInconvertibleElementField {
  @annotation.XmlElement()
  String value;

  SerializableConverterInconvertibleElementField({required this.value});
}

@ShouldGenerate(r'''
void _$SerializableConverterNullableElementFieldBuildXmlChildren(SerializableConverterNullableElementField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { if (valueSerialized != null) { const ElementDateTimeConverter().buildXmlChildren(valueSerialized, builder, namespaces: namespaces); } });
}

SerializableConverterNullableElementField _$SerializableConverterNullableElementFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value');
return SerializableConverterNullableElementField(value: value != null ? const ElementDateTimeConverter().fromXmlElement(value) : null);
}

List<XmlAttribute> _$SerializableConverterNullableElementFieldToXmlAttributes(SerializableConverterNullableElementField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$SerializableConverterNullableElementFieldToXmlChildren(SerializableConverterNullableElementField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), valueSerialized != null ? const ElementDateTimeConverter().toXmlAttributes(valueSerialized, namespaces: namespaces) : [], valueSerialized != null ? const ElementDateTimeConverter().toXmlChildren(valueSerialized, namespaces: namespaces) : []);
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable(
  converters: [
    ElementDateTimeConverter(),
  ],
)
class SerializableConverterNullableElementField {
  @annotation.XmlElement()
  DateTime? value;

  SerializableConverterNullableElementField({this.value});
}

/// An XML converter that converts a DateTime to/from XML attributes for example:
///
/// ```xml
/// <value year='1970' month='1' day='1'/>
/// ```
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

/// An XML converter that converts a nullable DateTime to/from XML attributes for example:
///
/// ```xml
/// <value year='1970' month='1' day='1'/>
/// ```
class AttributeNullableDateTimeConverter
    implements annotation.XmlConverter<DateTime?> {
  const AttributeNullableDateTimeConverter();

  @override
  void buildXmlChildren(
    DateTime? instance,
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    if (instance != null) {
      builder.attribute('year', '${instance.year}');
      builder.attribute('month', '${instance.month}');
      builder.attribute('day', '${instance.day}');
    } else {
      builder.attribute('xsi:nil', 'true');
    }
  }

  @override
  DateTime? fromXmlElement(
    XmlElement element,
  ) {
    final year = element.getAttribute('year');
    final month = element.getAttribute('month');
    final day = element.getAttribute('day');

    if (year == null || month == null || day == null) {
      return null;
    }

    return DateTime(
      int.parse(year),
      int.parse(month),
      int.parse(day),
    );
  }

  @override
  List<XmlAttribute> toXmlAttributes(
    DateTime? instance, {
    Map<String, String?> namespaces = const {},
  }) {
    if (instance != null) {
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
    } else {
      return [
        XmlAttribute(
          XmlName('nil', 'xsi'),
          'true',
        ),
      ];
    }
  }

  @override
  List<XmlNode> toXmlChildren(
    DateTime? instance, {
    Map<String, String?> namespaces = const {},
  }) {
    return const [];
  }
}

/// An XML converter that converts a DateTime to/from XML elements for example:
///
/// ```xml
/// <value>
///   <year>1970</year>
///   <month>1</month>
///   <day>1</day>
/// </value>
/// ```
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

/// An XML converter that converts a nullable DateTime to/from XML elements for example:
///
/// ```xml
/// <value>
///   <year>1970</year>
///   <month>1</month>
///   <day>1</day>
/// </value>
/// ```
class ElementNullableDateTimeConverter
    implements annotation.XmlConverter<DateTime?> {
  const ElementNullableDateTimeConverter();

  @override
  void buildXmlChildren(
    DateTime? instance,
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    if (instance != null) {
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
    } else {
      builder.attribute('xsi:nil', 'true');
    }
  }

  @override
  DateTime? fromXmlElement(
    XmlElement element,
  ) {
    final year = element.getElement('year')?.getText();
    final month = element.getElement('month')?.getText();
    final day = element.getElement('day')?.getText();

    if (year == null || month == null || day == null) {
      return null;
    }

    return DateTime(
      int.parse(year),
      int.parse(month),
      int.parse(day),
    );
  }

  @override
  List<XmlAttribute> toXmlAttributes(
    DateTime? instance, {
    Map<String, String?> namespaces = const {},
  }) {
    return [
      if (instance == null)
        XmlAttribute(
          XmlName('nil', 'xsi'),
          'true',
        ),
    ];
  }

  @override
  List<XmlNode> toXmlChildren(
    DateTime? instance, {
    Map<String, String?> namespaces = const {},
  }) {
    return [
      if (instance != null)
        XmlElement(
          XmlName('year'),
          const [],
          [
            XmlText('${instance.year}'),
          ],
        ),
      if (instance != null)
        XmlElement(
          XmlName('month'),
          const [],
          [
            XmlText('${instance.month}'),
          ],
        ),
      if (instance != null)
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
