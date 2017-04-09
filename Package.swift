import PackageDescription

let package = Package(
  name: "PlayingCards",
  targets: [
    Target(name: "PlayingCards"),
    Target(name: "Poker", dependencies: [.Target(name: "PlayingCards")])
  ],
  dependencies: [
    .Package(url: "https://github.com/typelift/Swiftz", majorVersion: 0, minor: 6),
  ]
);

