.PHONY: setup format analyze test build-apk build-ios run

setup:
	flutter pub get

format:
	dart format --set-exit-if-changed .

analyze:
	flutter analyze

test:
	flutter test --coverage

build-apk:
	flutter build apk --release

build-ios:
	flutter build ios --release --no-codesign

run:
	flutter run