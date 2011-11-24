/*!
jQuery Waypoints - v1.0.2
Copyright (c) 2011 Caleb Troughton
Dual licensed under the MIT license and GPL license.
https://github.com/imakewebthings/jquery-waypoints/blob/master/MIT-license.txt
https://github.com/imakewebthings/jquery-waypoints/blob/master/GPL-license.txt
*/
/*
Waypoints is a small jQuery plugin that makes it easy to execute a function
whenever you scroll to an element.

GitHub Repository: https://github.com/imakewebthings/jquery-waypoints
Documentation and Examples: http://imakewebthings.github.com/jquery-waypoints

Changelog:
	v1.0.2
		- Moved scroll and resize handler bindings out of load.  Should play nicer
		  with async loaders like Head JS and LABjs.
		- Fixed a 1px off error when using certain % offsets.
		- Added unit tests.
	v1.0.1
		- Added $.waypoints('viewportHeight').
		- Fixed iOS bug (using the new viewportHeight method).
		- Added offset function alias: 'bottom-in-view'.
	v1.0 - Initial release.
	
Support:
	- jQuery versions 1.4+
	- IE6+, FF3+, Chrome 6+, Safari 4+, Opera 11
	- Other versions and browsers may work, these are just the ones I've looked at.
*/
(function(a,b,c,d,e){function m(a){var b=g.length-1;while(b>=0&&g[b].element[0]!==a[0])b-=1;return b}function n(a,c){a.element.trigger(k,c),a.options.triggerOnce&&a.element[b]("destroy")}function o(){var b=f.scrollTop(),d=b>h,e=a.grep(g,function(a,c){return d?a.offset>h&&a.offset<=b:a.offset<=h&&a.offset>b});(!h||!b)&&a[c]("refresh"),h=b;if(!e.length)return;a[c].settings.continuous?a.each(d?e:e.reverse(),function(a,b){n(b,[d?"down":"up"])}):n(e[d?e.length-1:0],[d?"down":"up"])}"$:nomunge";var f=a(d),g=[],h=-99999,i=!1,j=!1,k="waypoint.reached",l={init:function(d,e){return this.each(function(){var f=a(this),h=m(f),i=h<0?a.fn[b].defaults:g[h].options,j=a.extend({},i,e);j.offset=j.offset==="bottom-in-view"?function(){return a[c]("viewportHeight")-a(this).outerHeight()}:j.offset,h<0?g.push({element:f,offset:f.offset().top,options:j}):g[h].options=j,d&&f.bind(k,d)}),a[c]("refresh"),this},remove:function(){return this.each(function(){var b=m(a(this));b>=0&&g.splice(b,1)})},destroy:function(){return this.unbind(k)[b]("remove")}};a.fn[b]=function(c){if(l[c])return l[c].apply(this,Array.prototype.slice.call(arguments,1));if(typeof c=="function"||!c)return l.init.apply(this,arguments);if(typeof c=="object")return l.init.apply(this,[null,c]);a.error("Method "+c+" does not exist on jQuery"+b)},a.fn[b].defaults={offset:0,triggerOnce:!1};var p={refresh:function(){a.each(g,function(b,d){var e=0,f=d.offset;if(typeof d.options.offset=="function")e=d.options.offset.apply(d.element);else if(typeof d.options.offset=="string")var g=parseFloat(d.options.offset),e=d.options.offset.indexOf("%")?Math.ceil(a[c]("viewportHeight")*(g/100)):g;else e=d.options.offset;d.offset=d.element.offset().top-e,h>f&&h<=d.offset?n(d,["up"]):h<f&&h>=d.offset&&n(d,["down"])}),g.sort(function(a,b){return a.offset-b.offset})},viewportHeight:function(){return d.innerHeight?d.innerHeight:f.height()},aggregate:function(){var b=a();return a.each(g,function(a,c){b=b.add(c.element)}),b}};a[c]=function(a){return p[a]?p[a].apply(this):p.aggregate()},a[c].settings={continuous:!0,resizeThrottle:200,scrollThrottle:100},f.scroll(function(){i||(i=!0,d.setTimeout(function(){o(),i=!1},a[c].settings.scrollThrottle))}).resize(function(){j||(j=!0,d.setTimeout(function(){a[c]("refresh"),j=!1},a[c].settings.resizeThrottle))}).load(function(){a[c]("refresh"),o()})})(jQuery,"waypoint","waypoints",this)