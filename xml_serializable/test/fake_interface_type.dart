import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:test/fake.dart';

class FakeInterfaceType extends Fake implements InterfaceType {
  @override
  final List<InterfaceType> allSupertypes;

  @override
  final InterfaceElement element2;

  @override
  final InterfaceType? superclass;

  @override
  final bool isDartCoreBool;

  @override
  final bool isDartCoreDouble;

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
  final bool isDartCoreEnum;

  @override
  final bool isDynamic;

  @override
  final bool isVoid;

  @override
  final NullabilitySuffix nullabilitySuffix;

  @override
  final List<DartType> typeArguments;

  FakeInterfaceType({
    List<InterfaceType>? allSupertypes,
    required this.element2,
    this.superclass,
    bool? isDartCoreBool,
    bool? isDartCoreDouble,
    bool? isDartCoreFunction,
    bool? isDartCoreInt,
    bool? isDartCoreIterable,
    bool? isDartCoreList,
    bool? isDartCoreMap,
    bool? isDartCoreNull,
    bool? isDartCoreNum,
    bool? isDartCoreObject,
    bool? isDartCoreSet,
    bool? isDartCoreString,
    bool? isDartCoreSymbol,
    bool? isDartCoreEnum,
    bool? isDynamic,
    bool? isVoid,
    NullabilitySuffix? nullabilitySuffix,
    List<DartType>? typeArguments,
  })  : allSupertypes = allSupertypes ?? [],
        isDartCoreBool = isDartCoreBool ?? false,
        isDartCoreDouble = isDartCoreDouble ?? false,
        isDartCoreFunction = isDartCoreFunction ?? false,
        isDartCoreInt = isDartCoreInt ?? false,
        isDartCoreIterable = isDartCoreIterable ?? false,
        isDartCoreList = isDartCoreList ?? false,
        isDartCoreMap = isDartCoreMap ?? false,
        isDartCoreNull = isDartCoreNull ?? false,
        isDartCoreNum = isDartCoreNum ?? false,
        isDartCoreObject = isDartCoreObject ?? false,
        isDartCoreSet = isDartCoreSet ?? false,
        isDartCoreString = isDartCoreString ?? false,
        isDartCoreSymbol = isDartCoreSymbol ?? false,
        isDartCoreEnum = isDartCoreEnum ?? false,
        isDynamic = isDynamic ?? false,
        isVoid = isVoid ?? false,
        nullabilitySuffix = nullabilitySuffix ?? NullabilitySuffix.none,
        typeArguments = typeArguments ?? [];
}
