import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';
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
        'should generate `buildXmlChildren`, `fromXmlElement`, `toXmlAttributes`, `toXmlChildren` if the class has an `XmlSerializable` attribute',
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
                        name: 'iterableelement',
                      ),
                    ],
                    name: 'iterableElement',
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
                        name: 'nonselfclosingiterableelement',
                        isSelfClosing: false,
                      ),
                    ],
                    name: 'nonSelfClosingIterableElement',
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
                        name: 'excludeifnulliterableelement',
                        includeIfNull: false,
                      ),
                    ],
                    name: 'excludeIfNullIterableElement',
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
                        name: 'listelement',
                      ),
                    ],
                    name: 'listElement',
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
                        name: 'nonselfclosinglistelement',
                        isSelfClosing: false,
                      ),
                    ],
                    name: 'nonSelfClosingListElement',
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
                        name: 'excludeifnulllistelement',
                        includeIfNull: false,
                      ),
                    ],
                    name: 'excludeIfNullListElement',
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
                        name: 'setelement',
                      ),
                    ],
                    name: 'setElement',
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
                        name: 'nonselfclosingsetelement',
                        isSelfClosing: false,
                      ),
                    ],
                    name: 'nonSelfClosingSetElement',
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
                        name: 'excludeifnullsetelement',
                        includeIfNull: false,
                      ),
                    ],
                    name: 'excludeIfNullSetElement',
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
                        name: 'nonselfclosingcustomelement',
                        isSelfClosing: false,
                      ),
                    ],
                    name: 'nonSelfClosingCustomElement',
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
                        name: 'excludeifnullcustomelement',
                        includeIfNull: false,
                      ),
                    ],
                    name: 'excludeIfNullCustomElement',
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
                    metadata: [
                      FakeXmlTextElementAnnotation(),
                    ],
                    name: 'direction',
                    type: FakeInterfaceType(
                      element2: FakeEnumElement('Direction', [
                        FakeFieldElement(
                          name: 'a',
                          isEnumConstant: true,
                        ),
                        FakeFieldElement(
                          name: 'b',
                          isEnumConstant: true,
                        ),
                      ]),
                      nullabilitySuffix: NullabilitySuffix.question,
                      superclass: FakeInterfaceType(isDartCoreEnum: true),
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
            equals(r'''
void _$TestClassBuildXmlChildren(TestClass instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
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
final stringElement = instance.stringElement;
final stringElementSerialized = stringElement;
builder.element('stringelement', nest: () { if (stringElementSerialized != null) { builder.text(stringElementSerialized); } });
final nonSelfClosingStringElement = instance.nonSelfClosingStringElement;
final nonSelfClosingStringElementSerialized = nonSelfClosingStringElement;
builder.element('nonselfclosingstringelement', isSelfClosing: false, nest: () { if (nonSelfClosingStringElementSerialized != null) { builder.text(nonSelfClosingStringElementSerialized); } });
final excludeIfNullStringElement = instance.excludeIfNullStringElement;
final excludeIfNullStringElementSerialized = excludeIfNullStringElement;
if (excludeIfNullStringElementSerialized != null) { builder.element('excludeifnullstringelement', nest: () { builder.text(excludeIfNullStringElementSerialized); }); }
final iterableElement = instance.iterableElement;
final iterableElementSerialized = iterableElement;
if (iterableElementSerialized != null) { for (final value in iterableElementSerialized) { builder.element('iterableelement', nest: () { builder.text(value); }); } }
final nonSelfClosingIterableElement = instance.nonSelfClosingIterableElement;
final nonSelfClosingIterableElementSerialized = nonSelfClosingIterableElement;
if (nonSelfClosingIterableElementSerialized != null) { for (final value in nonSelfClosingIterableElementSerialized) { builder.element('nonselfclosingiterableelement', isSelfClosing: false, nest: () { builder.text(value); }); } }
final excludeIfNullIterableElement = instance.excludeIfNullIterableElement;
final excludeIfNullIterableElementSerialized = excludeIfNullIterableElement;
if (excludeIfNullIterableElementSerialized != null) { for (final value in excludeIfNullIterableElementSerialized) { builder.element('excludeifnulliterableelement', nest: () { builder.text(value); }); } }
final listElement = instance.listElement;
final listElementSerialized = listElement;
if (listElementSerialized != null) { for (final value in listElementSerialized) { builder.element('listelement', nest: () { builder.text(value); }); } }
final nonSelfClosingListElement = instance.nonSelfClosingListElement;
final nonSelfClosingListElementSerialized = nonSelfClosingListElement;
if (nonSelfClosingListElementSerialized != null) { for (final value in nonSelfClosingListElementSerialized) { builder.element('nonselfclosinglistelement', isSelfClosing: false, nest: () { builder.text(value); }); } }
final excludeIfNullListElement = instance.excludeIfNullListElement;
final excludeIfNullListElementSerialized = excludeIfNullListElement;
if (excludeIfNullListElementSerialized != null) { for (final value in excludeIfNullListElementSerialized) { builder.element('excludeifnulllistelement', nest: () { builder.text(value); }); } }
final setElement = instance.setElement;
final setElementSerialized = setElement;
if (setElementSerialized != null) { for (final value in setElementSerialized) { builder.element('setelement', nest: () { builder.text(value); }); } }
final nonSelfClosingSetElement = instance.nonSelfClosingSetElement;
final nonSelfClosingSetElementSerialized = nonSelfClosingSetElement;
if (nonSelfClosingSetElementSerialized != null) { for (final value in nonSelfClosingSetElementSerialized) { builder.element('nonselfclosingsetelement', isSelfClosing: false, nest: () { builder.text(value); }); } }
final excludeIfNullSetElement = instance.excludeIfNullSetElement;
final excludeIfNullSetElementSerialized = excludeIfNullSetElement;
if (excludeIfNullSetElementSerialized != null) { for (final value in excludeIfNullSetElementSerialized) { builder.element('excludeifnullsetelement', nest: () { builder.text(value); }); } }
final customElement = instance.customElement;
final customElementSerialized = customElement;
builder.element('customelement', nest: () { if (customElementSerialized != null) { customElementSerialized.buildXmlChildren(builder, namespaces: namespaces); } });
final nonSelfClosingCustomElement = instance.nonSelfClosingCustomElement;
final nonSelfClosingCustomElementSerialized = nonSelfClosingCustomElement;
builder.element('nonselfclosingcustomelement', isSelfClosing: false, nest: () { if (nonSelfClosingCustomElementSerialized != null) { nonSelfClosingCustomElementSerialized.buildXmlChildren(builder, namespaces: namespaces); } });
final excludeIfNullCustomElement = instance.excludeIfNullCustomElement;
final excludeIfNullCustomElementSerialized = excludeIfNullCustomElement;
if (excludeIfNullCustomElementSerialized != null) { builder.element('excludeifnullcustomelement', nest: () { excludeIfNullCustomElementSerialized.buildXmlChildren(builder, namespaces: namespaces); }); }
final stringText = instance.stringText;
final stringTextSerialized = stringText;
if (stringTextSerialized != null) { builder.text(stringTextSerialized); }
final direction = instance.direction;
final directionSerialized = _$DirectionEnumMap[direction];
if (directionSerialized != null) { builder.text(directionSerialized); }
}

TestClass _$TestClassFromXmlElement(XmlElement element) {
final boolAttribute = element.getAttribute('boolattribute');
final dateTimeAttribute = element.getAttribute('datetimeattribute');
final doubleAttribute = element.getAttribute('doubleattribute');
final durationAttribute = element.getAttribute('durationattribute');
final dynamicAttribute = element.getAttribute('dynamicattribute');
final intAttribute = element.getAttribute('intattribute');
final numAttribute = element.getAttribute('numattribute');
final stringAttribute = element.getAttribute('stringattribute');
final uriAttribute = element.getAttribute('uriattribute');
final stringElement = element.getElement('stringelement')?.getText();
final nonSelfClosingStringElement = element.getElement('nonselfclosingstringelement')?.getText();
final excludeIfNullStringElement = element.getElement('excludeifnullstringelement')?.getText();
final iterableElement = element.getElements('iterableelement')?.map((e) => e.getText()).whereType<String>();
final nonSelfClosingIterableElement = element.getElements('nonselfclosingiterableelement')?.map((e) => e.getText()).whereType<String>();
final excludeIfNullIterableElement = element.getElements('excludeifnulliterableelement')?.map((e) => e.getText()).whereType<String>();
final listElement = element.getElements('listelement')?.map((e) => e.getText()).whereType<String>();
final nonSelfClosingListElement = element.getElements('nonselfclosinglistelement')?.map((e) => e.getText()).whereType<String>();
final excludeIfNullListElement = element.getElements('excludeifnulllistelement')?.map((e) => e.getText()).whereType<String>();
final setElement = element.getElements('setelement')?.map((e) => e.getText()).whereType<String>();
final nonSelfClosingSetElement = element.getElements('nonselfclosingsetelement')?.map((e) => e.getText()).whereType<String>();
final excludeIfNullSetElement = element.getElements('excludeifnullsetelement')?.map((e) => e.getText()).whereType<String>();
final customElement = element.getElement('customelement');
final nonSelfClosingCustomElement = element.getElement('nonselfclosingcustomelement');
final excludeIfNullCustomElement = element.getElement('excludeifnullcustomelement');
final stringText = element.getText();
final direction = element.getText();
return TestClass(boolAttribute: boolAttribute != null ? boolAttribute == 'true' || boolAttribute == '1' ? true : boolAttribute == 'false' || boolAttribute == '0' ? false : throw FormatException('Invalid bool format', boolAttribute) : null, dateTimeAttribute: dateTimeAttribute != null ? DateTime.parse(dateTimeAttribute) : null, doubleAttribute: doubleAttribute != null ? double.parse(doubleAttribute) : null, durationAttribute: durationAttribute != null ? Duration(microseconds: int.parse(durationAttribute)) : null, dynamicAttribute: dynamicAttribute, intAttribute: intAttribute != null ? int.parse(intAttribute) : null, numAttribute: numAttribute != null ? num.parse(numAttribute) : null, stringAttribute: stringAttribute, uriAttribute: uriAttribute != null ? Uri.parse(uriAttribute) : null, stringElement: stringElement, nonSelfClosingStringElement: nonSelfClosingStringElement, excludeIfNullStringElement: excludeIfNullStringElement, iterableElement: iterableElement, nonSelfClosingIterableElement: nonSelfClosingIterableElement, excludeIfNullIterableElement: excludeIfNullIterableElement, listElement: listElement?.toList(), nonSelfClosingListElement: nonSelfClosingListElement?.toList(), excludeIfNullListElement: excludeIfNullListElement?.toList(), setElement: setElement?.toSet(), nonSelfClosingSetElement: nonSelfClosingSetElement?.toSet(), excludeIfNullSetElement: excludeIfNullSetElement?.toSet(), customElement: customElement != null ? CustomClass.fromXmlElement(customElement) : null, nonSelfClosingCustomElement: nonSelfClosingCustomElement != null ? CustomClass.fromXmlElement(nonSelfClosingCustomElement) : null, excludeIfNullCustomElement: excludeIfNullCustomElement != null ? CustomClass.fromXmlElement(excludeIfNullCustomElement) : null, stringText: stringText, direction: annotation.$enumDecodeNullable(_$DirectionEnumMap, direction));
}

List<XmlAttribute> _$TestClassToXmlAttributes(TestClass instance, {Map<String, String?> namespaces = const {}}) {
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

List<XmlNode> _$TestClassToXmlChildren(TestClass instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
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
final iterableElement = instance.iterableElement;
final iterableElementSerialized = iterableElement;
final iterableElementConstructed = iterableElementSerialized?.map((e) => XmlElement(XmlName('iterableelement'), [], [XmlText(e)]));
if (iterableElementConstructed != null) { children.addAll(iterableElementConstructed); }
final nonSelfClosingIterableElement = instance.nonSelfClosingIterableElement;
final nonSelfClosingIterableElementSerialized = nonSelfClosingIterableElement;
final nonSelfClosingIterableElementConstructed = nonSelfClosingIterableElementSerialized?.map((e) => XmlElement(XmlName('nonselfclosingiterableelement'), [], [XmlText(e)], false));
if (nonSelfClosingIterableElementConstructed != null) { children.addAll(nonSelfClosingIterableElementConstructed); }
final excludeIfNullIterableElement = instance.excludeIfNullIterableElement;
final excludeIfNullIterableElementSerialized = excludeIfNullIterableElement;
final excludeIfNullIterableElementConstructed = excludeIfNullIterableElementSerialized?.map((e) => XmlElement(XmlName('excludeifnulliterableelement'), [], [XmlText(e)]));
if (excludeIfNullIterableElementConstructed != null) { children.addAll(excludeIfNullIterableElementConstructed); }
final listElement = instance.listElement;
final listElementSerialized = listElement;
final listElementConstructed = listElementSerialized?.map((e) => XmlElement(XmlName('listelement'), [], [XmlText(e)]));
if (listElementConstructed != null) { children.addAll(listElementConstructed); }
final nonSelfClosingListElement = instance.nonSelfClosingListElement;
final nonSelfClosingListElementSerialized = nonSelfClosingListElement;
final nonSelfClosingListElementConstructed = nonSelfClosingListElementSerialized?.map((e) => XmlElement(XmlName('nonselfclosinglistelement'), [], [XmlText(e)], false));
if (nonSelfClosingListElementConstructed != null) { children.addAll(nonSelfClosingListElementConstructed); }
final excludeIfNullListElement = instance.excludeIfNullListElement;
final excludeIfNullListElementSerialized = excludeIfNullListElement;
final excludeIfNullListElementConstructed = excludeIfNullListElementSerialized?.map((e) => XmlElement(XmlName('excludeifnulllistelement'), [], [XmlText(e)]));
if (excludeIfNullListElementConstructed != null) { children.addAll(excludeIfNullListElementConstructed); }
final setElement = instance.setElement;
final setElementSerialized = setElement;
final setElementConstructed = setElementSerialized?.map((e) => XmlElement(XmlName('setelement'), [], [XmlText(e)]));
if (setElementConstructed != null) { children.addAll(setElementConstructed); }
final nonSelfClosingSetElement = instance.nonSelfClosingSetElement;
final nonSelfClosingSetElementSerialized = nonSelfClosingSetElement;
final nonSelfClosingSetElementConstructed = nonSelfClosingSetElementSerialized?.map((e) => XmlElement(XmlName('nonselfclosingsetelement'), [], [XmlText(e)], false));
if (nonSelfClosingSetElementConstructed != null) { children.addAll(nonSelfClosingSetElementConstructed); }
final excludeIfNullSetElement = instance.excludeIfNullSetElement;
final excludeIfNullSetElementSerialized = excludeIfNullSetElement;
final excludeIfNullSetElementConstructed = excludeIfNullSetElementSerialized?.map((e) => XmlElement(XmlName('excludeifnullsetelement'), [], [XmlText(e)]));
if (excludeIfNullSetElementConstructed != null) { children.addAll(excludeIfNullSetElementConstructed); }
final customElement = instance.customElement;
final customElementSerialized = customElement;
final customElementConstructed = XmlElement(XmlName('customelement'), customElementSerialized?.toXmlAttributes(namespaces: namespaces) ?? [], customElementSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
children.add(customElementConstructed);
final nonSelfClosingCustomElement = instance.nonSelfClosingCustomElement;
final nonSelfClosingCustomElementSerialized = nonSelfClosingCustomElement;
final nonSelfClosingCustomElementConstructed = XmlElement(XmlName('nonselfclosingcustomelement'), nonSelfClosingCustomElementSerialized?.toXmlAttributes(namespaces: namespaces) ?? [], nonSelfClosingCustomElementSerialized?.toXmlChildren(namespaces: namespaces) ?? [], false);
children.add(nonSelfClosingCustomElementConstructed);
final excludeIfNullCustomElement = instance.excludeIfNullCustomElement;
final excludeIfNullCustomElementSerialized = excludeIfNullCustomElement;
final excludeIfNullCustomElementConstructed = excludeIfNullCustomElementSerialized != null ? XmlElement(XmlName('excludeifnullcustomelement'), excludeIfNullCustomElementSerialized.toXmlAttributes(namespaces: namespaces), excludeIfNullCustomElementSerialized.toXmlChildren(namespaces: namespaces)) : null;
if (excludeIfNullCustomElementConstructed != null) { children.add(excludeIfNullCustomElementConstructed); }
final stringText = instance.stringText;
final stringTextSerialized = stringText;
final stringTextConstructed = stringTextSerialized != null ? XmlText(stringTextSerialized) : null;
if (stringTextConstructed != null) { children.add(stringTextConstructed); }
final direction = instance.direction;
final directionSerialized = _$DirectionEnumMap[direction];
final directionConstructed = directionSerialized != null ? XmlText(directionSerialized) : null;
if (directionConstructed != null) { children.add(directionConstructed); }
return children;
}const _$DirectionEnumMap = {
  Direction.a: 'a',  Direction.b: 'b',
};
'''),
          );
        },
      );

      test(
        'should generate `buildXmlChildren`, `buildXmlElement`, `fromXmlElement`, `toXmlAttributes`, `toXmlChildren`, `toXmlElement` if the class has an `XmlSerializable` attribute and an `XmlRootElement` attribute',
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
                        name: 'iterableelement',
                      ),
                    ],
                    name: 'iterableElement',
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
                        name: 'nonselfclosingiterableelement',
                        isSelfClosing: false,
                      ),
                    ],
                    name: 'nonSelfClosingIterableElement',
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
                        name: 'excludeifnulliterableelement',
                        includeIfNull: false,
                      ),
                    ],
                    name: 'excludeIfNullIterableElement',
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
                        name: 'listelement',
                      ),
                    ],
                    name: 'listElement',
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
                        name: 'nonselfclosinglistelement',
                        isSelfClosing: false,
                      ),
                    ],
                    name: 'nonSelfClosingListElement',
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
                        name: 'excludeifnulllistelement',
                        includeIfNull: false,
                      ),
                    ],
                    name: 'excludeIfNullListElement',
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
                        name: 'setelement',
                      ),
                    ],
                    name: 'setElement',
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
                        name: 'nonselfclosingsetelement',
                        isSelfClosing: false,
                      ),
                    ],
                    name: 'nonSelfClosingSetElement',
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
                        name: 'excludeifnullsetelement',
                        includeIfNull: false,
                      ),
                    ],
                    name: 'excludeIfNullSetElement',
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
                        name: 'nonselfclosingcustomelement',
                        isSelfClosing: false,
                      ),
                    ],
                    name: 'nonSelfClosingCustomElement',
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
                        name: 'excludeifnullcustomelement',
                        includeIfNull: false,
                      ),
                    ],
                    name: 'excludeIfNullCustomElement',
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
                    metadata: [
                      FakeXmlTextElementAnnotation(),
                    ],
                    name: 'direction',
                    type: FakeInterfaceType(
                      element2: FakeEnumElement('Direction', [
                        FakeFieldElement(
                          name: 'a',
                          isEnumConstant: true,
                        ),
                        FakeFieldElement(
                          name: 'b',
                          isEnumConstant: true,
                        ),
                      ]),
                      nullabilitySuffix: NullabilitySuffix.question,
                      superclass: FakeInterfaceType(isDartCoreEnum: true),
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
            equals(r'''
void _$TestClassBuildXmlChildren(TestClass instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
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
final stringElement = instance.stringElement;
final stringElementSerialized = stringElement;
builder.element('stringelement', nest: () { if (stringElementSerialized != null) { builder.text(stringElementSerialized); } });
final nonSelfClosingStringElement = instance.nonSelfClosingStringElement;
final nonSelfClosingStringElementSerialized = nonSelfClosingStringElement;
builder.element('nonselfclosingstringelement', isSelfClosing: false, nest: () { if (nonSelfClosingStringElementSerialized != null) { builder.text(nonSelfClosingStringElementSerialized); } });
final excludeIfNullStringElement = instance.excludeIfNullStringElement;
final excludeIfNullStringElementSerialized = excludeIfNullStringElement;
if (excludeIfNullStringElementSerialized != null) { builder.element('excludeifnullstringelement', nest: () { builder.text(excludeIfNullStringElementSerialized); }); }
final iterableElement = instance.iterableElement;
final iterableElementSerialized = iterableElement;
if (iterableElementSerialized != null) { for (final value in iterableElementSerialized) { builder.element('iterableelement', nest: () { builder.text(value); }); } }
final nonSelfClosingIterableElement = instance.nonSelfClosingIterableElement;
final nonSelfClosingIterableElementSerialized = nonSelfClosingIterableElement;
if (nonSelfClosingIterableElementSerialized != null) { for (final value in nonSelfClosingIterableElementSerialized) { builder.element('nonselfclosingiterableelement', isSelfClosing: false, nest: () { builder.text(value); }); } }
final excludeIfNullIterableElement = instance.excludeIfNullIterableElement;
final excludeIfNullIterableElementSerialized = excludeIfNullIterableElement;
if (excludeIfNullIterableElementSerialized != null) { for (final value in excludeIfNullIterableElementSerialized) { builder.element('excludeifnulliterableelement', nest: () { builder.text(value); }); } }
final listElement = instance.listElement;
final listElementSerialized = listElement;
if (listElementSerialized != null) { for (final value in listElementSerialized) { builder.element('listelement', nest: () { builder.text(value); }); } }
final nonSelfClosingListElement = instance.nonSelfClosingListElement;
final nonSelfClosingListElementSerialized = nonSelfClosingListElement;
if (nonSelfClosingListElementSerialized != null) { for (final value in nonSelfClosingListElementSerialized) { builder.element('nonselfclosinglistelement', isSelfClosing: false, nest: () { builder.text(value); }); } }
final excludeIfNullListElement = instance.excludeIfNullListElement;
final excludeIfNullListElementSerialized = excludeIfNullListElement;
if (excludeIfNullListElementSerialized != null) { for (final value in excludeIfNullListElementSerialized) { builder.element('excludeifnulllistelement', nest: () { builder.text(value); }); } }
final setElement = instance.setElement;
final setElementSerialized = setElement;
if (setElementSerialized != null) { for (final value in setElementSerialized) { builder.element('setelement', nest: () { builder.text(value); }); } }
final nonSelfClosingSetElement = instance.nonSelfClosingSetElement;
final nonSelfClosingSetElementSerialized = nonSelfClosingSetElement;
if (nonSelfClosingSetElementSerialized != null) { for (final value in nonSelfClosingSetElementSerialized) { builder.element('nonselfclosingsetelement', isSelfClosing: false, nest: () { builder.text(value); }); } }
final excludeIfNullSetElement = instance.excludeIfNullSetElement;
final excludeIfNullSetElementSerialized = excludeIfNullSetElement;
if (excludeIfNullSetElementSerialized != null) { for (final value in excludeIfNullSetElementSerialized) { builder.element('excludeifnullsetelement', nest: () { builder.text(value); }); } }
final customElement = instance.customElement;
final customElementSerialized = customElement;
builder.element('customelement', nest: () { if (customElementSerialized != null) { customElementSerialized.buildXmlChildren(builder, namespaces: namespaces); } });
final nonSelfClosingCustomElement = instance.nonSelfClosingCustomElement;
final nonSelfClosingCustomElementSerialized = nonSelfClosingCustomElement;
builder.element('nonselfclosingcustomelement', isSelfClosing: false, nest: () { if (nonSelfClosingCustomElementSerialized != null) { nonSelfClosingCustomElementSerialized.buildXmlChildren(builder, namespaces: namespaces); } });
final excludeIfNullCustomElement = instance.excludeIfNullCustomElement;
final excludeIfNullCustomElementSerialized = excludeIfNullCustomElement;
if (excludeIfNullCustomElementSerialized != null) { builder.element('excludeifnullcustomelement', nest: () { excludeIfNullCustomElementSerialized.buildXmlChildren(builder, namespaces: namespaces); }); }
final stringText = instance.stringText;
final stringTextSerialized = stringText;
if (stringTextSerialized != null) { builder.text(stringTextSerialized); }
final direction = instance.direction;
final directionSerialized = _$DirectionEnumMap[direction];
if (directionSerialized != null) { builder.text(directionSerialized); }
}

void _$TestClassBuildXmlElement(TestClass instance, XmlBuilder builder, {Map<String, String> namespaces = const {}}) {
builder.element('testclass', namespaces: namespaces, nest: () { instance.buildXmlChildren(builder, namespaces: namespaces); });
}

TestClass _$TestClassFromXmlElement(XmlElement element) {
final boolAttribute = element.getAttribute('boolattribute');
final dateTimeAttribute = element.getAttribute('datetimeattribute');
final doubleAttribute = element.getAttribute('doubleattribute');
final durationAttribute = element.getAttribute('durationattribute');
final dynamicAttribute = element.getAttribute('dynamicattribute');
final intAttribute = element.getAttribute('intattribute');
final numAttribute = element.getAttribute('numattribute');
final stringAttribute = element.getAttribute('stringattribute');
final uriAttribute = element.getAttribute('uriattribute');
final stringElement = element.getElement('stringelement')?.getText();
final nonSelfClosingStringElement = element.getElement('nonselfclosingstringelement')?.getText();
final excludeIfNullStringElement = element.getElement('excludeifnullstringelement')?.getText();
final iterableElement = element.getElements('iterableelement')?.map((e) => e.getText()).whereType<String>();
final nonSelfClosingIterableElement = element.getElements('nonselfclosingiterableelement')?.map((e) => e.getText()).whereType<String>();
final excludeIfNullIterableElement = element.getElements('excludeifnulliterableelement')?.map((e) => e.getText()).whereType<String>();
final listElement = element.getElements('listelement')?.map((e) => e.getText()).whereType<String>();
final nonSelfClosingListElement = element.getElements('nonselfclosinglistelement')?.map((e) => e.getText()).whereType<String>();
final excludeIfNullListElement = element.getElements('excludeifnulllistelement')?.map((e) => e.getText()).whereType<String>();
final setElement = element.getElements('setelement')?.map((e) => e.getText()).whereType<String>();
final nonSelfClosingSetElement = element.getElements('nonselfclosingsetelement')?.map((e) => e.getText()).whereType<String>();
final excludeIfNullSetElement = element.getElements('excludeifnullsetelement')?.map((e) => e.getText()).whereType<String>();
final customElement = element.getElement('customelement');
final nonSelfClosingCustomElement = element.getElement('nonselfclosingcustomelement');
final excludeIfNullCustomElement = element.getElement('excludeifnullcustomelement');
final stringText = element.getText();
final direction = element.getText();
return TestClass(boolAttribute: boolAttribute != null ? boolAttribute == 'true' || boolAttribute == '1' ? true : boolAttribute == 'false' || boolAttribute == '0' ? false : throw FormatException('Invalid bool format', boolAttribute) : null, dateTimeAttribute: dateTimeAttribute != null ? DateTime.parse(dateTimeAttribute) : null, doubleAttribute: doubleAttribute != null ? double.parse(doubleAttribute) : null, durationAttribute: durationAttribute != null ? Duration(microseconds: int.parse(durationAttribute)) : null, dynamicAttribute: dynamicAttribute, intAttribute: intAttribute != null ? int.parse(intAttribute) : null, numAttribute: numAttribute != null ? num.parse(numAttribute) : null, stringAttribute: stringAttribute, uriAttribute: uriAttribute != null ? Uri.parse(uriAttribute) : null, stringElement: stringElement, nonSelfClosingStringElement: nonSelfClosingStringElement, excludeIfNullStringElement: excludeIfNullStringElement, iterableElement: iterableElement, nonSelfClosingIterableElement: nonSelfClosingIterableElement, excludeIfNullIterableElement: excludeIfNullIterableElement, listElement: listElement?.toList(), nonSelfClosingListElement: nonSelfClosingListElement?.toList(), excludeIfNullListElement: excludeIfNullListElement?.toList(), setElement: setElement?.toSet(), nonSelfClosingSetElement: nonSelfClosingSetElement?.toSet(), excludeIfNullSetElement: excludeIfNullSetElement?.toSet(), customElement: customElement != null ? CustomClass.fromXmlElement(customElement) : null, nonSelfClosingCustomElement: nonSelfClosingCustomElement != null ? CustomClass.fromXmlElement(nonSelfClosingCustomElement) : null, excludeIfNullCustomElement: excludeIfNullCustomElement != null ? CustomClass.fromXmlElement(excludeIfNullCustomElement) : null, stringText: stringText, direction: annotation.$enumDecodeNullable(_$DirectionEnumMap, direction));
}

List<XmlAttribute> _$TestClassToXmlAttributes(TestClass instance, {Map<String, String?> namespaces = const {}}) {
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

List<XmlNode> _$TestClassToXmlChildren(TestClass instance, {Map<String, String?> namespaces = const {}}) {
final children = <XmlNode>[];
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
final iterableElement = instance.iterableElement;
final iterableElementSerialized = iterableElement;
final iterableElementConstructed = iterableElementSerialized?.map((e) => XmlElement(XmlName('iterableelement'), [], [XmlText(e)]));
if (iterableElementConstructed != null) { children.addAll(iterableElementConstructed); }
final nonSelfClosingIterableElement = instance.nonSelfClosingIterableElement;
final nonSelfClosingIterableElementSerialized = nonSelfClosingIterableElement;
final nonSelfClosingIterableElementConstructed = nonSelfClosingIterableElementSerialized?.map((e) => XmlElement(XmlName('nonselfclosingiterableelement'), [], [XmlText(e)], false));
if (nonSelfClosingIterableElementConstructed != null) { children.addAll(nonSelfClosingIterableElementConstructed); }
final excludeIfNullIterableElement = instance.excludeIfNullIterableElement;
final excludeIfNullIterableElementSerialized = excludeIfNullIterableElement;
final excludeIfNullIterableElementConstructed = excludeIfNullIterableElementSerialized?.map((e) => XmlElement(XmlName('excludeifnulliterableelement'), [], [XmlText(e)]));
if (excludeIfNullIterableElementConstructed != null) { children.addAll(excludeIfNullIterableElementConstructed); }
final listElement = instance.listElement;
final listElementSerialized = listElement;
final listElementConstructed = listElementSerialized?.map((e) => XmlElement(XmlName('listelement'), [], [XmlText(e)]));
if (listElementConstructed != null) { children.addAll(listElementConstructed); }
final nonSelfClosingListElement = instance.nonSelfClosingListElement;
final nonSelfClosingListElementSerialized = nonSelfClosingListElement;
final nonSelfClosingListElementConstructed = nonSelfClosingListElementSerialized?.map((e) => XmlElement(XmlName('nonselfclosinglistelement'), [], [XmlText(e)], false));
if (nonSelfClosingListElementConstructed != null) { children.addAll(nonSelfClosingListElementConstructed); }
final excludeIfNullListElement = instance.excludeIfNullListElement;
final excludeIfNullListElementSerialized = excludeIfNullListElement;
final excludeIfNullListElementConstructed = excludeIfNullListElementSerialized?.map((e) => XmlElement(XmlName('excludeifnulllistelement'), [], [XmlText(e)]));
if (excludeIfNullListElementConstructed != null) { children.addAll(excludeIfNullListElementConstructed); }
final setElement = instance.setElement;
final setElementSerialized = setElement;
final setElementConstructed = setElementSerialized?.map((e) => XmlElement(XmlName('setelement'), [], [XmlText(e)]));
if (setElementConstructed != null) { children.addAll(setElementConstructed); }
final nonSelfClosingSetElement = instance.nonSelfClosingSetElement;
final nonSelfClosingSetElementSerialized = nonSelfClosingSetElement;
final nonSelfClosingSetElementConstructed = nonSelfClosingSetElementSerialized?.map((e) => XmlElement(XmlName('nonselfclosingsetelement'), [], [XmlText(e)], false));
if (nonSelfClosingSetElementConstructed != null) { children.addAll(nonSelfClosingSetElementConstructed); }
final excludeIfNullSetElement = instance.excludeIfNullSetElement;
final excludeIfNullSetElementSerialized = excludeIfNullSetElement;
final excludeIfNullSetElementConstructed = excludeIfNullSetElementSerialized?.map((e) => XmlElement(XmlName('excludeifnullsetelement'), [], [XmlText(e)]));
if (excludeIfNullSetElementConstructed != null) { children.addAll(excludeIfNullSetElementConstructed); }
final customElement = instance.customElement;
final customElementSerialized = customElement;
final customElementConstructed = XmlElement(XmlName('customelement'), customElementSerialized?.toXmlAttributes(namespaces: namespaces) ?? [], customElementSerialized?.toXmlChildren(namespaces: namespaces) ?? []);
children.add(customElementConstructed);
final nonSelfClosingCustomElement = instance.nonSelfClosingCustomElement;
final nonSelfClosingCustomElementSerialized = nonSelfClosingCustomElement;
final nonSelfClosingCustomElementConstructed = XmlElement(XmlName('nonselfclosingcustomelement'), nonSelfClosingCustomElementSerialized?.toXmlAttributes(namespaces: namespaces) ?? [], nonSelfClosingCustomElementSerialized?.toXmlChildren(namespaces: namespaces) ?? [], false);
children.add(nonSelfClosingCustomElementConstructed);
final excludeIfNullCustomElement = instance.excludeIfNullCustomElement;
final excludeIfNullCustomElementSerialized = excludeIfNullCustomElement;
final excludeIfNullCustomElementConstructed = excludeIfNullCustomElementSerialized != null ? XmlElement(XmlName('excludeifnullcustomelement'), excludeIfNullCustomElementSerialized.toXmlAttributes(namespaces: namespaces), excludeIfNullCustomElementSerialized.toXmlChildren(namespaces: namespaces)) : null;
if (excludeIfNullCustomElementConstructed != null) { children.add(excludeIfNullCustomElementConstructed); }
final stringText = instance.stringText;
final stringTextSerialized = stringText;
final stringTextConstructed = stringTextSerialized != null ? XmlText(stringTextSerialized) : null;
if (stringTextConstructed != null) { children.add(stringTextConstructed); }
final direction = instance.direction;
final directionSerialized = _$DirectionEnumMap[direction];
final directionConstructed = directionSerialized != null ? XmlText(directionSerialized) : null;
if (directionConstructed != null) { children.add(directionConstructed); }
return children;
}

XmlElement _$TestClassToXmlElement(TestClass instance, {Map<String, String?> namespaces = const {}}) {
return XmlElement(XmlName('testclass'), [...namespaces.toXmlAttributes(), ...instance.toXmlAttributes(namespaces: namespaces)], instance.toXmlChildren(namespaces: namespaces));
}const _$DirectionEnumMap = {
  Direction.a: 'a',  Direction.b: 'b',
};
'''),
          );
        },
      );

      test(
        'should generate `buildXmlChildren`, `fromXmlElement`, `toXmlAttributes`, `toXmlChildren` and a mixin with `buildXmlChildren`, `toXmlAttributes`, `toXmlChildren` if the class has an `XmlSerializable` attribute with create mixin',
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
        'should generate `buildXmlChildren`, `buildXmlElement`, `fromXmlElement`, `toXmlAttributes`, `toXmlChildren`, `toXmlElement` and a mixin with `buildXmlChildren`, `buildXmlElement`, `toXmlAttributes`, `toXmlChildren`, `toXmlElement` if the class has an `XmlSerializable` attribute with create mixin and an `XmlRootElement` attribute',
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
