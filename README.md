# olearistest


Flutter version 3.32.0

## If you are starting this project for the first time, follow these steps:

(1) Upgrade build runner
```bash
$ flutter upgrade build_runner
```
(2) Install flutter_gen (https://pub.dev/packages/flutter_gen)
```bash
$  brew install FlutterGen/tap/fluttergen
```
(3) Generate linked assets resources
```bash
$ dart pub global activate flutter_gen
```
(4) Generate annotations
```bash
$ flutter packages pub run build_runner build
```
(5) Specify the path to generate
```bash
$ fluttergen -c pubspec.yaml
```
(6) Put away conflicting dependencies
```bash
$ dart run build_runner build --delete-conflicting-outputs
```
