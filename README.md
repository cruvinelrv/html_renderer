

# html_renderer

A lightweight Flutter package for rendering HTML content with customizable styling and widget support.

## Features

- Renders simple HTML into Flutter widgets
- Supports paragraphs, headings, ordered and unordered lists, tables, and colored spans
- Allows style customization via parameters

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  html_renderer: ^0.0.3
```

Run:

```sh
dart pub get
```

## Usage

```dart
import 'package:html_renderer/html_renderer.dart';

HtmlRender(
  html: "<h1>Title</h1><p>Paragraph content</p>",
)
```

## Example

See full examples in the `example/` folder or in the online documentation.

## License

MIT © 2025 Vinicius Cruvinel
