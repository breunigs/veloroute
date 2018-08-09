const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const OptimizeCSSAssetsPlugin = require("optimize-css-assets-webpack-plugin");
const UglifyJsPlugin = require("uglifyjs-webpack-plugin");


module.exports = (env, argv) => {
  const isProduction = argv.mode === 'production';
  return {
    devtool: "source-map",
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
        minify: !isProduction ? false : {
          collapseWhitespace: true,
          removeComments: true
        },
        hash: true
      }),
      !isProduction ? null : new OptimizeCSSAssetsPlugin({})
    ].filter(plugin => plugin !== null),
  }
};
