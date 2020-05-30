const path = require('path');
const glob = require('glob');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const TerserPlugin = require('terser-webpack-plugin');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');

module.exports = (env, options) => ({
  devtool: "source-map",
  optimization: {
    minimizer: [
      new TerserPlugin({ cache: true, parallel: true, sourceMap: true }),
      new OptimizeCSSAssetsPlugin({})
    ]
  },
  entry: {
    'app.js': glob.sync('./vendor/**/*.js').concat(['./js/app.js']),
    'polyfill.js': ['./js/polyfill.js'],
    'liveview.js': ['./js/liveview.js'],
    'mly.js': ['./js/mly.js'],
    'map.js': ['./js/map.js'],
  },
  output: {
    filename: '[name]',
    path: path.resolve(__dirname, '../priv/static/js')
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader'
        }
      },
      {
        test: /\.scss$/,
        use: [
          MiniCssExtractPlugin.loader,
          {
            loader: 'css-loader',
            options: {}
          },
          {
            loader: 'sass-loader',
            options: {}
          }
        ]
      }
    ]
  },
  plugins: [
    new MiniCssExtractPlugin({ filename: '../css/app.css' }),
    new CopyWebpackPlugin([{ from: 'static/', to: '../' }])
  ]
});
