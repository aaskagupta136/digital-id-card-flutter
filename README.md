# Digital Student ID Card Generator

A Flutter app that lets a student enter their details, upload a photo, and instantly generate a clean, styled digital ID card.

## Problem

Physical student ID cards take time to print and are easy to lose or forget. This app shows how a digital version can be generated instantly from user input — useful for events, temporary access, or as a quick placeholder before an official card is issued.

## How it works

The app has two screens:

1. **Login / Form Page** — the user fills in session, name, date of birth, branch, college ID number, mobile number, and address, and uploads a photo from the gallery.
2. **ID Card Page** — after tapping **Generate ID Card**, all the entered data is passed to a second screen that displays it as a formatted, card-style ID with the college header, photo, and details laid out clearly.

Before navigating to the ID card screen, the form checks that no field is left empty and shows a message if something is missing.

## Tech stack

- **Flutter / Dart**
- [`image_picker`](https://pub.dev/packages/image_picker) for selecting a photo from the gallery

## Key design decisions

- **StatefulWidget vs StatelessWidget** — the form screen is a `StatefulWidget` because it needs to track changing text input and the picked image. The ID card display screen is a `StatelessWidget` because it only renders data passed to it once and never changes after that.
- **Reusable `infoRow()` widget** — the ID card originally repeated the same label-value row layout five times (DOB, branch, college ID, mobile, address). This was refactored into a single `infoRow()` function with default parameter values, so most calls stay simple while still allowing specific fields (like branch) to override font size when needed.
- **Reusable `buildTextField()` widget** — similarly, all seven form fields shared the same label, hint, and border styling, so this was extracted into one function instead of repeating it seven times.
- **Disposed controllers** — all `TextEditingController`s are disposed when the form page closes, to avoid memory leaks.
- **Extracted color constants** — repeated theme colors are defined once at the top of the file instead of being hardcoded in multiple places.

## Getting started

```bash
flutter pub get
flutter run
```

## Author

**Aaska Gupta**
[GitHub](https://github.com/aaskagupta136) · [LinkedIn](https://www.linkedin.com/in/aaska-gupta-9b6043377)
