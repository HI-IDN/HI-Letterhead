# `hi-letter.cls`

`hi-letter.cls` is a LaTeX document class for creating professional letters using the University of Iceland's (UoI) standard letterhead. This class is designed to provide a clean, customizable, and multilingual template suitable for academic and professional correspondence.

## Features

- **Multilingual Support**: Write letters in Icelandic (`lang=is`) or English (`lang=en`).
  - Icelandic (`Sæmundargata`, Icelandic logo).
  - English (`Saemundargata`, English logo).
- **Dynamic Header**: Automatically adjusts the address and logo based on the selected language.
- **Customizable Content**:
  - Reference line (`\refline`).
  - Deadline (`\deadline`).
  - Carbon copy (`\cc`).
  - Enclosures (`\encl`).
  - Blind carbon copy (`\bcc`).
- **A4 Page Dimensions**: Optimized for A4 paper size.
- **Professional Styling**: Sans-serif fonts, University of Iceland's blue color (`#10099F`), and a clean layout.

## Requirements

This class requires the following LaTeX packages:
- `graphicx` (image handling)
- `epstopdf` (EPS-to-PDF conversion)
- `epsfig` (EPS figure support)
- `ifthen` (conditional logic)
- `xcolor` (color management)
- `fancyhdr` (header and footer management)

## Installation

1. Download the `hi-letter.cls` file.
2. Place it in the same directory as your LaTeX file or in your local LaTeX class directory.

## Options

### Language Options
- `lang=is`: Icelandic (default).
- `lang=en`: English.

### Customizable Commands
| Command          | Description                             | Example                                   |
|-------------------|-----------------------------------------|-------------------------------------------|
| `\refline{}`     | Adds a reference line.                 | `\refline{2024/12345678}`                 |
| `\deadline{}`    | Adds a deadline.                       | `\deadline{December 15, 2024}`            |
| `\encl{}`        | Adds enclosures.                       | `\encl{hi-letter.cls, hi-logo.eps}`       |
| `\cc{}`          | Adds a carbon copy.                    | `\cc{Dr. John Smith, Dept. of Chemistry}` |
| `\bcc{}`         | Adds a blind carbon copy.              | `\bcc{Office of Research Oversight}`      |

## Example Usage

An example letter is included in the repository as `hi-letter_example.tex`. This example demonstrates how to use the class with Icelandic or English options, reference lines, deadlines, and other features. Compile the example with a standard LaTeX distribution to see the output.

## License

This class is released under the MIT License. See the `LICENSE` file for details.

## Contributions

Contributions, bug reports, and feature requests are welcome! Please feel free to fork the repository and submit a pull request or open an issue.

## Contact

For questions, suggestions, or issues, contact [Helga Ingimundardóttir](mailto:helgaingim@hi.is).
