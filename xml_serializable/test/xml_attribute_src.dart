import 'package:source_gen_test/source_gen_test.dart';
import 'package:xml_annotation/xml_annotation.dart';

@ShouldGenerate(r'''
void _$BoolFieldBuildXmlChildren(BoolField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value == true ? 'true' : 'false';
builder.attribute('value', valueSerialized);
}

BoolField _$BoolFieldFromXmlElement(XmlElement element) {
final value = element.getAttribute('value')!;
return BoolField(value: value == 'true' || value == '1' ? true : value == 'false' || value == '0' ? false : throw FormatException('Invalid bool format', value));
}

List<XmlAttribute> _$BoolFieldToXmlAttributes(BoolField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value == true ? 'true' : 'false';
final valueConstructed = XmlAttribute(XmlName('value'), valueSerialized);
attributes.add(valueConstructed);
return attributes;
}

List<XmlNode> _$BoolFieldToXmlChildren(BoolField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class BoolField {
  @XmlAttribute()
  bool value;

  BoolField({required this.value});
}

@ShouldGenerate(r'''
void _$DateTimeFieldBuildXmlChildren(DateTimeField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.toIso8601String();
builder.attribute('value', valueSerialized);
}

DateTimeField _$DateTimeFieldFromXmlElement(XmlElement element) {
final value = element.getAttribute('value')!;
return DateTimeField(value: DateTime.parse(value));
}

List<XmlAttribute> _$DateTimeFieldToXmlAttributes(DateTimeField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value.toIso8601String();
final valueConstructed = XmlAttribute(XmlName('value'), valueSerialized);
attributes.add(valueConstructed);
return attributes;
}

List<XmlNode> _$DateTimeFieldToXmlChildren(DateTimeField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class DateTimeField {
  @XmlAttribute()
  DateTime value;

  DateTimeField({required this.value});
}

@ShouldGenerate(r'''
void _$DoubleFieldBuildXmlChildren(DoubleField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.toString();
builder.attribute('value', valueSerialized);
}

DoubleField _$DoubleFieldFromXmlElement(XmlElement element) {
final value = element.getAttribute('value')!;
return DoubleField(value: double.parse(value));
}

List<XmlAttribute> _$DoubleFieldToXmlAttributes(DoubleField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value.toString();
final valueConstructed = XmlAttribute(XmlName('value'), valueSerialized);
attributes.add(valueConstructed);
return attributes;
}

List<XmlNode> _$DoubleFieldToXmlChildren(DoubleField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class DoubleField {
  @XmlAttribute()
  double value;

  DoubleField({required this.value});
}

@ShouldGenerate(r'''
void _$DurationFieldBuildXmlChildren(DurationField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.inMicroseconds.toString();
builder.attribute('value', valueSerialized);
}

DurationField _$DurationFieldFromXmlElement(XmlElement element) {
final value = element.getAttribute('value')!;
return DurationField(value: Duration(microseconds: int.parse(value)));
}

List<XmlAttribute> _$DurationFieldToXmlAttributes(DurationField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value.inMicroseconds.toString();
final valueConstructed = XmlAttribute(XmlName('value'), valueSerialized);
attributes.add(valueConstructed);
return attributes;
}

List<XmlNode> _$DurationFieldToXmlChildren(DurationField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class DurationField {
  @XmlAttribute()
  Duration value;

  DurationField({required this.value});
}

@ShouldGenerate(r'''
void _$DynamicFieldBuildXmlChildren(DynamicField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
if (valueSerialized != null) { builder.attribute('value', valueSerialized); }
}

DynamicField _$DynamicFieldFromXmlElement(XmlElement element) {
final value = element.getAttribute('value');
return DynamicField(value: value);
}

List<XmlAttribute> _$DynamicFieldToXmlAttributes(DynamicField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = valueSerialized != null ? XmlAttribute(XmlName('value'), valueSerialized) : null;
if (valueConstructed != null) { attributes.add(valueConstructed); }
return attributes;
}

List<XmlNode> _$DynamicFieldToXmlChildren(DynamicField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class DynamicField {
  @XmlAttribute()
  dynamic value;

  DynamicField({this.value});
}

@ShouldGenerate(r'''
void _$EnumFieldBuildXmlChildren(EnumField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = $FooBarEnumMap[value]!;
builder.attribute('value', valueSerialized);
}

EnumField _$EnumFieldFromXmlElement(XmlElement element) {
final value = element.getAttribute('value')!;
return EnumField(value: $FooBarEnumMap.entries.singleWhere((fooBarEnumMapEntry) => fooBarEnumMapEntry.value == value, orElse: () => throw ArgumentError('`$value` is not one of the supported values: ${$FooBarEnumMap.values.join(', ')}')).key);
}

List<XmlAttribute> _$EnumFieldToXmlAttributes(EnumField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = $FooBarEnumMap[value]!;
final valueConstructed = XmlAttribute(XmlName('value'), valueSerialized);
attributes.add(valueConstructed);
return attributes;
}

List<XmlNode> _$EnumFieldToXmlChildren(EnumField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class EnumField {
  @XmlAttribute()
  FooBar value;

  EnumField({required this.value});
}

@ShouldGenerate(r'''
void _$IntFieldBuildXmlChildren(IntField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.toString();
builder.attribute('value', valueSerialized);
}

IntField _$IntFieldFromXmlElement(XmlElement element) {
final value = element.getAttribute('value')!;
return IntField(value: int.parse(value));
}

List<XmlAttribute> _$IntFieldToXmlAttributes(IntField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value.toString();
final valueConstructed = XmlAttribute(XmlName('value'), valueSerialized);
attributes.add(valueConstructed);
return attributes;
}

List<XmlNode> _$IntFieldToXmlChildren(IntField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class IntField {
  @XmlAttribute()
  int value;

  IntField({required this.value});
}

@ShouldThrow(
  r'`@XmlAttribute()` cannot be used on fields of an iterable type due to https://www.w3.org/TR/xml/#uniqattspec.',
)
@XmlSerializable()
class IterableField {
  @XmlAttribute()
  Iterable<String> value;

  IterableField({required this.value});
}

@ShouldGenerate(r'''
void _$NumFieldBuildXmlChildren(NumField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.toString();
builder.attribute('value', valueSerialized);
}

NumField _$NumFieldFromXmlElement(XmlElement element) {
final value = element.getAttribute('value')!;
return NumField(value: num.parse(value));
}

List<XmlAttribute> _$NumFieldToXmlAttributes(NumField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value.toString();
final valueConstructed = XmlAttribute(XmlName('value'), valueSerialized);
attributes.add(valueConstructed);
return attributes;
}

List<XmlNode> _$NumFieldToXmlChildren(NumField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class NumField {
  @XmlAttribute()
  num value;

  NumField({required this.value});
}

@ShouldGenerate(r'''
void _$StringFieldBuildXmlChildren(StringField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.attribute('value', valueSerialized);
}

StringField _$StringFieldFromXmlElement(XmlElement element) {
final value = element.getAttribute('value')!;
return StringField(value: value);
}

List<XmlAttribute> _$StringFieldToXmlAttributes(StringField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlAttribute(XmlName('value'), valueSerialized);
attributes.add(valueConstructed);
return attributes;
}

List<XmlNode> _$StringFieldToXmlChildren(StringField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class StringField {
  @XmlAttribute()
  String value;

  StringField({required this.value});
}

@ShouldGenerate(r'''
void _$UriFieldBuildXmlChildren(UriField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value.toString();
builder.attribute('value', valueSerialized);
}

UriField _$UriFieldFromXmlElement(XmlElement element) {
final value = element.getAttribute('value')!;
return UriField(value: Uri.parse(value));
}

List<XmlAttribute> _$UriFieldToXmlAttributes(UriField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value.toString();
final valueConstructed = XmlAttribute(XmlName('value'), valueSerialized);
attributes.add(valueConstructed);
return attributes;
}

List<XmlNode> _$UriFieldToXmlChildren(UriField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class UriField {
  @XmlAttribute()
  Uri value;

  UriField({required this.value});
}

@ShouldGenerate(r'''
void _$NullableBoolFieldBuildXmlChildren(NullableBoolField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value != null ? value == true ? 'true' : 'false' : null;
if (valueSerialized != null) { builder.attribute('value', valueSerialized); }
}

NullableBoolField _$NullableBoolFieldFromXmlElement(XmlElement element) {
final value = element.getAttribute('value');
return NullableBoolField(value: value != null ? value == 'true' || value == '1' ? true : value == 'false' || value == '0' ? false : throw FormatException('Invalid bool format', value) : null);
}

List<XmlAttribute> _$NullableBoolFieldToXmlAttributes(NullableBoolField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value != null ? value == true ? 'true' : 'false' : null;
final valueConstructed = valueSerialized != null ? XmlAttribute(XmlName('value'), valueSerialized) : null;
if (valueConstructed != null) { attributes.add(valueConstructed); }
return attributes;
}

List<XmlNode> _$NullableBoolFieldToXmlChildren(NullableBoolField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class NullableBoolField {
  @XmlAttribute()
  bool? value;

  NullableBoolField({this.value});
}

@ShouldGenerate(r'''
void _$NullableDateTimeFieldBuildXmlChildren(NullableDateTimeField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value?.toIso8601String();
if (valueSerialized != null) { builder.attribute('value', valueSerialized); }
}

NullableDateTimeField _$NullableDateTimeFieldFromXmlElement(XmlElement element) {
final value = element.getAttribute('value');
return NullableDateTimeField(value: value != null ? DateTime.parse(value) : null);
}

List<XmlAttribute> _$NullableDateTimeFieldToXmlAttributes(NullableDateTimeField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value?.toIso8601String();
final valueConstructed = valueSerialized != null ? XmlAttribute(XmlName('value'), valueSerialized) : null;
if (valueConstructed != null) { attributes.add(valueConstructed); }
return attributes;
}

List<XmlNode> _$NullableDateTimeFieldToXmlChildren(NullableDateTimeField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class NullableDateTimeField {
  @XmlAttribute()
  DateTime? value;

  NullableDateTimeField({this.value});
}

@ShouldGenerate(r'''
void _$NullableDoubleFieldBuildXmlChildren(NullableDoubleField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value?.toString();
if (valueSerialized != null) { builder.attribute('value', valueSerialized); }
}

NullableDoubleField _$NullableDoubleFieldFromXmlElement(XmlElement element) {
final value = element.getAttribute('value');
return NullableDoubleField(value: value != null ? double.parse(value) : null);
}

List<XmlAttribute> _$NullableDoubleFieldToXmlAttributes(NullableDoubleField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value?.toString();
final valueConstructed = valueSerialized != null ? XmlAttribute(XmlName('value'), valueSerialized) : null;
if (valueConstructed != null) { attributes.add(valueConstructed); }
return attributes;
}

List<XmlNode> _$NullableDoubleFieldToXmlChildren(NullableDoubleField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class NullableDoubleField {
  @XmlAttribute()
  double? value;

  NullableDoubleField({this.value});
}

@ShouldGenerate(r'''
void _$NullableDurationFieldBuildXmlChildren(NullableDurationField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value?.inMicroseconds.toString();
if (valueSerialized != null) { builder.attribute('value', valueSerialized); }
}

NullableDurationField _$NullableDurationFieldFromXmlElement(XmlElement element) {
final value = element.getAttribute('value');
return NullableDurationField(value: value != null ? Duration(microseconds: int.parse(value)) : null);
}

List<XmlAttribute> _$NullableDurationFieldToXmlAttributes(NullableDurationField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value?.inMicroseconds.toString();
final valueConstructed = valueSerialized != null ? XmlAttribute(XmlName('value'), valueSerialized) : null;
if (valueConstructed != null) { attributes.add(valueConstructed); }
return attributes;
}

List<XmlNode> _$NullableDurationFieldToXmlChildren(NullableDurationField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class NullableDurationField {
  @XmlAttribute()
  Duration? value;

  NullableDurationField({this.value});
}

@ShouldGenerate(r'''
void _$NullableEnumFieldBuildXmlChildren(NullableEnumField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value != null ? $FooBarEnumMap[value]! : null;
if (valueSerialized != null) { builder.attribute('value', valueSerialized); }
}

NullableEnumField _$NullableEnumFieldFromXmlElement(XmlElement element) {
final value = element.getAttribute('value');
return NullableEnumField(value: value != null ? $FooBarEnumMap.entries.singleWhere((fooBarEnumMapEntry) => fooBarEnumMapEntry.value == value, orElse: () => throw ArgumentError('`$value` is not one of the supported values: ${$FooBarEnumMap.values.join(', ')}')).key : null);
}

List<XmlAttribute> _$NullableEnumFieldToXmlAttributes(NullableEnumField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value != null ? $FooBarEnumMap[value]! : null;
final valueConstructed = valueSerialized != null ? XmlAttribute(XmlName('value'), valueSerialized) : null;
if (valueConstructed != null) { attributes.add(valueConstructed); }
return attributes;
}

List<XmlNode> _$NullableEnumFieldToXmlChildren(NullableEnumField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class NullableEnumField {
  @XmlAttribute()
  FooBar? value;

  NullableEnumField({this.value});
}

@ShouldGenerate(r'''
void _$NullableIntFieldBuildXmlChildren(NullableIntField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value?.toString();
if (valueSerialized != null) { builder.attribute('value', valueSerialized); }
}

NullableIntField _$NullableIntFieldFromXmlElement(XmlElement element) {
final value = element.getAttribute('value');
return NullableIntField(value: value != null ? int.parse(value) : null);
}

List<XmlAttribute> _$NullableIntFieldToXmlAttributes(NullableIntField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value?.toString();
final valueConstructed = valueSerialized != null ? XmlAttribute(XmlName('value'), valueSerialized) : null;
if (valueConstructed != null) { attributes.add(valueConstructed); }
return attributes;
}

List<XmlNode> _$NullableIntFieldToXmlChildren(NullableIntField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class NullableIntField {
  @XmlAttribute()
  int? value;

  NullableIntField({this.value});
}

@ShouldThrow(
  r'`@XmlAttribute()` cannot be used on fields of an iterable type due to https://www.w3.org/TR/xml/#uniqattspec.',
)
@XmlSerializable()
class NullableIterableField {
  @XmlAttribute()
  Iterable<String>? value;

  NullableIterableField({this.value});
}

@ShouldGenerate(r'''
void _$NullableNumFieldBuildXmlChildren(NullableNumField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value?.toString();
if (valueSerialized != null) { builder.attribute('value', valueSerialized); }
}

NullableNumField _$NullableNumFieldFromXmlElement(XmlElement element) {
final value = element.getAttribute('value');
return NullableNumField(value: value != null ? num.parse(value) : null);
}

List<XmlAttribute> _$NullableNumFieldToXmlAttributes(NullableNumField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value?.toString();
final valueConstructed = valueSerialized != null ? XmlAttribute(XmlName('value'), valueSerialized) : null;
if (valueConstructed != null) { attributes.add(valueConstructed); }
return attributes;
}

List<XmlNode> _$NullableNumFieldToXmlChildren(NullableNumField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class NullableNumField {
  @XmlAttribute()
  num? value;

  NullableNumField({this.value});
}

@ShouldGenerate(r'''
void _$NullableStringFieldBuildXmlChildren(NullableStringField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
if (valueSerialized != null) { builder.attribute('value', valueSerialized); }
}

NullableStringField _$NullableStringFieldFromXmlElement(XmlElement element) {
final value = element.getAttribute('value');
return NullableStringField(value: value);
}

List<XmlAttribute> _$NullableStringFieldToXmlAttributes(NullableStringField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = valueSerialized != null ? XmlAttribute(XmlName('value'), valueSerialized) : null;
if (valueConstructed != null) { attributes.add(valueConstructed); }
return attributes;
}

List<XmlNode> _$NullableStringFieldToXmlChildren(NullableStringField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class NullableStringField {
  @XmlAttribute()
  String? value;

  NullableStringField({this.value});
}

@ShouldGenerate(r'''
void _$NullableUriFieldBuildXmlChildren(NullableUriField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value?.toString();
if (valueSerialized != null) { builder.attribute('value', valueSerialized); }
}

NullableUriField _$NullableUriFieldFromXmlElement(XmlElement element) {
final value = element.getAttribute('value');
return NullableUriField(value: value != null ? Uri.parse(value) : null);
}

List<XmlAttribute> _$NullableUriFieldToXmlAttributes(NullableUriField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value?.toString();
final valueConstructed = valueSerialized != null ? XmlAttribute(XmlName('value'), valueSerialized) : null;
if (valueConstructed != null) { attributes.add(valueConstructed); }
return attributes;
}

List<XmlNode> _$NullableUriFieldToXmlChildren(NullableUriField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class NullableUriField {
  @XmlAttribute()
  Uri? value;

  NullableUriField({this.value});
}

@ShouldGenerate(r'''
void _$NonDefaultNameBuildXmlChildren(NonDefaultName instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
if (valueSerialized != null) { builder.attribute('name', valueSerialized); }
}

NonDefaultName _$NonDefaultNameFromXmlElement(XmlElement element) {
final value = element.getAttribute('name');
return NonDefaultName(value: value);
}

List<XmlAttribute> _$NonDefaultNameToXmlAttributes(NonDefaultName instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = valueSerialized != null ? XmlAttribute(XmlName('name'), valueSerialized) : null;
if (valueConstructed != null) { attributes.add(valueConstructed); }
return attributes;
}

List<XmlNode> _$NonDefaultNameToXmlChildren(NonDefaultName instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class NonDefaultName {
  @XmlAttribute(
    name: 'name',
  )
  String? value;

  NonDefaultName({this.value});
}

@ShouldGenerate(r'''
void _$NonDefaultNamespaceBuildXmlChildren(NonDefaultNamespace instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
if (valueSerialized != null) { builder.attribute('value', valueSerialized, namespace: 'https://www.example.com'); }
}

NonDefaultNamespace _$NonDefaultNamespaceFromXmlElement(XmlElement element) {
final value = element.getAttribute('value', namespace: 'https://www.example.com');
return NonDefaultNamespace(value: value);
}

List<XmlAttribute> _$NonDefaultNamespaceToXmlAttributes(NonDefaultNamespace instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = valueSerialized != null ? XmlAttribute(XmlName('value', namespaces['https://www.example.com']), valueSerialized) : null;
if (valueConstructed != null) { attributes.add(valueConstructed); }
return attributes;
}

List<XmlNode> _$NonDefaultNamespaceToXmlChildren(NonDefaultNamespace instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class NonDefaultNamespace {
  @XmlAttribute(
    namespace: 'https://www.example.com',
  )
  String? value;

  NonDefaultNamespace({this.value});
}

@ShouldGenerate(r'''
void _$NonDefaultNameAndNonDefaultNamespaceBuildXmlChildren(NonDefaultNameAndNonDefaultNamespace instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
if (valueSerialized != null) { builder.attribute('name', valueSerialized, namespace: 'https://www.example.com'); }
}

NonDefaultNameAndNonDefaultNamespace _$NonDefaultNameAndNonDefaultNamespaceFromXmlElement(XmlElement element) {
final value = element.getAttribute('name', namespace: 'https://www.example.com');
return NonDefaultNameAndNonDefaultNamespace(value: value);
}

List<XmlAttribute> _$NonDefaultNameAndNonDefaultNamespaceToXmlAttributes(NonDefaultNameAndNonDefaultNamespace instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = valueSerialized != null ? XmlAttribute(XmlName('name', namespaces['https://www.example.com']), valueSerialized) : null;
if (valueConstructed != null) { attributes.add(valueConstructed); }
return attributes;
}

List<XmlNode> _$NonDefaultNameAndNonDefaultNamespaceToXmlChildren(NonDefaultNameAndNonDefaultNamespace instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable()
class NonDefaultNameAndNonDefaultNamespace {
  @XmlAttribute(
    name: 'name',
    namespace: 'https://www.example.com',
  )
  String? value;

  NonDefaultNameAndNonDefaultNamespace({this.value});
}

@ShouldGenerate(r'''
void _$OverrideFieldRenameBuildXmlChildren(OverrideFieldRename instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final fooBar = instance.fooBar;
final fooBarSerialized = fooBar;
if (fooBarSerialized != null) { builder.attribute('fooBar', fooBarSerialized); }
final fooBaz = instance.fooBaz;
final fooBazSerialized = fooBaz;
if (fooBazSerialized != null) { builder.attribute('FooBaz', fooBazSerialized); }
}

OverrideFieldRename _$OverrideFieldRenameFromXmlElement(XmlElement element) {
final fooBar = element.getAttribute('fooBar');
final fooBaz = element.getAttribute('FooBaz');
return OverrideFieldRename(fooBar: fooBar, fooBaz: fooBaz);
}

List<XmlAttribute> _$OverrideFieldRenameToXmlAttributes(OverrideFieldRename instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final fooBar = instance.fooBar;
final fooBarSerialized = fooBar;
final fooBarConstructed = fooBarSerialized != null ? XmlAttribute(XmlName('fooBar'), fooBarSerialized) : null;
if (fooBarConstructed != null) { attributes.add(fooBarConstructed); }
final fooBaz = instance.fooBaz;
final fooBazSerialized = fooBaz;
final fooBazConstructed = fooBazSerialized != null ? XmlAttribute(XmlName('FooBaz'), fooBazSerialized) : null;
if (fooBazConstructed != null) { attributes.add(fooBazConstructed); }
return attributes;
}

List<XmlNode> _$OverrideFieldRenameToXmlChildren(OverrideFieldRename instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
return children;
}''')
@XmlSerializable(
  fieldRename: FieldRename.pascal,
)
class OverrideFieldRename {
  @XmlAttribute(
    name: 'fooBar',
  )
  String? fooBar;

  @XmlAttribute()
  String? fooBaz;

  OverrideFieldRename({this.fooBar, this.fooBaz});
}

enum FooBar {
  foo,
  bar,
}
