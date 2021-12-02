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
      new TerserPlugin({
        cache: true,
        parallel: true,
        sourceMap: true
      }),
      new OptimizeCSSAssetsPlugin({})
    ]
  },
  entry: {
    'app': glob.sync('./vendor/**/*.js').concat(['./js/app.js']),
    'polyfill': ['./js/polyfill.js'],
    'liveview': ['./js/liveview.js'],
    'mbgl1': ['./js/mbgl1.js'],
    'mbgl2': ['./js/mbgl2.js'],
    'map': ['./js/map.js'],
    'video_player': ['./js/video_player.js'],
    'link_helper': ['./js/link_helper.js'],
  },
  output: {
    filename: '[name].js',
    chunkFilename: '[name]-[chunkhash].js',
    publicPath: "/js/",
    path: path.resolve(__dirname, '../priv/static/js')
  },
  module: {
    rules: [{
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env']
          }
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
    new MiniCssExtractPlugin({
      filename: '../css/app.css'
    }),
    new CopyWebpackPlugin([{
      from: 'static/',
      to: '../'
    }])
  ]
});
