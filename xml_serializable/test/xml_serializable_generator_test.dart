import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';
import 'package:xml_annotation/xml_annotation.dart';
import 'package:xml_serializable/xml_serializable.dart';

import 'fake_bool_class_element.dart';
import 'fake_build_step.dart';
import 'fake_class_element.dart';
import 'fake_constant_reader.dart';
import 'fake_date_time_class_element.dart';
import 'fake_double_class_element.dart';
import 'fake_duration_class_element.dart';
import 'fake_dynamic_class_element.dart';
import 'fake_enum_element.dart';
import 'fake_field_element.dart';
import 'fake_int_class_element.dart';
import 'fake_interface_type.dart';
import 'fake_iterable_class_element.dart';
import 'fake_library_element.dart';
import 'fake_list_class_element.dart';
import 'fake_num_class_element.dart';
import 'fake_set_class_element.dart';
import 'fake_string_class_element.dart';
import 'fake_uri_class_element.dart';
import 'fake_xml_attribute_element_annotation.dart';
import 'fake_xml_element_element_annotation.dart';
import 'fake_xml_root_element_element_annotation.dart';
import 'fake_xml_serializable_element_annotation.dart';
import 'fake_xml_text_element_annotation.dart';

void main() {
  group(
    'XmlSerializableGenerator',
    () {
      const generator = XmlSerializableGenerator();

      test(
        'should generate `buildXmlChildren`, `fromXmlElement`, `toXmlAttributes`, `toXmlChildren` if the class has an `XmlSerializable` annotation',
        () {
          expect(
            generator.generateForAnnotatedElement(
              FakeClassElement(
                fields: [
                  FakeFieldElement(
                    metadata: [
                      FakeXmlAttributeElementAnnotation(
                        name: 'boolattribute',
                      ),
                    ],
                    name: 'boolAttribute',
                    type: FakeInterfaceType(
                      element2: FakeBoolClassElement(),
                      isDartCoreBool: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlAttributeElementAnnotation(
                        name: 'datetimeattribute',
                      ),
                    ],
                    name: 'dateTimeAttribute',
                    type: FakeInterfaceType(
                      element2: FakeDateTimeClassElement(),
                      nullabilitySuffix: NullabilitySuffix.question,
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlAttributeElementAnnotation(
                        name: 'doubleattribute',
                      ),
                    ],
                    name: 'doubleAttribute',
                    type: FakeInterfaceType(
                      element2: FakeDoubleClassElement(),
                      isDartCoreDouble: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlAttributeElementAnnotation(
                        name: 'durationattribute',
                      ),
                    ],
                    name: 'durationAttribute',
                    type: FakeInterfaceType(
                      element2: FakeDurationClassElement(),
                      nullabilitySuffix: NullabilitySuffix.question,
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlAttributeElementAnnotation(
                        name: 'dynamicattribute',
                      ),
                    ],
                    name: 'dynamicAttribute',
                    type: FakeInterfaceType(
                      element2: FakeDynamicClassElement(),
                      isDynamic: true,
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlAttributeElementAnnotation(
                        name: 'enumattribute',
                      ),
                    ],
                    name: 'enumAttribute',
                    type: FakeInterfaceType(
                      element2: FakeEnumElement(
                        fields: [
                          FakeFieldElement(
                            name: 'Foo',
                            isEnumConstant: true,
                          ),
                          FakeFieldElement(
                            name: 'Bar',
                            isEnumConstant: true,
                          ),
                        ],
                        name: 'FooBar',
                      ),
                      isDartCoreEnum: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlAttributeElementAnnotation(
                        name: 'intattribute',
                      ),
                    ],
                    name: 'intAttribute',
                    type: FakeInterfaceType(
                      element2: FakeIntClassElement(),
                      isDartCoreInt: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlAttributeElementAnnotation(
                        name: 'numattribute',
                      ),
                    ],
                    name: 'numAttribute',
                    type: FakeInterfaceType(
                      element2: FakeNumClassElement(),
                      isDartCoreNum: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlAttributeElementAnnotation(
                        name: 'stringattribute',
                      ),
                    ],
                    name: 'stringAttribute',
                    type: FakeInterfaceType(
                      element2: FakeStringClassElement(),
                      isDartCoreString: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlAttributeElementAnnotation(
                        name: 'uriattribute',
                      ),
                    ],
                    name: 'uriAttribute',
                    type: FakeInterfaceType(
                      element2: FakeUriClassElement(),
                      nullabilitySuffix: NullabilitySuffix.question,
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlElementElementAnnotation(
                        name: 'customelement',
                      ),
                    ],
                    name: 'customElement',
                    type: FakeInterfaceType(
                      element2: FakeClassElement(
                        metadata: [
                          FakeXmlSerializableElementAnnotation(),
                        ],
                        name: 'CustomClass',
                      ),
                      nullabilitySuffix: NullabilitySuffix.question,
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlElementElementAnnotation(
                        name: 'customiterableelement',
                      ),
                    ],
                    name: 'customIterableElement',
                    type: FakeInterfaceType(
                      element2: FakeIterableClassElement(),
                      isDartCoreIterable: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                      typeArguments: [
                        FakeInterfaceType(
                          element2: FakeClassElement(
                            metadata: [
                              FakeXmlSerializableElementAnnotation(),
                            ],
                            name: 'CustomClass',
                          ),
                        ),
                      ],
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlElementElementAnnotation(
                        name: 'enumelement',
                      ),
                    ],
                    name: 'enumElement',
                    type: FakeInterfaceType(
                      element2: FakeEnumElement(
                        fields: [
                          FakeFieldElement(
                            name: 'Foo',
                            isEnumConstant: true,
                          ),
                          FakeFieldElement(
                            name: 'Bar',
                            isEnumConstant: true,
                          ),
                        ],
                        name: 'FooBar',
                      ),
                      isDartCoreEnum: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlElementElementAnnotation(
                        name: 'enumiterableelement',
                      ),
                    ],
                    name: 'enumIterableElement',
                    type: FakeInterfaceType(
                      element2: FakeIterableClassElement(),
                      isDartCoreIterable: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                      typeArguments: [
                        FakeInterfaceType(
                          element2: FakeEnumElement(
                            fields: [
                              FakeFieldElement(
                                name: 'Foo',
                                isEnumConstant: true,
                              ),
                              FakeFieldElement(
                                name: 'Bar',
                                isEnumConstant: true,
                              ),
                            ],
                            name: 'FooBar',
                          ),
                          isDartCoreEnum: true,
                        ),
                      ],
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlElementElementAnnotation(
                        name: 'stringelement',
                      ),
                    ],
                    name: 'stringElement',
                    type: FakeInterfaceType(
                      element2: FakeStringClassElement(),
                      isDartCoreString: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlElementElementAnnotation(
                        name: 'nonselfclosingstringelement',
                        isSelfClosing: false,
                      ),
                    ],
                    name: 'nonSelfClosingStringElement',
                    type: FakeInterfaceType(
                      element2: FakeStringClassElement(),
                      isDartCoreString: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlElementElementAnnotation(
                        name: 'excludeifnullstringelement',
                        includeIfNull: false,
                      ),
                    ],
                    name: 'excludeIfNullStringElement',
                    type: FakeInterfaceType(
                      element2: FakeStringClassElement(),
                      isDartCoreString: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlElementElementAnnotation(
                        name: 'stringiterableelement',
                      ),
                    ],
                    name: 'stringIterableElement',
                    type: FakeInterfaceType(
                      element2: FakeIterableClassElement(),
                      isDartCoreIterable: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                      typeArguments: [
                        FakeInterfaceType(
                          element2: FakeStringClassElement(),
                          isDartCoreString: true,
                        ),
                      ],
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlElementElementAnnotation(
                        name: 'nonselfclosingstringiterableelement',
                        isSelfClosing: false,
                      ),
                    ],
                    name: 'nonSelfClosingStringIterableElement',
                    type: FakeInterfaceType(
                      element2: FakeIterableClassElement(),
                      isDartCoreIterable: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                      typeArguments: [
                        FakeInterfaceType(
                          element2: FakeStringClassElement(),
                          isDartCoreString: true,
                        ),
                      ],
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlElementElementAnnotation(
                        name: 'excludeifnullstringiterableelement',
                        includeIfNull: false,
                      ),
                    ],
                    name: 'excludeIfNullStringIterableElement',
                    type: FakeInterfaceType(
                      element2: FakeIterableClassElement(),
                      isDartCoreIterable: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                      typeArguments: [
                        FakeInterfaceType(
                          element2: FakeStringClassElement(),
                          isDartCoreString: true,
                        ),
                      ],
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlElementElementAnnotation(
                        name: 'stringlistelement',
                      ),
                    ],
                    name: 'stringListElement',
                    type: FakeInterfaceType(
                      element2: FakeListClassElement(),
                      isDartCoreList: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                      typeArguments: [
                        FakeInterfaceType(
                          element2: FakeStringClassElement(),
                          isDartCoreString: true,
                        ),
                      ],
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlElementElementAnnotation(
                        name: 'nonselfclosingstringlistelement',
                        isSelfClosing: false,
                      ),
                    ],
                    name: 'nonSelfClosingStringListElement',
                    type: FakeInterfaceType(
                      element2: FakeListClassElement(),
                      isDartCoreList: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                      typeArguments: [
                        FakeInterfaceType(
                          element2: FakeStringClassElement(),
                          isDartCoreString: true,
                        ),
                      ],
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlElementElementAnnotation(
                        name: 'excludeifnullstringlistelement',
                        includeIfNull: false,
                      ),
                    ],
                    name: 'excludeIfNullStringListElement',
                    type: FakeInterfaceType(
                      element2: FakeListClassElement(),
                      isDartCoreList: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                      typeArguments: [
                        FakeInterfaceType(
                          element2: FakeStringClassElement(),
                          isDartCoreString: true,
                        ),
                      ],
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlElementElementAnnotation(
                        name: 'stringsetelement',
                      ),
                    ],
                    name: 'stringSetElement',
                    type: FakeInterfaceType(
                      element2: FakeSetClassElement(),
                      isDartCoreSet: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                      typeArguments: [
                        FakeInterfaceType(
                          element2: FakeStringClassElement(),
                          isDartCoreString: true,
                        ),
                      ],
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlElementElementAnnotation(
                        name: 'nonselfclosingstringsetelement',
                        isSelfClosing: false,
                      ),
                    ],
                    name: 'nonSelfClosingStringSetElement',
                    type: FakeInterfaceType(
                      element2: FakeSetClassElement(),
                      isDartCoreSet: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                      typeArguments: [
                        FakeInterfaceType(
                          element2: FakeStringClassElement(),
                          isDartCoreString: true,
                        ),
                      ],
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlElementElementAnnotation(
                        name: 'excludeifnullstringsetelement',
                        includeIfNull: false,
                      ),
                    ],
                    name: 'excludeIfNullStringSetElement',
                    type: FakeInterfaceType(
                      element2: FakeSetClassElement(),
                      isDartCoreSet: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                      typeArguments: [
                        FakeInterfaceType(
                          element2: FakeStringClassElement(),
                          isDartCoreString: true,
                        ),
                      ],
                    ),
                  ),
                  FakeFieldElement(
                    metadata: [
                      FakeXmlTextElementAnnotation(),
                    ],
                    name: 'stringText',
                    type: FakeInterfaceType(
                      element2: FakeStringClassElement(),
                      isDartCoreString: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                    ),
                  ),
                  FakeFieldElement(
                    name: 'ignored',
                    type: FakeInterfaceType(
                      element2: FakeClassElement(),
                      nullabilitySuffix: NullabilitySuffix.question,
                    ),
                  ),
                ],
                metadata: [
                  FakeXmlSerializableElementAnnotation(),
                ],
                name: 'TestClass',
              ),
              FakeConstantReader(),
              FakeBuildStep(),
            ),
            equals(
                '''void _\$TestClassBuildXmlChildren(TestClass instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final boolAttribute = instance.boolAttribute;
final boolAttributeSerialized = boolAttribute != null ? boolAttribute == true ? 'true' : 'false' : null;
if (boolAttributeSerialized != null) { builder.attribute('boolattribute', boolAttributeSerialized); }
final dateTimeAttribute = instance.dateTimeAttribute;
final dateTimeAttributeSerialized = dateTimeAttribute?.toIso8601String();
if (dateTimeAttributeSerialized != null) { builder.attribute('datetimeattribute', dateTimeAttributeSerialized); }
final doubleAttribute = instance.doubleAttribute;
final doubleAttributeSerialized = doubleAttribute?.toString();
if (doubleAttributeSerialized != null) { builder.attribute('doubleattribute', doubleAttributeSerialized); }
final durationAttribute = instance.durationAttribute;
final durationAttributeSerialized = durationAttribute?.inMicroseconds.toString();
if (durationAttributeSerialized != null) { builder.attribute('durationattribute', durationAttributeSerialized); }
final dynamicAttribute = instance.dynamicAttribute;
final dynamicAttributeSerialized = dynamicAttribute;
if (dynamicAttributeSerialized != null) { builder.attribute('dynamicattribute', dynamicAttributeSerialized); }
final enumAttribute = instance.enumAttribute;
final enumAttributeSerialized = enumAttribute != null ? \$FooBarEnumMap[enumAttribute]! : null;
if (enumAttributeSerialized != null) { builder.attribute('enumattribute', enumAttributeSerialized); }
final intAttribute = instance.intAttribute;
final intAttributeSerialized = intAttribute?.toString();
if (intAttributeSerialized != null) { builder.attribute('intattribute', intAttributeSerialized); }
final numAttribute = instance.numAttribute;
final numAttributeSerialized = numAttribute?.toString();
if (numAttributeSerialized != null) { builder.attribute('numattribute', numAttributeSerialized); }
final stringAttribute = instance.stringAttribute;
final stringAttributeSerialized = stringAttribute;
if (stringAttributeSerialized != null) { builder.attribute('stringattribute', stringAttributeSerialized); }
final uriAttribute = instance.uriAttribute;
final uriAttributeSerialized = uriAttribute?.toString();
if (uriAttributeSerialized != null) { builder.attribute('uriattribute', uriAttributeSerialized); }
final customElement = instance.customElement;
final customElementSerialized = customElement;
builder.element('customelement', nest: () { if (customElementSerialized != null) { customElementSerialized.buildXmlChildren(builder, namespaces: namespaces); } });
final customIterableElement = instance.customIterableElement;
final customIterableElementSerialized = customIterableElement;
if (customIterableElementSerialized != null) { for (final value in customIterableElementSerialized) { builder.element('customiterableelement', nest: () { value.buildXmlChildren(builder, namespaces: namespaces); }); } }
final enumElement = instance.enumElement;
final enumElementSerialized = enumElement != null ? \$FooBarEnumMap[enumElement]! : null;
builder.element('enumelement', nest: () { if (enumElementSerialized != null) { builder.text(enumElementSerialized); } });
final enumIterableElement = instance.enumIterableElement;
final enumIterableElementSerialized = enumIterableElement?.map((e) => \$FooBarEnumMap[e]!);
if (enumIterableElementSerialized != null) { for (final value in enumIterableElementSerialized) { builder.element('enumiterableelement', nest: () { builder.text(value); }); } }
final stringElement = instance.stringElement;
final stringElementSerialized = stringElement;
builder.element('stringelement', nest: () { if (stringElementSerialized != null) { builder.text(stringElementSerialized); } });
final nonSelfClosingStringElement = instance.nonSelfClosingStringElement;
final nonSelfClosingStringElementSerialized = nonSelfClosingStringElement;
builder.element('nonselfclosingstringelement', isSelfClosing: false, nest: () { if (nonSelfClosingStringElementSerialized != null) { builder.text(nonSelfClosingStringElementSerialized); } });
final excludeIfNullStringElement = instance.excludeIfNullStringElement;
final excludeIfNullStringElementSerialized = excludeIfNullStringElement;
if (excludeIfNullStringElementSerialized != null) { builder.element('excludeifnullstringelement', nest: () { builder.text(excludeIfNullStringElementSerialized); }); }
final stringIterableElement = instance.stringIterableElement;
final stringIterableElementSerialized = stringIterableElement;
if (stringIterableElementSerialized != null) { for (final value in stringIterableElementSerialized) { builder.element('stringiterableelement', nest: () { builder.text(value); }); } }
final nonSelfClosingStringIterableElement = instance.nonSelfClosingStringIterableElement;
final nonSelfClosingStringIterableElementSerialized = nonSelfClosingStringIterableElement;
if (nonSelfClosingStringIterableElementSerialized != null) { for (final value in nonSelfClosingStringIterableElementSerialized) { builder.element('nonselfclosingstringiterableelement', isSelfClosing: false, nest: () { builder.text(value); }); } }
final excludeIfNullStringIterableElement = instance.excludeIfNullStringIterableElement;
final excludeIfNullStringIterableElementSerialized = excludeIfNullStringIterableElement;
if (excludeIfNullStringIterableElementSerialized != null) { for (final value in excludeIfNullStringIterableElementSerialized) { builder.element('excludeifnullstringiterableelement', nest: () { builder.text(value); }); } }
final stringListElement = instance.stringListElement;
final stringListElementSerialized = stringListElement;
if (stringListElementSerialized != null) { for (final value in stringListElementSerialized) { builder.element('stringlistelement', nest: () { builder.text(value); }); } }
final nonSelfClosingStringListElement = instance.nonSelfClosingStringListElement;
final nonSelfClosingStringListElementSerialized = nonSelfClosingStringListElement;
if (nonSelfClosingStringListElementSerialized != null) { for (final value in nonSelfClosingStringListElementSerialized) { builder.element('nonselfclosingstringlistelement', isSelfClosing: false, nest: () { builder.text(value); }); } }
final excludeIfNullStringListElement = instance.excludeIfNullStringListElement;
final excludeIfNullStringListElementSerialized = excludeIfNullStringListElement;
if (excludeIfNullStringListElementSerialized != null) { for (final value in excludeIfNullStringListElementSerialized) { builder.element('excludeifnullstringlistelement', nest: () { builder.text(value); }); } }
final stringSetElement = instance.stringSetElement;
final stringSetElementSerialized = stringSetElement;
if (stringSetElementSerialized != null) { for (final value in stringSetElementSerialized) { builder.element('stringsetelement', nest: () { builder.text(value); }); } }
final nonSelfClosingStringSetElement = instance.nonSelfClosingStringSetElement;
final nonSelfClosingStringSetElementSerialized = nonSelfClosingStringSetElement;
if (nonSelfClosingStringSetElementSerialized != null) { for (final value in nonSelfClosingStringSetElementSerialized) { builder.element('nonselfclosingstringsetelement', isSelfClosing: false, nest: () { builder.text(value); }); } }
final excludeIfNullStringSetElement = instance.excludeIfNullStringSetElement;
final excludeIfNullStringSetElementSerialized = excludeIfNullStringSetElement;
if (excludeIfNullStringSetElementSerialized != null) { for (final value in excludeIfNullStringSetElementSerialized) { builder.element('excludeifnullstringsetelement', nest: () { builder.text(value); }); } }
final stringText = instance.stringText;
final stringTextSerialized = stringText;
if (stringTextSerialized != null) { builder.text(stringTextSerialized); }
}

TestClass _\$TestClassFromXmlElement(XmlElement element) {
final boolAttribute = element.getAttribute('boolattribute');
final dateTimeAttribute = element.getAttribute('datetimeattribute');
final doubleAttribute = element.getAttribute('doubleattribute');
final durationAttribute = element.getAttribute('durationattribute');
final dynamicAttribute = element.getAttribute('dynamicattribute');
final enumAttribute = element.getAttribute('enumattribute');
final intAttribute = element.getAttribute('intattribute');
final numAttribute = element.getAttribute('numattribute');
final stringAttribute = element.getAttribute('stringattribute');
final uriAttribute = element.getAttribute('uriattribute');
final customElement = element.getElement('customelement');
final customIterableElement = element.getElements('customiterableelement');
final enumElement = element.getElement('enumelement')?.getText();
final enumIterableElement = element.getElements('enumiterableelement')?.map((e) => e.getText()).whereType<String>();
final stringElement = element.getElement('stringelement')?.getText();
final nonSelfClosingStringElement = element.getElement('nonselfclosingstringelement')?.getText();
final excludeIfNullStringElement = element.getElement('excludeifnullstringelement')?.getText();
final stringIterableElement = element.getElements('stringiterableelement')?.map((e) => e.getText()).whereType<String>();
final nonSelfClosingStringIterableElement = element.getElements('nonselfclosingstringiterableelement')?.map((e) => e.getText()).whereType<String>();
final excludeIfNullStringIterableElement = element.getElements('excludeifnullstringiterableelement')?.map((e) => e.getText()).whereType<String>();
final stringListElement = element.getElements('stringlistelement')?.map((e) => e.getText()).whereType<String>();
final nonSelfClosingStringListElement = element.getElements('nonselfclosingstringlistelement')?.map((e) => e.getText()).whereType<String>();
final excludeIfNullStringListElement = element.getElements('excludeifnullstringlistelement')?.map((e) => e.getText()).whereType<String>();
final stringSetElement = element.getElements('stringsetelement')?.map((e) => e.getText()).whereType<String>();
final nonSelfClosingStringSetElement = element.getElements('nonselfclosingstringsetelement')?.map((e) => e.getText()).whereType<String>();
final excludeIfNullStringSetElement = element.getElements('excludeifnullstringsetelement')?.map((e) => e.getText()).whereType<String>();
final stringText = element.getText();
return TestClass(boolAttribute: boolAttribute != null ? boolAttribute == 'true' || boolAttribute == '1' ? true : boolAttribute == 'false' || boolAttribute == '0' ? false : throw FormatException('Invalid bool format', boolAttribute) : null, dateTimeAttribute: dateTimeAttribute != null ? DateTime.parse(dateTimeAttribute) : null, doubleAttribute: doubleAttribute != null ? double.parse(doubleAttribute) : null, durationAttribute: durationAttribute != null ? Duration(microseconds: int.parse(durationAttribute)) : null, dynamicAttribute: dynamicAttribute, enumAttribute: enumAttribute != null ? \$FooBarEnumMap.entries.singleWhere((fooBarEnumMapEntry) => fooBarEnumMapEntry.value == enumAttribute, orElse: () => throw ArgumentError('`\$enumAttribute` is not one of the supported values: \${\$FooBarEnumMap.values.join(', ')}')).key : null, intAttribute: intAttribute != null ? int.parse(intAttribute) : null, numAttribute: numAttribute != null ? num.parse(numAttribute) : null, stringAttribute: stringAttribute, uriAttribute: uriAttribute != null ? Uri.parse(uriAttribute) : null, customElement: customElement != null ? CustomClass.fromXmlElement(customElement) : null, customIterableElement: customIterableElement?.map((e) => CustomClass.fromXmlElement(e)), enumElement: enumElement != null ? \$FooBarEnumMap.entries.singleWhere((fooBarEnumMapEntry) => fooBarEnumMapEntry.value == enumElement, orElse: () => throw ArgumentError('`\$enumElement` is not one of the supported values: \${\$FooBarEnumMap.values.join(', ')}')).key : null, enumIterableElement: enumIterableElement?.map((e) => \$FooBarEnumMap.entries.singleWhere((fooBarEnumMapEntry) => fooBarEnumMapEntry.value == e, orElse: () => throw ArgumentError('`\$e` is not one of the supported values: \${\$FooBarEnumMap.values.join(', ')}')).key), stringElement: stringElement, nonSelfClosingStringElement: nonSelfClosingStringElement, excludeIfNullStringElement: excludeIfNullStringElement, stringIterableElement: stringIterableElement, nonSelfClosingStringIterableElement: nonSelfClosingStringIterableElement, excludeIfNullStringIterableElement: excludeIfNullStringIterableElement, stringListElement: stringListElement?.toList(), nonSelfClosingStringListElement: nonSelfClosingStringListElement?.toList(), excludeIfNullStringListElement: excludeIfNullStringListElement?.toList(), stringSetElement: stringSetElement?.toSet(), nonSelfClosingStringSetElement: nonSelfClosingStringSetElement?.toSet(), excludeIfNullStringSetElement: excludeIfNullStringSetElement?.toSet(), stringText: stringText);
}

List<XmlAttribute> _\$TestClassToXmlAttributes(TestClass instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
final boolAttribute = instance.boolAttribute;
final boolAttributeSerialized = boolAttribute != null ? boolAttribute == true ? 'true' : 'false' : null;
final boolAttributeConstructed = boolAttributeSerialized != null ? XmlAttribute(XmlName('boolattribute'), boolAttributeSerialized) : null;
if (boolAttributeConstructed != null) { attributes.add(boolAttributeConstructed); }
final dateTimeAttribute = instance.dateTimeAttribute;
final dateTimeAttributeSerialized = dateTimeAttribute?.toIso8601String();
final dateTimeAttributeConstructed = dateTimeAttributeSerialized != null ? XmlAttribute(XmlName('datetimeattribute'), dateTimeAttributeSerialized) : null;
if (dateTimeAttributeConstructed != null) { attributes.add(dateTimeAttributeConstructed); }
final doubleAttribute = instance.doubleAttribute;
final doubleAttributeSerialized = doubleAttribute?.toString();
final doubleAttributeConstructed = doubleAttributeSerialized != null ? XmlAttribute(XmlName('doubleattribute'), doubleAttributeSerialized) : null;
if (doubleAttributeConstructed != null) { attributes.add(doubleAttributeConstructed); }
final durationAttribute = instance.durationAttribute;
final durationAttributeSerialized = durationAttribute?.inMicroseconds.toString();
final durationAttributeConstructed = durationAttributeSerialized != null ? XmlAttribute(XmlName('durationattribute'), durationAttributeSerialized) : null;
if (durationAttributeConstructed != null) { attributes.add(durationAttributeConstructed); }
final dynamicAttribute = instance.dynamicAttribute;
final dynamicAttributeSerialized = dynamicAttribute;
final dynamicAttributeConstructed = dynamicAttributeSerialized != null ? XmlAttribute(XmlName('dynamicattribute'), dynamicAttributeSerialized) : null;
if (dynamicAttributeConstructed != null) { attributes.add(dynamicAttributeConstructed); }
final enumAttribute = instance.enumAttribute;
final enumAttributeSerialized = enumAttribute != null ? \$FooBarEnumMap[enumAttribute]! : null;
final enumAttributeConstructed = enumAttributeSerialized != null ? XmlAttribute(XmlName('enumattribute'), enumAttributeSerialized) : null;
if (enumAttributeConstructed != null) { attributes.add(enumAttributeConstructed); }
final intAttribute = instance.intAttribute;
final intAttributeSerialized = intAttribute?.toString();
final intAttributeConstructed = intAttributeSerialized != null ? XmlAttribute(XmlName('intattribute'), intAttributeSerialized) : null;
if (intAttributeConstructed != null) { attributes.add(intAttributeConstructed); }
final numAttribute = instance.numAttribute;
final numAttributeSerialized = numAttribute?.toString();
final numAttributeConstructed = numAttributeSerialized != null ? XmlAttribute(XmlName('numattribute'), numAttributeSerialized) : null;
if (numAttributeConstructed != null) { attributes.add(numAttributeConstructed); }
final stringAttribute = instance.stringAttribute;
final stringAttributeSerialized = stringAttribute;
final stringAttributeConstructed = stringAttributeSerialized != null ? XmlAttribute(XmlName('stringattribute'), stringAttributeSerialized) : null;
if (stringAttributeConstructed != null) { attributes.add(stringAttributeConstructed); }
final uriAttribute = instance.uriAttribute;
final uriAttributeSerialized = uriAttribute?.toString();
final uriAttributeConstructed = uriAttributeSerialized != null ? XmlAttribute(XmlName('uriattribute'), uriAttributeSerialized) : null;
if (uriAttributeConstructed != null) { attributes.add(uriAttributeConstructed); }
return attributes;
}

List<XmlNode> _\$TestClassToXmlChildren(TestClass instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final customElement = instance.customElement;
final customElementSerialized = customElement;
final customElementConstructed = XmlElement(XmlName('customelement'), customElementSerialized?.toXmlAttributes(namespaces: namespaces) ?? [], customElementSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
children.add(customElementConstructed);
final customIterableElement = instance.customIterableElement;
final customIterableElementSerialized = customIterableElement;
final customIterableElementConstructed = customIterableElementSerialized?.map((e) => XmlElement(XmlName('customiterableelement'), e.toXmlAttributes(namespaces: namespaces), e.toXmlChildren(namespaces: namespaces)));
if (customIterableElementConstructed != null) { children.addAll(customIterableElementConstructed); }
final enumElement = instance.enumElement;
final enumElementSerialized = enumElement != null ? \$FooBarEnumMap[enumElement]! : null;
final enumElementConstructed = XmlElement(XmlName('enumelement'), [], enumElementSerialized != null ? [XmlText(enumElementSerialized)] : []);
children.add(enumElementConstructed);
final enumIterableElement = instance.enumIterableElement;
final enumIterableElementSerialized = enumIterableElement?.map((e) => \$FooBarEnumMap[e]!);
final enumIterableElementConstructed = enumIterableElementSerialized?.map((e) => XmlElement(XmlName('enumiterableelement'), [], [XmlText(e)]));
if (enumIterableElementConstructed != null) { children.addAll(enumIterableElementConstructed); }
final stringElement = instance.stringElement;
final stringElementSerialized = stringElement;
final stringElementConstructed = XmlElement(XmlName('stringelement'), [], stringElementSerialized != null ? [XmlText(stringElementSerialized)] : []);
children.add(stringElementConstructed);
final nonSelfClosingStringElement = instance.nonSelfClosingStringElement;
final nonSelfClosingStringElementSerialized = nonSelfClosingStringElement;
final nonSelfClosingStringElementConstructed = XmlElement(XmlName('nonselfclosingstringelement'), [], nonSelfClosingStringElementSerialized != null ? [XmlText(nonSelfClosingStringElementSerialized)] : [], false);
children.add(nonSelfClosingStringElementConstructed);
final excludeIfNullStringElement = instance.excludeIfNullStringElement;
final excludeIfNullStringElementSerialized = excludeIfNullStringElement;
final excludeIfNullStringElementConstructed = excludeIfNullStringElementSerialized != null ? XmlElement(XmlName('excludeifnullstringelement'), [], [XmlText(excludeIfNullStringElementSerialized)]) : null;
if (excludeIfNullStringElementConstructed != null) { children.add(excludeIfNullStringElementConstructed); }
final stringIterableElement = instance.stringIterableElement;
final stringIterableElementSerialized = stringIterableElement;
final stringIterableElementConstructed = stringIterableElementSerialized?.map((e) => XmlElement(XmlName('stringiterableelement'), [], [XmlText(e)]));
if (stringIterableElementConstructed != null) { children.addAll(stringIterableElementConstructed); }
final nonSelfClosingStringIterableElement = instance.nonSelfClosingStringIterableElement;
final nonSelfClosingStringIterableElementSerialized = nonSelfClosingStringIterableElement;
final nonSelfClosingStringIterableElementConstructed = nonSelfClosingStringIterableElementSerialized?.map((e) => XmlElement(XmlName('nonselfclosingstringiterableelement'), [], [XmlText(e)], false));
if (nonSelfClosingStringIterableElementConstructed != null) { children.addAll(nonSelfClosingStringIterableElementConstructed); }
final excludeIfNullStringIterableElement = instance.excludeIfNullStringIterableElement;
final excludeIfNullStringIterableElementSerialized = excludeIfNullStringIterableElement;
final excludeIfNullStringIterableElementConstructed = excludeIfNullStringIterableElementSerialized?.map((e) => XmlElement(XmlName('excludeifnullstringiterableelement'), [], [XmlText(e)]));
if (excludeIfNullStringIterableElementConstructed != null) { children.addAll(excludeIfNullStringIterableElementConstructed); }
final stringListElement = instance.stringListElement;
final stringListElementSerialized = stringListElement;
final stringListElementConstructed = stringListElementSerialized?.map((e) => XmlElement(XmlName('stringlistelement'), [], [XmlText(e)]));
if (stringListElementConstructed != null) { children.addAll(stringListElementConstructed); }
final nonSelfClosingStringListElement = instance.nonSelfClosingStringListElement;
final nonSelfClosingStringListElementSerialized = nonSelfClosingStringListElement;
final nonSelfClosingStringListElementConstructed = nonSelfClosingStringListElementSerialized?.map((e) => XmlElement(XmlName('nonselfclosingstringlistelement'), [], [XmlText(e)], false));
if (nonSelfClosingStringListElementConstructed != null) { children.addAll(nonSelfClosingStringListElementConstructed); }
final excludeIfNullStringListElement = instance.excludeIfNullStringListElement;
final excludeIfNullStringListElementSerialized = excludeIfNullStringListElement;
final excludeIfNullStringListElementConstructed = excludeIfNullStringListElementSerialized?.map((e) => XmlElement(XmlName('excludeifnullstringlistelement'), [], [XmlText(e)]));
if (excludeIfNullStringListElementConstructed != null) { children.addAll(excludeIfNullStringListElementConstructed); }
final stringSetElement = instance.stringSetElement;
final stringSetElementSerialized = stringSetElement;
final stringSetElementConstructed = stringSetElementSerialized?.map((e) => XmlElement(XmlName('stringsetelement'), [], [XmlText(e)]));
if (stringSetElementConstructed != null) { children.addAll(stringSetElementConstructed); }
final nonSelfClosingStringSetElement = instance.nonSelfClosingStringSetElement;
final nonSelfClosingStringSetElementSerialized = nonSelfClosingStringSetElement;
final nonSelfClosingStringSetElementConstructed = nonSelfClosingStringSetElementSerialized?.map((e) => XmlElement(XmlName('nonselfclosingstringsetelement'), [], [XmlText(e)], false));
if (nonSelfClosingStringSetElementConstructed != null) { children.addAll(nonSelfClosingStringSetElementConstructed); }
final excludeIfNullStringSetElement = instance.excludeIfNullStringSetElement;
final excludeIfNullStringSetElementSerialized = excludeIfNullStringSetElement;
final excludeIfNullStringSetElementConstructed = excludeIfNullStringSetElementSerialized?.map((e) => XmlElement(XmlName('excludeifnullstringsetelement'), [], [XmlText(e)]));
if (excludeIfNullStringSetElementConstructed != null) { children.addAll(excludeIfNullStringSetElementConstructed); }
final stringText = instance.stringText;
final stringTextSerialized = stringText;
final stringTextConstructed = stringTextSerialized != null ? XmlText(stringTextSerialized) : null;
if (stringTextConstructed != null) { children.add(stringTextConstructed); }
return children;
}'''),
          );
        },
      );

      test(
        'should generate `buildXmlChildren`, `buildXmlElement`, `fromXmlElement`, `toXmlAttributes`, `toXmlChildren`, `toXmlElement` if the class has an `XmlSerializable` annotation and an `XmlRootElement` annotation',
        () {
          expect(
            generator.generateForAnnotatedElement(
              FakeClassElement(
                fields: [
                  FakeFieldElement(
                    metadata: [
                      FakeXmlElementElementAnnotation(
                        name: 'stringelement',
                      ),
                    ],
                    name: 'stringElement',
                    type: FakeInterfaceType(
                      element2: FakeStringClassElement(),
                      isDartCoreString: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                    ),
                  ),
                ],
                metadata: [
                  FakeXmlRootElementElementAnnotation(
                    name: 'testclass',
                  ),
                  FakeXmlSerializableElementAnnotation(),
                ],
                name: 'TestClass',
              ),
              FakeConstantReader(),
              FakeBuildStep(),
            ),
            equals(
                '''void _\$TestClassBuildXmlChildren(TestClass instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final stringElement = instance.stringElement;
final stringElementSerialized = stringElement;
builder.element('stringelement', nest: () { if (stringElementSerialized != null) { builder.text(stringElementSerialized); } });
}

void _\$TestClassBuildXmlElement(TestClass instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
builder.element('testclass', namespaces: namespaces, nest: () { instance.buildXmlChildren(builder, namespaces: namespaces); });
}

TestClass _\$TestClassFromXmlElement(XmlElement element) {
final stringElement = element.getElement('stringelement')?.getText();
return TestClass(stringElement: stringElement);
}

List<XmlAttribute> _\$TestClassToXmlAttributes(TestClass instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _\$TestClassToXmlChildren(TestClass instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final stringElement = instance.stringElement;
final stringElementSerialized = stringElement;
final stringElementConstructed = XmlElement(XmlName('stringelement'), [], stringElementSerialized != null ? [XmlText(stringElementSerialized)] : []);
children.add(stringElementConstructed);
return children;
}

XmlElement _\$TestClassToXmlElement(TestClass instance, {Map<String, String?> namespaces = const {}}) {
return XmlElement(XmlName('testclass'), [...namespaces.toXmlAttributes(), ...instance.toXmlAttributes(namespaces: namespaces)], instance.toXmlChildren(namespaces: namespaces));
}'''),
          );
        },
      );

      test(
        'should generate `buildXmlChildren`, `fromXmlElement`, `toXmlAttributes`, `toXmlChildren` and a mixin with `buildXmlChildren`, `toXmlAttributes`, `toXmlChildren` if the class has an `XmlSerializable` annotation with a truthy `createMixin`',
        () {
          expect(
            generator.generateForAnnotatedElement(
              FakeClassElement(
                fields: [
                  FakeFieldElement(
                    metadata: [
                      FakeXmlElementElementAnnotation(
                        name: 'stringelement',
                      ),
                    ],
                    name: 'stringElement',
                    type: FakeInterfaceType(
                      element2: FakeStringClassElement(),
                      isDartCoreString: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                    ),
                  ),
                ],
                metadata: [
                  FakeXmlSerializableElementAnnotation(
                    createMixin: true,
                  ),
                ],
                name: 'TestClass',
              ),
              FakeConstantReader(),
              FakeBuildStep(),
            ),
            equals(
                '''void _\$TestClassBuildXmlChildren(TestClass instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final stringElement = instance.stringElement;
final stringElementSerialized = stringElement;
builder.element('stringelement', nest: () { if (stringElementSerialized != null) { builder.text(stringElementSerialized); } });
}

TestClass _\$TestClassFromXmlElement(XmlElement element) {
final stringElement = element.getElement('stringelement')?.getText();
return TestClass(stringElement: stringElement);
}

List<XmlAttribute> _\$TestClassToXmlAttributes(TestClass instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _\$TestClassToXmlChildren(TestClass instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final stringElement = instance.stringElement;
final stringElementSerialized = stringElement;
final stringElementConstructed = XmlElement(XmlName('stringelement'), [], stringElementSerialized != null ? [XmlText(stringElementSerialized)] : []);
children.add(stringElementConstructed);
return children;
}

mixin _\$TestClassXmlSerializableMixin {
void buildXmlChildren(XmlBuilder builder, {Map<String, String> namespaces = const {}}) => _\$TestClassBuildXmlChildren(this as TestClass, builder, namespaces: namespaces);

List<XmlAttribute> toXmlAttributes({Map<String, String?> namespaces = const {}}) => _\$TestClassToXmlAttributes(this as TestClass, namespaces: namespaces);

List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) => _\$TestClassToXmlChildren(this as TestClass, namespaces: namespaces);
}'''),
          );
        },
      );

      test(
        'should generate `buildXmlChildren`, `buildXmlElement`, `fromXmlElement`, `toXmlAttributes`, `toXmlChildren`, `toXmlElement` and a mixin with `buildXmlChildren`, `buildXmlElement`, `toXmlAttributes`, `toXmlChildren`, `toXmlElement` if the class has an `XmlSerializable` annotation with a truthy `createMixin` and an `XmlRootElement` annotation',
        () {
          expect(
            generator.generateForAnnotatedElement(
              FakeClassElement(
                fields: [
                  FakeFieldElement(
                    metadata: [
                      FakeXmlElementElementAnnotation(
                        name: 'stringelement',
                      ),
                    ],
                    name: 'stringElement',
                    type: FakeInterfaceType(
                      element2: FakeStringClassElement(),
                      isDartCoreString: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                    ),
                  ),
                ],
                metadata: [
                  FakeXmlRootElementElementAnnotation(
                    name: 'testclass',
                  ),
                  FakeXmlSerializableElementAnnotation(
                    createMixin: true,
                  ),
                ],
                name: 'TestClass',
              ),
              FakeConstantReader(),
              FakeBuildStep(),
            ),
            equals(
                '''void _\$TestClassBuildXmlChildren(TestClass instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final stringElement = instance.stringElement;
final stringElementSerialized = stringElement;
builder.element('stringelement', nest: () { if (stringElementSerialized != null) { builder.text(stringElementSerialized); } });
}

void _\$TestClassBuildXmlElement(TestClass instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
builder.element('testclass', namespaces: namespaces, nest: () { instance.buildXmlChildren(builder, namespaces: namespaces); });
}

TestClass _\$TestClassFromXmlElement(XmlElement element) {
final stringElement = element.getElement('stringelement')?.getText();
return TestClass(stringElement: stringElement);
}

List<XmlAttribute> _\$TestClassToXmlAttributes(TestClass instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _\$TestClassToXmlChildren(TestClass instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final stringElement = instance.stringElement;
final stringElementSerialized = stringElement;
final stringElementConstructed = XmlElement(XmlName('stringelement'), [], stringElementSerialized != null ? [XmlText(stringElementSerialized)] : []);
children.add(stringElementConstructed);
return children;
}

XmlElement _\$TestClassToXmlElement(TestClass instance, {Map<String, String?> namespaces = const {}}) {
return XmlElement(XmlName('testclass'), [...namespaces.toXmlAttributes(), ...instance.toXmlAttributes(namespaces: namespaces)], instance.toXmlChildren(namespaces: namespaces));
}

mixin _\$TestClassXmlSerializableMixin {
void buildXmlChildren(XmlBuilder builder, {Map<String, String> namespaces = const {}}) => _\$TestClassBuildXmlChildren(this as TestClass, builder, namespaces: namespaces);

void buildXmlElement(XmlBuilder builder, {Map<String, String> namespaces = const {}}) => _\$TestClassBuildXmlElement(this as TestClass, builder, namespaces: namespaces);

List<XmlAttribute> toXmlAttributes({Map<String, String?> namespaces = const {}}) => _\$TestClassToXmlAttributes(this as TestClass, namespaces: namespaces);

List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) => _\$TestClassToXmlChildren(this as TestClass, namespaces: namespaces);

XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) => _\$TestClassToXmlElement(this as TestClass, namespaces: namespaces);
}'''),
          );
        },
      );

      test(
        'should generate `buildXmlChildren`, `fromXmlElement`, `toXmlAttributes`, `toXmlChildren` with attribute names and element names encoded to pascal case if the class has an `XmlSerializable` annotation with a `fieldRename` of `pascal`',
        () {
          expect(
            generator.generateForAnnotatedElement(
              FakeClassElement(
                fields: [
                  FakeFieldElement(
                    enclosingElement3: FakeClassElement(
                      metadata: [
                        FakeXmlSerializableElementAnnotation(
                          fieldRename: FieldRename.pascal,
                        ),
                      ],
                    ),
                    metadata: [
                      FakeXmlElementElementAnnotation(),
                    ],
                    name: 'stringElement',
                    type: FakeInterfaceType(
                      element2: FakeStringClassElement(),
                      isDartCoreString: true,
                      nullabilitySuffix: NullabilitySuffix.question,
                    ),
                  ),
                  FakeFieldElement(
                    enclosingElement3: FakeClassElement(
                      metadata: [
                        FakeXmlSerializableElementAnnotation(
                          fieldRename: FieldRename.pascal,
                        ),
                      ],
                    ),
                    metadata: [
                      FakeXmlElementElementAnnotation(
                        name: 'customelement',
                      ),
                    ],
                    name: 'customElement',
                    type: FakeInterfaceType(
                      element2: FakeClassElement(
                        metadata: [
                          FakeXmlSerializableElementAnnotation(),
                        ],
                        name: 'CustomClass',
                      ),
                      nullabilitySuffix: NullabilitySuffix.question,
                    ),
                  ),
                ],
                metadata: [
                  FakeXmlSerializableElementAnnotation(
                    fieldRename: FieldRename.pascal,
                  ),
                ],
                name: 'TestClass',
              ),
              FakeConstantReader(),
              FakeBuildStep(),
            ),
            equals(
                '''void _\$TestClassBuildXmlChildren(TestClass instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
final stringElement = instance.stringElement;
final stringElementSerialized = stringElement;
builder.element('StringElement', nest: () { if (stringElementSerialized != null) { builder.text(stringElementSerialized); } });
final customElement = instance.customElement;
final customElementSerialized = customElement;
builder.element('customelement', nest: () { if (customElementSerialized != null) { customElementSerialized.buildXmlChildren(builder, namespaces: namespaces); } });
}

TestClass _\$TestClassFromXmlElement(XmlElement element) {
final stringElement = element.getElement('StringElement')?.getText();
final customElement = element.getElement('customelement');
return TestClass(stringElement: stringElement, customElement: customElement != null ? CustomClass.fromXmlElement(customElement) : null);
}

List<XmlAttribute> _\$TestClassToXmlAttributes(TestClass instance, {Map<String, String?> namespaces = const {}}) {
final attributes = <XmlAttribute>[];
return attributes;
}

List<XmlNode> _\$TestClassToXmlChildren(TestClass instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
final stringElement = instance.stringElement;
final stringElementSerialized = stringElement;
final stringElementConstructed = XmlElement(XmlName('StringElement'), [], stringElementSerialized != null ? [XmlText(stringElementSerialized)] : []);
children.add(stringElementConstructed);
final customElement = instance.customElement;
final customElementSerialized = customElement;
final customElementConstructed = XmlElement(XmlName('customelement'), customElementSerialized?.toXmlAttributes(namespaces: namespaces) ?? [], customElementSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
children.add(customElementConstructed);
return children;
}'''),
          );
        },
      );

      test(
        'should throw an invalid generation source error if the library is not non nullable by default',
        () {
          expect(
            () {
              generator.generateForAnnotatedElement(
                FakeClassElement(
                  library: FakeLibraryElement(
                    isNonNullableByDefault: false,
                  ),
                  metadata: [
                    FakeXmlRootElementElementAnnotation(),
                    FakeXmlSerializableElementAnnotation(),
                  ],
                ),
                FakeConstantReader(),
                FakeBuildStep(),
              );
            },
            throwsA(isA<InvalidGenerationSourceError>()),
          );
        },
      );

      test(
        'should throw an invalid generation source error if the class has a field that is an iterable type and has an `XmlAttribute` annotation',
        () {
          expect(
            () {
              generator.generateForAnnotatedElement(
                FakeClassElement(
                  fields: [
                    FakeFieldElement(
                      metadata: [
                        FakeXmlAttributeElementAnnotation(),
                      ],
                      type: FakeInterfaceType(
                        element2: FakeIterableClassElement(),
                        isDartCoreIterable: true,
                        nullabilitySuffix: NullabilitySuffix.question,
                        typeArguments: [
                          FakeInterfaceType(
                            element2: FakeStringClassElement(),
                            isDartCoreString: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                  metadata: [
                    FakeXmlRootElementElementAnnotation(),
                    FakeXmlSerializableElementAnnotation(),
                  ],
                ),
                FakeConstantReader(),
                FakeBuildStep(),
              );
            },
            throwsA(isA<InvalidGenerationSourceError>()),
          );
        },
      );

      test(
        'should throw an invalid generation source error if the element is not a class element',
        () {
          expect(
            () {
              generator.generateForAnnotatedElement(
                FakeFieldElement(),
                FakeConstantReader(),
                FakeBuildStep(),
              );
            },
            throwsA(isA<InvalidGenerationSourceError>()),
          );
        },
      );
    },
  );
}
