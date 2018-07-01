const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
// const fs  = require('fs');

module.exports = {
  devtool: "cheap-eval-source-map",
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
      }
    ]
  },
  devServer: {
    contentBase: path.join(__dirname, "dist"),
    compress: true,
    port: 9000
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: "base.css"
    }),
    new HtmlWebpackPlugin({
      template: "main.ejs",
      // template: '!!ejs-compiled-loader!main.html',
      minify: true,
      hash: true,
      // snippets: {
      //   pathRender: fs.readFileSync('routes/geo/path_render.html', 'utf8')
      // }
    })
  ]
};
