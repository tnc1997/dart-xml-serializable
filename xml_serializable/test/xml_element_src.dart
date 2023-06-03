import 'package:source_gen_test/source_gen_test.dart';
import 'package:xml_annotation/xml_annotation.dart';

@ShouldGenerate(r'''
void _$BoolFieldBuildXmlChildren(BoolField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value == true ? 'true' : 'false';
builder.element('value', nest: () { builder.text(valueSerialized); });
}

BoolField _$BoolFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!.getText()!;
return BoolField(value: value == 'true' || value == '1' ? true : value == 'false' || value == '0' ? false : throw FormatException('Invalid bool format', value));
}

List<XmlAttribute> _$BoolFieldToXmlAttributes(BoolField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$BoolFieldToXmlChildren(BoolField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value == true ? 'true' : 'false';
final valueConstructed = XmlElement(XmlName('value'), [], [XmlText(valueSerialized)]);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class BoolField {
  @XmlElement()
  bool value;

  BoolField({required this.value});
}

@ShouldGenerate(r'''
void _$CustomFieldBuildXmlChildren(CustomField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { valueSerialized.buildXmlChildren(builder, namespaces: namespaces); });
}

CustomField _$CustomFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!;
return CustomField(value: HelloWorld.fromXmlElement(value));
}

List<XmlAttribute> _$CustomFieldToXmlAttributes(CustomField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$CustomFieldToXmlChildren(CustomField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), valueSerialized.toXmlAttributes(namespaces: namespaces), valueSerialized.toXmlChildren(namespaces: namespaces));
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class CustomField {
  @XmlElement()
  HelloWorld value;

  CustomField({required this.value});
}

@ShouldGenerate(r'''
void _$DateTimeFieldBuildXmlChildren(DateTimeField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.toIso8601String();
builder.element('value', nest: () { builder.text(valueSerialized); });
}

DateTimeField _$DateTimeFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!.getText()!;
return DateTimeField(value: DateTime.parse(value));
}

List<XmlAttribute> _$DateTimeFieldToXmlAttributes(DateTimeField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$DateTimeFieldToXmlChildren(DateTimeField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value.toIso8601String();
final valueConstructed = XmlElement(XmlName('value'), [], [XmlText(valueSerialized)]);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class DateTimeField {
  @XmlElement()
  DateTime value;

  DateTimeField({required this.value});
}

@ShouldGenerate(r'''
void _$DoubleFieldBuildXmlChildren(DoubleField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.toString();
builder.element('value', nest: () { builder.text(valueSerialized); });
}

DoubleField _$DoubleFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!.getText()!;
return DoubleField(value: double.parse(value));
}

