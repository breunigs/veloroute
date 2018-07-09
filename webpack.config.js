const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

module.exports = env => ({
  devtool: "source-map", //env ? "source-map" : "cheap-eval-source-map",
  mode: "development",
  entry: "./src/index.js",
  output: {
    path: path.resolve(__dirname),
    filename: "bundle.js"
  },
  module: {
    rules: [
      {
        test: /\.scss$/,
        use: [
          "style-loader",
          MiniCssExtractPlugin.loader,
          "css-loader",
          "postcss-loader",
          "sass-loader"
        ]
      },
      {
        test: /\.html$/,
        loader: "underscore-template-loader",
        query: {
          root: "myapp",
          parseDynamicRoutes: true
        }
      }
    ]
  },
  devServer: {
    contentBase: path.join(__dirname, "build"),
    compress: false,
    port: 9000,
    headers: {
      "Content-Security-Policy": [
        "worker-src blob:",
        "child-src blob:",
        "img-src data: blob: http: https:",
        "connect-src 'self' https: wss: http: ws:"
      ].join(" ; ")
    }
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: "base.css"
    }),
    new HtmlWebpackPlugin({
      template: "main.html",
      minify: true,
      hash: true
    })
  ]
});
