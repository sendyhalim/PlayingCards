build:
	swift build --configuration release

regenerate-xcode:
	swift package generate-xcodeproj

test:
	cp Package.swift .Package.swift.bak
	cp .Package.test.swift Package.swift
	swift test
	mv .Package.swift.bak Package.swift

.PHONY: build regenerate-xcode test