List<XmlAttribute> _$DoubleFieldToXmlAttributes(DoubleField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$DoubleFieldToXmlChildren(DoubleField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value.toString();
final valueConstructed = XmlElement(XmlName('value'), [], [XmlText(valueSerialized)]);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class DoubleField {
  @XmlElement()
  double value;

  DoubleField({required this.value});
}

@ShouldGenerate(r'''
void _$DurationFieldBuildXmlChildren(DurationField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.inMicroseconds.toString();
builder.element('value', nest: () { builder.text(valueSerialized); });
}

DurationField _$DurationFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!.getText()!;
return DurationField(value: Duration(microseconds: int.parse(value)));
}

List<XmlAttribute> _$DurationFieldToXmlAttributes(DurationField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$DurationFieldToXmlChildren(DurationField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value.inMicroseconds.toString();
final valueConstructed = XmlElement(XmlName('value'), [], [XmlText(valueSerialized)]);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class DurationField {
  @XmlElement()
  Duration value;

  DurationField({required this.value});
}

@ShouldGenerate(r'''
void _$DynamicFieldBuildXmlChildren(DynamicField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { if (valueSerialized != null) { builder.text(valueSerialized); } });
}

DynamicField _$DynamicFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')?.getText();
return DynamicField(value: value);
}

List<XmlAttribute> _$DynamicFieldToXmlAttributes(DynamicField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$DynamicFieldToXmlChildren(DynamicField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), [], valueSerialized != null ? [XmlText(valueSerialized)] : []);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class DynamicField {
  @XmlElement()
  dynamic value;

  DynamicField({this.value});
}

@ShouldGenerate(r'''
void _$EnumFieldBuildXmlChildren(EnumField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = $FooBarEnumMap[value]!;
builder.element('value', nest: () { builder.text(valueSerialized); });
}

EnumField _$EnumFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!.getText()!;
return EnumField(value: $FooBarEnumMap.entries.singleWhere((fooBarEnumMapEntry) => fooBarEnumMapEntry.value == value, orElse: () => throw ArgumentError('`$value` is not one of the supported values: ${$FooBarEnumMap.values.join(', ')}')).key);
}

List<XmlAttribute> _$EnumFieldToXmlAttributes(EnumField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$EnumFieldToXmlChildren(EnumField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = $FooBarEnumMap[value]!;
final valueConstructed = XmlElement(XmlName('value'), [], [XmlText(valueSerialized)]);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class EnumField {
  @XmlElement()
  FooBar value;

  EnumField({required this.value});
}

@ShouldGenerate(r'''
void _$IntFieldBuildXmlChildren(IntField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.toString();
builder.element('value', nest: () { builder.text(valueSerialized); });
}

IntField _$IntFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!.getText()!;
return IntField(value: int.parse(value));
}

List<XmlAttribute> _$IntFieldToXmlAttributes(IntField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$IntFieldToXmlChildren(IntField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value.toString();
final valueConstructed = XmlElement(XmlName('value'), [], [XmlText(valueSerialized)]);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class IntField {
  @XmlElement()
  int value;

  IntField({required this.value});
}

@ShouldGenerate(r'''
void _$IterableFieldBuildXmlChildren(IterableField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
for (final value in valueSerialized) { builder.element('value', nest: () { builder.text(value); }); }
}

IterableField _$IterableFieldFromXmlElement(XmlElement element) {
final value = element.getElements('value')!.map((e) => e.getText()).whereType<String>();
return IterableField(value: value);
}

List<XmlAttribute> _$IterableFieldToXmlAttributes(IterableField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$IterableFieldToXmlChildren(IterableField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = valueSerialized.map((e) => XmlElement(XmlName('value'), [], [XmlText(e)]));
children.addAll(valueConstructed);
return children;
}''')
@XmlSerializable()
class IterableField {
  @XmlElement()
  Iterable<String> value;

  IterableField({required this.value});
}

@ShouldGenerate(r'''
void _$ListFieldBuildXmlChildren(ListField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
for (final value in valueSerialized) { builder.element('value', nest: () { builder.text(value); }); }
}

ListField _$ListFieldFromXmlElement(XmlElement element) {
final value = element.getElements('value')!.map((e) => e.getText()).whereType<String>();
return ListField(value: value.toList());
}

List<XmlAttribute> _$ListFieldToXmlAttributes(ListField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$ListFieldToXmlChildren(ListField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = valueSerialized.map((e) => XmlElement(XmlName('value'), [], [XmlText(e)]));
children.addAll(valueConstructed);
return children;
}''')
@XmlSerializable()
class ListField {
  @XmlElement()
  List<String> value;

  ListField({required this.value});
}

@ShouldGenerate(r'''
void _$NumFieldBuildXmlChildren(NumField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.toString();
builder.element('value', nest: () { builder.text(valueSerialized); });
}

NumField _$NumFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!.getText()!;
return NumField(value: num.parse(value));
}

List<XmlAttribute> _$NumFieldToXmlAttributes(NumField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NumFieldToXmlChildren(NumField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value.toString();
final valueConstructed = XmlElement(XmlName('value'), [], [XmlText(valueSerialized)]);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class NumField {
  @XmlElement()
  num value;

  NumField({required this.value});
}

@ShouldGenerate(r'''
void _$SetFieldBuildXmlChildren(SetField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
for (final value in valueSerialized) { builder.element('value', nest: () { builder.text(value); }); }
}

SetField _$SetFieldFromXmlElement(XmlElement element) {
final value = element.getElements('value')!.map((e) => e.getText()).whereType<String>();
return SetField(value: value.toSet());
}

List<XmlAttribute> _$SetFieldToXmlAttributes(SetField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$SetFieldToXmlChildren(SetField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = valueSerialized.map((e) => XmlElement(XmlName('value'), [], [XmlText(e)]));
children.addAll(valueConstructed);
return children;
}''')
@XmlSerializable()
class SetField {
  @XmlElement()
  Set<String> value;

  SetField({required this.value});
}

@ShouldGenerate(r'''
void _$StringFieldBuildXmlChildren(StringField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { builder.text(valueSerialized); });
}

StringField _$StringFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!.getText()!;
return StringField(value: value);
}

List<XmlAttribute> _$StringFieldToXmlAttributes(StringField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$StringFieldToXmlChildren(StringField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), [], [XmlText(valueSerialized)]);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class StringField {
  @XmlElement()
  String value;

  StringField({required this.value});
}

@ShouldGenerate(r'''
void _$UriFieldBuildXmlChildren(UriField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.toString();
builder.element('value', nest: () { builder.text(valueSerialized); });
}

UriField _$UriFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!.getText()!;
return UriField(value: Uri.parse(value));
}

List<XmlAttribute> _$UriFieldToXmlAttributes(UriField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$UriFieldToXmlChildren(UriField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value.toString();
final valueConstructed = XmlElement(XmlName('value'), [], [XmlText(valueSerialized)]);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class UriField {
  @XmlElement()
  Uri value;

  UriField({required this.value});
}

@ShouldGenerate(r'''
void _$NullableBoolFieldBuildXmlChildren(NullableBoolField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value != null ? value == true ? 'true' : 'false' : null;
builder.element('value', nest: () { if (valueSerialized != null) { builder.text(valueSerialized); } });
}

NullableBoolField _$NullableBoolFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')?.getText();
return NullableBoolField(value: value != null ? value == 'true' || value == '1' ? true : value == 'false' || value == '0' ? false : throw FormatException('Invalid bool format', value) : null);
}

List<XmlAttribute> _$NullableBoolFieldToXmlAttributes(NullableBoolField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NullableBoolFieldToXmlChildren(NullableBoolField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value != null ? value == true ? 'true' : 'false' : null;
final valueConstructed = XmlElement(XmlName('value'), [], valueSerialized != null ? [XmlText(valueSerialized)] : []);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class NullableBoolField {
  @XmlElement()
  bool? value;

  NullableBoolField({this.value});
}

@ShouldGenerate(r'''
void _$NullableCustomFieldBuildXmlChildren(NullableCustomField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { if (valueSerialized != null) { valueSerialized.buildXmlChildren(builder, namespaces: namespaces); } });
}

NullableCustomField _$NullableCustomFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value');
return NullableCustomField(value: value != null ? HelloWorld.fromXmlElement(value) : null);
}

List<XmlAttribute> _$NullableCustomFieldToXmlAttributes(NullableCustomField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NullableCustomFieldToXmlChildren(NullableCustomField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), valueSerialized?.toXmlAttributes(namespaces: namespaces) ?? [], valueSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class NullableCustomField {
  @XmlElement()
  HelloWorld? value;

  NullableCustomField({this.value});
}

@ShouldGenerate(r'''
void _$NullableDateTimeFieldBuildXmlChildren(NullableDateTimeField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value?.toIso8601String();
builder.element('value', nest: () { if (valueSerialized != null) { builder.text(valueSerialized); } });
}

NullableDateTimeField _$NullableDateTimeFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')?.getText();
return NullableDateTimeField(value: value != null ? DateTime.parse(value) : null);
}

List<XmlAttribute> _$NullableDateTimeFieldToXmlAttributes(NullableDateTimeField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NullableDateTimeFieldToXmlChildren(NullableDateTimeField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value?.toIso8601String();
final valueConstructed = XmlElement(XmlName('value'), [], valueSerialized != null ? [XmlText(valueSerialized)] : []);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class NullableDateTimeField {
  @XmlElement()
  DateTime? value;

  NullableDateTimeField({this.value});
}

@ShouldGenerate(r'''
void _$NullableDoubleFieldBuildXmlChildren(NullableDoubleField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value?.toString();
builder.element('value', nest: () { if (valueSerialized != null) { builder.text(valueSerialized); } });
}

NullableDoubleField _$NullableDoubleFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')?.getText();
return NullableDoubleField(value: value != null ? double.parse(value) : null);
}

List<XmlAttribute> _$NullableDoubleFieldToXmlAttributes(NullableDoubleField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NullableDoubleFieldToXmlChildren(NullableDoubleField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value?.toString();
final valueConstructed = XmlElement(XmlName('value'), [], valueSerialized != null ? [XmlText(valueSerialized)] : []);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class NullableDoubleField {
  @XmlElement()
  double? value;

  NullableDoubleField({this.value});
}

@ShouldGenerate(r'''
void _$NullableDurationFieldBuildXmlChildren(NullableDurationField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value?.inMicroseconds.toString();
builder.element('value', nest: () { if (valueSerialized != null) { builder.text(valueSerialized); } });
}

NullableDurationField _$NullableDurationFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')?.getText();
return NullableDurationField(value: value != null ? Duration(microseconds: int.parse(value)) : null);
}

List<XmlAttribute> _$NullableDurationFieldToXmlAttributes(NullableDurationField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NullableDurationFieldToXmlChildren(NullableDurationField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value?.inMicroseconds.toString();
final valueConstructed = XmlElement(XmlName('value'), [], valueSerialized != null ? [XmlText(valueSerialized)] : []);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class NullableDurationField {
  @XmlElement()
  Duration? value;

  NullableDurationField({this.value});
}

@ShouldGenerate(r'''
void _$NullableEnumFieldBuildXmlChildren(NullableEnumField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value != null ? $FooBarEnumMap[value]! : null;
builder.element('value', nest: () { if (valueSerialized != null) { builder.text(valueSerialized); } });
}

NullableEnumField _$NullableEnumFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')?.getText();
return NullableEnumField(value: value != null ? $FooBarEnumMap.entries.singleWhere((fooBarEnumMapEntry) => fooBarEnumMapEntry.value == value, orElse: () => throw ArgumentError('`$value` is not one of the supported values: ${$FooBarEnumMap.values.join(', ')}')).key : null);
}

List<XmlAttribute> _$NullableEnumFieldToXmlAttributes(NullableEnumField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NullableEnumFieldToXmlChildren(NullableEnumField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value != null ? $FooBarEnumMap[value]! : null;
final valueConstructed = XmlElement(XmlName('value'), [], valueSerialized != null ? [XmlText(valueSerialized)] : []);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class NullableEnumField {
  @XmlElement()
  FooBar? value;

  NullableEnumField({this.value});
}

@ShouldGenerate(r'''
void _$NullableIntFieldBuildXmlChildren(NullableIntField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value?.toString();
builder.element('value', nest: () { if (valueSerialized != null) { builder.text(valueSerialized); } });
}

NullableIntField _$NullableIntFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')?.getText();
return NullableIntField(value: value != null ? int.parse(value) : null);
}

List<XmlAttribute> _$NullableIntFieldToXmlAttributes(NullableIntField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NullableIntFieldToXmlChildren(NullableIntField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value?.toString();
final valueConstructed = XmlElement(XmlName('value'), [], valueSerialized != null ? [XmlText(valueSerialized)] : []);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class NullableIntField {
  @XmlElement()
  int? value;

  NullableIntField({this.value});
}

@ShouldGenerate(r'''
void _$NullableIterableFieldBuildXmlChildren(NullableIterableField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
if (valueSerialized != null) { for (final value in valueSerialized) { builder.element('value', nest: () { builder.text(value); }); } }
}

NullableIterableField _$NullableIterableFieldFromXmlElement(XmlElement element) {
final value = element.getElements('value')?.map((e) => e.getText()).whereType<String>();
return NullableIterableField(value: value);
}

List<XmlAttribute> _$NullableIterableFieldToXmlAttributes(NullableIterableField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NullableIterableFieldToXmlChildren(NullableIterableField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = valueSerialized?.map((e) => XmlElement(XmlName('value'), [], [XmlText(e)]));
if (valueConstructed != null) { children.addAll(valueConstructed); }
return children;
}''')
@XmlSerializable()
class NullableIterableField {
  @XmlElement()
  Iterable<String>? value;

  NullableIterableField({this.value});
}

@ShouldGenerate(r'''
void _$NullableListFieldBuildXmlChildren(NullableListField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
if (valueSerialized != null) { for (final value in valueSerialized) { builder.element('value', nest: () { builder.text(value); }); } }
}

NullableListField _$NullableListFieldFromXmlElement(XmlElement element) {
final value = element.getElements('value')?.map((e) => e.getText()).whereType<String>();
return NullableListField(value: value?.toList());
}

List<XmlAttribute> _$NullableListFieldToXmlAttributes(NullableListField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NullableListFieldToXmlChildren(NullableListField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = valueSerialized?.map((e) => XmlElement(XmlName('value'), [], [XmlText(e)]));
if (valueConstructed != null) { children.addAll(valueConstructed); }
return children;
}''')
@XmlSerializable()
class NullableListField {
  @XmlElement()
  List<String>? value;

  NullableListField({this.value});
}

@ShouldGenerate(r'''
void _$NullableNumFieldBuildXmlChildren(NullableNumField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value?.toString();
builder.element('value', nest: () { if (valueSerialized != null) { builder.text(valueSerialized); } });
}

NullableNumField _$NullableNumFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')?.getText();
return NullableNumField(value: value != null ? num.parse(value) : null);
}

List<XmlAttribute> _$NullableNumFieldToXmlAttributes(NullableNumField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NullableNumFieldToXmlChildren(NullableNumField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value?.toString();
final valueConstructed = XmlElement(XmlName('value'), [], valueSerialized != null ? [XmlText(valueSerialized)] : []);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class NullableNumField {
  @XmlElement()
  num? value;

  NullableNumField({this.value});
}

@ShouldGenerate(r'''
void _$NullableSetFieldBuildXmlChildren(NullableSetField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
if (valueSerialized != null) { for (final value in valueSerialized) { builder.element('value', nest: () { builder.text(value); }); } }
}

NullableSetField _$NullableSetFieldFromXmlElement(XmlElement element) {
final value = element.getElements('value')?.map((e) => e.getText()).whereType<String>();
return NullableSetField(value: value?.toSet());
}

List<XmlAttribute> _$NullableSetFieldToXmlAttributes(NullableSetField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NullableSetFieldToXmlChildren(NullableSetField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = valueSerialized?.map((e) => XmlElement(XmlName('value'), [], [XmlText(e)]));
if (valueConstructed != null) { children.addAll(valueConstructed); }
return children;
}''')
@XmlSerializable()
class NullableSetField {
  @XmlElement()
  Set<String>? value;

  NullableSetField({this.value});
}

@ShouldGenerate(r'''
void _$NullableStringFieldBuildXmlChildren(NullableStringField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { if (valueSerialized != null) { builder.text(valueSerialized); } });
}

NullableStringField _$NullableStringFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')?.getText();
return NullableStringField(value: value);
}

List<XmlAttribute> _$NullableStringFieldToXmlAttributes(NullableStringField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NullableStringFieldToXmlChildren(NullableStringField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), [], valueSerialized != null ? [XmlText(valueSerialized)] : []);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class NullableStringField {
  @XmlElement()
  String? value;

  NullableStringField({this.value});
}

@ShouldGenerate(r'''
void _$NullableUriFieldBuildXmlChildren(NullableUriField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value?.toString();
builder.element('value', nest: () { if (valueSerialized != null) { builder.text(valueSerialized); } });
}

NullableUriField _$NullableUriFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')?.getText();
return NullableUriField(value: value != null ? Uri.parse(value) : null);
}

List<XmlAttribute> _$NullableUriFieldToXmlAttributes(NullableUriField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NullableUriFieldToXmlChildren(NullableUriField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value?.toString();
final valueConstructed = XmlElement(XmlName('value'), [], valueSerialized != null ? [XmlText(valueSerialized)] : []);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class NullableUriField {
  @XmlElement()
  Uri? value;

  NullableUriField({this.value});
}

@ShouldGenerate(r'''
void _$NonDefaultNameBuildXmlChildren(NonDefaultName instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('name', nest: () { if (valueSerialized != null) { builder.text(valueSerialized); } });
}

NonDefaultName _$NonDefaultNameFromXmlElement(XmlElement element) {
final value = element.getElement('name')?.getText();
return NonDefaultName(value: value);
}

List<XmlAttribute> _$NonDefaultNameToXmlAttributes(NonDefaultName instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NonDefaultNameToXmlChildren(NonDefaultName instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('name'), [], valueSerialized != null ? [XmlText(valueSerialized)] : []);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class NonDefaultName {
  @XmlElement(
    name: 'name',
  )
  String? value;

  NonDefaultName({this.value});
}

@ShouldGenerate(r'''
void _$NonDefaultNamespaceBuildXmlChildren(NonDefaultNamespace instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', namespace: 'https://www.example.com', nest: () { if (valueSerialized != null) { builder.text(valueSerialized); } });
}

NonDefaultNamespace _$NonDefaultNamespaceFromXmlElement(XmlElement element) {
final value = element.getElement('value', namespace: 'https://www.example.com')?.getText();
return NonDefaultNamespace(value: value);
}

List<XmlAttribute> _$NonDefaultNamespaceToXmlAttributes(NonDefaultNamespace instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NonDefaultNamespaceToXmlChildren(NonDefaultNamespace instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value', namespaces['https://www.example.com']), [], valueSerialized != null ? [XmlText(valueSerialized)] : []);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class NonDefaultNamespace {
  @XmlElement(
    namespace: 'https://www.example.com',
  )
  String? value;

  NonDefaultNamespace({this.value});
}

@ShouldGenerate(r'''
void _$NonDefaultNameAndNonDefaultNamespaceBuildXmlChildren(NonDefaultNameAndNonDefaultNamespace instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('name', namespace: 'https://www.example.com', nest: () { if (valueSerialized != null) { builder.text(valueSerialized); } });
}

NonDefaultNameAndNonDefaultNamespace _$NonDefaultNameAndNonDefaultNamespaceFromXmlElement(XmlElement element) {
final value = element.getElement('name', namespace: 'https://www.example.com')?.getText();
return NonDefaultNameAndNonDefaultNamespace(value: value);
}

List<XmlAttribute> _$NonDefaultNameAndNonDefaultNamespaceToXmlAttributes(NonDefaultNameAndNonDefaultNamespace instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NonDefaultNameAndNonDefaultNamespaceToXmlChildren(NonDefaultNameAndNonDefaultNamespace instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('name', namespaces['https://www.example.com']), [], valueSerialized != null ? [XmlText(valueSerialized)] : []);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class NonDefaultNameAndNonDefaultNamespace {
  @XmlElement(
    name: 'name',
    namespace: 'https://www.example.com',
  )
  String? value;

  NonDefaultNameAndNonDefaultNamespace({this.value});
}

@ShouldGenerate(r'''
void _$NonDefaultIsSelfClosingBuildXmlChildren(NonDefaultIsSelfClosing instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', isSelfClosing: false, nest: () { if (valueSerialized != null) { builder.text(valueSerialized); } });
}

NonDefaultIsSelfClosing _$NonDefaultIsSelfClosingFromXmlElement(XmlElement element) {
final value = element.getElement('value')?.getText();
return NonDefaultIsSelfClosing(value: value);
}

List<XmlAttribute> _$NonDefaultIsSelfClosingToXmlAttributes(NonDefaultIsSelfClosing instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NonDefaultIsSelfClosingToXmlChildren(NonDefaultIsSelfClosing instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), [], valueSerialized != null ? [XmlText(valueSerialized)] : [], false);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class NonDefaultIsSelfClosing {
  @XmlElement(
    isSelfClosing: false,
  )
  String? value;

  NonDefaultIsSelfClosing({this.value});
}

@ShouldGenerate(r'''
void _$NonDefaultIncludeIfNullBuildXmlChildren(NonDefaultIncludeIfNull instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
if (valueSerialized != null) { builder.element('value', nest: () { builder.text(valueSerialized); }); }
}

NonDefaultIncludeIfNull _$NonDefaultIncludeIfNullFromXmlElement(XmlElement element) {
final value = element.getElement('value')?.getText();
return NonDefaultIncludeIfNull(value: value);
}

List<XmlAttribute> _$NonDefaultIncludeIfNullToXmlAttributes(NonDefaultIncludeIfNull instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$NonDefaultIncludeIfNullToXmlChildren(NonDefaultIncludeIfNull instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = valueSerialized != null ? XmlElement(XmlName('value'), [], [XmlText(valueSerialized)]) : null;
if (valueConstructed != null) { children.add(valueConstructed); }
return children;
}''')
@XmlSerializable()
class NonDefaultIncludeIfNull {
  @XmlElement(
    includeIfNull: false,
  )
  String? value;

  NonDefaultIncludeIfNull({this.value});
}

@ShouldGenerate(r'''
void _$OverrideFieldRenameBuildXmlChildren(OverrideFieldRename instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final fooBar = instance.fooBar;
final fooBarSerialized = fooBar;
builder.element('fooBar', nest: () { if (fooBarSerialized != null) { builder.text(fooBarSerialized); } });
final fooBaz = instance.fooBaz;
final fooBazSerialized = fooBaz;
builder.element('FooBaz', nest: () { if (fooBazSerialized != null) { builder.text(fooBazSerialized); } });
}

OverrideFieldRename _$OverrideFieldRenameFromXmlElement(XmlElement element) {
final fooBar = element.getElement('fooBar')?.getText();
final fooBaz = element.getElement('FooBaz')?.getText();
return OverrideFieldRename(fooBar: fooBar, fooBaz: fooBaz);
}

List<XmlAttribute> _$OverrideFieldRenameToXmlAttributes(OverrideFieldRename instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$OverrideFieldRenameToXmlChildren(OverrideFieldRename instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final fooBar = instance.fooBar;
final fooBarSerialized = fooBar;
final fooBarConstructed = XmlElement(XmlName('fooBar'), [], fooBarSerialized != null ? [XmlText(fooBarSerialized)] : []);
children.add(fooBarConstructed);
final fooBaz = instance.fooBaz;
final fooBazSerialized = fooBaz;
final fooBazConstructed = XmlElement(XmlName('FooBaz'), [], fooBazSerialized != null ? [XmlText(fooBazSerialized)] : []);
children.add(fooBazConstructed);
return children;
}''')
@XmlSerializable(
  fieldRename: FieldRename.pascal,
)
class OverrideFieldRename {
  @XmlElement(
    name: 'fooBar',
  )
  String? fooBar;

  @XmlElement()
  String? fooBaz;

  OverrideFieldRename({this.fooBar, this.fooBaz});
}

enum FooBar {
  foo,
  bar,
}

@XmlSerializable()
class HelloWorld {
  @XmlElement()
  String? value;
}
