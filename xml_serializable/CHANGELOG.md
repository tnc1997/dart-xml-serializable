# Changelog

All notable changes to this project will be documented in this file. See [Conventional Commits](https://www.conventionalcommits.org) for commit guidelines.

## 2.5.4 (2025-03-09)

### Code Refactoring

* resolve analyzer no_wildcard_variable_uses ([42ca666](https://github.com/tnc1997/dart-xml-serializable/commit/42ca666dfdf34268526202417c8e9bb53a7b1812))
* resolve analyzer override_on_non_overriding_member ([6a5b8f3](https://github.com/tnc1997/dart-xml-serializable/commit/6a5b8f380b9e86b04f415eabfc673f546caeb253))
* resolve analyzer overridden_fields ([ca6f6ad](https://github.com/tnc1997/dart-xml-serializable/commit/ca6f6ad05f3600f2b98fec50fdb46128e57d0a39))
* resolve analyzer subtype_of_sealed_class ([65715f5](https://github.com/tnc1997/dart-xml-serializable/commit/65715f53137242af594ef500360440561fa9ba60))
* ignore analyzer deprecated_member_use_from_same_package ([2312f8c](https://github.com/tnc1997/dart-xml-serializable/commit/2312f8cefcfc66464e03ca705b17788265a52e54))
* ignore analyzer unused_field ([327d6e1](https://github.com/tnc1997/dart-xml-serializable/commit/327d6e19eb9c6b062ead06f78445292c8f1b4108))

### Builds

* **deps:** bump source_gen ([6925799](https://github.com/tnc1997/dart-xml-serializable/commit/6925799428b740d6894c5bb41e9dc5dcab08cbf1))
* **deps:** bump analyzer ([5dfbc6d](https://github.com/tnc1997/dart-xml-serializable/commit/5dfbc6dc8830e5096ffc92dc767c04c7d3a50722))

## 2.5.3 (2024-12-04)

### Bug Fixes

* xml converter iterable fields ([#64](https://github.com/tnc1997/dart-xml-serializable/issues/64)) ([9393522](https://github.com/tnc1997/dart-xml-serializable/commit/9393522b5d4329ac83420d76a900449f9c1de701))

## 2.5.2 (2024-09-09)

### Bug Fixes

* nullable converter types include if null ([#62](https://github.com/tnc1997/dart-xml-serializable/issues/62)) ([273ead3](https://github.com/tnc1997/dart-xml-serializable/commit/273ead37a07afde1bac01f2bda3c8460b9a3bb41))

## 2.5.1 (2024-08-26)

### Bug Fixes

* escape strings containing reserved characters ([#60](https://github.com/tnc1997/dart-xml-serializable/issues/60)) ([0cf42f8](https://github.com/tnc1997/dart-xml-serializable/commit/0cf42f891dc18d76e67afa26e651cbe344b76f2e))

## 2.5.0 (2024-02-04)

### Features

* add support for custom converters ([#56](https://github.com/tnc1997/dart-xml-serializable/issues/56)) ([dc09f99](https://github.com/tnc1997/dart-xml-serializable/commit/dc09f99a4f8d039678e1477d44d163b05d5c5bf6))

### Tests

* add xml converter and update fakes ([#57](https://github.com/tnc1997/dart-xml-serializable/issues/57)) ([0615769](https://github.com/tnc1997/dart-xml-serializable/commit/0615769a7a61dea8445711023be4f0ff71da481c))

## 2.4.1 (2023-12-13)

### Builds

* upgrade dependencies ([#51](https://github.com/tnc1997/dart-xml-serializable/issues/51)) ([1d82fc8](https://github.com/tnc1997/dart-xml-serializable/commit/1d82fc8db40b30328079cac515ac7b180dbf6636))

## 2.4.0 (2023-10-07)

### Features

* add support for serializing xml cdata ([#48](https://github.com/tnc1997/dart-xml-serializable/issues/48)) ([8a11d9e](https://github.com/tnc1997/dart-xml-serializable/commit/8a11d9e95610e05becf5406eab531c457f5b92f8))

## 2.3.0 (2023-06-11)

### Features

* add support for fields in superclasses ([#39](https://github.com/tnc1997/dart-xml-serializable/issues/39)) ([8679f1c](https://github.com/tnc1997/dart-xml-serializable/commit/8679f1c0c48b18743c7cac7404ef793d84706d0a))
* add support for import prefixes ([#40](https://github.com/tnc1997/dart-xml-serializable/issues/40)) ([ca0e835](https://github.com/tnc1997/dart-xml-serializable/commit/ca0e835cb95fdc229c0303c09b79d5ea759897bc))

### Documentation

* add step by step getting started ([#34](https://github.com/tnc1997/dart-xml-serializable/issues/34)) ([4c44991](https://github.com/tnc1997/dart-xml-serializable/commit/4c449910ffbaf6453a50e3fe1ef324066e9a941e))

### Tests

* use build_test and source_gen_test packages ([#41](https://github.com/tnc1997/dart-xml-serializable/issues/41)) ([f35d018](https://github.com/tnc1997/dart-xml-serializable/commit/f35d0186b138a293236d26391bba8dd178600eb4))

## 2.2.2 (2022-10-29)

### Bug Fixes

* publicise generated enum maps to enable reuse ([#29](https://github.com/tnc1997/dart-xml-serializable/issues/29)) ([ab66a66](https://github.com/tnc1997/dart-xml-serializable/commit/ab66a665e92ad92d11055a404e3d444fa4556bb2))
* only deserialize fields with an annotation ([#30](https://github.com/tnc1997/dart-xml-serializable/issues/30)) ([1b96d2d](https://github.com/tnc1997/dart-xml-serializable/commit/1b96d2d2ef323a2e58054760b30720d45e6cf9af))

## 2.2.1 (2022-10-26)

### Bug Fixes

* enum iterable duplicate variable declaration ([#26](https://github.com/tnc1997/dart-xml-serializable/issues/26)) ([f429e84](https://github.com/tnc1997/dart-xml-serializable/commit/f429e84e25dae00ffc20b293c287b48f68b66f72))

## 2.2.0 (2022-10-23)

### Features

* add support for serializing enums ([#20](https://github.com/tnc1997/dart-xml-serializable/issues/20)) ([c827cce](https://github.com/tnc1997/dart-xml-serializable/commit/c827cce956d43968e78e6939719c4742968895c9))
* add support for renaming fields in a class ([#24](https://github.com/tnc1997/dart-xml-serializable/issues/24)) ([d2aefbe](https://github.com/tnc1997/dart-xml-serializable/commit/d2aefbe2d76d41c756fa4163e1584077400d271c))

## 2.1.1 (2022-08-07)

### Bug Fixes

* mixin support for classes without root element ([#18](https://github.com/tnc1997/dart-xml-serializable/issues/18)) ([731babb](https://github.com/tnc1997/dart-xml-serializable/commit/731babb2f627daa9eb395616a9857124cd66bb15))

## 2.1.0 (2022-06-12)

### Features

* add support for serializing additional types ([#15](https://github.com/tnc1997/dart-xml-serializable/issues/15)) ([0186617](https://github.com/tnc1997/dart-xml-serializable/commit/0186617c0bbdfe649818b36f98efcb26ca5b05f7))
* add create mixin to reduce boilerplate ([#17](https://github.com/tnc1997/dart-xml-serializable/issues/17)) ([47c7a7b](https://github.com/tnc1997/dart-xml-serializable/commit/47c7a7b7debfd82ff333573cf977450316a07c55))

## 2.0.2 (2022-04-30)

### Builds

* upgrade dependencies ([#16](https://github.com/tnc1997/dart-xml-serializable/issues/16)) ([de714fb](https://github.com/tnc1997/dart-xml-serializable/commit/de714fbcf413dd96200e23615d3ea580958d4ff0))

## 2.0.1 (2022-01-05)

### Builds

* upgrade dependencies ([#11](https://github.com/tnc1997/dart-xml-serializable/issues/11)) ([56eec20](https://github.com/tnc1997/dart-xml-serializable/commit/56eec207fc9bed4007768656749618cbe9b878e3))

## 2.0.0 (2021-10-17)

### Builds

* upgrade dependencies ([#9](https://github.com/tnc1997/dart-xml-serializable/issues/9)) ([9d8f30f](https://github.com/tnc1997/dart-xml-serializable/commit/9d8f30faf697edb0a88298f0b0d662059369fca1))

### Documentation

* add xml serializable ([#8](https://github.com/tnc1997/dart-xml-serializable/issues/8)) ([9b74662](https://github.com/tnc1997/dart-xml-serializable/commit/9b746624158eb389bfb3d3fcd53d160fc6153bfb))

## 2.0.0-nullsafety.0 (2021-01-04)

### Features

* add is self closing ([#4](https://github.com/tnc1997/dart-xml-serializable/issues/4)) ([9956218](https://github.com/tnc1997/dart-xml-serializable/commit/9956218380b58aa1cd43fbd2245bdc3db250f102))
* add include if null ([#5](https://github.com/tnc1997/dart-xml-serializable/issues/5)) ([e1c84fe](https://github.com/tnc1997/dart-xml-serializable/commit/e1c84fe3507b904160f0230c3a60508fc9191fa9))

### Code Refactoring

* add null safety ([#3](https://github.com/tnc1997/dart-xml-serializable/issues/3)) ([baed31f](https://github.com/tnc1997/dart-xml-serializable/commit/baed31fdfea01561af42599a9fa9b734077f9cce))

## 1.0.0 (2020-10-04)

### Features

* initial commit ([#2](https://github.com/tnc1997/dart-xml-serializable/issues/2)) ([f0a62ed](https://github.com/tnc1997/dart-xml-serializable/commit/f0a62ed929ab256666ee61ed41a91eaa7748b3d3))
