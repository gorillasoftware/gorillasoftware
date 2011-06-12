/*
  Live.js - One script closer to Designing in the Browser
  Written for Handcraft.com by Martin Kool (@mrtnkl).

  Version 3.

  http://livejs.com
  http://livejs.com/license (MIT)  
  @livejs

  Include live.js#css to monitor css changes only.
  Include live.js#js to monitor js changes only.
  Include live.js#html to monitor html changes only.
  Mix and match to monitor a preferred combination such as live.js#html,css  

  By default, just include live.js to monitor all css, js and html changes.
  
  Live.js can also be loaded as a bookmarklet. It is best to only use it for CSS then,
  as a page reload due to a change in html or css would not re-include the bookmarklet.
  To monitor CSS and be notified that it has loaded, include it as: live.js#css,notify
*/
(function(){var a={Etag:1,"Last-Modified":1,"Content-Length":1,"Content-Type":1},b={},c={},d={},e={},f=1e3,g=!1,h={html:1,css:1,js:1},i={heartbeat:function(){document.body&&(g||i.loadresources(),i.checkForChanges()),setTimeout(i.heartbeat,f)},loadresources:function(){function a(a){var b=document.location,c=new RegExp("^\\.|^/(?!/)|^[\\w]((?!://).)*$|"+b.protocol+"//"+b.host);return a.match(c)}var c=document.getElementsByTagName("script"),e=document.getElementsByTagName("link"),f=[];for(var j=0;j<c.length;j++){var k=c[j],l=k.getAttribute("src");l&&a(l)&&f.push(l);if(l&&l.match(/\blive.js#/)){for(var m in h)h[m]=l.match("[#,|]"+m)!=null;l.match("notify")&&alert("Live.js is loaded.")}}h.js||(f=[]),h.html&&f.push(document.location.href);for(var j=0;j<e.length&&h.css;j++){var n=e[j],o=n.getAttribute("rel"),p=n.getAttribute("href",2);p&&o&&o.match("stylesheet")&&a(p)&&(f.push(p),d[p]=n)}for(var j=0;j<f.length;j++){var q=f[j];i.getHead(q,function(a,c){b[a]=c})}var r=document.getElementsByTagName("head")[0],s=document.createElement("style"),t="transition: all .3s ease-out;";css=[".livejs-loading * { ",t," -webkit-",t,"-moz-",t,"-o-",t,"}"].join(""),s.setAttribute("type","text/css"),r.appendChild(s),s.styleSheet?s.styleSheet.cssText=css:s.appendChild(document.createTextNode(css)),g=!0},checkForChanges:function(){for(var a in b){if(c[a])continue;i.getHead(a,function(a,c){var d=b[a],e=!1;b[a]=c;for(var f in d){var g=d[f],h=c[f],j=c["Content-Type"];switch(f){case"Etag":if(!h)break;default:e=g!=h}if(e){i.refreshResource(a,j);break}}})}},refreshResource:function(a,b){switch(b){case"text/css":var c=d[a],f=document.body.parentNode,g=c.parentNode,h=c.nextSibling,j=document.createElement("link");f.className=f.className.replace(/\s*livejs\-loading/gi,"")+" livejs-loading",j.setAttribute("type","text/css"),j.setAttribute("rel","stylesheet"),j.setAttribute("href",a+"?now="+new Date*1),h?g.insertBefore(j,h):g.appendChild(j),d[a]=j,e[a]=c,i.removeoldLinkElements();break;case"text/html":if(a!=document.location.href)return;case"text/javascript":case"application/javascript":case"application/x-javascript":document.location.reload()}},removeoldLinkElements:function(){var a=0;for(var b in e){try{var c=d[b],f=e[b],g=document.body.parentNode,h=c.sheet||c.styleSheet,j=h.rules||h.cssRules;j.length>=0&&(f.parentNode.removeChild(f),delete e[b],setTimeout(function(){g.className=g.className.replace(/\s*livejs\-loading/gi,"")},100))}catch(k){a++}a&&setTimeout(i.removeoldLinkElements,50)}},getHead:function(b,d){c[b]=!0;var e=window.XMLHttpRequest?new XMLHttpRequest:new ActiveXObject("Microsoft.XmlHttp");e.open("HEAD",b,!0),e.onreadystatechange=function(){delete c[b];if(e.readyState==4&&e.status!=304){e.getAllResponseHeaders();var f={};for(var g in a){var h=e.getResponseHeader(g);g=="Etag"&&h&&(h=h.replace(/^W\//,"")),g=="Content-Type"&&h&&(h=h.replace(/^(.*?);.*?$/i,"$1")),f[g]=h}d(b,f)}},e.send()}};document.location.protocol!="file:"?(window.liveJsLoaded||i.heartbeat(),window.liveJsLoaded=!0):window.console&&console.log("Live.js doesn't support the file protocol. It needs http.")})()