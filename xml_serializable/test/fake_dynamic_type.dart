import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:test/fake.dart';

import 'fake_dynamic_class_element.dart';

class FakeDynamicType extends Fake implements DynamicType {
  @override
  final InterfaceElement element = FakeDynamicClassElement();

  @override
  final bool isDartCoreBool = false;

  @override
  final bool isDartCoreDouble = false;

  @override
  final bool isDartCoreEnum = false;

  @override
  final bool isDartCoreFunction = false;

  @override
  final bool isDartCoreInt = false;

  @override
  final bool isDartCoreIterable = false;

  @override
  final bool isDartCoreList = false;

  @override
  final bool isDartCoreMap = false;

  @override
  final bool isDartCoreNull = false;

  @override
  final bool isDartCoreNum = false;

  @override
  final bool isDartCoreObject = false;

  @override
  final bool isDartCoreSet = false;

  @override
  final bool isDartCoreString = false;

  @override
  final bool isDartCoreSymbol = false;

  @override
  final NullabilitySuffix nullabilitySuffix = NullabilitySuffix.none;
}
