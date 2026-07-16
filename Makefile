.PHONY: setup format analyze test generate build-apk build-ios run

setup:
	flutter pub get
	$(MAKE) generate

generate:
	dart run build_runner build --delete-conflicting-outputs

format:
	dart format --set-exit-if-changed .

analyze: generate
	flutter analyze

test: generate
	flutter test --coverage

build-apk:
	flutter build apk --release

build-ios:
	flutter build ios --release --no-codesign

run:
	flutter run