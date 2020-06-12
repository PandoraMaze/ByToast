# ByToast
[![pub package](https://img.shields.io/badge/pub-v1.0.1-brightgreen?style=flat&logo=flutter)](https://pub.dev/packages/bytoast) 
[![author](https://img.shields.io/badge/author-:byk-4189d5?style=flat&logo=github)](https://github.com/bluesofy)

A Toast Widget for Flutter.

## Feature
- 非调用原生Toast，Dart实现；
- 交互和动效接近原生Toast，不触发遮罩点击事件，跨页仍显示；
- 其他

## Get Started
### Add Dependency
```yaml
dependencies:
  bytoast: ^1.1.0
```

### Usage
```dart
import 'package:toaster/toaster.dart';

/// Simple Toast
ByToast.short();

/// Toast with Icon
ByToast.withIcon();

/// Toast For Customize
ByToast.more();
```

## Support or Contact
- E-Mail: <bluesofy@live.cn>
