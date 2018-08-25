const presets = [
  ["@babel/env", {
    targets: {
      browsers: ["last 2 versions", "ie >= 11"]
    },
    debug: true,
    useBuiltIns: "usage"
  }]
];

module.exports = { presets };
