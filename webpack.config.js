const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const OptimizeCSSAssetsPlugin = require("optimize-css-assets-webpack-plugin");
const ScriptExtHtmlWebpackPlugin = require("script-ext-html-webpack-plugin");
const UglifyJsPlugin = require("uglifyjs-webpack-plugin");
const WebpackCdnPlugin = require('webpack-cdn-plugin');

module.exports = (env, argv) => {
  const isProduction = argv.mode === 'production';

  const htmlOpts = {
    template: "main.html",
    minify: !isProduction ? false : {
      collapseWhitespace: true,
      removeComments: true
    },
    excludeChunks: [ 'polyfillLoader' ],
    hash: false
  }
  pages = [
    new HtmlWebpackPlugin({...htmlOpts, title: "veloroute.hamburg"}),
    new HtmlWebpackPlugin({...htmlOpts, title: "veloroute.hamburg – Alltagsroute 1", filename: "1.html"}),
    new HtmlWebpackPlugin({...htmlOpts, title: "veloroute.hamburg – Alltagsroute 2", filename: "2.html"}),
    new HtmlWebpackPlugin({...htmlOpts, title: "veloroute.hamburg – Alltagsroute 3", filename: "3.html"}),
    new HtmlWebpackPlugin({...htmlOpts, title: "veloroute.hamburg – Alltagsroute 4", filename: "4.html"}),
    new HtmlWebpackPlugin({...htmlOpts, title: "veloroute.hamburg – Alltagsroute 5", filename: "5.html"}),
    new HtmlWebpackPlugin({...htmlOpts, title: "veloroute.hamburg – Alltagsroute 6", filename: "6.html"}),
    new HtmlWebpackPlugin({...htmlOpts, title: "veloroute.hamburg – Alltagsroute 7", filename: "7.html"}),
    new HtmlWebpackPlugin({...htmlOpts, title: "veloroute.hamburg – Alltagsroute 8", filename: "8.html"}),
    new HtmlWebpackPlugin({...htmlOpts, title: "veloroute.hamburg – Alltagsroute 9", filename: "9.html"}),
    new HtmlWebpackPlugin({...htmlOpts, title: "veloroute.hamburg – Alltagsroute 10", filename: "10.html"}),
    new HtmlWebpackPlugin({...htmlOpts, title: "veloroute.hamburg – Alltagsroute 11", filename: "11.html"}),
    new HtmlWebpackPlugin({...htmlOpts, title: "veloroute.hamburg – Alltagsroute 12", filename: "12.html"}),
    new HtmlWebpackPlugin({...htmlOpts, title: "veloroute.hamburg – Alltagsroute 13", filename: "13.html"}),
    new HtmlWebpackPlugin({...htmlOpts, title: "veloroute.hamburg – Alltagsroute 14", filename: "14.html"}),
    new HtmlWebpackPlugin({...htmlOpts, title: "veloroute.hamburg – Qualität und Ausbaustatus", filename: "quality.html"})
  ];

  return {
    devtool: "source-map",
    mode: "development",
    entry: {
      polyfillLoader: "./src/polyfill-loader.js",
      polyfillChecker: "./src/polyfill-checker.js",
      app: "./src/index.js"
    },
    output: {
      path: path.resolve(__dirname),
      chunkFilename: "chunk.[name].[contenthash].ch.js",
      filename: "bundle.[name].[contenthash].ch.js"
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
        },
        {
          test: /\.js$/,
          exclude: /node_modules/,
          use: {
            loader: 'babel-loader',
            options: {
              presets: [["@babel/env", {
                targets: {
                  browsers: ["last 1 versions", "ie >= 11"]
                },
                exclude: ["transform-regenerator", "transform-async-to-generator"],
                debug: false,
                useBuiltIns: false
              }]],
              plugins: ["@babel/plugin-syntax-dynamic-import", "module:fast-async"]
            },
          }
        }
      ]
    },
    devServer: {
      contentBase: path.join(__dirname, "build"),
      compress: false,
      port: 9000,
      historyApiFallback: {
        rewrites: [{
          from: /^\/(\d+|quality)$/,
          to: context => context.parsedUrl.path + '.html'
        }],
      },
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
        filename: "base.[contenthash].ch.css"
      }),
      ...pages,
      new WebpackCdnPlugin({
        modules: [
          {
            name: 'mapillary-js',
            var: 'Mapillary',
            style: 'dist/mapillary.min.css'
          },
          {
            name: 'mapbox-gl',
            var: 'mapboxgl',
            style: 'dist/mapbox-gl.css'
          }
        ],
        publicPath: '/node_modules'
      }),
      new ScriptExtHtmlWebpackPlugin({
        preload: {
          test: /(images|app|polyfillChecker|unpkg.com).*\.js$/,
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
