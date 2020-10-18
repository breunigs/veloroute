// IE 11 (lvieview)
import "mdn-polyfills/Object.assign"
import "mdn-polyfills/CustomEvent"
import "mdn-polyfills/String.prototype.startsWith"
import "mdn-polyfills/Array.from"
import "mdn-polyfills/Array.prototype.find"
import "mdn-polyfills/NodeList.prototype.forEach"
import "mdn-polyfills/Element.prototype.closest"
import "mdn-polyfills/Element.prototype.matches"
import "mdn-polyfills/Node.prototype.remove"
import "child-replace-with-polyfill"
import "url-search-params-polyfill"
import "formdata-polyfill"
import "classlist-polyfill"
import "@webcomponents/template"
// IE 11 + Edge
import "shim-keyboard-event-key"
if (!window.requestIdleCallback) {
  window.requestIdleCallback = function (x) {
    window.setTimeout(x, 0);
  }
}


// ours
import 'mdn-polyfills/Array.prototype.includes'
