import PackageDescription

let package = Package(
  name: "PlayingCards",
  dependencies: [
    .Package(url: "https://github.com/typelift/Swiftz", majorVersion: 0, minor: 6),
  ]
);

