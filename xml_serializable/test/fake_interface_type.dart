import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import 'fake_dart_type.dart';
import 'fake_interface_element.dart';

class FakeInterfaceType extends FakeDartType implements InterfaceType {
  @override
  final List<InterfaceType> allSupertypes;

  @override
  final List<InterfaceType> interfaces;

  @override
  final List<InterfaceType> mixins;

  @override
  final InterfaceType? superclass;

  @override
  late InterfaceElement element;

  @override
  final List<DartType> typeArguments;

  FakeInterfaceType({
    this.allSupertypes = const [],
    this.interfaces = const [],
    this.mixins = const [],
    this.superclass,
    InterfaceElement? element,
    this.typeArguments = const [],
    super.isDartCoreBool,
    super.isDartCoreDouble,
    super.isDartCoreEnum,
    super.isDartCoreFunction,
    super.isDartCoreInt,
    super.isDartCoreIterable,
    super.isDartCoreList,
    super.isDartCoreMap,
    super.isDartCoreNull,
    super.isDartCoreNum,
    super.isDartCoreObject,
    super.isDartCoreSet,
    super.isDartCoreString,
    super.isDartCoreSymbol,
    super.nullabilitySuffix,
  }) {
    this.element = element ??
        FakeInterfaceElement(
          thisType: this,
        );
  }
}
