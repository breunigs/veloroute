const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const OptimizeCSSAssetsPlugin = require("optimize-css-assets-webpack-plugin");
const ScriptExtHtmlWebpackPlugin = require("script-ext-html-webpack-plugin");
const UglifyJsPlugin = require("uglifyjs-webpack-plugin");

module.exports = (env, argv) => {
  const isProduction = argv.mode === 'production';
  return {
    devtool: "source-map",
    mode: "development",
    entry: "./src/index.js",
    output: {
      path: path.resolve(__dirname),
      chunkFilename: "chunk.[name].[contenthash].js",
      filename: "bundle.[name].[contenthash].js"
    },
    module: {
      // needed due to incompatibility with webpack production mode. This is
      // for mapillary, but here's a similar issue for mapbox:
      // See https://github.com/mapbox/mapbox-gl-js/issues/4359
      noParse: /mapillary/,
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
        filename: "base.[contenthash].css"
      }),
      new HtmlWebpackPlugin({
        template: "main.html",
        minify: !isProduction ? false : {
          collapseWhitespace: true,
          removeComments: true
        },
        hash: false
      }),
      new ScriptExtHtmlWebpackPlugin({
        preload: {
          test: /(images).*\.js$/,
          chunks: 'all'
        }
      }),
      !isProduction ? null : new UglifyJsPlugin({
        extractComments: true,
        parallel: true,
        sourceMap: true
      }),
      !isProduction ? null : new OptimizeCSSAssetsPlugin({})
    ].filter(plugin => plugin !== null),
  }
};
