import 'package:source_gen_test/source_gen_test.dart';
import 'package:xml_annotation/xml_annotation.dart';

@ShouldGenerate(r'''
void _$BoolFieldBuildXmlChildren(BoolField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value == true ? 'true' : 'false';
builder.text(valueSerialized);
}

BoolField _$BoolFieldFromXmlElement(XmlElement element) {
final value = element.getText()!;
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
final valueConstructed = XmlText(valueSerialized);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class BoolField {
  @XmlText()
  bool value;

  BoolField({required this.value});
}

@ShouldGenerate(r'''
void _$DateTimeFieldBuildXmlChildren(DateTimeField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.toIso8601String();
builder.text(valueSerialized);
}

DateTimeField _$DateTimeFieldFromXmlElement(XmlElement element) {
final value = element.getText()!;
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
final valueConstructed = XmlText(valueSerialized);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class DateTimeField {
  @XmlText()
  DateTime value;

  DateTimeField({required this.value});
}

@ShouldGenerate(r'''
void _$DoubleFieldBuildXmlChildren(DoubleField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.toString();
builder.text(valueSerialized);
}

DoubleField _$DoubleFieldFromXmlElement(XmlElement element) {
final value = element.getText()!;
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
final valueConstructed = XmlText(valueSerialized);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class DoubleField {
  @XmlText()
  double value;

  DoubleField({required this.value});
}

@ShouldGenerate(r'''
void _$DurationFieldBuildXmlChildren(DurationField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.inMicroseconds.toString();
builder.text(valueSerialized);
}

DurationField _$DurationFieldFromXmlElement(XmlElement element) {
final value = element.getText()!;
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
final valueConstructed = XmlText(valueSerialized);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class DurationField {
  @XmlText()
  Duration value;

  DurationField({required this.value});
}

@ShouldGenerate(r'''
void _$DynamicFieldBuildXmlChildren(DynamicField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
if (valueSerialized != null) { builder.text(valueSerialized); }
}

DynamicField _$DynamicFieldFromXmlElement(XmlElement element) {
final value = element.getText();
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
final valueConstructed = valueSerialized != null ? XmlText(valueSerialized) : null;
if (valueConstructed != null) { children.add(valueConstructed); }
return children;
}''')
@XmlSerializable()
class DynamicField {
  @XmlText()
  dynamic value;

  DynamicField({this.value});
}

@ShouldGenerate(r'''
void _$EnumFieldBuildXmlChildren(EnumField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = $FooBarEnumMap[value]!;
builder.text(valueSerialized);
}

EnumField _$EnumFieldFromXmlElement(XmlElement element) {
final value = element.getText()!;
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
final valueConstructed = XmlText(valueSerialized);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class EnumField {
  @XmlText()
  FooBar value;

  EnumField({required this.value});
}

@ShouldGenerate(r'''
void _$IntFieldBuildXmlChildren(IntField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.toString();
builder.text(valueSerialized);
}

IntField _$IntFieldFromXmlElement(XmlElement element) {
final value = element.getText()!;
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
final valueConstructed = XmlText(valueSerialized);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class IntField {
  @XmlText()
  int value;

  IntField({required this.value});
}

@ShouldGenerate(r'''
void _$NumFieldBuildXmlChildren(NumField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.toString();
builder.text(valueSerialized);
}

NumField _$NumFieldFromXmlElement(XmlElement element) {
final value = element.getText()!;
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
final valueConstructed = XmlText(valueSerialized);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class NumField {
  @XmlText()
  num value;

  NumField({required this.value});
}

@ShouldGenerate(r'''
void _$StringFieldBuildXmlChildren(StringField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.text(valueSerialized);
}

StringField _$StringFieldFromXmlElement(XmlElement element) {
final value = element.getText()!;
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
final valueConstructed = XmlText(valueSerialized);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class StringField {
  @XmlText()
  String value;

  StringField({required this.value});
}

@ShouldGenerate(r'''
void _$UriFieldBuildXmlChildren(UriField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.toString();
builder.text(valueSerialized);
}

UriField _$UriFieldFromXmlElement(XmlElement element) {
final value = element.getText()!;
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
final valueConstructed = XmlText(valueSerialized);
children.add(valueConstructed);
return children;
}''')
@XmlSerializable()
class UriField {
  @XmlText()
  Uri value;

  UriField({required this.value});
}

@ShouldGenerate(r'''
void _$NullableBoolFieldBuildXmlChildren(NullableBoolField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value != null ? value == true ? 'true' : 'false' : null;
if (valueSerialized != null) { builder.text(valueSerialized); }
}

NullableBoolField _$NullableBoolFieldFromXmlElement(XmlElement element) {
final value = element.getText();
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
final valueConstructed = valueSerialized != null ? XmlText(valueSerialized) : null;
if (valueConstructed != null) { children.add(valueConstructed); }
return children;
}''')
@XmlSerializable()
class NullableBoolField {
  @XmlText()
  bool? value;

  NullableBoolField({this.value});
}

@ShouldGenerate(r'''
void _$NullableDateTimeFieldBuildXmlChildren(NullableDateTimeField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value?.toIso8601String();
if (valueSerialized != null) { builder.text(valueSerialized); }
}

NullableDateTimeField _$NullableDateTimeFieldFromXmlElement(XmlElement element) {
final value = element.getText();
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
final valueConstructed = valueSerialized != null ? XmlText(valueSerialized) : null;
if (valueConstructed != null) { children.add(valueConstructed); }
return children;
}''')
@XmlSerializable()
class NullableDateTimeField {
  @XmlText()
  DateTime? value;

  NullableDateTimeField({this.value});
}

@ShouldGenerate(r'''
void _$NullableDoubleFieldBuildXmlChildren(NullableDoubleField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value?.toString();
if (valueSerialized != null) { builder.text(valueSerialized); }
}

NullableDoubleField _$NullableDoubleFieldFromXmlElement(XmlElement element) {
final value = element.getText();
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
final valueConstructed = valueSerialized != null ? XmlText(valueSerialized) : null;
if (valueConstructed != null) { children.add(valueConstructed); }
return children;
}''')
@XmlSerializable()
class NullableDoubleField {
  @XmlText()
  double? value;

  NullableDoubleField({this.value});
}

@ShouldGenerate(r'''
void _$NullableDurationFieldBuildXmlChildren(NullableDurationField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value?.inMicroseconds.toString();
if (valueSerialized != null) { builder.text(valueSerialized); }
}

NullableDurationField _$NullableDurationFieldFromXmlElement(XmlElement element) {
final value = element.getText();
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
final valueConstructed = valueSerialized != null ? XmlText(valueSerialized) : null;
if (valueConstructed != null) { children.add(valueConstructed); }
return children;
}''')
@XmlSerializable()
class NullableDurationField {
  @XmlText()
  Duration? value;

  NullableDurationField({this.value});
}

@ShouldGenerate(r'''
void _$NullableEnumFieldBuildXmlChildren(NullableEnumField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value != null ? $FooBarEnumMap[value]! : null;
if (valueSerialized != null) { builder.text(valueSerialized); }
}

NullableEnumField _$NullableEnumFieldFromXmlElement(XmlElement element) {
final value = element.getText();
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
final valueConstructed = valueSerialized != null ? XmlText(valueSerialized) : null;
if (valueConstructed != null) { children.add(valueConstructed); }
return children;
}''')
@XmlSerializable()
class NullableEnumField {
  @XmlText()
  FooBar? value;

  NullableEnumField({this.value});
}

@ShouldGenerate(r'''
void _$NullableIntFieldBuildXmlChildren(NullableIntField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value?.toString();
if (valueSerialized != null) { builder.text(valueSerialized); }
}

NullableIntField _$NullableIntFieldFromXmlElement(XmlElement element) {
final value = element.getText();
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
final valueConstructed = valueSerialized != null ? XmlText(valueSerialized) : null;
if (valueConstructed != null) { children.add(valueConstructed); }
return children;
}''')
@XmlSerializable()
class NullableIntField {
  @XmlText()
  int? value;

  NullableIntField({this.value});
}

@ShouldGenerate(r'''
void _$NullableNumFieldBuildXmlChildren(NullableNumField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value?.toString();
if (valueSerialized != null) { builder.text(valueSerialized); }
}

NullableNumField _$NullableNumFieldFromXmlElement(XmlElement element) {
final value = element.getText();
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
final valueConstructed = valueSerialized != null ? XmlText(valueSerialized) : null;
if (valueConstructed != null) { children.add(valueConstructed); }
return children;
}''')
@XmlSerializable()
class NullableNumField {
  @XmlText()
  num? value;

  NullableNumField({this.value});
}

@ShouldGenerate(r'''
void _$NullableStringFieldBuildXmlChildren(NullableStringField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
if (valueSerialized != null) { builder.text(valueSerialized); }
}

NullableStringField _$NullableStringFieldFromXmlElement(XmlElement element) {
final value = element.getText();
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
final valueConstructed = valueSerialized != null ? XmlText(valueSerialized) : null;
if (valueConstructed != null) { children.add(valueConstructed); }
return children;
}''')
@XmlSerializable()
class NullableStringField {
  @XmlText()
  String? value;

  NullableStringField({this.value});
}

@ShouldGenerate(r'''
void _$NullableUriFieldBuildXmlChildren(NullableUriField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value?.toString();
if (valueSerialized != null) { builder.text(valueSerialized); }
}

NullableUriField _$NullableUriFieldFromXmlElement(XmlElement element) {
final value = element.getText();
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
final valueConstructed = valueSerialized != null ? XmlText(valueSerialized) : null;
if (valueConstructed != null) { children.add(valueConstructed); }
return children;
}''')
@XmlSerializable()
class NullableUriField {
  @XmlText()
  Uri? value;

  NullableUriField({this.value});
}

enum FooBar {
  foo,
  bar,
}
