const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const OptimizeCSSAssetsPlugin = require("optimize-css-assets-webpack-plugin");
const UglifyJsPlugin = require("uglifyjs-webpack-plugin");

module.exports = env => ({
  devtool: "source-map",
  mode: "development",
  entry: "./src/index.js",
  output: {
    path: path.resolve(__dirname),
    filename: "bundle.js"
  },
  module: {
    // needed due to incompatibility with minify. Might work with mapbox-gl 0.47.0+
    // See https://github.com/mapbox/mapbox-gl-js/issues/4359
    noParse: /(mapbox-gl)\.js$/,
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
      minify: env !== 'prod' ? false : {
        collapseWhitespace: true,
        removeComments: true
      },
      hash: true
    }),
    env !== 'prod' ? null : new OptimizeCSSAssetsPlugin({}),
    env !== 'prod' ? null : new UglifyJsPlugin({
      extractComments: true,
      parallel: true,
      sourceMap: true,
    })
  ].filter(plugin => plugin !== null),
});
