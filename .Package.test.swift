import PackageDescription

let package = Package(
  name: "PlayingCards",
  dependencies: [
    .Package(url: "https://github.com/typelift/Swiftz", majorVersion: 0, minor: 6),
    .Package(url: "https://github.com/Quick/Quick", majorVersion: 1, minor: 1),
    .Package(url: "https://github.com/Quick/Nimble", majorVersion: 6)
  ]
);

