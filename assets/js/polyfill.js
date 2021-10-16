// IE 11 (liveview)
import "mdn-polyfills/Object.assign"
import "mdn-polyfills/CustomEvent"
import "mdn-polyfills/String.prototype.startsWith"
import "mdn-polyfills/Array.from"
import "mdn-polyfills/Array.prototype.find"
import "mdn-polyfills/Array.prototype.some"
import "mdn-polyfills/NodeList.prototype.forEach"
import "mdn-polyfills/Element.prototype.closest"
import "mdn-polyfills/Element.prototype.matches"
import "mdn-polyfills/Node.prototype.remove"
import "child-replace-with-polyfill"
import "url-search-params-polyfill"
import "formdata-polyfill"
import "classlist-polyfill"
import "new-event-polyfill"
import "@webcomponents/template"
import "core-js/features/set"
import "core-js/features/url"
// IE 11 + Edge
import "shim-keyboard-event-key"

// ours
import 'mdn-polyfills/Array.prototype.includes'

// IE 11 only
// via https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/isNaN#polyfill
Number.isNaN = Number.isNaN || function isNaN(input) {
  return typeof input === 'number' && input !== input;
}
