import 'package:analyzer/dart/element/type.dart';

extension DartTypeExtensions on DartType {
  /// Returns `true` if this type represents a type defined in the dart:core library.
  bool get isDartCore =>
      isDartCoreBool ||
      isDartCoreDouble ||
      isDartCoreFunction ||
      isDartCoreInt ||
      isDartCoreIterable ||
      isDartCoreList ||
      isDartCoreMap ||
      isDartCoreNull ||
      isDartCoreNum ||
      isDartCoreObject ||
      isDartCoreSet ||
      isDartCoreString ||
      isDartCoreSymbol;
}
