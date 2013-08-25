/*
 * Foundation Responsive Library
 * http://foundation.zurb.com
 * Copyright 2013, ZURB
 * Free to use under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
*/
var libFuncName=null;if("undefined"==typeof jQuery&&"undefined"==typeof Zepto&&"function"==typeof $)libFuncName=$;else if("function"==typeof jQuery)libFuncName=jQuery;else{if("function"!=typeof Zepto)throw new TypeError;libFuncName=Zepto}!function(t){!function(){Array.prototype.filter||(Array.prototype.filter=function(t){"use strict";if(null==this)throw new TypeError;var n=Object(this),i=n.length>>>0;if("function"!=typeof t)try{throw new TypeError}catch(e){return}for(var r=[],o=arguments[1],a=0;i>a;a++)if(a in n){var u=n[a];t&&t.call(o,u,a,n)&&r.push(u)}return r},Function.prototype.bind||(Function.prototype.bind=function(t){if("function"!=typeof this)throw new TypeError("Function.prototype.bind - what is trying to be bound is not callable");var n=Array.prototype.slice.call(arguments,1),i=this,e=function(){},r=function(){return i.apply(this instanceof e&&t?this:t,n.concat(Array.prototype.slice.call(arguments)))};return e.prototype=this.prototype,r.prototype=new e,r})),t.fn.stop=t.fn.stop||function(){return this}}(),function(n){"use strict";n.Foundation={name:"Foundation",version:"4.0.8",cache:{},init:function(t,n,i,e,r,o){var a,u=[t,i,e,r],s=[],o=o||!1;if(o&&(this.nc=o),this.scope=t||this.scope,n&&"string"==typeof n){if(/off/i.test(n))return this.off();if(a=n.split(" "),a.length>0)for(var f=a.length-1;f>=0;f--)s.push(this.init_lib(a[f],u))}else for(var c in this.libs)s.push(this.init_lib(c,u));return"function"==typeof n&&u.unshift(n),this.response_obj(s,u)},response_obj:function(t,n){for(var i in n)if("function"==typeof n[i])return n[i]({errors:t.filter(function(t){return"string"==typeof t?t:void 0})});return t},init_lib:function(t,n){return this.trap(function(){return this.libs.hasOwnProperty(t)?(this.patch(this.libs[t]),this.libs[t].init.apply(this.libs[t],n)):void 0}.bind(this),t)},trap:function(t,n){if(!this.nc)try{return t()}catch(i){return this.error({name:n,message:"could not be initialized",more:i.name+" "+i.message})}return t()},patch:function(t){this.fix_outer(t)},inherit:function(t,n){for(var i=n.split(" "),e=i.length-1;e>=0;e--)this.lib_methods.hasOwnProperty(i[e])&&(this.libs[t.name][i[e]]=this.lib_methods[i[e]])},random_str:function(t){var n="0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz".split("");t||(t=Math.floor(Math.random()*n.length));for(var i="",e=0;t>e;e++)i+=n[Math.floor(Math.random()*n.length)];return i},libs:{},lib_methods:{set_data:function(t,n){var i=[this.name,+new Date,Foundation.random_str(5)].join("-");return Foundation.cache[i]=n,t.attr("data-"+this.name+"-id",i),n},get_data:function(t){return Foundation.cache[t.attr("data-"+this.name+"-id")]},remove_data:function(n){n?(delete Foundation.cache[n.attr("data-"+this.name+"-id")],n.attr("data-"+this.name+"-id","")):t("[data-"+this.name+"-id]").each(function(){delete Foundation.cache[t(this).attr("data-"+this.name+"-id")],t(this).attr("data-"+this.name+"-id","")})},throttle:function(t,n){var i=null;return function(){var e=this,r=arguments;clearTimeout(i),i=setTimeout(function(){t.apply(e,r)},n)}},data_options:function(n){function i(t){return!isNaN(t-0)&&null!==t&&""!==t&&t!==!1&&t!==!0}function e(n){return"string"==typeof n?t.trim(n):n}var r,o,a={},u=(n.attr("data-options")||":").split(";"),s=u.length;for(r=s-1;r>=0;r--)o=u[r].split(":"),/true/i.test(o[1])&&(o[1]=!0),/false/i.test(o[1])&&(o[1]=!1),i(o[1])&&(o[1]=parseInt(o[1],10)),2===o.length&&o[0].length>0&&(a[e(o[0])]=e(o[1]));return a},delay:function(t,n){return setTimeout(t,n)},scrollTo:function(i,e,r){if(!(0>r)){var o=e-t(n).scrollTop(),a=10*(o/r);this.scrollToTimerCache=setTimeout(function(){isNaN(parseInt(a,10))||(n.scrollTo(0,t(n).scrollTop()+a),this.scrollTo(i,e,r-10))}.bind(this),10)}},scrollLeft:function(t){return t.length?"scrollLeft"in t[0]?t[0].scrollLeft:t[0].pageXOffset:void 0},empty:function(t){if(t.length&&t.length>0)return!1;if(t.length&&0===t.length)return!0;for(var n in t)if(hasOwnProperty.call(t,n))return!1;return!0}},fix_outer:function(t){t.outerHeight=function(t,n){return"function"==typeof Zepto?t.height():"undefined"!=typeof n?t.outerHeight(n):t.outerHeight()},t.outerWidth=function(t){return"function"==typeof Zepto?t.width():"undefined"!=typeof bool?t.outerWidth(bool):t.outerWidth()}},error:function(t){return t.name+" "+t.message+"; "+t.more},off:function(){return t(this.scope).off(".fndtn"),t(n).off(".fndtn"),!0},zj:function(){try{return Zepto}catch(t){return jQuery}}()},t.fn.foundation=function(){var t=Array.prototype.slice.call(arguments,0);return this.each(function(){return Foundation.init.apply(Foundation,[this].concat(t)),this})}}(this,this.document)}(libFuncName);