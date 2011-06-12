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
(function(a,b,c,d,e){function h(a){var b=j.length-1;while(b>=0&&j[b].element[0]!==a[0])b-=1;return b}function g(a,c){a.element.trigger(n,c),a.options.triggerOnce&&a.element[b]("destroy")}function f(){var b=i.scrollTop(),d=b>k,e=a.grep(j,function(a,c){return d?a.offset>k&&a.offset<=b:a.offset<=k&&a.offset>b});(!k||!b)&&a[c]("refresh"),k=b,!e.length||(a[c].settings.continuous?a.each(d?e:e.reverse(),function(a,b){g(b,[d?"down":"up"])}):g(e[d?e.length-1:0],[d?"down":"up"]))}"$:nomunge";var i=a(d),j=[],k=-99999,l=!1,m=!1,n="waypoint.reached",o={init:function(d,e){this.each(function(){var f=a(this),g=h(f),i=g<0?a.fn[b].defaults:j[g].options,k=a.extend({},i,e);k.offset=k.offset==="bottom-in-view"?function(){return a[c]("viewportHeight")-a(this).outerHeight()}:k.offset,g<0?j.push({element:f,offset:f.offset().top,options:k}):j[g].options=k,d&&f.bind(n,d)}),a[c]("refresh");return this},remove:function(){return this.each(function(){var b=h(a(this));b>=0&&j.splice(b,1)})},destroy:function(){return this.unbind(n)[b]("remove")}};a.fn[b]=function(c){if(o[c])return o[c].apply(this,Array.prototype.slice.call(arguments,1));if(typeof c=="function"||!c)return o.init.apply(this,arguments);if(typeof c=="object")return o.init.apply(this,[null,c]);a.error("Method "+c+" does not exist on jQuery"+b)},a.fn[b].defaults={offset:0,triggerOnce:!1};var p={refresh:function(){a.each(j,function(b,d){var e=0,f=d.offset;if(typeof d.options.offset=="function")e=d.options.offset.apply(d.element);else if(typeof d.options.offset=="string")var h=parseFloat(d.options.offset),e=d.options.offset.indexOf("%")?Math.ceil(a[c]("viewportHeight")*(h/100)):h;else e=d.options.offset;d.offset=d.element.offset().top-e,k>f&&k<=d.offset?g(d,["up"]):k<f&&k>=d.offset&&g(d,["down"])}),j.sort(function(a,b){return a.offset-b.offset})},viewportHeight:function(){return d.innerHeight?d.innerHeight:i.height()},aggregate:function(){var b=a();a.each(j,function(a,c){b=b.add(c.element)});return b}};a[c]=function(a){return p[a]?p[a].apply(this):p.aggregate()},a[c].settings={continuous:!0,resizeThrottle:200,scrollThrottle:100},i.scroll(function(){l||(l=!0,d.setTimeout(function(){f(),l=!1},a[c].settings.scrollThrottle))}).resize(function(){m||(m=!0,d.setTimeout(function(){a[c]("refresh"),m=!1},a[c].settings.resizeThrottle))}).load(function(){a[c]("refresh"),f()})})(jQuery,"waypoint","waypoints",this)