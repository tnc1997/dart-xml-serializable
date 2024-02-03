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
@AttributeDateTimeConverter()
class ClassAnnotationAttributeField {
  @annotation.XmlAttribute()
  DateTime value;

  ClassAnnotationAttributeField({required this.value});
}

@ShouldGenerate(r'''
void _$ClassAnnotationConvertibleElementFieldBuildXmlChildren(ClassAnnotationConvertibleElementField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { const AttributeDateTimeConverter().buildXmlChildren(valueSerialized, builder, namespaces: namespaces); });
}

ClassAnnotationConvertibleElementField _$ClassAnnotationConvertibleElementFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!;
return ClassAnnotationConvertibleElementField(value: const AttributeDateTimeConverter().fromXmlElement(value));
}

List<XmlAttribute> _$ClassAnnotationConvertibleElementFieldToXmlAttributes(ClassAnnotationConvertibleElementField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$ClassAnnotationConvertibleElementFieldToXmlChildren(ClassAnnotationConvertibleElementField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), const AttributeDateTimeConverter().toXmlAttributes(valueSerialized, namespaces: namespaces), const AttributeDateTimeConverter().toXmlChildren(valueSerialized, namespaces: namespaces));
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable()
@AttributeDateTimeConverter()
class ClassAnnotationConvertibleElementField {
  @annotation.XmlElement()
  DateTime value;

  ClassAnnotationConvertibleElementField({required this.value});
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
@AttributeDateTimeConverter()
class ClassAnnotationInconvertibleElementField {
  @annotation.XmlElement()
  String value;

  ClassAnnotationInconvertibleElementField({required this.value});
}

@ShouldGenerate(r'''
void _$ClassAnnotationNullableConvertibleElementFieldBuildXmlChildren(ClassAnnotationNullableConvertibleElementField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { if (valueSerialized != null) { const AttributeDateTimeConverter().buildXmlChildren(valueSerialized, builder, namespaces: namespaces); } });
}

ClassAnnotationNullableConvertibleElementField _$ClassAnnotationNullableConvertibleElementFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value');
return ClassAnnotationNullableConvertibleElementField(value: value != null ? const AttributeDateTimeConverter().fromXmlElement(value) : null);
}

List<XmlAttribute> _$ClassAnnotationNullableConvertibleElementFieldToXmlAttributes(ClassAnnotationNullableConvertibleElementField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$ClassAnnotationNullableConvertibleElementFieldToXmlChildren(ClassAnnotationNullableConvertibleElementField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), valueSerialized != null ? const AttributeDateTimeConverter().toXmlAttributes(valueSerialized, namespaces: namespaces) : [], valueSerialized != null ? const AttributeDateTimeConverter().toXmlChildren(valueSerialized, namespaces: namespaces) : []);
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable()
@AttributeDateTimeConverter()
class ClassAnnotationNullableConvertibleElementField {
  @annotation.XmlElement()
  DateTime? value;

  ClassAnnotationNullableConvertibleElementField({this.value});
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
void _$FieldAnnotationConvertibleElementFieldBuildXmlChildren(FieldAnnotationConvertibleElementField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { const ElementDateTimeConverter().buildXmlChildren(valueSerialized, builder, namespaces: namespaces); });
}

FieldAnnotationConvertibleElementField _$FieldAnnotationConvertibleElementFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!;
return FieldAnnotationConvertibleElementField(value: const ElementDateTimeConverter().fromXmlElement(value));
}

List<XmlAttribute> _$FieldAnnotationConvertibleElementFieldToXmlAttributes(FieldAnnotationConvertibleElementField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$FieldAnnotationConvertibleElementFieldToXmlChildren(FieldAnnotationConvertibleElementField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), const ElementDateTimeConverter().toXmlAttributes(valueSerialized, namespaces: namespaces), const ElementDateTimeConverter().toXmlChildren(valueSerialized, namespaces: namespaces));
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable()
class FieldAnnotationConvertibleElementField {
  @annotation.XmlElement()
  @ElementDateTimeConverter()
  DateTime value;

  FieldAnnotationConvertibleElementField({required this.value});
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
void _$FieldAnnotationNullableConvertibleElementFieldBuildXmlChildren(FieldAnnotationNullableConvertibleElementField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { if (valueSerialized != null) { const ElementDateTimeConverter().buildXmlChildren(valueSerialized, builder, namespaces: namespaces); } });
}

FieldAnnotationNullableConvertibleElementField _$FieldAnnotationNullableConvertibleElementFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value');
return FieldAnnotationNullableConvertibleElementField(value: value != null ? const ElementDateTimeConverter().fromXmlElement(value) : null);
}

List<XmlAttribute> _$FieldAnnotationNullableConvertibleElementFieldToXmlAttributes(FieldAnnotationNullableConvertibleElementField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$FieldAnnotationNullableConvertibleElementFieldToXmlChildren(FieldAnnotationNullableConvertibleElementField instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final value = instance.value;
final valueSerialized = value;
final valueConstructed = XmlElement(XmlName('value'), valueSerialized != null ? const ElementDateTimeConverter().toXmlAttributes(valueSerialized, namespaces: namespaces) : [], valueSerialized != null ? const ElementDateTimeConverter().toXmlChildren(valueSerialized, namespaces: namespaces) : []);
children.add(valueConstructed);
return children;
}''')
@annotation.XmlSerializable()
class FieldAnnotationNullableConvertibleElementField {
  @annotation.XmlElement()
  @ElementDateTimeConverter()
  DateTime? value;

  FieldAnnotationNullableConvertibleElementField({this.value});
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
void _$SerializableConverterConvertibleElementFieldBuildXmlChildren(SerializableConverterConvertibleElementField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { const ElementDateTimeConverter().buildXmlChildren(valueSerialized, builder, namespaces: namespaces); });
}

SerializableConverterConvertibleElementField _$SerializableConverterConvertibleElementFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value')!;
return SerializableConverterConvertibleElementField(value: const ElementDateTimeConverter().fromXmlElement(value));
}

List<XmlAttribute> _$SerializableConverterConvertibleElementFieldToXmlAttributes(SerializableConverterConvertibleElementField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$SerializableConverterConvertibleElementFieldToXmlChildren(SerializableConverterConvertibleElementField instance, {Map<String, String?> namespaces = const {}}) {
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
class SerializableConverterConvertibleElementField {
  @annotation.XmlElement()
  DateTime value;

  SerializableConverterConvertibleElementField({required this.value});
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
void _$SerializableConverterNullableConvertibleElementFieldBuildXmlChildren(SerializableConverterNullableConvertibleElementField instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final value = instance.value;
final valueSerialized = value;
builder.element('value', nest: () { if (valueSerialized != null) { const ElementDateTimeConverter().buildXmlChildren(valueSerialized, builder, namespaces: namespaces); } });
}

SerializableConverterNullableConvertibleElementField _$SerializableConverterNullableConvertibleElementFieldFromXmlElement(XmlElement element) {
final value = element.getElement('value');
return SerializableConverterNullableConvertibleElementField(value: value != null ? const ElementDateTimeConverter().fromXmlElement(value) : null);
}

List<XmlAttribute> _$SerializableConverterNullableConvertibleElementFieldToXmlAttributes(SerializableConverterNullableConvertibleElementField instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _$SerializableConverterNullableConvertibleElementFieldToXmlChildren(SerializableConverterNullableConvertibleElementField instance, {Map<String, String?> namespaces = const {}}) {
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
class SerializableConverterNullableConvertibleElementField {
  @annotation.XmlElement()
  DateTime? value;

  SerializableConverterNullableConvertibleElementField({this.value});
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
