import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:test/fake.dart';

import 'fake_element.dart';

class FakeDartType extends Fake implements DartType {
  @override
  Element get element => _element ?? FakeElement();

  @override
  final bool isDartCoreBool;

  @override
  final bool isDartCoreDouble;

  @override
  final bool isDartCoreEnum;

  @override
  final bool isDartCoreFunction;

  @override
  final bool isDartCoreInt;

  @override
  final bool isDartCoreIterable;

  @override
  final bool isDartCoreList;

  @override
  final bool isDartCoreMap;

  @override
  final bool isDartCoreNull;

  @override
  final bool isDartCoreNum;

  @override
  final bool isDartCoreObject;

  @override
  final bool isDartCoreSet;

  @override
  final bool isDartCoreString;

  @override
  final bool isDartCoreSymbol;

  @override
  final NullabilitySuffix nullabilitySuffix;

  final Element? _element;

  FakeDartType({
    Element? element,
    this.isDartCoreBool = false,
    this.isDartCoreDouble = false,
    this.isDartCoreEnum = false,
    this.isDartCoreFunction = false,
    this.isDartCoreInt = false,
    this.isDartCoreIterable = false,
    this.isDartCoreList = false,
    this.isDartCoreMap = false,
    this.isDartCoreNull = false,
    this.isDartCoreNum = false,
    this.isDartCoreObject = false,
    this.isDartCoreSet = false,
    this.isDartCoreString = false,
    this.isDartCoreSymbol = false,
    this.nullabilitySuffix = NullabilitySuffix.none,
  }) : _element = element;
}
