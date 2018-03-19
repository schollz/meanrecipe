

<!doctype html>
<!--[if IE 8]>    <html class="ie lt-ie10 lt-ie9"> <![endif]-->
<!--[if IE 9]>    <html class="ie lt-ie10"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
     
            <html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://ogp.me/ns/fb#" xmlns:og="http://opengraphprotocol.org/schema/">   
        <head><!-- INSERT BY TRANSFORMER. SELECTOR=head,LOCATION=prepend --><script>

/*  Rapid+JS v3.1.0 Released on 2018-01-22T21:06Z | (c) Yottaa, Inc. | https://www.yottaa.com/rapidjs-license */ (function(h,Y){return Y(h)})('undefined'!==typeof window?window:this,function(h,Y){function J(){var a='0123456789abcdef'.split(''),b=[],c=Math.random,d;b[8]=b[13]=b[18]=b[23]='-';b[14]='4';for(var f=0;36>f;f++)b[f]||(d=0|16*c(),b[f]=a[19==f?d&3|8:d&15]);return b.join('')}function ma(){for(var a=g.rum.key?g.rum.key:l.getCookie('yo-rum-key'),b=0,c=0,d=0,f=0;f<g.delayed.length;f++){var e=g.delayed[f];'none'!=e.orgDelayType&&(U='active',e.newNode&&e.newNode.nodeName?'img'==e.newNode.nodeName.toLowerCase()? c++:'script'==e.newNode.nodeName.toLowerCase()&&'attributesrc'!=e.type&&b++:e.me&&e.me.nodeName&&'script'==e.me.nodeName.toLowerCase()&&d++)}a={siteKey:null!=a?a:h.location.hostname,uuid:Z,formatVersion:na,releaseDate:oa,requestType:'navigation',fullPageURL:document.location.href,userAgent:navigator.userAgent,pageTitle:document.title,isNavigationSupported:l.def(h.performance)&&l.def(h.performance.timing)&&l.def(h.performance.timing.toJSON),isResourceTimingSupported:l.def(h.performance)&&l.def(h.performance.getEntries), isPaintTimingSupported:l.def(h.performance)&&l.def(h.performance.getEntries),yOptimizations:l.metaDataValue('X-Yottaa-Optimizations'),eventTimestamp:(new Date).getTime(),sequencing:{numScriptsSequenced:b,numImagesSequenced:c,numBlocksSequenced:d,numDelayedObjects:g.delayed.length},commonDimensions:{}};K.geo&&(a.geo=K.geo);for(var r in G)a.commonDimensions[r]=G[r];a.commonDimensions.optState||(a.commonDimensions.optState=U);try{h.localStorage&&localStorage.getItem&&_storeQoeData(a)}catch(Aa){l.log('localStorage was not available')}!0== a.isNavigationSupported&&(a.navigationTiming=h.performance.timing.toJSON());a.isPaintTimingSupported=!1;a.paintTiming={};if(h.performance&&h.performance.getEntriesByType&&(r=h.performance.getEntriesByType('paint'),null!=r&&0<r.length))for(a.isPaintTimingSupported=!0,f=0;f<r.length;f++)a.paintTiming[r[f].name]=r[f].startTime;A.rum=a;setTimeout(function(){k.publish({topic:'rum/send',message:A.rum})},100)}function pa(a,b,c,d){if(g.sequenceWrites&&'script'==a.nodeName.toLowerCase()){for(var f in t)if(0< t[f].length&&d.writeLocation!=t[f][0].getWriteSelector())return e.def(d.writeLocation)&&(a.yo_writeSelector=d.writeLocation),t[f][0].addScript(a),!1;f=null;g&&(f=e.select(d.writeLocation));if(null!=f){a.write_context=new w(f,a,d.writeLocation);var p=t[d.writeLocation];e.undef(p)&&(p=t[d.writeLocation]=[]);p.push(a.write_context);P=function(){var a=Array.prototype.slice.call(arguments,0,-1).join('');0<p.length&&p[p.length-1].collectDocumentWrite(a)};a.original_onload=a.onload;a.original_onreadystatechange= a.onreadystatechange;a.onload=a.onreadystatechange=null;var h=!1;a.onerror=a.onload=function(){h||this.readyState&&'loaded'!==this.readyState&&'complete'!==this.readyState||(e.log('loading ',this,this.write_context.getId()),h=!0,this.original_onload?this.original_onload.call(arguments):k.publish({topic:'sequence/afterloaded/'+a.src,message:a}),this.write_context.finalizeWriteOverride(),this.original_onload=this.write_context=this.onload=this.onreadystatechange=null)};a.onreadystatechange=function(){h|| this.readyState&&'loaded'!==this.readyState&&'complete'!==this.readyState||(e.log('loading ',this,this.write_context.getId()),h=!0,this.original_onload||k.publish({topic:'sequence/afterloaded/'+a.src,message:a}),this.write_context.finalizeWriteOverride(),this.original_onload=this.write_context=this.onload=this.onreadystatechange=null);this.original_onreadystatechange&&this.original_onreadystatechange.call(arguments)}}}return!0}function qa(a,b,c,d){if(g.sequenceWrites&&'function'!==typeof d.writeLocation){for(var f in t)if(0< t[f].length&&d.writeLocation!=t[f][0].getWriteSelector())return e.def(d.writeLocation)&&(d.yo_writeSelector=d.writeLocation),t[f][0].addScript(a),!1;f=null;g&&(f=e.select(d.writeLocation));if(null!=f){d.write_context=new w(f,{src:a},d.writeLocation);var p=t[d.writeLocation];e.undef(p)&&(p=t[d.writeLocation]=[]);p.push(d.write_context);P=function(){var a=Array.prototype.slice.call(arguments,0,-1).join('');0<p.length&&p[p.length-1].collectDocumentWrite(a)}}}return!0}function $(a,b){for(;a.firstChild;)a.removeChild(a.firstChild); e.writeHTML(a,b)}function ra(){if(!1!=g.afterShockLoaded){for(var a=0;a<g.delayed.length;a++)if('none'!=g.delayed[a].delayType)return;null!=g.intervalID&&(clearInterval(g.intervalID),g.intervalID=null,e.log('Turning off response timer all objects are loaded.'))}}function aa(a){g.sequenceWrites&&e.undef(a.yo_write)&&(a.yo_write=a.write,P=sa,a.writeln=a.write=function(){var b=Array.prototype.slice.call(arguments).join('');P(b,a)})}function sa(a,b){for(var c=!1,d=0;d<g.write.length;d++){var f=g.write[d]; if(a.match(f.start)||1==f.state){var d={document:b},p;for(p in f)d[p]=f[p];c=!0;f.string&&!1==V?f.string+=a:(f.state=1,f.string=a);if(e.undef(f.end)||a.match(f.end)){if(e.undef(d.delayType)||'none'==d.delayType){f.config=d;if(e.def(d.onBefore))d.onBefore(f,b);e.undef(d.selector)||null==d.selector?d.selector=b:d.selector=e.select(d.selector);d.selector.yo_write?(V=!0,-1!=f.string.indexOf('m_js_controller.js')&&(V=!0),d.selector.yo_write(f.string)):e.writeHTML(d.selector,f.string,d.how);if(e.def(d.onAfter))d.onAfter(f, b)}else e.undef(d.selector)?(d.selector='yo_write_'+Math.floor(1E9*Math.random()),e.undef(d.how)&&(d.how='append'),e.undef(d.delayValue)&&(d.delayValue=d.selector),document.yo_write('<di'+'v id='+d.selector+' style=width:0px;height:0px></di'+'v>'),d.selector=e.select(d.selector).parentNode):d.selector=e.select(d.selector),p=Yo.sequence.resource(''),e.def(d.onBefore)&&p.beforeLoading(d.onBefore),e.def(d.onLoad)&&p.afterLoaded(d.onLoad),p.type='inner',p.how=f.how,p.newNode=a,p.before=d.selector,p.me=d.selector, g.delayed.push(p),domCompleteTriggered&&p.execute();f.state=2;f.string=''}break}}!1==c&&b.yo_write(a);e.log('write hander = '+a)}function $(a,b){for(;a.firstChild;)a.removeChild(a.firstChild);ta(a,b)}function ta(a,b,c){var d=document.createElement('div');d.innerHTML='string'===typeof b?b:b.innerHTML;for(b=d.childNodes;0<b.length;)'insert'==c?a.parentNode.insertBefore(d.removeChild(b[0]),a):a.appendChild(d.removeChild(b[0]));return this}function ba(a){for(var b=0;b<g.srcAttrs.length;b++){var c=a.getAttribute(g.srcAttrs[b]); if(null!=c)return c}return(c=a.getAttribute('src'))&&'data:image/cloaked;plain,'==c.slice(0,25)?c.substring(25):null}function ua(a){a='string'===typeof a?e.select(a):a;var b=content=e.select(a.getAttribute(g.pre+'location')),c=a.getAttribute(g.pre+'how'),d=new (_delayed()),f=a.nodeName.toLowerCase(),p=a;'eval'==c||'gpt'==c?(content=a.innerHTML,d=Yo.sequence.script(content)):null==c&&(c='replace');var r=a.getAttribute(g.pre+'delayType'),k=a.getAttribute(g.pre+'delayValue'),l=a.getAttribute('src'), q=ba(a),m=q&&0<q.length?'src':'inner',l=a.getAttribute(g.pre+'animator'),n=a.getAttribute(g.pre+'onbefore');null!=n&&e.isFunction(h[n])&&d.beforeLoading(h[n]);var u=a.getAttribute(g.pre+'onLoad');null!=u&&e.isFunction(h[u])&&d.afterLoaded(h[u]);null==content&&(content=a,c='insert');a.setAttribute(g.pre+'loaded','true');if(-1===e.inArray(a,g.targets)){d.animator=l;if('img'==f)null==r&&(r='lazy'),null==b&&(b=a);else if('script'==f){f=a.getAttribute('type');null!=f&&(f=f.split('/'),2<f.length&&(r=f[2], k=f[3]));f=a.getAttribute(g.pre+'writeLocation');d.writeLocation=null!=f?f:a;l=a.getAttribute(g.pre+'src');if(null!=l)return null==r&&(r='none'),d=Yo.sequence.script(l)[r](k),null!=n&&e.isFunction(h[n])&&d.beforeLoading(h[n]),null!=u&&e.isFunction(h[u])&&d.afterLoaded(h[u]),d.me=a,d.load(),d;null==b&&(b=a)}null==r&&(r='none');!0==e.contains(document.documentElement,a)&&a.setAttribute(g.pre+'loaded','true');d[r](k);d.before=b;d.me=p;d.type=m;d.srcAttr=q;d.how=c;d.match=!1;d.newNode='eval'==c||'gpt'== c?content:a;return d}}function ca(a){return function(b,c,d){var f=Q[(a?'on':'')+b];if(f)f.triggered?setTimeout(function(){c(f.event)},0):f.listeners.push(c);else return a?this.yo_addEventListener(b,c,d):this.yo_attachEvent(b,c,d)}}function va(a,b,c){function d(a){e.log('Loading '+c.before.src+' via event handler '+c.delayValue);c.afterShock();var p=null;e.def(a.currentTarget)?p=a.currentTarget:e.def(a.srcElement)&&(p=a.srcElement);e.removeEvent(p,b[0],d)}e.log('Adding event ',b[0],b[1]);e.addEvent(a, b[0],d)}function da(a,b){return a.top>b.top-a.height&&a.bottom<b.bottom+g.offset+2*a.height&&a.left>b.left-a.width&&a.right<b.right+g.offset+2*a.width}function wa(a,b){return ea(this,a,b,'insert')}function xa(a){return ea(this,a,a,'append')}function ea(a,b,c,d){k.publish({topic:'sequence/captured',message:{parentNode:a,newNode:b,before:c,captureType:d}});if(!1==fa(b,a,function(a,e){var h=a.clone();h.type=d;h.newNode=b;h.before=c;h.me=e;g.delayed.push(h)}))return H.safeWriteInsert(b,c,a,M(b),'append'== d);a=g.delayed[g.delayed.length-1];if(domCompleteTriggered||'none'==a.delayType)return a.execute()}function fa(a,b,c){var d=null,f=null,p=!1;a&&a.nodeName&&(d=a.nodeName.toLowerCase());if('script'==d||'iframe'==d){f=M(a);c(f,b);var p=!0,g=!1;a.onreadystatechange&&(a.onreadystatechangeOriginal=a.onreadystatechange,a.onreadystatechange=null);a.onreadystatechange=function(){g||this.readyState&&'loaded'!==this.readyState&&'complete'!==this.readyState||(k.publish({topic:'sequence/afterloaded/'+f.key,message:f}), g=!0);this.onreadystatechangeOriginal&&this.onreadystatechangeOriginal.apply(this,arguments)};a.onload&&(a.onloadOriginal=a.onload,a.onload=null);a.onload=function(){!1==g&&(k.publish({topic:'sequence/afterloaded/'+f.key,message:f}),g=!0);this.onloadOriginal&&this.onloadOriginal.apply(this,arguments)}}else if(f=M(b),null==f||'none'!=f.delayType)c(f,b),f.before=b,p=!0;e.log(a.nodeName+' '+a.src+' is'+(p?' ':' NOT ')+'sequenced.');!1==p&&k.publish({topic:'sequence/beforeloading/'+f.key,message:f}); return p}function M(a){var b=a.src;!0==e.def(a.yo_src)&&(b=a.yo_src);if(null==b||0==b.length)return b=new (_delayed()),b.delayType='none',b;for(var c=0;c<g.resources.length;c++){var d=g.resources[c],f;if(f=!0==d.match){f=d.url;var p=b;null==f||null==p?f=!1:(e.log('Match src',p,'and url',f),f='string'===typeof f&&-1!=p.indexOf(f)||null!=p.match(f));f=!0==f}if(f)return e.log('Found configuration for '+b+' delayType '+d.delayType),'empty'==d.delayType&&(a.src=null==d.delaySrc?'data:text/javascript;plain,//': d.delaySrc,d.delayType='none'),d}e.log('Did NOT find configuration for '+b+' checking local configuration. ');b=new (_delayed());if(null!=a.delayType)'empty'==a.delayType&&(a.src=null==a.delaySrc?'data:text/javascript;plain,//':a.delaySrc,a.delayType='none'),b[a.delayType](a.delayValue);else b[g.defaultType](g.defaultDelay);b.before=a;return b}function ha(){for(var a=0;a<g.resources.length;a++){var b=g.resources[a];if(!b.isConfig){var c=new (_delayed());c.key=c.url=b.url;c.match=!0;c.local=!0;c[b.delayType](b.delayValue); g.resources[a]=c}}}var R={},g={defaultDelay:5E3,defaultType:'none',log:!1,throttle:20,sequenceXHR:!1,sequenceWrites:!1,sendTimingData:!1,timingDataURL:'',offset:100,loadOnDOM:!1,scan:['script','img'],resources:[],abTesting:[],write:[],intervalID:null,lazyCheckSize:!0,pre:'data-yo-',srcAttrs:['data-yo-src','data-yo-srcset'],afterShockLoaded:!1,optimizeIE:!0,delayed:[]},l={log:function(){if(g.log&&(l.def(h)&&l.def(h.console)&&l.def(h.console.log)||l.def(self)&&l.def(self.console)&&l.def(self.console.log))){for(var a= '',b=0;b<arguments.length;b++){var c=arguments[b],d='';'object'===typeof c&&c&&l.def(c.nodeName)?(d=c.yo_src?'yo_src '+c.yo_src:c.src?'src '+c.src:'id '+c.id,a+='['+c.nodeName+', '+d+'] '):a+=c+' '}console.log('Yo.utils.log: '+a)}},def:function(a){return'undefined'!=typeof a},undef:function(a){return!l.def(a)},isFunction:function(a){return!!(a&&a.constructor&&a.call&&a.apply)},decodeSafeString:function(a){return decodeURIComponent(a)},getCookie:function(a){for(var b=document.cookie.split(';'),c=0;c< b.length;c++){var d=b[c];if(-1!=d.indexOf(a)){for(;' '==d.charAt(0);)d=d.substring(1,d.length);return d.substring(a.length+1,d.length)}}return null},setCookie:function(a,b,c){var d='';c&&(d=new Date,d=new Date(d.getTime()+1E3*c),d='; expires='+d.toGMTString());document.cookie=a+'='+b+d+'; path=/';return!0},addEvent:function(a,b,c){a.attachEvent?a.attachEvent('on'+b,c):a.addEventListener&&a.addEventListener(b,c,!1)},removeEvent:function(a,b,c){a.detachEvent?a.detachEvent('on'+b,c):a.removeEventListener(b, c,!1)},metaDataValue:function(a,b){var c=document.getElementsByName(a);return null!=c&&1==c.length?1==arguments.length?c[0].getAttribute('content'):c[0].setAttribute('content',b):null}},k={},E={},ya=1,ia={},W=[];_executeCallback=function(a,b){setTimeout(function(){a.callback.call(a.context,b.message,b.topic)},0)};_addWildcards=function(a,b){for(var c=0;c<W.length;c++){var d=W[c];null!=b.topic.match(d.topic)&&a.push(d)}};k.subscribe=function(a){a.id=++ya;l.undef(a.priority)&&(a.priority=0);l.undef(a.priority)&& (a.priority=0);'string'===typeof a.topic&&-1!=a.topic.indexOf('*')&&(a.topic=new RegExp(a.topic.replace(/\*/g,'.*')));if('string'===typeof a.topic){a.topic=a.topic.toLowerCase();!0==l.undef(E[a.topic])&&(E[a.topic]=[]);E[a.topic].push(a);E[a.topic].sort(function(a,b){return b.priority-a.priority});var b=ia[a.topic];l.def(b)&&a.callback.call(b.context,b.message,b.topic)}else W.push(a);l.log('_pubsub.subscribe',a.topic,a.id);return a.id};k.publish=function(a){a.topic=a.topic.toLowerCase();var b=E[a.topic], b=!0==l.undef(b)?[]:b.slice(0);_addWildcards(b,a);a.persistent&&(ia[a.topic]=a);if(!0==l.def(b)){for(var c=[],d=0;d<b.length;d++){var f=b[d],e=!0;!0==a.async?_executeCallback(f,a):(e=f.callback.call(f.context,a.message,a.topic),c.push(e));l.log('_pubsub.publish',f.topic,f.id);if(!1==e&&!0===a.cancellable)break}return c}l.log('_pubsub.publish',a.topic,'no callbacks');return 0};k.unsubscribe=function(a){for(var b in E)for(var c=E[b],d=0;d<c.length;d++)if(c[d].id==a)return c.splice(d,1),l.log('_pubsub.unsubscribe', 'found'),!0;l.log('_pubsub.unsubscribe','not found');return!1};var A={releaseDate:'2018-01-22',errors:{has:!1},config:g},K=function(){return A};k.subscribe({topic:'core/configure',callback:function(a){K.config=g}});k.subscribe({topic:'core/start',callback:function(){K.config=g}});l.addEvent(h,'error',function(a){var b=a.message,c=a.lineno,d=a.filename;3==arguments.length&&(b=arguments[0],d=arguments[1],c=arguments[2]);l.log('errorCapture',b,c,d);k.publish({topic:'core/js/error',persistent:!0,message:{message:b, implementationType:'dom',resourceName:d,lineNumber:c,collectionTimestamp:(new Date).getTime()}});A.errors={has:!0}});var B={},na='2',oa='2018-01-22',ja=[],N=[],G={},U='unknown',Z=J();_storeQoeData=function(a){var b=localStorage.getItem('rapid-js-visitor-3');if(null!=b){var b=JSON.parse(b),c=(new Date).getTime()>b.visitorTimestamp+18E5;a.visitor={visitorTimestamp:(new Date).getTime(),numVisitorPageViews:b.numVisitorPageViews+1,numSessionPageViews:c?1:b.numSessionPageViews+1,visitorId:b.visitorId?b.visitorId: J(),numSessions:c?b.numSessions+1:b.numSessions,sessionId:c?J():b.sessionId}}else a.visitor={visitorTimestamp:(new Date).getTime(),numVisitorPageViews:1,numSessionPageViews:1,numSessions:1,visitorId:J(),sessionId:J()};localStorage.setItem('rapid-js-visitor-3',JSON.stringify(a.visitor));b=localStorage.getItem('rapid-js-qoe-5');null!=b&&(a.qoe=JSON.parse(b))};_sendData=function(a){if(!0===g.rum.post){var b=new XMLHttpRequest;b.onreadystatechange=function(){4==this.readyState&&l.log('Rum data response received', this.status)};b.open('POST',g.rum.beaconUrl,!0);b.setRequestHeader('Content-type','application/json');b.send(JSON.stringify(a))}else{var b=document.createElement('img'),c=g.rum.beaconUrl+'?';l.log('Sending timing data to ',c);for(var d in a)c+=d+'='+encodeURIComponent(a[d])+'&';b.src=c}};_captureResource=function(){if(!1!=l.def(h.performance)&&!1!=l.def(h.performance.getEntries)){try{if(!h.localStorage||!h.localStorage.getItem)return}catch(a){l.log('localStorage was not available');return}for(var b= [],c=h.performance.timing,d=0,f=0,e=c.domInteractive-c.navigationStart,r=c.domContentLoadedEventEnd-c.navigationStart,k=c.domComplete-c.navigationStart,q=c.loadEventEnd-c.navigationStart,L=h.performance.getEntries(),c=L.length,m=0;m<c;m++){var n=L[m],u=n.startTime,y=0;u<=e?(f+=g.rum.advanced.domInteractiveCoef,y=1):u<=r?(f+=g.rum.advanced.domContentLoadedEventCoef,y=2):u<=k?(f+=g.rum.advanced.domCompleteCoef,y=3):u<=q?(f+=g.rum.advanced.loadEventCoef,y=4):0<n.duration&&(d+=n.duration);0!=y&&n.duration> g.rum.advanced.blockingTime?N.push({lastByteTime:n.duration,implementationType:'dom',type:4,zone:y,resourceName:n.name,resourceSizeBytes:n.decodedBodySize}):0==y&&n.duration>g.rum.advanced.performanceTime?N.push({lastByteTime:n.duration,implementationType:'dom',type:0,zone:y,resourceName:n.name,resourceSizeBytes:n.decodedBodySize}):n.decodedBodySize>g.rum.advanced.violationSize&&N.push({lastByteTime:n.duration,implementationType:'dom',type:1,zone:y,resourceName:n.name,resourceSizeBytes:n.decodedBodySize}); n.toJSON&&(n=n.toJSON(),n.implementationType='dom',b.push(n))}if(h.performance.getEntriesByName)for(e=document.getElementsByTagName('script'),m=0;m<e.length;m++)null!=e[m].src&&''!=e[m].src&&(r=e[m].src,0==r.indexOf('//')&&(r=h.location.protocol+r),L=h.performance.getEntriesByName(r),null!=L&&0!=L.length||N.push({implementationType:'dom',lastByteTime:0,type:2,zone:0,resourceName:e[m].src,resourceSizeBytes:0}));m=localStorage.getItem('rapid-js-qoe-5');null==m?m={sessionTimeSaved:d,journeyTime:d}:(m= JSON.parse(m),m={sessionTimeSaved:(new Date).getTime()>m.collectionTimestamp+18E5?d:m.sessionTimeSaved+d,journeyTime:m.journeyTime+d});m.entries=c;m.timeSaved=d;m.score=f;m.pageMeasured=h.location.href;m.violations=N;!0===g.rum.requests&&(m.resourceTiming=b);m.jsErrors=ja;m.pageMeasuredUuid=Z;m.collectionTimestamp=(new Date).getTime();m.commonDimensions={};for(var t in G)m.commonDimensions[t]=G[t];m.commonDimensions.optState||(m.commonDimensions.optState=U);localStorage.setItem('rapid-js-qoe-5',JSON.stringify(m))}}; B.initialize=function(a,b,c,d,f){g.rum={beaconUrl:a,requests:b,key:c,post:!0,advanced:{performanceTime:750,blockingTime:1500,violationSize:1024E3,domInteractiveCoef:200,domContentLoadedEventCoef:150,domCompleteCoef:100,loadEventCoef:50}};l.def(f)&&(f.performanceTime&&(g.rum.advanced.performanceTime=f.performanceTime),f.blockingTime&&(g.rum.advanced.blockingTime=f.blockingTime),f.violationSize&&(g.rum.advanced.violationSize=f.violationSize));h.performance&&h.performance.setResourceTimingBufferSize&& h.performance.setResourceTimingBufferSize(500)};B.set=function(a,b){G[a]=b};B.get=function(){return G};k.subscribe({topic:'core/load',callback:function(){l.def(g.rum)&&l.def(g.rum.beaconUrl)&&(ma(),l.addEvent(h,'unload',function(){l.log('unload window event triggered');_captureResource()}))}});k.subscribe({topic:'core/js/error',callback:function(a,b){ja.push(a)}});k.subscribe({topic:'rum/send',callback:function(a,b){var c=k.publish({topic:'rum/beforeSend',async:!1,message:A.rum});0!=c.length&&!1=== c[0]||_sendData(A.rum)}});var I=document;_loadCookieConfig=function(){var a=l.getCookie('yo-aftershock-config');if(null!=a&&0<a.length)try{a=eval(a),Yo.configure(a)}catch(b){}};_domready=function(){function a(a){b(a)}function b(a){('poll'===a||'readystatechange'===a.type)&&'complete'!==I.readyState||d||(d=!0,g.afterShockLoaded=!0,k.publish({topic:'core/load',async:!0,message:R,persistent:!0}))}function c(){try{I.documentElement.doScroll('left')}catch(a){setTimeout(c,50);return}b('poll')}var d=!1, f=!0;if('complete'===I.readyState)g.afterShockLoaded=!0,k.publish({topic:'core/load',async:!0,message:Yo,persistent:!0});else{if(I.createEventObject&&I.documentElement.doScroll){try{f=!h.frameElement}catch(e){}f&&c()}!0==g.loadOnDOM&&(l.addEvent(document,'DOMContentLoaded',b),l.addEvent(document,'readystatechange',b));l.addEvent(h,'load',a)}};k.subscribe({topic:'core/start',callback:function(){_loadCookieConfig();_domready()}});var e=l;e.rewrite=function(a){var b=e.metaDataValue('resource.version'), c=e.metaDataValue('cdn.hostname'),d=e.metaDataValue('profile.id');return location.protocol+c+'/'+d+'/'+location.hostname+'/'+b+(0!=a.indexOf('/')?'/':'')+a};e.select=function(a){var b=-1;if(null==a||1==a.length)return null;if('document'==a)return document;if('window'==a)return h;if(e.def(a.nodeName))return a;if('.'==a[0])return a=document.getElementsByClassName(a.substring(1)),0<a.length?a[0]:null;if(-1!=(b=a.indexOf('['))){var c=a.substring(0,b),d=a.substring(b+1),f=d.indexOf(']'),g=d.indexOf('['), d=d.substring(0,f),r=0,f=-1,k=[],l=null;if(-1!=(r=d.indexOf('~')))f=2;else if(-1!=(r=d.indexOf('*')))f=1;else if(-1!=(r=d.indexOf('=')))f=0;else return null;if(-1!=g){g=a.substring(b+1+g+1);b=g.indexOf(']');try{g=parseInt(g.substring(0,b))}catch(q){}}var m=d.substring(0,r),r=d.substring(r+1);2==f&&(l=new RegExp(r));c=document.getElementsByTagName(c);for(b=0;b<c.length;b++){var n=0<m.length?c[b].getAttribute(m):c[b].innerHTML;0==f&&n==r?k.push(c[b]):1==f&&null!=n&&-1!=n.indexOf(r)?k.push(c[b]):2== f&&null!=n&&-1!=n.search(l)&&k.push(c[b])}e.log(a,d,m,r,0==k.length?k.length:k[0]);return-1!=g?g<k.length?k[g]:null:k[0]}'#'==a[0]&&(a=a.substring(1));return document.getElementById(a)};e.writeHTML=function(a,b,c){var d=document.createElement('div');d.innerHTML='string'===typeof b?b:b.innerHTML;for(b=d.childNodes;0<b.length;)if('script'==b[0].nodeName.toLowerCase())if(b[0].src)Yo.sequence.script(d.removeChild(b[0]).src).load();else try{eval(d.removeChild(b[0]).innerHTML)}catch(f){e.log(f)}else'insert'== c?a.parentNode.insertBefore(d.removeChild(b[0]),a):a.appendChild(d.removeChild(b[0]))};e.contains=document.documentElement.compareDocumentPosition?function(a,b){return!!(a.compareDocumentPosition(b)&16)}:document.documentElement.contains?function(a,b){return a!==b&&(a.contains?a.contains(b):!1)}:function(a,b){for(;b=b.parentNode;)if(b===a)return!0;return!1};e.updateHeadItemAttributes=function(a,b,c){0>a&&(document.cookie='yo-disable-instanton=true;Max-Age=2',h.location.reload(!0));a=document.documentElement.getElementsByTagName('head')[0].children[a]; for(var d=0;d<b.length;d++)a.removeAttribute(b[d]);for(var f in c)a.setAttribute(f,c[f])};e.replaceHeadItemContent=function(a,b){0>a&&(document.cookie='yo-disable-instanton=true;Max-Age=2',h.location.reload(!0));document.documentElement.getElementsByTagName('head')[0].children[a].textContent=b};e.isIE=function(){return navigator.userAgent&&(-1!=navigator.userAgent.indexOf('MSIE')||-1!=navigator.userAgent.indexOf('rv:11'))};e.inArray=function(a,b,c){var d;if(b){if(Array.prototype.indexOf)return Array.prototype.indexOf.call(b, a,c);d=b.length;for(c=c?0>c?Math.max(0,d+c):c:0;c<d;c++)if(c in b&&b[c]===a)return c}return-1};var H={},t={},w=function(a,b,c){this.writeContent='';this.writeLocation=a;this.writeSelector=c;this.offScreenDom=null;this.node=b;this.scripts=[];this.id='yo_write_'+Math.floor(1E9*Math.random());e.log('creating WriteContext',this.id,this.node.src);w.prototype.getId=function(a){return this.id};w.prototype.collectDocumentWrite=function(a){this.writeContent+=a;e.log('write override',this.getId(),this.node.src, a)};w.prototype.addScript=function(a){this.scripts.push(a)};w.prototype.getWriteSelector=function(a){return this.writeSelector};w.prototype.executeDeferredScripts=function(){for(var a=0;a<this.scripts.length;a++){var b=this.scripts[a].getAttribute('src');e.def(this.scripts[a].yo_src)&&(b=this.scripts[a].yo_src);Yo.sequence.script(b).none().writeLocation(this.scripts[a].yo_writeSelector).load()}};w.prototype.finalizeWriteOverride=function(){null==this.writeLocation?e.log('write location is null, content ignored', this.getId(),this.node.src):0<this.writeContent.length?(e.log('creating off screen DOM',this.getId(),this.node.src),this.offScreenDom=I.createElement('div'),this.offScreenDom.innerHTML=this.writeContent):e.log('no content, just continue',this.getId(),this.node.src);this.continueWrite()};w.prototype.insertContent=function(){for(;0<this.offScreenDom.childNodes.length;){var a=this.offScreenDom.childNodes[0],b=a.nodeName.toLowerCase();if('script'==b){b=a.getAttribute('language');if(null==b||'vbscript'!= b.toLowerCase()){t[this.writeSelector].push(this);try{this.offScreenDom.removeChild(a)}catch(c){}Yo.sequence.script(a.getAttribute('src')).none().writeLocation(this.writeSelector).load();return!1}try{eval(a.innerHTML),this.offScreenDom.removeChild(a)}catch(e){}this.writeLocation.parentNode.insertBefore(a,this.writeLocation)}else if('link'==b&&'stylesheet'==a.getAttribute('rel').toLowerCase()){document.getElementsByTagName('head')[0].appendChild(a);try{this.offScreenDom.removeChild(a)}catch(g){}}else this.writeLocation.parentNode.insertBefore(a, this.writeLocation)}this.offScreenDom.innerHTML='';return!0};w.prototype.continueWrite=function(){for(var a=t[this.writeSelector],b=a.pop();b;){e.log('Continue writing ',b.getId());if(b.offScreenDom&&!1==b.insertContent())break;0==a.length&&b.executeDeferredScripts();b=a.pop()}}};H.safeWriteInsert=function(a,b,c,d,f){if(!0==pa(a,b,c,d)){var g;a:{try{!0==e.def(a.yo_src)&&(!0==e.isIE()?a.setAttribute('src',a.yo_src):a.src=a.yo_src);g=!0==f||c.contains&&!1==c.contains(b)?c.yo_ac(a):c.yo_ib(a,b);break a}catch(h){e.log('ERROR adding node into dom', a,h)}g=void 0}return g}};H.safeWriteEval=function(a,b,c,d,f){if(!0==qa(a,b,c,d))try{a=a.replace('<scri'+'ipt>','').replace('\x3c/scri'+'ipt>',''),'gpt'==f&&(a='googletag.cmd.push(function() { googletag.pubads().enableSyncRendering = function(){}; '+a+'});'),h.eval(a),g.sequenceWrites&&d.write_context.finalizeWriteOverride()}catch(p){e.log('Error eval',p)}};g.delayed=[];g.targets=[];var x=function(){this.executed=!1;this.cont=!0};x.prototype.afterLoaded=function(a){k.subscribe({topic:'sequence/afterloaded/'+ this.key,callback:a,context:this});return this};x.prototype.beforeLoading=function(a){k.subscribe({topic:'sequence/beforeloading/'+this.key,callback:a,context:this});return this};x.prototype.execute=function(){return this.afterShock()};x.prototype.clone=function(){var a=new x,b;for(b in this)a[b]=this[b];return a};x.prototype.preventDefault=function(){this.cont=!1};x.prototype.key=null;x.prototype.isConfig=function(a){return this.delayType==a};x.prototype.afterShock=function(){var a=null;if(!0!=this.loaded&& (this.delayType='none',this.loaded=!0,e.log('Injecting ',this.newNode,', by ',this.type,' into the DOM now.'),'attributesrc'!=this.type&&k.publish({topic:'sequence/beforeloading/'+this.key,message:this}),!1!=this.cont)){var b=this.newNode,c=this.type,d=this.before;if('insert'==c)a=H.safeWriteInsert(b,d,this.me,this,!1);else if('append'==c)a=H.safeWriteInsert(b,null,this.me,this,!0);else if('replace'==c)this.me.replaceChild(b,d);else if('attributesrc'==c)d.setAttribute('src',b.yo_src);else if('src'== c)e.def(this.animator)&&null!=this.animator?animator(d,this.animator):e.def(g.animator)&&animator(d,g.animator),b=d.getAttribute(g.pre+'srcset'),null!=b&&d.setAttribute('srcset',b),d.src=this.srcAttr;else if('style'==c)b.setAttribute('style',b.getAttribute(g.pre+'style'));else if('inner'==c)e.log(this.how+' -> '+b),'replace'==this.how?$(d,b):'eval'==this.how||'gpt'==this.how?a=H.safeWriteEval(b,d,this.me,this,this.how):e.writeHTML(d,b,this.how),k.publish({topic:'sequence/afterloaded/'+this.key,message:this}); else if('function'==c)e.log(this.how+' -> '+b),d=this.key.apply(this.funcThis,this.funcParameters),k.publish({topic:'sequence/afterloaded/'+this.key,message:{delayed:this,retVal:d}});else if('xhr'==c){this.xhr.onreadystatechange&&(this.xhr.original_oonreadystatechange=this.xhr.onreadystatechange);var f=this;this.xhr.onreadystatechange=function(a){4==f.xhr.readyState&&k.publish({topic:'sequence/afterloaded/'+f.key,message:[a,this]});f.xhr.original_oonreadystatechange&&f.xhr.original_oonreadystatechange.call(arguments)}; this.xhr.xhr_send.apply(this.xhr,this.xhr._yo.send_args)}else'image'==c&&this.loadImage(this);ra();return a}};_delayed=function(){return x};var S=function(a){var b=new (_delayed());'string'===typeof a&&0==a.indexOf('/')&&a.lastIndexOf('/')==a.length-1&&(a=new RegExp(a));b.key=b.url=a;b.match=!0;e.undef(g.resources)&&(g.resources=[]);for(var c=-1,d=0;d<g.resources.length;d++){var f=g.resources[d].url;if('string'===typeof a&&'string'===typeof f&&-1!=a.indexOf(f)||'string'!==typeof f&&'string'===typeof a&& null!=a.match(f)){c=d;break}}b.writeLocation=function(a){this.writeLocation=a;return this};-1==c?g.resources.push(b):g.resources.splice(c,0,b);return b},P=null,V=!1;k.subscribe({topic:'core/configure',callback:function(){aa(document)}});var C={};_xhrOpen=function(a,b,c,d,f){this._yo={open_args:arguments,async:!1===c?!1:!0};e.log('xhr open = '+b+', async '+c);k.publish({topic:'sequence/captured',message:this._yo});return this.xhr_open.apply(this,arguments)};_xhrSend=function(a){if(e.undef(this._yo)|| !0!==this._yo.async)return this.xhr_send.apply(this,arguments);var b=this,c={src:this._yo.open_args[1],nodeName:'xhr'};if(!1==fa(c,c,function(a,c){var e=a.clone();e.type='xhr';e.xhr=b;e.newNode=c;g.delayed.push(e);!0==g.afterShockLoaded&&e.execute()}))return e.log('xhr send is NOT defered, '+c.src),this.xhr_send.apply(this,arguments);this._yo.send_args=arguments;e.log('xhr send is defered, '+c.src+', '+g.delayed[g.delayed.length-1].delayType)};_xhrAbort=function(){if(e.undef(this._yo)||e.undef(this._yo.send_args)|| !0!==this._yo.async)return this.xhr_abort.apply(this,arguments);e.log('Abort to the xhr object is called',' async true')};C.create=function(a){return S(a)};C.captureMethods=function(a){!0==e.undef(a.XMLHttpRequest.prototype.xhr_open)&&(a.XMLHttpRequest.prototype.xhr_open=a.XMLHttpRequest.prototype.open,a.XMLHttpRequest.prototype.xhr_send=a.XMLHttpRequest.prototype.send,a.XMLHttpRequest.prototype.xhr_abort=a.XMLHttpRequest.prototype.abort)};C.overrideMethods=function(a){a.XMLHttpRequest.prototype.open= _xhrOpen;a.XMLHttpRequest.prototype.send=_xhrSend;a.XMLHttpRequest.prototype.abort=_xhrAbort};C.captureMethods(h);k.subscribe({topic:'core/configure',callback:function(){!0==g.sequenceXHR&&!0==e.def(XMLHttpRequest)&&C.overrideMethods(h)}});k.subscribe({topic:'core/load',callback:function(){Yo.sequence.scanTags(!1)}});var v={},Q={};_trackEvent=function(a,b,c){e.def(Q[b])||(Q['on'+b]={object:a,name:b,triggered:!1,event:null,listeners:[]},e.addEvent(a,b,function(a){var c=Q['on'+b],e=c.listeners;c.event= a;navigator.userAgent.match(/MSIE /)&&(c.event={type:a.type});for(var g=0;g<e.length;g++)e[g].call(c.object,a);c.triggered=!0}),!a.yo_addEventListener&&a.addEventListener&&c&&(a.yo_addEventListener=a.addEventListener,a.addEventListener=ca(!0)),!a.yo_attachEvent&&a.attachEvent&&c&&(a.yo_attachEvent=a.attachEvent,a.attachEvent=ca(!1)))};v.loadEvents=function(){_trackEvent(h,'load',!0);_trackEvent(document,'readystatechange',!1);_trackEvent(document,'DOMContentLoaded',!1);_trackEvent(document,'DOMFrameContentLoaded', !0)};var T=null,ka=function(a){this.tempImage=new T;var b=a.image.onload;a.image.onload=null;this.tempImage.onload=function(c){b&&b.call(a.image,c);k.publish({topic:'sequence/afterloaded/'+a.key,message:arguments})};var c=a.image.onerror;a.image.onerror=null;this.tempImage.onerror=function(b){c&&c.call(a.image,b);k.publish({topic:'sequence/afterloaded/'+a.key,message:arguments})};k.publish({topic:'sequence/beforeloading/'+a.key,message:arguments});this.tempImage.src=a.src},za=function(){null==T&& (T=Image,Image=function(){var a=new T;try{Object.defineProperty(a,'src',{set:function(b){Yo.utils.log('Overloaded image src being set',b);b={src:b,key:b.toLowerCase()};k.publish({topic:'sequence/captured',message:b});var d={src:b.src,key:b.key,nodeName:'image'};nodeConfig=M(d);var f=nodeConfig.clone();f.type='image';f.src=d.src;f.image=this;f.newNode=d;g.delayed.push(f);f.loadImage=ka;!0==g.afterShockLoaded&&f.execute();b.image=a;'none'==nodeConfig.delayType&&ka(b)}})}catch(b){e.log(b)}return a})}; k.subscribe({topic:'core/configure',callback:function(){!0==g.sequenceImage&&za()}});k.subscribe({topic:'core/load',callback:function(){}});_delayed().prototype.defer=function(a){this.orgDelayType=this.delayType='defer';this.delayValue=a;if(!0==e.isIE()&&!1==g.optimizeIE)return e.log('Override defer on IE',this.url),this.none();this.execute=function(){if(!1!=g.afterShockLoaded&&!0!=this.executed){this.executed=!0;e.log('Loading ',this.newNode,' via timer event. It will load in ',this.delayValue); var a=this;setTimeout(function(){a.afterShock()},1*this.delayValue);return this}};return this};_delayed().prototype.event=function(a){this.orgDelayType=this.delayType='event';this.delayValue=a;this.execute=function(){if(!1!=g.afterShockLoaded&&!0!=this.executed){this.executed=!0;e.log('Event handling '+this.before.src+' '+this.delayValue);var a=this.delayValue.split(' '),c=a[0].toLowerCase();if('beforeloading'==c||'afterloaded'==c){a=a[1];if('#adjacent'==a)return this.defer(0);k.subscribe({topic:'sequence/'+ c+'/'+a,context:this,callback:function(a){e.log('Loading '+this.before.src+' via event handler '+this.delayValue);this.afterShock()}})}else va(e.select(a[1]),a,this);return this}};return this};k.subscribe({topic:'core/load',callback:function(){}});var F={},D={top:0-g.offset,left:0-g.offset,height:0,width:0,right:0,bottom:0};_throttle=function(a,b){var c=0;return function(){var d=+new Date;d-c<b||(c=d,a.apply(this,arguments))}};_saveViewport=function(){D.height=h.innerHeight||document.documentElement.clientHeight|| document.body.clientHeight;D.bottom=D.height;D.width=h.innerWidth||document.documentElement.clientWidth||document.body.clientWidth;D.right=D.width};_showIfVisible=function(a,b,c){if(!0==e.contains(document.documentElement,c)){if(a=_getBoundingClientRect(c),!1==_advancedDetectionMode(c)&&a.top<D.height+g.offset||!0==_advancedDetectionMode(c)&&(!g.lazyCheckSize||0<a.width&&0<a.height)&&!0==da(a,D)&&!0==_notClipped(c,a))return e.log('showIfVisible is visible ',b,', ',c),g.delayed[b].afterShock(),!0}else return!1}; _advancedDetectionMode=function(a){return null!=g.intervalID&&e.def(a.getBoundingClientRect)};_getBoundingClientRect=function(a){a=a.getBoundingClientRect();e.undef(a.width)&&(a={top:a.top,left:a.left,right:a.right,bottom:a.bottom,width:a.right-a.left,height:a.bottom-a.top});return a};_notClipped=function(a,b){for(var c=a.parentNode;null!=c&&1==c.nodeType;){var d=X(c,'overflow');if(d&&'hidden'==d.toLowerCase())a.yo_clipped=c;else if(0==X(c,'opacity')||'none'==X(c,'display'))return!1;c=c.parentNode}!0== e.undef(a.yo_clipped)&&(a.yo_clipped=!1);return!1!=a.yo_clipped?da(b,_getBoundingClientRect(a.yo_clipped)):!0};var O,la;document.defaultView&&document.defaultView.getComputedStyle&&(O=function(a,b){var c,d;if(d=a.ownerDocument.defaultView){if(d=d.getComputedStyle(a,null))c=d.getPropertyValue(b),''!==c||e.contains(a.ownerDocument.documentElement,a)||(c=a.style[b]);return c}});document.documentElement.currentStyle&&(la=function(a,b){var c=a.currentStyle&&a.currentStyle[b];return''===c?'auto':c});var X= O||la;document.getElementsByClassName||(document.getElementsByClassName=function(a){return this.querySelectorAll('.'+a)});F.scrollHandler=function(a){_saveViewport();if(e.undef(document.documentElement.getBoundingClientRect))return!0;for(var b=a=0;b<g.delayed.length;b++)if(g.delayed[b].isConfig('lazy')){var c=b,d=g.delayed[c],f=d.delayValue;if('string'===typeof f)f=e.select(f);else if(null==f||e.def(f))f=d.before;null!=f&&_showIfVisible(d.before,c,f);a++}};F.delayed=function(a){this.orgDelayType= this.delayType='lazy';this.delayValue=a;this.execute=function(a){return this};return this};O=_throttle(F.scrollHandler,20);e.addEvent(h,'scroll',O);e.addEvent(h,'resize',O);k.subscribe({topic:'core/load',callback:function(){F.scrollHandler()}});_delayed().prototype.lazy=F.delayed;k.subscribe({topic:'core/configure',callback:function(a){0<a.lazyTimer&&null==g.intervalID&&(g.intervalID=setInterval(F.scrollHandler,a.lazyTimer))}});_delayed().prototype.none=function(){this.orgDelayType=this.delayType= 'none';this.execute=function(){return this.afterShock()};return this};_delayed().prototype.remove=function(a,b,c){var d=!1,f='yostore'+e.metaDataValue('resource.version')+this.key;e.undef(a)||'always'==a?d=!0:'session'==a?sessionStorage&&'true'==sessionStorage.getItem(f)?d=!0:sessionStorage&&sessionStorage.setItem(f,'true'):'visitor'==a&&(localStorage&&'true'==localStorage.getItem(f)?d=!0:localStorage&&localStorage.setItem(f,'true'));if(!0==d)this.orgDelayType=this.delayType='remove',this.execute= function(){return this};else this[b](c);return this};var q={};domCompleteTriggered=!1;q.node=function(a){if(a=e.select(a))a.yo_ac=e.def(a.yo_ac)?a.yo_ac:a.appendChild,a.yo_ib=e.def(a.yo_ib)?a.yo_ib:a.insertBefore,a.appendChild=xa,a.insertBefore=wa};q.clearNode=function(a){e.def(a.yo_ib)&&(a.insertBefore=a.yo_ib);e.def(a.yo_ac)&&(a.appendChild=a.yo_ac)};q.addScanner=function(a){g.scan||(g.scan=[]);-1===e.inArray(a,g.scan)&&g.scan.push(a)};q.displayNow=function(){e.log('Handle the display of all visible tags up to now.'); q.scanTags(!0);F.scrollHandler({})};q.createTimer=function(a,b){Yo.configure({lazyTimer:a});b&&Yo.configure({lazyCheckSize:b})};q.createElement=function(a){a.yo_createElement||(a.yo_createElement=a.createElement,a.createElement=function(b){var c=a.yo_createElement(b),d=b.toLowerCase();e.log('_sequencing.createElement',c,b);if(('iframe'==d||'script'==d)&&!0==e.undef(c.yo_src_override)){c.yo_src_override=!0;try{Object.defineProperty(c,'src',{set:function(a){if(this.yo_src=a)if(e.log('Object.src',a), nodeConfig=M(this),null!=nodeConfig&&'none'!=nodeConfig.delayType){if(a=nodeConfig.clone(),a.type='attributesrc',a.newNode=this,a.before=this,a.me=this,g.delayed.push(a),domCompleteTriggered)return a.execute()}else this.setAttribute('src',a)},get:function(){return this.yo_src?this.yo_src:''}})}catch(f){e.log(f)}}return c})};q.resource=S;q.script=function(a){var b=S(a);b.src=a;b.newNode=a;b.before={src:a};b.load=function(a){var b=document.createElement('script');b.type='text/javascript';b.async=!0; b.yo_src=this.url;(a||document.getElementsByTagName('script')[0].parentNode).appendChild(b);return this};b.eval=function(){g.delayed.push(this);this.how='eval';this.type='inner';this.execute();return this};b.apply=function(a,b){g.delayed.push(this);this.how='apply';this.type='function';this.funcThis=a;this.funcParameters=b;this.execute();return this};b.writeLocation=function(a){this.writeLocation=a;return this};return b};q.xhr=C.create;q.content=function(a){var b=ua(a);k.publish({topic:'sequence/captured', message:{delayed:b,location:a}});b.load=function(){e.log('Sequence a script = '+a.id+', type '+this.type);null==this.delayType||'none'==this.delayType?e.log('Content found that needs to be loaded immediately'):e.log('Content found that needs to be sequenced',this.delayType,this.delayValue);this.execute(g.delayed.length-1);g.delayed.push(this)};return b};q.event=v;q.image=function(a){return S(a)};q.scanTags=function(a){if(g.scan){for(var b=0,c=g.scan.length;b<c;b++){var d=g.scan[b],f=document.getElementsByTagName(d), h=void 0;e.log('Find all '+d+' tags in the document.');for(var k=0,l=f.length;k<l;k+=1)if(h=f[k],'true'!==h.getAttribute(g.pre+'loaded')){var q=ba(h),t=h.getAttribute(g.pre+'style');q?(e.log('Found src ',d,', src = '+q+' tag to handle with AfterShocK.'),Yo.sequence.content(h).load()):'script'==d?(q=h.getAttribute('type'),h.getAttribute(g.pre+'src'),q&&-1<q.indexOf('yo/sequence')?(e.log('Found a '+d+', yo/sequence tag to handle with AfterShocK.'),Yo.sequence.content(h).load()):'yo/abtest'==q&&_abTestScript(h)): t&&(e.log('Found style ',d,', src = '+q+' tag to handle with AfterShocK.'),h=Yo.sequence.content(h),h.type='style',h.before=h.newNode,h.load())}}!0!==a&&(g.scan=[])}};q.cloakImages=function(a,b){if(!0!=e.undef(h.btoa))for(var c=0,d=a.length;c<d;c+=1){var f=a[c],g=document.getElementsByTagName(f);e.log('Cloak '+f);for(var k=0,l=g.length;k<l;k+=1)for(var q=g[k],t=0,m=b.length;t<m;t+=1){var n=b[t],u=q.getAttribute(n);null!=u&&(e.log('Cloak '+f,n,u),q.setAttribute(n,'data:image/cloaked;base64,'+btoa(u)))}}}; q.document=aa;q.captureMethods=C.captureMethods;q.overrideMethods=C.overrideMethods;v=document.getElementsByTagName('script');0<v.length&&q.node(v[0].parentNode);q.node(document.getElementsByTagName('head')[0]);!0==e.isIE()&&!0==g.optimizeIE&&q.createElement(document);k.subscribe({topic:'core/start',callback:function(){ha()}});k.subscribe({topic:'core/configure',callback:function(){ha()}});k.subscribe({topic:'core/load',callback:function(){domCompleteTriggered=!0;for(var a=0;a<g.delayed.length;a++)g.delayed[a].execute()}}); var z={},v={};_abTest=function(a,b,c,d,f,g,k,l){return Yo.sequence.resource(d).none().beforeLoading(function(){e.log('adding the google segmentation using a custom (dimension'+a+', '+b+', '+c+')',f,g);Yo.stats().errors.has&&(c+='_error');if('universal'==f){var d=!1;h.ga=function(){if(e.def(a)&&2<arguments.length&&0<=arguments[0].indexOf('set')&&arguments[1]!='dimension'+a){if((h.ga.q=h.ga.q||[]).push(arguments),ga(arguments[0],'dimension'+a,c),d=!0,!0==e.def(k)){for(var b=[],f=0;f<h.ga.q.length;f++)if(3!= h.ga.q[f].length||h.ga.q[f][1]!='dimension'+k)b[b.length]=h.ga.q[f];h.ga.q=b}}else(h.ga.q=h.ga.q||[]).push(arguments),!0==e.undef(k)&&!1==d&&((h.ga.q=h.ga.q||[]).push(['set','dimension'+a,c]),d=!0);_abTestAnalyticsUniversal(arguments)}}else if(e.def(_gaq)){for(var q=1,m=[],n=0;n<_gaq.length;n++)e.def(_gaq[n])&&2<_gaq[n].length&&-1!=_gaq[n][0].indexOf('_setCustomVar')?(!0!=e.undef(a)&&_gaq[n][1]==a||!0!=e.undef(k)&&_gaq[n][1]==k||(m[m.length]=_gaq[n]),q=n):m[m.length]=_gaq[n];_gaq=m;e.def(a)&&(m='_setCustomVar', 0<_gaq.length&&0<_gaq[0].length&&(n=_gaq[0][0].indexOf('.'),-1!=n&&(m=_gaq[0][0].substring(0,n+1)+m)),e.def(l)&&(a=l),_gaq.splice(q,0,[m,a,b,c,e.undef(g)?2:g]));e.log('abTestAnalyticsClassic()');_abTestAnalyticsClassic()}else e.log('Error creating ga information, no selected version',f)})};_getCookieVariant=function(a){return l.getCookie('yo_abtesting_'+a.name+'v'+a.version)};_setCookieVariant=function(a,b,c){e.setCookie('yo_abtesting_'+a.name+'v'+a.version,b,c)};_configureAbTestAnalytics=function(){var a= config.abTestingAnalytics;e.def(a)&&e.undef(a.loaded)&&(_abTest(void 0,void 0,void 0,a.url,a.gaVersion),e.log('Registering analytics',a.url,a.gaVersion),a.loaded=!0)};_executeAllAbTest=function(){e.undef(g.abTestingAnalytics)?e.log('Analytics for ab testing not properly defined'):'classic'==g.abTestingAnalytics.gaVersion?_executeAllAbTestClassic():_executeAllAbTestUniversal()};_executeAllAbTestUniversal=function(){for(var a in g.abTesting){var b=g.abTesting[a];_executeAbTest(b);ga('set','dimension'+ b.analytics.index,b.valuePrefix+b.name+'_v'+b.version+'_'+b.chosenVariant)}!0==z.delayedTrack&&ga('send','pageview')};_executeAllAbTestClassic=function(){var a=null;if(e.def(h._gat)&&e.def(z.uaCode))for(var b=h._gat._getTrackers(),c=0;c<b.length;c++)b[c]._getAccount()==z.uaCode&&(a=b[c]);for(var d in g.abTesting)b=g.abTesting[d],_executeAbTest(b),c=2,'hit'==b.analytics.stickiness?c=3:'visitor'==b.analytics.stickiness&&(c=1),null!=a?a._setCustomVar(b.analytics.index,b.analytics.name,b.valuePrefix+ b.name+'_v'+b.version+'_'+b.chosenVariant,c):e.def(h._gaq)&&h._gaq.push(['_setCustomVar',b.analytics.index,b.analytics.name,b.valuePrefix+b.name+'_v'+b.version+'_'+b.chosenVariant,c]);!0==z.delayedTrack&&(null!=a?(a._trackPageview(),e.log('pageTracker._trackPageview()')):e.def(h._gaq)?(h._gaq.push(['_trackPageview']),e.log("window._gaq.push(['_trackPageview'])")):e.log('Did not find the UA code so we can not track'))};_executeAbTest=function(a){var b=_getCookieVariant(a);null==b&&(b=_chooseVariant(a)); 'hit'!=a.stickiness&&_setCookieVariant(a,b,'visitor'==a.stickiness?864E5:60*(e.undef(a.sessionTime)?30:a.sessionTime));e.log('Variant',b,'was chooen for test',a.name);a.chosenVariant=b;a=a.variants[b];if(e.undef(a))'original'!=b&&e.log('Using original content as the variant',b,'was not found');else for(b=0;b<a.targets.length;b++){var c=a.targets[b];'function'==typeof c?c():Yo.sequence.content(c).load()}};_abTestScript=function(a){var b=a.getAttribute(g.pre+'abtestname'),c=g.abTesting[b];if(e.undef(c))e.log('Found variant script for test', b,"but doesn't exist");else if(b=a.getAttribute(g.pre+'variant'),e.def(c.variants[b]))e.log('Variant script with existing name',b,'already exists. This variant will be excluded');else{var b=a.getAttribute(g.pre+'variantname'),d=a.getAttribute(g.pre+'splitcondition');e.undef(c.variants[b])?c.variants[b]={splitCondition:d,targets:[a]}:c.variants[b].targets.push(a);e.log('Found script variant',b,'with splitCondition',d)}};_chooseVariant=function(a){var b=a.variants;if('percentage'==a.splitBy){var c= 0,d;for(d in b){a=b[d];var f=c;a.splitCondition*=1;c+=a.splitCondition;a.splitCondition+=f}100<b[b.length-1]&&e.log('Total percentage of variants is greater than 100, test will always leave out some variants');c=100*Math.random();for(d in b)if(a=b[d],c<a.splitCondition)return d;return'original'}e.log('Unsupported splitType',a.splitBy,'for test',a.name)};_abTestAnalyticsUniversal=function(a){'send'==a[0]&&e.def(z.delayedTrack)&&(h.ga.q.pop(),z.delayedTrack=!0)};_abTestAnalyticsClassic=function(a){if(e.def(z.delayedTrack)){a= [];for(var b=0;b<_gaq.length;b++)e.undef(_gaq[b])||1>_gaq[b].length||'_trackPageview'!=_gaq[b][0]?('_setAccount'==_gaq[b][0]&&(z.uaCode=_gaq[b][1]),a[a.length]=_gaq[b]):z.delayedTrack=!0;_gaq=a}};v.universal=function(a,b,c,d){return _abTest(a,void 0,b,c,'universal',void 0,d)};v.classic=function(a,b,c,d,f,e){return _abTest(a,b,c,d,'classic',f,e)};v.omniture=function(a,b,c,d){var f=s.t;s.t=function(){c&&(s[c]=d+s[c]);s['eVar'+a]=b;return f.apply(this,arguments)}};v.abTesting=function(a){e.undef(a.variants)&& (a.variants={});e.undef(a.splitBy)&&(a.splitBy='percentage');e.undef(a.stickiness)&&(a.stickiness='session');e.undef(a.version)&&(a.version='0');e.undef(a.analytics)&&(a.analytics={});e.undef(a.analytics.valuePrefix)&&(a.analytics.valuePrefix='yo_abtesting_');e.undef(a.analytics.name)&&(a.analytics.name='yottaa_abtest');e.undef(a.valuePrefix)&&(a.valuePrefix='');g.abTesting[a.name]=a};v.abVariant=function(a,b){var c=g.abTesting[name];e.undef(c)&&e.log('Test',name,'was not defined');c.variants.push(b)}; k.subscribe({topic:'core/load',callback:function(){_executeAllAbTest()}});h.Yo||(h.Yo={});R={utils:e,pubsub:k,configure:function(a){if('string'===typeof a){var b='ul= dl= dt= sd= sr= vp='.split(' ');b[0]+=navigator.language;b[1]+=encodeURIComponent(h.location.href.substring(0,1E3));b[2]+=encodeURIComponent(document.title);b[3]+=h.screen.colorDepth;b[4]+=h.screen.width+','+h.screen.height;b[5]+=h.screen.availWidth+','+h.screen.availHeight;try{if(h.sessionStorage&&sessionStorage.getItem){var c=sessionStorage.getItem('rapid.testVariation'); c&&'undefined'!=c&&b.push('testVariation='+c);var d=sessionStorage.getItem('rapid.siteVersion'),c=-1;if(d&&'undefined'!=d)b.push('siteVersion='+d);else if(-1!=(c=h.location.search.indexOf('yoSiteVersion='))){var f=h.location.search.substring(c+14).split('&');0<f[0].length?b.push('siteVersion='+f[0]):sessionStorage.removeItem&&sessionStorage.removeItem('rapid.siteVersion')}}}catch(e){l.log('sessionStorage was not available')}d=null;d=h.XMLHttpRequest?new XMLHttpRequest:new ActiveXObject('Microsoft.XMLHTTP'); d.open('GET',a+'&'+b.join('&'),!1);d.send('');a=document.createElement('script');a.type='text/javascript';a.text=d.responseText;document.getElementsByTagName('head')[0].appendChild(a);try{h.sessionStorage&&sessionStorage.setItem&&(B.get().testVariation&&sessionStorage.setItem('rapid.testVariation',B.get().testVariation),B.get().inputSiteVersion&&sessionStorage.setItem('rapid.siteVersion',B.get().inputSiteVersion))}catch(q){l.log('sessionStorage was not available')}}else for(b in a)'resources'==b? g.resources=g.resources.concat(a.resources):g[b]=a[b];k.publish({topic:'core/configure',message:g})},sequence:q,rum:B,abTesting:v,insert:{HEAD_START:'head_start',HEAD_END:'head_end',BODY_START:'body_start',BODY_END:'body_end',location:function(a){null!=document.body?document.write("<di'+'v id='yo_tag_"+a+"'></di'+'v>"):document.write("<script id='yo_tag_"+a+"'>\x3c/script>");k.publish({topic:'tag/location/'+a,persistent:!0})},resource:function(a,b,c,d){var f=Yo.sequence.script(a);f.loaded=!0;k.subscribe({topic:'tag/location/'+ b,callback:function(){var a=e.select('#yo_tag_'+b);Yo.sequence.node(a);c&&''!=c||(c='none');f[c](d);f.loaded=!1;f.load(a)}});return f},script:function(a,b,c,d){var f=Yo.sequence.script(a);f.loaded=!0;k.subscribe({topic:'tag/location/'+b,callback:function(){c&&''!=c||(c='none');f[c](d);f.loaded=!1;f.eval()}});return f},content:function(a,b,c,d){var f=document.createElement('script');c&&''!=c||(c='none');f.setAttribute('type','yo/sequencing/'+c+'/'+d);var g=Yo.sequence.content(f);g.loaded=!0;0==b.indexOf('css:')? k.subscribe({topic:'core/load',callback:function(){e.def(a.nodeName)?f.appendChild(a):f.innerHTML=a;var c=b.split(':');g.before=e.select(c[1]);3==c.length&&('after'==c[2]?null==g.before.nextSibling?(g.before=g.before.parentNode,g.how='append'):g.before=g.before.nextSibling:'prepend'==c[2]?0<g.before.childNodes.length?g.before=g.before.childNodes[0]:g.how='append':'append'==c[2]&&(g.how='append'));g.loaded=!1;g.load()}}):k.subscribe({topic:'tag/location/'+b,callback:function(){e.def(a.nodeName)?f.appendChild(a): f.innerHTML=a;g.loaded=!1;g.before=e.select('#yo_tag_'+b);g.load()}});return g}},stats:K,geo:function(){if(0===arguments.length)return A.geo;1===arguments.length&&(A.geo=arguments[0],k.publish({topic:'core/geo',message:arguments[0]}))}};h.Yo=R;k.publish({topic:'core/start',message:R});h.yo_addScaner=Yo.sequence.addScanner;h.yo_createTimer=Yo.sequence.createTimer;h.yo_displayNow=Yo.sequence.displayNow;h.yo_configureAfterShock=Yo.configure;h.yo_afterShockStats=Yo.stats;h.yo_nodeWatch=Yo.sequence.node; h.yo_addResource=function(a,b,c,d,f,e){a=Yo.sequence.resource(a);a[b](c);d&&a.beforeLoading(d);f&&a.afterLoaded(f);e&&a.writeLocation(e)};h.yo_scriptLoader=function(a,b,c,d,f,e){a=Yo.sequence.script(a);a[b](c);d&&a.beforeLoading(d);f&&a.afterLoaded(f);e&&a.writeLocation(e);a.load()};h.yo_deferLoadResource=function(a,b,c,d,e){yo_addResource(a,'defer',b,c,d,e)};h.yo_lazyLoadResource=function(a,b,c,d,e){yo_addResource(a,'lazy',b,c,d,e)};return h.Yo}); 

</script><!-- INSERT BY TRANSFORMER. SELECTOR=head,LOCATION=prepend --><script>
Yo.configure({sequenceWrites: true});
Yo.rum.initialize('https://qoe-1.yottaa.net/log-nt/event', (Math.random()>0.99), 'www.kraftrecipes.com', true);
Yo.rum.set('optState', 'active');

Yo.pubsub.subscribe({
  topic: 'rum/beforeSend',
  callback: function(message, topic){
   if (dataLayer.pageTemplate){
     message.fullPageURL = dataLayer.pageTemplate;
   }
  }
});

Yo.sequence.resource('gpt').none();
Yo.sequence.resource('adService').none();
Yo.sequence.resource('index.min.js').none();
Yo.sequence.resource('tag').none();
Yo.sequence.resource('karma').none();
Yo.sequence.resource('dvbs_src.js').none();
Yo.sequence.resource('coremetrics').none();
Yo.sequence.resource('analytics.js').none();
Yo.sequence.resource('maxymiser.net').none();
Yo.sequence.resource('Kraft.SwiftIQ.js').none();
Yo.sequence.resource('recommendations').none();
Yo.sequence.resource('RelatedRecipes.ascx').none();
Yo.sequence.resource('r1EOG0QR_default').none();
Yo.sequence.resource('sdk.js').defer(5000);
Yo.sequence.resource('fbds.js').defer(5000);
Yo.sequence.resource('loader.js').defer(5000);
</script><!-- INSERT BY TRANSFORMER. SELECTOR=head,LOCATION=prepend --><script>
Yo.sequence.resource(/.*/).defer(0);
</script><!-- INSERT BY TRANSFORMER. SELECTOR=head,LOCATION=prepend --><script>
Yo.sequence.resource('Brightcove').none();
</script><!-- INSERT BY TRANSFORMER. SELECTOR=Head,LOCATION=prepend --><script type="text/javascript">
!function(e){if(!window.pintrk){window.pintrk=function(){window.pintrk.queue.push(Array.prototype.slice.call(arguments))};var n=window.pintrk;n.queue=[],n.version="3.0";var t=document.createElement("script");t.async=!0,t.src=e;var r=document.getElementsByTagName("script")[0];r.parentNode.insertBefore(t,r)}}("https://s.pinimg.com/ct/core.js");
 
pintrk('load','2615649022972');
pintrk('page');
</script>
<noscript>
<img height="1" width="1" style="display:none;" alt=""
src="https://ct.pinterest.com/v3/?tid=2615649022972&noscript=1" />
</noscript><meta http-equiv="X-UA-Compatible" content="IE=edge" /><script type="text/javascript">window.NREUM||(NREUM={});NREUM.info = {"beacon":"bam.nr-data.net","errorBeacon":"bam.nr-data.net","licenseKey":"83ebae476f","applicationID":"70467198","transactionName":"MQdSY0BRWxBWVkwKCwhNcWRiH1kCTlpNFxdJD1FeXFFRAkdBURUBSANDR0o=","queueTime":1,"applicationTime":219,"agent":"","atts":""}</script><script type="text/javascript">(window.NREUM||(NREUM={})).loader_config={xpid:"VQEHVFRWCBAHVFVUAAAOXg=="};window.NREUM||(NREUM={}),__nr_require=function(t,n,e){function r(e){if(!n[e]){var o=n[e]={exports:{}};t[e][0].call(o.exports,function(n){var o=t[e][1][n];return r(o||n)},o,o.exports)}return n[e].exports}if("function"==typeof __nr_require)return __nr_require;for(var o=0;o<e.length;o++)r(e[o]);return r}({1:[function(t,n,e){function r(t){try{s.console&&console.log(t)}catch(n){}}var o,i=t("ee"),a=t(15),s={};try{o=localStorage.getItem("__nr_flags").split(","),console&&"function"==typeof console.log&&(s.console=!0,o.indexOf("dev")!==-1&&(s.dev=!0),o.indexOf("nr_dev")!==-1&&(s.nrDev=!0))}catch(c){}s.nrDev&&i.on("internal-error",function(t){r(t.stack)}),s.dev&&i.on("fn-err",function(t,n,e){r(e.stack)}),s.dev&&(r("NR AGENT IN DEVELOPMENT MODE"),r("flags: "+a(s,function(t,n){return t}).join(", ")))},{}],2:[function(t,n,e){function r(t,n,e,r,s){try{p?p-=1:o(s||new UncaughtException(t,n,e),!0)}catch(f){try{i("ierr",[f,c.now(),!0])}catch(d){}}return"function"==typeof u&&u.apply(this,a(arguments))}function UncaughtException(t,n,e){this.message=t||"Uncaught error with no additional information",this.sourceURL=n,this.line=e}function o(t,n){var e=n?null:c.now();i("err",[t,e])}var i=t("handle"),a=t(16),s=t("ee"),c=t("loader"),f=t("gos"),u=window.onerror,d=!1,l="nr@seenError",p=0;c.features.err=!0,t(1),window.onerror=r;try{throw new Error}catch(h){"stack"in h&&(t(8),t(7),"addEventListener"in window&&t(5),c.xhrWrappable&&t(9),d=!0)}s.on("fn-start",function(t,n,e){d&&(p+=1)}),s.on("fn-err",function(t,n,e){d&&!e[l]&&(f(e,l,function(){return!0}),this.thrown=!0,o(e))}),s.on("fn-end",function(){d&&!this.thrown&&p>0&&(p-=1)}),s.on("internal-error",function(t){i("ierr",[t,c.now(),!0])})},{}],3:[function(t,n,e){t("loader").features.ins=!0},{}],4:[function(t,n,e){function r(t){}if(window.performance&&window.performance.timing&&window.performance.getEntriesByType){var o=t("ee"),i=t("handle"),a=t(8),s=t(7),c="learResourceTimings",f="addEventListener",u="resourcetimingbufferfull",d="bstResource",l="resource",p="-start",h="-end",m="fn"+p,w="fn"+h,v="bstTimer",y="pushState",g=t("loader");g.features.stn=!0,t(6);var b=NREUM.o.EV;o.on(m,function(t,n){var e=t[0];e instanceof b&&(this.bstStart=g.now())}),o.on(w,function(t,n){var e=t[0];e instanceof b&&i("bst",[e,n,this.bstStart,g.now()])}),a.on(m,function(t,n,e){this.bstStart=g.now(),this.bstType=e}),a.on(w,function(t,n){i(v,[n,this.bstStart,g.now(),this.bstType])}),s.on(m,function(){this.bstStart=g.now()}),s.on(w,function(t,n){i(v,[n,this.bstStart,g.now(),"requestAnimationFrame"])}),o.on(y+p,function(t){this.time=g.now(),this.startPath=location.pathname+location.hash}),o.on(y+h,function(t){i("bstHist",[location.pathname+location.hash,this.startPath,this.time])}),f in window.performance&&(window.performance["c"+c]?window.performance[f](u,function(t){i(d,[window.performance.getEntriesByType(l)]),window.performance["c"+c]()},!1):window.performance[f]("webkit"+u,function(t){i(d,[window.performance.getEntriesByType(l)]),window.performance["webkitC"+c]()},!1)),document[f]("scroll",r,{passive:!0}),document[f]("keypress",r,!1),document[f]("click",r,!1)}},{}],5:[function(t,n,e){function r(t){for(var n=t;n&&!n.hasOwnProperty(u);)n=Object.getPrototypeOf(n);n&&o(n)}function o(t){s.inPlace(t,[u,d],"-",i)}function i(t,n){return t[1]}var a=t("ee").get("events"),s=t(18)(a,!0),c=t("gos"),f=XMLHttpRequest,u="addEventListener",d="removeEventListener";n.exports=a,"getPrototypeOf"in Object?(r(document),r(window),r(f.prototype)):f.prototype.hasOwnProperty(u)&&(o(window),o(f.prototype)),a.on(u+"-start",function(t,n){var e=t[1],r=c(e,"nr@wrapped",function(){function t(){if("function"==typeof e.handleEvent)return e.handleEvent.apply(e,arguments)}var n={object:t,"function":e}[typeof e];return n?s(n,"fn-",null,n.name||"anonymous"):e});this.wrapped=t[1]=r}),a.on(d+"-start",function(t){t[1]=this.wrapped||t[1]})},{}],6:[function(t,n,e){var r=t("ee").get("history"),o=t(18)(r);n.exports=r,o.inPlace(window.history,["pushState","replaceState"],"-")},{}],7:[function(t,n,e){var r=t("ee").get("raf"),o=t(18)(r),i="equestAnimationFrame";n.exports=r,o.inPlace(window,["r"+i,"mozR"+i,"webkitR"+i,"msR"+i],"raf-"),r.on("raf-start",function(t){t[0]=o(t[0],"fn-")})},{}],8:[function(t,n,e){function r(t,n,e){t[0]=a(t[0],"fn-",null,e)}function o(t,n,e){this.method=e,this.timerDuration=isNaN(t[1])?0:+t[1],t[0]=a(t[0],"fn-",this,e)}var i=t("ee").get("timer"),a=t(18)(i),s="setTimeout",c="setInterval",f="clearTimeout",u="-start",d="-";n.exports=i,a.inPlace(window,[s,"setImmediate"],s+d),a.inPlace(window,[c],c+d),a.inPlace(window,[f,"clearImmediate"],f+d),i.on(c+u,r),i.on(s+u,o)},{}],9:[function(t,n,e){function r(t,n){d.inPlace(n,["onreadystatechange"],"fn-",s)}function o(){var t=this,n=u.context(t);t.readyState>3&&!n.resolved&&(n.resolved=!0,u.emit("xhr-resolved",[],t)),d.inPlace(t,y,"fn-",s)}function i(t){g.push(t),h&&(x?x.then(a):w?w(a):(E=-E,O.data=E))}function a(){for(var t=0;t<g.length;t++)r([],g[t]);g.length&&(g=[])}function s(t,n){return n}function c(t,n){for(var e in t)n[e]=t[e];return n}t(5);var f=t("ee"),u=f.get("xhr"),d=t(18)(u),l=NREUM.o,p=l.XHR,h=l.MO,m=l.PR,w=l.SI,v="readystatechange",y=["onload","onerror","onabort","onloadstart","onloadend","onprogress","ontimeout"],g=[];n.exports=u;var b=window.XMLHttpRequest=function(t){var n=new p(t);try{u.emit("new-xhr",[n],n),n.addEventListener(v,o,!1)}catch(e){try{u.emit("internal-error",[e])}catch(r){}}return n};if(c(p,b),b.prototype=p.prototype,d.inPlace(b.prototype,["open","send"],"-xhr-",s),u.on("send-xhr-start",function(t,n){r(t,n),i(n)}),u.on("open-xhr-start",r),h){var x=m&&m.resolve();if(!w&&!m){var E=1,O=document.createTextNode(E);new h(a).observe(O,{characterData:!0})}}else f.on("fn-end",function(t){t[0]&&t[0].type===v||a()})},{}],10:[function(t,n,e){function r(t){var n=this.params,e=this.metrics;if(!this.ended){this.ended=!0;for(var r=0;r<d;r++)t.removeEventListener(u[r],this.listener,!1);if(!n.aborted){if(e.duration=a.now()-this.startTime,4===t.readyState){n.status=t.status;var i=o(t,this.lastSize);if(i&&(e.rxSize=i),this.sameOrigin){var c=t.getResponseHeader("X-NewRelic-App-Data");c&&(n.cat=c.split(", ").pop())}}else n.status=0;e.cbTime=this.cbTime,f.emit("xhr-done",[t],t),s("xhr",[n,e,this.startTime])}}}function o(t,n){var e=t.responseType;if("json"===e&&null!==n)return n;var r="arraybuffer"===e||"blob"===e||"json"===e?t.response:t.responseText;return h(r)}function i(t,n){var e=c(n),r=t.params;r.host=e.hostname+":"+e.port,r.pathname=e.pathname,t.sameOrigin=e.sameOrigin}var a=t("loader");if(a.xhrWrappable){var s=t("handle"),c=t(11),f=t("ee"),u=["load","error","abort","timeout"],d=u.length,l=t("id"),p=t(14),h=t(13),m=window.XMLHttpRequest;a.features.xhr=!0,t(9),f.on("new-xhr",function(t){var n=this;n.totalCbs=0,n.called=0,n.cbTime=0,n.end=r,n.ended=!1,n.xhrGuids={},n.lastSize=null,p&&(p>34||p<10)||window.opera||t.addEventListener("progress",function(t){n.lastSize=t.loaded},!1)}),f.on("open-xhr-start",function(t){this.params={method:t[0]},i(this,t[1]),this.metrics={}}),f.on("open-xhr-end",function(t,n){"loader_config"in NREUM&&"xpid"in NREUM.loader_config&&this.sameOrigin&&n.setRequestHeader("X-NewRelic-ID",NREUM.loader_config.xpid)}),f.on("send-xhr-start",function(t,n){var e=this.metrics,r=t[0],o=this;if(e&&r){var i=h(r);i&&(e.txSize=i)}this.startTime=a.now(),this.listener=function(t){try{"abort"===t.type&&(o.params.aborted=!0),("load"!==t.type||o.called===o.totalCbs&&(o.onloadCalled||"function"!=typeof n.onload))&&o.end(n)}catch(e){try{f.emit("internal-error",[e])}catch(r){}}};for(var s=0;s<d;s++)n.addEventListener(u[s],this.listener,!1)}),f.on("xhr-cb-time",function(t,n,e){this.cbTime+=t,n?this.onloadCalled=!0:this.called+=1,this.called!==this.totalCbs||!this.onloadCalled&&"function"==typeof e.onload||this.end(e)}),f.on("xhr-load-added",function(t,n){var e=""+l(t)+!!n;this.xhrGuids&&!this.xhrGuids[e]&&(this.xhrGuids[e]=!0,this.totalCbs+=1)}),f.on("xhr-load-removed",function(t,n){var e=""+l(t)+!!n;this.xhrGuids&&this.xhrGuids[e]&&(delete this.xhrGuids[e],this.totalCbs-=1)}),f.on("addEventListener-end",function(t,n){n instanceof m&&"load"===t[0]&&f.emit("xhr-load-added",[t[1],t[2]],n)}),f.on("removeEventListener-end",function(t,n){n instanceof m&&"load"===t[0]&&f.emit("xhr-load-removed",[t[1],t[2]],n)}),f.on("fn-start",function(t,n,e){n instanceof m&&("onload"===e&&(this.onload=!0),("load"===(t[0]&&t[0].type)||this.onload)&&(this.xhrCbStart=a.now()))}),f.on("fn-end",function(t,n){this.xhrCbStart&&f.emit("xhr-cb-time",[a.now()-this.xhrCbStart,this.onload,n],n)})}},{}],11:[function(t,n,e){n.exports=function(t){var n=document.createElement("a"),e=window.location,r={};n.href=t,r.port=n.port;var o=n.href.split("://");!r.port&&o[1]&&(r.port=o[1].split("/")[0].split("@").pop().split(":")[1]),r.port&&"0"!==r.port||(r.port="https"===o[0]?"443":"80"),r.hostname=n.hostname||e.hostname,r.pathname=n.pathname,r.protocol=o[0],"/"!==r.pathname.charAt(0)&&(r.pathname="/"+r.pathname);var i=!n.protocol||":"===n.protocol||n.protocol===e.protocol,a=n.hostname===document.domain&&n.port===e.port;return r.sameOrigin=i&&(!n.hostname||a),r}},{}],12:[function(t,n,e){function r(){}function o(t,n,e){return function(){return i(t,[f.now()].concat(s(arguments)),n?null:this,e),n?void 0:this}}var i=t("handle"),a=t(15),s=t(16),c=t("ee").get("tracer"),f=t("loader"),u=NREUM;"undefined"==typeof window.newrelic&&(newrelic=u);var d=["setPageViewName","setCustomAttribute","setErrorHandler","finished","addToTrace","inlineHit","addRelease"],l="api-",p=l+"ixn-";a(d,function(t,n){u[n]=o(l+n,!0,"api")}),u.addPageAction=o(l+"addPageAction",!0),u.setCurrentRouteName=o(l+"routeName",!0),n.exports=newrelic,u.interaction=function(){return(new r).get()};var h=r.prototype={createTracer:function(t,n){var e={},r=this,o="function"==typeof n;return i(p+"tracer",[f.now(),t,e],r),function(){if(c.emit((o?"":"no-")+"fn-start",[f.now(),r,o],e),o)try{return n.apply(this,arguments)}catch(t){throw c.emit("fn-err",[arguments,this,t],e),t}finally{c.emit("fn-end",[f.now()],e)}}}};a("setName,setAttribute,save,ignore,onEnd,getContext,end,get".split(","),function(t,n){h[n]=o(p+n)}),newrelic.noticeError=function(t){"string"==typeof t&&(t=new Error(t)),i("err",[t,f.now()])}},{}],13:[function(t,n,e){n.exports=function(t){if("string"==typeof t&&t.length)return t.length;if("object"==typeof t){if("undefined"!=typeof ArrayBuffer&&t instanceof ArrayBuffer&&t.byteLength)return t.byteLength;if("undefined"!=typeof Blob&&t instanceof Blob&&t.size)return t.size;if(!("undefined"!=typeof FormData&&t instanceof FormData))try{return JSON.stringify(t).length}catch(n){return}}}},{}],14:[function(t,n,e){var r=0,o=navigator.userAgent.match(/Firefox[\/\s](\d+\.\d+)/);o&&(r=+o[1]),n.exports=r},{}],15:[function(t,n,e){function r(t,n){var e=[],r="",i=0;for(r in t)o.call(t,r)&&(e[i]=n(r,t[r]),i+=1);return e}var o=Object.prototype.hasOwnProperty;n.exports=r},{}],16:[function(t,n,e){function r(t,n,e){n||(n=0),"undefined"==typeof e&&(e=t?t.length:0);for(var r=-1,o=e-n||0,i=Array(o<0?0:o);++r<o;)i[r]=t[n+r];return i}n.exports=r},{}],17:[function(t,n,e){n.exports={exists:"undefined"!=typeof window.performance&&window.performance.timing&&"undefined"!=typeof window.performance.timing.navigationStart}},{}],18:[function(t,n,e){function r(t){return!(t&&t instanceof Function&&t.apply&&!t[a])}var o=t("ee"),i=t(16),a="nr@original",s=Object.prototype.hasOwnProperty,c=!1;n.exports=function(t,n){function e(t,n,e,o){function nrWrapper(){var r,a,s,c;try{a=this,r=i(arguments),s="function"==typeof e?e(r,a):e||{}}catch(f){l([f,"",[r,a,o],s])}u(n+"start",[r,a,o],s);try{return c=t.apply(a,r)}catch(d){throw u(n+"err",[r,a,d],s),d}finally{u(n+"end",[r,a,c],s)}}return r(t)?t:(n||(n=""),nrWrapper[a]=t,d(t,nrWrapper),nrWrapper)}function f(t,n,o,i){o||(o="");var a,s,c,f="-"===o.charAt(0);for(c=0;c<n.length;c++)s=n[c],a=t[s],r(a)||(t[s]=e(a,f?s+o:o,i,s))}function u(e,r,o){if(!c||n){var i=c;c=!0;try{t.emit(e,r,o,n)}catch(a){l([a,e,r,o])}c=i}}function d(t,n){if(Object.defineProperty&&Object.keys)try{var e=Object.keys(t);return e.forEach(function(e){Object.defineProperty(n,e,{get:function(){return t[e]},set:function(n){return t[e]=n,n}})}),n}catch(r){l([r])}for(var o in t)s.call(t,o)&&(n[o]=t[o]);return n}function l(n){try{t.emit("internal-error",n)}catch(e){}}return t||(t=o),e.inPlace=f,e.flag=a,e}},{}],ee:[function(t,n,e){function r(){}function o(t){function n(t){return t&&t instanceof r?t:t?c(t,s,i):i()}function e(e,r,o,i){if(!l.aborted||i){t&&t(e,r,o);for(var a=n(o),s=h(e),c=s.length,f=0;f<c;f++)s[f].apply(a,r);var d=u[y[e]];return d&&d.push([g,e,r,a]),a}}function p(t,n){v[t]=h(t).concat(n)}function h(t){return v[t]||[]}function m(t){return d[t]=d[t]||o(e)}function w(t,n){f(t,function(t,e){n=n||"feature",y[e]=n,n in u||(u[n]=[])})}var v={},y={},g={on:p,emit:e,get:m,listeners:h,context:n,buffer:w,abort:a,aborted:!1};return g}function i(){return new r}function a(){(u.api||u.feature)&&(l.aborted=!0,u=l.backlog={})}var s="nr@context",c=t("gos"),f=t(15),u={},d={},l=n.exports=o();l.backlog=u},{}],gos:[function(t,n,e){function r(t,n,e){if(o.call(t,n))return t[n];var r=e();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(t,n,{value:r,writable:!0,enumerable:!1}),r}catch(i){}return t[n]=r,r}var o=Object.prototype.hasOwnProperty;n.exports=r},{}],handle:[function(t,n,e){function r(t,n,e,r){o.buffer([t],r),o.emit(t,n,e)}var o=t("ee").get("handle");n.exports=r,r.ee=o},{}],id:[function(t,n,e){function r(t){var n=typeof t;return!t||"object"!==n&&"function"!==n?-1:t===window?0:a(t,i,function(){return o++})}var o=1,i="nr@id",a=t("gos");n.exports=r},{}],loader:[function(t,n,e){function r(){if(!x++){var t=b.info=NREUM.info,n=l.getElementsByTagName("script")[0];if(setTimeout(u.abort,3e4),!(t&&t.licenseKey&&t.applicationID&&n))return u.abort();f(y,function(n,e){t[n]||(t[n]=e)}),c("mark",["onload",a()+b.offset],null,"api");var e=l.createElement("script");e.src="https://"+t.agent,n.parentNode.insertBefore(e,n)}}function o(){"complete"===l.readyState&&i()}function i(){c("mark",["domContent",a()+b.offset],null,"api")}function a(){return E.exists&&performance.now?Math.round(performance.now()):(s=Math.max((new Date).getTime(),s))-b.offset}var s=(new Date).getTime(),c=t("handle"),f=t(15),u=t("ee"),d=window,l=d.document,p="addEventListener",h="attachEvent",m=d.XMLHttpRequest,w=m&&m.prototype;NREUM.o={ST:setTimeout,SI:d.setImmediate,CT:clearTimeout,XHR:m,REQ:d.Request,EV:d.Event,PR:d.Promise,MO:d.MutationObserver};var v=""+location,y={beacon:"bam.nr-data.net",errorBeacon:"bam.nr-data.net",agent:"js-agent.newrelic.com/nr-1071.min.js"},g=m&&w&&w[p]&&!/CriOS/.test(navigator.userAgent),b=n.exports={offset:s,now:a,origin:v,features:{},xhrWrappable:g};t(12),l[p]?(l[p]("DOMContentLoaded",i,!1),d[p]("load",r,!1)):(l[h]("onreadystatechange",o),d[h]("onload",r)),c("mark",["firstbyte",s],null,"api");var x=0,E=t(17)},{}]},{},["loader",2,10,4,3]);</script>
<title>Brownie and Blondie Recipes - Kraft Recipes</title>
<meta name="title" content="Brownie and Blondie Recipes - Kraft Recipes" /><meta name="description" content="Enjoy our brownie and blondie recipes at the next party or potluck! Kraft Recipes has tasty brownie and blondie recipes for you to serve on a dessert tray." /><meta name="keywords" content="brownie and blondie recipes" /><link rel="canonical" href="http://www.kraftrecipes.com/recipes/dessert/brownie-blondies.aspx" /><meta name="pageimage" content="/-/media/assets/2018-spring/blonde-coffee-blondies-211778-642x428.jpg" /><meta name="metacategory" content="kids" /><meta name="metacategory" content="dinner" /><meta name="VIDEO_LANGUAGEID" content="1" />
<meta property="fb:app_id" Content="130791333621603" /><meta property="fb:site_name" Content="kraftrecipes.com" />
<meta property="og:title" Content="Brownie and Blondie Recipes" /><meta property="og:image" Content="http://www.kraftrecipes.com/-/media/assets/2018-spring/blonde-coffee-blondies-211778-642x428.jpg" /><meta property="og:url" Content="http://www.kraftrecipes.com/recipes/dessert/brownie-blondies.aspx" /><meta property="og:image:width" Content="642" /><meta property="og:image:height" Content="428" /><meta property="og:description" Content="Enjoy our brownie and blondie recipes at the next party or potluck! Kraft Recipes has tasty brownie and blondie recipes for you to serve on a dessert tray." /><meta property="og:site_name" Content="Recipes" />
<meta name="twitter:card" content="summary" /><meta name="twitter:site" content="@kraftfoods" /><meta name="twitter:title" content="Brownie and Blondie Recipes" /><meta name="twitter:description" content="Enjoy our brownie and blondie recipes at the next party or potluck! Kraft Recipes has tasty brownie and blondie recipes for you to serve on a dessert tray." /><meta name="twitter:image" content="http://www.kraftrecipes.com/-/media/assets/2018-spring/blonde-coffee-blondies-211778-642x428.jpg" /><meta name="twitter:url" content="http://www.kraftrecipes.com/recipes/dessert/brownie-blondies.aspx" />

<meta name="viewport" content="width=device-width,user-scalable=no,minimum-scale=1,maximum-scale=1" /><meta name="msapplication-config" content="none" />
          
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="/assets/css/main-opt.css" /><link rel="stylesheet" type="text/css" href="//players.brightcove.net/videojs-ima3/2/videojs.ima3.min.css" />
    <link rel="shortcut icon" href="/-/media/global/favicon.ico" type="image/x-icon">

<!-- STAN 437 Fix for KR  Add the following line of code to the global template of your site, just before the head tag. 
    This code should be placed before any asynchronous scripts or 3rd party analytics scripts. -->

<!-- Omit the protocol when specifying the path to mmcore.js.-->
<!-- Maxymiser script start -->
<script type="text/javascript" src="//service.maxymiser.net/api/us/kraftrecipes.com/abd850/mmapi.js"></script>
<!-- Maxymiser script end -->

 
    <script type="text/javascript">
        ///* Fix for Windows 8 Phone showing desktop site */
        (function () {
            if ("-ms-user-select" in document.documentElement.style && navigator.userAgent.match(/IEMobile\/10\.0/)) {
                var msViewportStyle = document.createElement("style");
                msViewportStyle.appendChild(
                    document.createTextNode("@-ms-viewport{width:auto!important}")
                );
                document.getElementsByTagName("head")[0].appendChild(msViewportStyle);
            }
        })();
    </script>
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css" /><script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>

        
    <script type="text/javascript" src="//cdn-us-ec.yottaa.net/5637a31d312e585f7100086c/www.kraftrecipes.com/v~22.121/assets/js/kraft.js?yocs=1V_1Y_25_&amp;yoloc=us"></script>
    <script type="text/javascript" src="//cdn-us-ec.yottaa.net/5637a31d312e585f7100086c/www.kraftrecipes.com/v~22.121/kraft.environmentSettings.js?yocs=1V_1Y_&amp;yoloc=us"></script>
    <script type="text/javascript">
        if (parent.location != self.location) {
            parent.location = self.location;
        }
        kraft.environmentSettings.registration.modalPage = "/account/registration-step-1.aspx";
        kraft.environmentSettings.zipModal.url = "/account/change-zip.aspx";
    </script>
        
    <link href="http://fonts.googleapis.com/css?family=Roboto+Slab:300,400,700" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="//cdn-us-ec.yottaa.net/5637a31d312e585f7100086c/www.kraftrecipes.com/v~22.121/assets/js/plugins/modernizr.min.js?yocs=1V_1Y_25_&amp;yoloc=us"></script>
        
    <!-- Begin comScore Tag --> 
    <script>var _comscore = _comscore || []; _comscore.push(
    { c1: "2", c2: "6036294" }
    ); (function () {
        var s = document.createElement("script"), el = document.getElementsByTagName("script")[0]; s.async = true; s.src = (document.location.protocol == "https:" ? "https://sb" : "http://b") + ".scorecardresearch.com/beacon.js"; el.parentNode.insertBefore(s, el);
    }
    )();</script> 
    <noscript><img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-yo-delayType="lazy" data-yo-src="http://b.scorecardresearch.com/p?c1=2&amp;c2=6036294&amp;cv=2.0&amp;cj=1" /></noscript> 
    <!-- End comScore Tag-->
    
    
   <!-- plugins -->
    
    <script src="//cdn-us-ec.yottaa.net/5637a31d312e585f7100086c/www.kraftrecipes.com/v~22.121/_bundles/js/plugins?v=iv1Hhsd1q753Ot4FwN901Bo97_1vLpr1u_nFqOFBPrA1&amp;yocs=1Y_&amp;yoloc=us"></script>


    <!-- global js -->
    
    <script src="/_bundles/js/global?v=miviqGSGqTMZ06u-iStuIR8ao4ES0va_6KBJY9yXKeU1"></script><!-- INSERT BY TRANSFORMER. SELECTOR=script[src*global],LOCATION=after --><script>
  kraft.global.HeaderAdInit = function(){
  }
</script>


  <!-- componentized globals -->
    
    <script src="//cdn-us-ec.yottaa.net/5637a31d312e585f7100086c/www.kraftrecipes.com/v~22.121/_bundles/js/components?v=lWgzZ_Rzp8JG9zSrYhz9GthaD16xPq6iI-417MW8F6g1&amp;yocs=1Y_&amp;yoloc=us"></script>


   <!-- Template-specific javascript -->
    

<script type="text/javascript">
    var dataLayer = dataLayer || [];

    dataLayer.language = "en";
    dataLayer.userID = "Anonymous";
    dataLayer.loginStatus = "not logged in";
    dataLayer.pageCategory = "recipes";
    dataLayer.pageTemplate = "RecipeCollection";
    dataLayer.device = kraft.viewportWidth < kraft.breakpoint ? 'mobile' : 'desktop';

    
        dataLayer.recipeCategoryFamily = "dessert: brownie-blondies";
        dataLayer.recipeCategoryParent = "dessert";
        dataLayer.recipeCategoryChild = "brownie-blondies";
    
</script>

	   <!-- signal code -->
  <script type="text/javascript" src="//s.btstatic.com/tag.js">
       { site: "KSNUeWE", mode: "sync" }
    </script>
    

    <!-- Load the JQuery library -->
      <!-- Experiment AB implementation -->
    <script>
        
        function getCookie(key) {
            var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
            return keyValue ? keyValue[2] : null;
        }
       function setCookie(key, value) {
            var expires = new Date();
            expires.setTime(expires.getTime() + (1 * 24 * 60 * 60 * 1000));
            document.cookie = key + '=' + value + ';path=/' + ';expires=' + expires.toUTCString();
       }
      
       function delete_cookie(name) {
           document.cookie = name +'=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
       }
      
    </script>
      
       <!-- Load the Content Experiment JavaScript API client for the experiment -->
        
         
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
         
              ga('create', 'UA-7760880-1', 'auto'); // This need to be dynamically populated from config for each env
                
        ga('send', 'pageview');

    </script>
             <!-- Script addition requested by Srini and okayed by Dan and Ben to 
                 Load Kraft.GA script to fire custom tracking -->
     <script src="//cdn-us-ec.yottaa.net/5637a31d312e585f7100086c/www.kraftrecipes.com/v~22.121/Assets/js/KraftGA.js?yocs=1V_1Y_25_&amp;yoloc=us" async="async"></script>

        
    <!-- End Google Analytics script -->

    
   
    <script src="//karma.mdpcdn.com/service/js-min/karma.header.js"></script>
   
    
<script type="text/javascript" src="//display.ugc.bazaarvoice.com/static/khcrm/en_US/bvapi.js"></script>     
     <script type="text/javascript" src="//cdn.nextopia.net/v1.5.1/7a1fdde83d7af719db1621c0ffc9cabb.js"></script>
    <link href="//cdn-us-ec.yottaa.net/5637a31d312e585f7100086c/www.kraftrecipes.com/v~22.121/assets/css/plugins/bringhtcove.coremetrics.plugin.css?yocs=1Y_&amp;yoloc=us" rel="stylesheet" />
    <!-- Script added by Naresh as part of "BackToTop" button implementation -->
    <script>
    $(document).ready(function() {
          $(window).scroll(function() {
	    if ( $(window).scrollTop() > 500) {
		    $('#return-to-top').fadeIn(500);  
        } else {
            $('#return-to-top').fadeOut(500);  
	    }
    });
    $('.return-to-top').click(function(event) {
    $('body,html').animate({scrollTop: 0}, 1000);
    });
    });
    </script>
<!-- LiveConnect tag for publishers -->
  <script type="text/javascript" src="//b-code.liadm.com/a-00nx.min.js" async="true" charset="utf-8"></script>
<!-- LiveConnect tag for publishers -->
    <!-- PinInterest BaseCode tag  -->
    <script type="text/javascript">
    !function(e){if(!window.pintrk){window.pintrk=function(){window.pintrk.queue.push(Array.prototype.slice.call(arguments))};var n=window.pintrk;n.queue=[],n.version="3.0";var t=document.createElement("script");t.async=!0,t.src=e;var r=document.getElementsByTagName("script")[0];r.parentNode.insertBefore(t,r)}}("https://s.pinimg.com/ct/core.js");
    pintrk('load','2615649022972');
    pintrk('page');
   </script>
   <noscript>
  <img height="1" width=""1"" style="display:none;" alt="" src="https://ct.pinterest.com/v3/?tid=2615649022972&noscript=1" />
  </noscript>
      <!-- PinInterest BaseCode tag  -->
     </head>
<body class="kraftrecipes"><!-- INSERT BY TRANSFORMER. SELECTOR=body,LOCATION=prepend --><script>
  Yo.sequence.node(document.body);
</script><!-- INSERT BY TRANSFORMER. SELECTOR=body,LOCATION=prepend --><script>
  Yo.sequence.createTimer(20);
</script>
   
    <!-- html code added by Naresh as part of BackToTop button implementation -->
    <a href="#" id="return-to-top" class="return-to-top" title="Return to Top"><em class="icon-chevron-up"></em><span>Top</span></a>
    <!-- Template-specific css -->
      
       
     
    <!-- facebook like button js -->
    <div id="fb-root"></div>
    <script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=130791333621603&version=v2.0";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
     
  
  <!-- End DMSUP-13717: CSS Skin -->  
    <form method="post" action="/recipes/dessert/brownie-blondies.aspx?gclsrc=ds" id="form1">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKLTc5MjUzNTYxOQ8WAh4TVmFsaWRhdGVSZXF1ZXN0TW9kZQIBFgICAxBkZBYEZg9kFgRmD2QWAmYPZBYCAgIPZBYCAgMPZBYCZg9kFgJmD2QWAgIFDw8WAh4HVmlzaWJsZWhkZAICD2QWAmYPDxYCHwFoZGQCAg9kFgJmD2QWAmYPZBYEAgMPZBYCZg9kFgJmD2QWBGYPEGRkFgBkAgEPEGRkFgBkAgcPZBYEZg9kFgJmD2QWAgIFDw8WAh8BaGRkAgIPZBYCZg9kFgICBQ8PFgIfAWhkZGTfD5W/qKgDsyLxkPA5uCEkqKrUWw==" />
</div>

<div class="aspNetHidden">

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="7F99C06E" />
</div>
       <input type="hidden" name="RBSLAPIURL" id="RBSLAPIURL" value="http://api.kraftapps.com/v1/RecipeBoxShoppingList/" " />
        <div class="bg-gradient"></div>
        <!-- header -->
        
<header id="topHeader">    

    <a id="header_0_acquisitionModal" href="#" rel="nofollow" class="acquisition-modal" data-modalurl="/EmailAcquisition" style="cursor:pointer;"></a>
    <div id="divHeaderTestAd" class="test-ad-leaderboard hidden-xs">
        
   </div>

    <div id="headerAd" class="ad-leaderboard hidden-xs">
      <div class="wrapper">
            
<div id="div-gpt-leaderboard-flex-1" data-tier="1"></div>

	        
	

<!--
alert('False');
alert('RecipeCategory');     
	alert('RecipeCollection'); 
alert('False'); -->
     
 


<!-- Time Rendered: 3/18/2018 7:00:23 PM -->
        </div>
    </div>
	<div class="main floater-active-sm floater-active-md floater-active-lg" id="topmainmenu">
		<div class="wrapper clearfix">
            

<div class="utility">
    <a href="http://www.comidakraft.com" rel="nofollow" class="new-window" target="_blank">
        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="13px" height="10px" viewbox="0 0 13 10" style="enable-background:new 0 0 13 10;" xml:space="preserve"><path class="st0" d="M2.6 4H1.5C1.2 4 1 4.2 1 4.5v4C1 8.8 1.2 9 1.5 9h6C7.8 9 8 8.8 8 8.5V7.4l1 0v1.1C9 9.3 8.3 10 7.5 10h-6 C0.7 10 0 9.3 0 8.5v-4C0 3.7 0.7 3 1.5 3h1.2L2.6 4z"/><path class="st0" d="M11.5 8h-8C2.7 8 2 7.3 2 6.5v-5C2 0.7 2.7 0 3.5 0h8C12.3 0 13 0.7 13 1.5v5C13 7.3 12.3 8 11.5 8 M3.5 1 C3.2 1 3 1.2 3 1.5v5C3 6.8 3.2 7 3.5 7h8C11.8 7 12 6.8 12 6.5v-5C12 1.2 11.8 1 11.5 1H3.5z"/></svg>
        <span>Comida Kraft</span>
    </a>
    <div class="divider dotted vertical"></div>
    
    <a href="http://www.kraftrecipes.com/recipes/recipe-box.aspx" rel="nofollow" class="recipe-box auth-link">
       <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="27.9px" height="24px" viewbox="0 0 27.9 24" style="enable-background:new 0 0 27.9 24;" xml:space="preserve"><path d="M2 3.9l1.3-3.5C3.4 0.2 3.6 0 3.9 0h8.8c0.2 0 0.4 0.1 0.5 0.3l0.5 1.2c0.1 0.2 0.3 0.3 0.5 0.3h10.6c0.3 0 0.5 0.2 0.6 0.4 l0.5 1.6c0.1 0.4-0.2 0.8-0.6 0.8H2.5C2.1 4.7 1.8 4.3 2 3.9 M27.9 7.8l-1.6 15.7c0 0.3-0.3 0.5-0.6 0.5H2.2c-0.3 0-0.6-0.2-0.6-0.5 L0 7.8c0-0.4 0.2-0.7 0.6-0.7h26.7C27.6 7.1 27.9 7.4 27.9 7.8 M19.3 16.9c0.8-0.7 1.2-1.8 1.2-2.9c0-2.2-1.7-3.9-3.8-3.9 c-0.9 0-1.8 0.3-2.4 0.9c-0.2 0.2-0.5 0.2-0.7 0c-0.7-0.6-1.5-0.9-2.4-0.9C9 10 7.3 11.8 7.3 14c0 1.2 0.5 2.2 1.2 2.9h0l4.1 4.3 c0.4 0.4 0.8 0.9 1.2 0.9s0.8-0.4 1.2-0.9L19.3 16.9L19.3 16.9z"/></svg>
        <span>Recipe Box</span>
    </a>
    <div class="divider dotted vertical"></div>
    <span class="welcome-profile">
         <a tabindex="0" class="username" data-toggle="popover" data-contentwrapper=".dropdown" data-html="true">
            <span></span>
            <div><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="15.9px" height="28.2px" viewbox="0 0 15.9 28.2" style="enable-background:new 0 0 15.9 28.2;" xml:space="preserve"><path class="st0" d="M0.3 1.2l0.9-0.9c0.4-0.4 0.9-0.4 1.3 0l13.2 13.2c0.4 0.4 0.4 0.9 0 1.3L2.5 27.9c-0.4 0.4-0.9 0.4-1.3 0 L0.3 27c-0.4-0.4-0.4-0.9 0-1.3l11-11c0.4-0.4 0.4-0.9 0-1.3l-11-11C-0.1 2.1-0.1 1.5 0.3 1.2"/></svg></div>
        </a>
        <div class="dropdown">
            <a href="http://www.kraftrecipes.com/recipes/shopping-lists.aspx" class="my-shopping-list">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="20px" height="25px" viewbox="0 0 20 25" style="enable-background:new 0 0 20 25;" xml:space="preserve"><path d="M14.5 5.9V0H0.6C0.3 0 0 0.3 0 0.6v23.8C0 24.7 0.3 25 0.6 25h18.8c0.3 0 0.6-0.3 0.6-0.6V5.9L14.5 5.9z M15.9 21.9 c0 0.1-0.1 0.2-0.2 0.2H4.3c-0.1 0-0.2-0.1-0.2-0.2v-1.4c0-0.1 0.1-0.2 0.2-0.2h11.4c0.1 0 0.2 0.1 0.2 0.2V21.9z M15.9 17.7 c0 0.1-0.1 0.2-0.2 0.2H4.3c-0.1 0-0.2-0.1-0.2-0.2v-1.5c0-0.1 0.1-0.2 0.2-0.2h11.4c0.1 0 0.2 0.1 0.2 0.2V17.7z M15.9 13.5 c0 0.1-0.1 0.2-0.2 0.2H4.3c-0.1 0-0.2-0.1-0.2-0.2V12c0-0.1 0.1-0.2 0.2-0.2h11.4c0.1 0 0.2 0.1 0.2 0.2V13.5z M15.7 0 c-0.1 0-0.2 0.1-0.2 0.2v4.2c0 0.3 0.2 0.5 0.5 0.5h3.9c0.1 0 0.2-0.1 0.2-0.2L15.7 0z"/></svg>
                <span>Shopping Lists</span>
            </a>
            <a href="http://www.kraftrecipes.com/account/view-user-account.aspx" class="my-profile">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="23px" height="25px" viewbox="0 0 23 25" style="enable-background:new 0 0 23 25;" xml:space="preserve"><path d="M1.2 23.9C2 24.6 3 25 4.4 25h14.3c1.3 0 2.4-0.4 3.2-1.1c0.8-0.8 1.2-1.8 1.2-3.1c0-0.6 0-1.1-0.1-1.7 c0-0.5-0.1-1.1-0.2-1.8s-0.3-1.2-0.4-1.8c-0.2-0.5-0.4-1.1-0.7-1.6c-0.3-0.5-0.6-1-1-1.3c-0.4-0.4-0.8-0.7-1.4-0.9 c-0.6-0.2-1.2-0.3-1.8-0.3c-0.1 0-0.3 0.1-0.7 0.4c-0.4 0.2-0.8 0.5-1.2 0.8c-0.5 0.3-1 0.5-1.8 0.8c-0.7 0.2-1.5 0.3-2.2 0.3 c-0.7 0-1.5-0.1-2.2-0.3c-0.7-0.2-1.3-0.5-1.8-0.8c-0.5-0.3-0.9-0.5-1.2-0.8c-0.4-0.2-0.6-0.4-0.7-0.4c-0.7 0-1.3 0.1-1.8 0.3 c-0.6 0.2-1 0.5-1.4 0.9c-0.4 0.4-0.7 0.8-1 1.3c-0.3 0.5-0.5 1-0.7 1.6c-0.2 0.5-0.3 1.1-0.4 1.8c-0.1 0.6-0.2 1.2-0.2 1.8 C0 19.6 0 20.2 0 20.8C0 22.1 0.4 23.1 1.2 23.9 M11.5 12.5c1.7 0 3.2-0.6 4.4-1.8c1.2-1.2 1.8-2.7 1.8-4.4c0-1.7-0.6-3.2-1.8-4.4 C14.7 0.6 13.2 0 11.5 0C9.8 0 8.3 0.6 7.1 1.8C5.8 3.1 5.2 4.5 5.2 6.2c0 1.7 0.6 3.2 1.8 4.4C8.3 11.9 9.8 12.5 11.5 12.5"/></svg>
                <span>My Account</span>
            </a>
            <a href="/_Handlers/SignOutHandler.ashx" class="sign-out">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="12px" height="10px" viewbox="0 0 12 10" style="enable-background:new 0 0 12 10;" xml:space="preserve"><path d="M11 0H8.8h-1H7.2C7 0 6.9 0.1 6.9 0.3v0.1c0 0.2 0.1 0.3 0.3 0.3h0.7h1h1.2c0.5 0 1 0.5 1 1v6.6c0 0.6-0.5 1-1 1H8.8 c0 0 0 0 0 0H7.2C7 9.3 6.9 9.4 6.9 9.6v0.1C6.9 9.8 7 10 7.2 10h0.1h1.5H11c0.5 0 1-0.5 1-1V1C12 0.5 11.5 0 11 0"/><path d="M9.3 4.7L5.2 0.6c-0.1-0.1-0.4-0.1-0.5 0l-1 1C3.6 1.8 3.6 2 3.7 2.2l1.7 1.7H0.6C0.3 3.9 0 4.2 0 4.5v1 c0 0.3 0.3 0.6 0.6 0.6h4.8L3.7 7.8c-0.1 0.1-0.1 0.4 0 0.5l1 1c0.1 0.1 0.4 0.1 0.5 0l4.1-4.1C9.4 5.2 9.4 5.1 9.4 5 C9.4 4.9 9.4 4.8 9.3 4.7"/></svg>
                <span>Sign Out</span>
            </a>        
        </div>
    </span>
    <span class="register-signin">
        <a href="#" rel="nofollow" class="sign-in" data-modalurl="http://www.kraftrecipes.com/account/sign-in.aspx">
            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="23px" height="25px" viewbox="0 0 23 25" style="enable-background:new 0 0 23 25;" xml:space="preserve"><path d="M1.2 23.9C2 24.6 3 25 4.4 25h14.3c1.3 0 2.4-0.4 3.2-1.1c0.8-0.8 1.2-1.8 1.2-3.1c0-0.6 0-1.1-0.1-1.7 c0-0.5-0.1-1.1-0.2-1.8s-0.3-1.2-0.4-1.8c-0.2-0.5-0.4-1.1-0.7-1.6c-0.3-0.5-0.6-1-1-1.3c-0.4-0.4-0.8-0.7-1.4-0.9 c-0.6-0.2-1.2-0.3-1.8-0.3c-0.1 0-0.3 0.1-0.7 0.4c-0.4 0.2-0.8 0.5-1.2 0.8c-0.5 0.3-1 0.5-1.8 0.8c-0.7 0.2-1.5 0.3-2.2 0.3 c-0.7 0-1.5-0.1-2.2-0.3c-0.7-0.2-1.3-0.5-1.8-0.8c-0.5-0.3-0.9-0.5-1.2-0.8c-0.4-0.2-0.6-0.4-0.7-0.4c-0.7 0-1.3 0.1-1.8 0.3 c-0.6 0.2-1 0.5-1.4 0.9c-0.4 0.4-0.7 0.8-1 1.3c-0.3 0.5-0.5 1-0.7 1.6c-0.2 0.5-0.3 1.1-0.4 1.8c-0.1 0.6-0.2 1.2-0.2 1.8 C0 19.6 0 20.2 0 20.8C0 22.1 0.4 23.1 1.2 23.9 M11.5 12.5c1.7 0 3.2-0.6 4.4-1.8c1.2-1.2 1.8-2.7 1.8-4.4c0-1.7-0.6-3.2-1.8-4.4 C14.7 0.6 13.2 0 11.5 0C9.8 0 8.3 0.6 7.1 1.8C5.8 3.1 5.2 4.5 5.2 6.2c0 1.7 0.6 3.2 1.8 4.4C8.3 11.9 9.8 12.5 11.5 12.5"/></svg>
        </a>
    </span>
    <script type="text/javascript">
        $(window).load(function () {
            facebookSignIn();
        });
    </script>
</div>

			<div class="shadowed">
				<div class="top-shadow"></div>
				<a class="mobile-nav-icon">
				   <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="39px" height="25px" viewbox="0 0 39 25" style="enable-background:new 0 0 39 25;" xml:space="preserve"><path d="M37.4 4.8H1.6C0.7 4.8 0 4.1 0 3.2V1.6C0 0.7 0.7 0 1.6 0h35.8C38.3 0 39 0.7 39 1.6v1.6C39 4.1 38.3 4.8 37.4 4.8"/><path d="M37.4 14.9H1.6c-0.9 0-1.6-0.7-1.6-1.6v-1.6c0-0.9 0.7-1.6 1.6-1.6h35.8c0.9 0 1.6 0.7 1.6 1.6v1.6 C39 14.2 38.3 14.9 37.4 14.9"/><path d="M37.4 25H1.6C0.7 25 0 24.3 0 23.4v-1.6c0-0.9 0.7-1.6 1.6-1.6h35.8c0.9 0 1.6 0.7 1.6 1.6v1.6C39 24.3 38.3 25 37.4 25"/></svg>
				</a>
                
				<a href="/" class="kraft-logo">
					<img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="" data-yo-delayType="lazy" data-yo-src="//cdn-us-ec.yottaa.net/5637a31d312e585f7100086c/www.kraftrecipes.com/v~22.121/Assets/images/Kraft_FamilyGreatly_Lockup_Small_NO_BKGRND-117x68.png?yocs=1V_1Y_2b_&amp;yoloc=us">
					
				</a>

				


<nav role="navigation">
    <ul class="nav"> 
        
        <li class="active dropdown full">
            <a href='/recipes.aspx' >Recipes<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="15.9px" height="28.2px" viewbox="0 0 15.9 28.2" style="enable-background:new 0 0 15.9 28.2;" xml:space="preserve"><path class="st0" d="M0.3 1.2l0.9-0.9c0.4-0.4 0.9-0.4 1.3 0l13.2 13.2c0.4 0.4 0.4 0.9 0 1.3L2.5 27.9c-0.4 0.4-0.9 0.4-1.3 0 L0.3 27c-0.4-0.4-0.4-0.9 0-1.3l11-11c0.4-0.4 0.4-0.9 0-1.3l-11-11C-0.1 2.1-0.1 1.5 0.3 1.2"/></svg></a>
            
            

            <ul class="dropdown-menu">
            
               <li>
                    <div class="title-row row">
                        <ul>
                            
                            <li>
                                <p><strong>Meal Type</strong></p>
                                <div class="divider dotted"></div>
                            </li>
                            
                            <li>
                                <p><strong>Holidays</strong></p>
                                <div class="divider dotted"></div>
                            </li>
                            
                            <li>
                                <p><strong>Featured Videos</strong></p>
                                <div class="divider dotted"></div>
                            </li>
                            
                            <li>
                                <p><strong>Collections</strong></p>
                                <div class="divider dotted"></div>
                            </li>
                            
                            <li>
                                <p><strong>Featured Content</strong></p>
                                <div class="divider dotted"></div>
                            </li>
                            
                        </ul>
                    </div>
                    <div class="link-row row">
                        
                        <ul>
                            
                            <li>
                                <a href='/recipes/dinner.aspx' >Dinner</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/dessert.aspx' title='Dessert' >Dessert</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/appetizers.aspx' >Appetizers</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/dinner/side-dishes.aspx' >Side Dishes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/lunch-ideas.aspx' >Lunch Ideas</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/healthy-living.aspx' >Healthy Living Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/ethnic-cuisine.aspx' >Ethnic Cuisine</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/beverages.aspx' >Beverages</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/breakfast-and-brunch.aspx' >Breakfast & Brunch</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/comfort-food.aspx' >Comfort Food</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/dinner/new-recipes.aspx' >New Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/budget.aspx' >Budget Recipes</a>
                            </li>
                            
                        </ul>  
                        <div class="divider dotted vertical"></div>  
                        
                        <ul>
                            
                            <li>
                                <a href='/recipes/holidays-and-entertaining/holidays/lent.aspx' >Lent</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/holidays-and-entertaining/holidays/st-patricks-day.aspx' >St. Patrick's Day</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/holidays-and-entertaining/holidays/easter.aspx' >Easter</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/holidays-and-entertaining/holidays/april-fools-recipes.aspx' >April Fool's Day</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/holidays-and-entertaining/holidays/passover/passoverrecipes.aspx' >Passover</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/holidays-and-entertaining/holidays/earth-day-recipes.aspx' >Earth Day</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/holidays-and-entertaining/holidays/cincodemayo.aspx' >Cinco de Mayo</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/holidays-and-entertaining/entertaining/potluck-menu-ideas.aspx' >Potluck Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/holidays-and-entertaining/entertaining/baby-bridal-shower-recipes.aspx' >Baby & Bridal Shower Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/yourkids/birthdayparties/birthdaybest.aspx' >Birthday Parties</a>
                            </li>
                            
                        </ul>  
                        <div class="divider dotted vertical"></div>  
                        
                        <ul>
                            
                            <li>
                                <a href='/cooking-tips/cooking-videos/dinner-videos.aspx' >Dinner Videos</a>
                            </li>
                            
                            <li>
                                <a href='/cooking-tips/cooking-videos/desserts-videos.aspx' >Dessert Videos</a>
                            </li>
                            
                            <li>
                                <a href='/cooking-tips/cooking-videos/cheesecake-videos.aspx' >Cheesecake Videos</a>
                            </li>
                            
                            <li>
                                <a href='/cooking-tips/cooking-videos/cookie-videos.aspx' >Cookie and Candy Videos</a>
                            </li>
                            
                            <li>
                                <a href='/cooking-tips/cooking-videos/appetizers-sides-videos.aspx' >Appetizer Videos</a>
                            </li>
                            
                            <li>
                                <a href='/cooking-tips/cooking-videos/holiday-videos.aspx' >Holiday Videos</a>
                            </li>
                            
                            <li>
                                <a href='/cooking-tips/cooking-videos/bbq-videos.aspx' >BBQ Videos</a>
                            </li>
                            
                            <li>
                                <a href='/cooking-tips/cooking-videos/breakfast-videos.aspx' >Breakfast Videos</a>
                            </li>
                            
                            <li>
                                <a href='/cooking-tips/cooking-videos/kitchen-basics-videos.aspx' >Kitchen Basics Videos</a>
                            </li>
                            
                            <li>
                                <a href='/cooking-tips/cooking-videos/reynolds-meal-magic-videos.aspx' title='Reynolds® Meal Magic Videos' >Reynolds<sup>®</sup> Meal Magic Videos</a>
                            </li>
                            
                        </ul>  
                        <div class="divider dotted vertical"></div>  
                        
                        <ul>
                            
                            <li>
                                <a href='/tips-ideas/holiday-list-ideas/top-ten-traditional-irish-recipes.aspx' >Top Irish Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/tips-ideas/holiday-list-ideas/11-fruit-pancake-recipes.aspx' >Fruit Pancake Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/tips-ideas/holiday-list-ideas/best-recipes-2017.aspx' >Best Recipes of 2017</a>
                            </li>
                            
                            <li>
                                <a href='/tips-ideas/holiday-list-ideas/refined-refreshments-for-tv-streaming-marathons.aspx' >TV Streaming Marathon Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/dinner/planning/slow-cooker-recipes.aspx' >Slow-Cooker Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/beverages/smoothies.aspx' >Smoothie Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/dinner/chicken-recipes/best-chicken-recipes.aspx' >Chicken Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/dinner/side-dishes/side-salads.aspx' >Salad Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/dinner/easy-dinner-recipes.aspx' >Easy Dinner Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/dinner/lasagna.aspx' >Lasagna Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/dinner/casserole-recipes.aspx' >Casserole Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/healthy-living/healthy-living-recipes.aspx' >Top Healthy Living Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/dinner/seafood/fish-shellfish.aspx' >Fish and Seafood Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/tips-ideas/holiday-list-ideas/30-minute-recipes.aspx' >30-Minute Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/dinner/reynolds-meal-magic.aspx' >REYNOLDS<sup>®</sup> Meal Magic</a>
                            </li>
                            
                        </ul>  
                        <div class="divider dotted vertical"></div>  
                        
                        <ul>
                            
                            <li>
                                <a href='/recipes/budget.aspx' >Budget Recipes</a>
                            </li>
                            
                            <li>
                                <a href='http://www.kraftrecipes.com/blog' target='_blank' title='Kraft Blog' >Kraft Blog</a>
                            </li>
                            
                            <li>
                                <a href='/promotions/kraftpromotions.aspx' title='Promotions' >Promotions</a>
                            </li>
                            
                            <li>
                                <a href='/twistthatdish.aspx' >Twist That Dish</a>
                            </li>
                            
                            <li>
                                <a href='/tips-ideas/holiday-list-ideas/spring-vegetables.aspx' >Spring Vegetable Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/dinner/skillet-sensations.aspx' >Skillet Dinner Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/dinner/ground-beef-recipes.aspx' >Ground Beef Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/dinner/side-dishes/potato-sides/scalloped-potato.aspx' >Scalloped Potato Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/dessert/brownie-recipes.aspx' >Brownie Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/dessert/jello-recipes-center.aspx' >JELL-O Recipe Center</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/dinner/chicken-recipes/casseroles.aspx' >Chicken Casserole Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/breakfast-and-brunch/egg-bakes-egg-casseroles.aspx' >Cheesy Egg Bakes</a>
                            </li>
                            
                            <li>
                                <a href='/tips-ideas/holiday-list-ideas/best-vegetarian-recipes-for-meat-lovers.aspx' >Vegetarian Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/tips-ideas/holiday-list-ideas/13-freezer-friendly-recipes.aspx' >Freezer-Friendly Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/breakfast-and-brunch/brunch-recipes.aspx' >Brunch Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/dessert/cheesecake-center/cheesecake-guide.aspx' >Cheesecake Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/dessert/chocolate-center/chocolate-center.aspx' >Chocolate Recipes</a>
                            </li>
                            
                        </ul>  
                        <div class="divider dotted vertical"></div>  
                                
                    </div>
                    <div class="view-all-row row">
                        <ul>
                            
                                   <li>
                                        <a href='/recipes.aspx' class='view-all-link forward' ><span class="circle-container"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="18.2px" height="30.5px" viewbox="0 0 18.2 30.5" style="enable-background:new 0 0 18.2 30.5;" xml:space="preserve"><path class="st0" d="M17.8 2.4l-1.9-1.9c-0.4-0.4-0.9-0.4-1.3 0L0.4 14.6c-0.4 0.4-0.4 0.9 0 1.3l14.2 14.2c0.4 0.4 0.9 0.4 1.3 0 l1.9-1.9c0.4-0.4 0.4-0.9 0-1.3l-11-11c-0.4-0.4-0.4-0.9 0-1.3l11-11C18.2 3.3 18.2 2.7 17.8 2.4"/></svg></span>View All Recipes</a>
                                   </li>
                            
                                   <li>
                                        <a href='/recipes/holidays-and-entertaining.aspx' class='view-all-link forward' ><span class="circle-container"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="18.2px" height="30.5px" viewbox="0 0 18.2 30.5" style="enable-background:new 0 0 18.2 30.5;" xml:space="preserve"><path class="st0" d="M17.8 2.4l-1.9-1.9c-0.4-0.4-0.9-0.4-1.3 0L0.4 14.6c-0.4 0.4-0.4 0.9 0 1.3l14.2 14.2c0.4 0.4 0.9 0.4 1.3 0 l1.9-1.9c0.4-0.4 0.4-0.9 0-1.3l-11-11c-0.4-0.4-0.4-0.9 0-1.3l11-11C18.2 3.3 18.2 2.7 17.8 2.4"/></svg></span>View All Holidays</a>
                                   </li>
                            
                                   <li>
                                        <a href='/cooking-tips/cooking-videos.aspx' class='view-all-link forward' ><span class="circle-container"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="18.2px" height="30.5px" viewbox="0 0 18.2 30.5" style="enable-background:new 0 0 18.2 30.5;" xml:space="preserve"><path class="st0" d="M17.8 2.4l-1.9-1.9c-0.4-0.4-0.9-0.4-1.3 0L0.4 14.6c-0.4 0.4-0.4 0.9 0 1.3l14.2 14.2c0.4 0.4 0.9 0.4 1.3 0 l1.9-1.9c0.4-0.4 0.4-0.9 0-1.3l-11-11c-0.4-0.4-0.4-0.9 0-1.3l11-11C18.2 3.3 18.2 2.7 17.8 2.4"/></svg></span>View All Featured Videos</a>
                                   </li>
                            
                                   <li>
                                        <a href='/recipes.aspx' class='view-all-link forward' ><span class="circle-container"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="18.2px" height="30.5px" viewbox="0 0 18.2 30.5" style="enable-background:new 0 0 18.2 30.5;" xml:space="preserve"><path class="st0" d="M17.8 2.4l-1.9-1.9c-0.4-0.4-0.9-0.4-1.3 0L0.4 14.6c-0.4 0.4-0.4 0.9 0 1.3l14.2 14.2c0.4 0.4 0.9 0.4 1.3 0 l1.9-1.9c0.4-0.4 0.4-0.9 0-1.3l-11-11c-0.4-0.4-0.4-0.9 0-1.3l11-11C18.2 3.3 18.2 2.7 17.8 2.4"/></svg></span>View All Collections</a>
                                   </li>
                            
                                   <li>
                                        
                                   </li>
                            
                        </ul>
                    </div>
                </li>
                
            </ul>
        </li> 
        
        <li class=" dropdown left">
            <a href='/products/productmain.aspx' >Products<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="15.9px" height="28.2px" viewbox="0 0 15.9 28.2" style="enable-background:new 0 0 15.9 28.2;" xml:space="preserve"><path class="st0" d="M0.3 1.2l0.9-0.9c0.4-0.4 0.9-0.4 1.3 0l13.2 13.2c0.4 0.4 0.4 0.9 0 1.3L2.5 27.9c-0.4 0.4-0.9 0.4-1.3 0 L0.3 27c-0.4-0.4-0.4-0.9 0-1.3l11-11c0.4-0.4 0.4-0.9 0-1.3l-11-11C-0.1 2.1-0.1 1.5 0.3 1.2"/></svg></a>
            
            

            <ul class="dropdown-menu">
            
               <li>
                    <div class="title-row row">
                        <ul>
                            
                            <li>
                                <p><strong>Featured Brand Sites</strong></p>
                                <div class="divider dotted"></div>
                            </li>
                            
                            <li>
                                <p><strong>Product By Category</strong></p>
                                <div class="divider dotted"></div>
                            </li>
                            
                            <li>
                                <p><strong>Tools & Info</strong></p>
                                <div class="divider dotted"></div>
                            </li>
                            
                        </ul>
                    </div>
                    <div class="link-row row">
                        
                        <ul>
                            
                            <li>
                                <a href='/products/a1.aspx' >A.1.</a>
                            </li>
                            
                            <li>
                                <a href='/products/bakers-chocolate.aspx' >BAKER'S Chocolate</a>
                            </li>
                            
                            <li>
                                <a href='/claussen.aspx' title='CLAUSSEN Pickles' >CLAUSSEN Pickles</a>
                            </li>
                            
                            <li>
                                <a href='/coolwhip.aspx' title='COOL WHIP' >COOL WHIP</a>
                            </li>
                            
                            <li>
                                <a href='http://www.heinzbbq.com/' target='_blank' >Heinz BBQ Sauce</a>
                            </li>
                            
                            <li>
                                <a href='/kraft-jello.aspx' title='JELL-O' >JELL-O</a>
                            </li>
                            
                            <li>
                                <a href='/products/jet-puffed.aspx' title='JET-PUFFED' >JET-PUFFED</a>
                            </li>
                            
                            <li>
                                <a href='/kraft-barbecue-sauce.aspx' >KRAFT Barbecue Sauce</a>
                            </li>
                            
                            <li>
                                <a href='/caramels.aspx' title='KRAFT Caramels' >KRAFT Caramels</a>
                            </li>
                            
                            <li>
                                <a href='/kraft-dressing.aspx' title='KRAFT Dressing' >KRAFT Dressing</a>
                            </li>
                            
                            <li>
                                <a href='/kraftcheese/parm.aspx' title='KRAFT Grated Parmesan' >KRAFT Grated Parmesan</a>
                            </li>
                            
                            <li>
                                <a href='/kraftcheese/kraft-natural-cheese.aspx' title='KRAFT Natural Cheese' >KRAFT Natural Cheese</a>
                            </li>
                            
                            <li>
                                <a href='/kraftcheese/kraft-singles.aspx' title='KRAFT Singles' >KRAFT Singles</a>
                            </li>
                            
                            <li>
                                <a href='/products/shake-n-bake.aspx' >KRAFT Shake ‘n Bake</a>
                            </li>
                            
                            <li>
                                <a href='/maxwell-house.aspx' title='Maxwell House' >Maxwell House</a>
                            </li>
                            
                            <li>
                                <a href='/products/miracle-whip.aspx' title='MIRACLE WHIP Dressing' >MIRACLE WHIP Dressing</a>
                            </li>
                            
                            <li>
                                <a href='/oreida.aspx' title='ORE-IDA' >ORE-IDA</a>
                            </li>
                            
                            <li>
                                <a href='http://www.oscarmayer.com' target='_blank' >Oscar Mayer</a>
                            </li>
                            
                            <li>
                                <a href='/philadelphia.aspx' title='PHILADELPHIA Cream Cheese' >PHILADELPHIA Cream Cheese</a>
                            </li>
                            
                            <li>
                                <a href='/stovetop.aspx' title='Miracle Whip' >STOVE TOP</a>
                            </li>
                            
                            <li>
                                <a href='/sure-jell.aspx' title='SURE-JELL' >SURE-JELL</a>
                            </li>
                            
                            <li>
                                <a href='/velveeta.aspx' title='VELVEETA' >VELVEETA</a>
                            </li>
                            
                        </ul>  
                        <div class="divider dotted vertical"></div>  
                        
                        <ul>
                            
                            <li>
                                <a href='/products/category/baking-desserts-290.aspx' >Baking &amp; Desserts</a>
                            </li>
                            
                            <li>
                                <a href='/products/category/cheese-dairy-361.aspx' >Cheese & Dairy</a>
                            </li>
                            
                            <li>
                                <a href='/products/category/drinks-606.aspx' >Drinks</a>
                            </li>
                            
                            <li>
                                <a href='/products/category/meats-meat-alternatives-230.aspx' >Meat & Meat Alternatives</a>
                            </li>
                            
                            <li>
                                <a href='/products/category/sauces-condiments-3.aspx' >Sauces & Condiments</a>
                            </li>
                            
                            <li>
                                <a href='/products/category/snacks-511.aspx' >Snacks</a>
                            </li>
                            
                            <li>
                                <a href='/products/category/packaged-meals-helpers-197.aspx' >Packaged Meals </a>
                            </li>
                            
                        </ul>  
                        <div class="divider dotted vertical"></div>  
                        
                        <ul>
                            
                            <li>
                                <a href='/products/productlocator.aspx' >Product Locator</a>
                            </li>
                            
                            <li>
                                <a href='/products/kraftbrands/kraftbrands.aspx' >Kraft Brands</a>
                            </li>
                            
                            <li>
                                <a href='/products/whatsnewlatestandfavorites.aspx' title='What's New' >What's New</a>
                            </li>
                            
                        </ul>  
                        <div class="divider dotted vertical"></div>  
                                
                    </div>
                    <div class="view-all-row row">
                        <ul>
                            
                                   <li>
                                        <a href='/products/productmain.aspx' class='view-all-link forward' ><span class="circle-container"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="18.2px" height="30.5px" viewbox="0 0 18.2 30.5" style="enable-background:new 0 0 18.2 30.5;" xml:space="preserve"><path class="st0" d="M17.8 2.4l-1.9-1.9c-0.4-0.4-0.9-0.4-1.3 0L0.4 14.6c-0.4 0.4-0.4 0.9 0 1.3l14.2 14.2c0.4 0.4 0.9 0.4 1.3 0 l1.9-1.9c0.4-0.4 0.4-0.9 0-1.3l-11-11c-0.4-0.4-0.4-0.9 0-1.3l11-11C18.2 3.3 18.2 2.7 17.8 2.4"/></svg></span>View All Products</a>
                                   </li>
                            
                                   <li>
                                        <a href='/products/productmain.aspx' class='view-all-link forward' ><span class="circle-container"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="18.2px" height="30.5px" viewbox="0 0 18.2 30.5" style="enable-background:new 0 0 18.2 30.5;" xml:space="preserve"><path class="st0" d="M17.8 2.4l-1.9-1.9c-0.4-0.4-0.9-0.4-1.3 0L0.4 14.6c-0.4 0.4-0.4 0.9 0 1.3l14.2 14.2c0.4 0.4 0.9 0.4 1.3 0 l1.9-1.9c0.4-0.4 0.4-0.9 0-1.3l-11-11c-0.4-0.4-0.4-0.9 0-1.3l11-11C18.2 3.3 18.2 2.7 17.8 2.4"/></svg></span>View All Products</a>
                                   </li>
                            
                                   <li>
                                        
                                   </li>
                            
                        </ul>
                    </div>
                </li>
                
            </ul>
        </li> 
        
        <li class=" dropdown full">
            <a href='/tips-ideas.aspx' >Tips & Ideas<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="15.9px" height="28.2px" viewbox="0 0 15.9 28.2" style="enable-background:new 0 0 15.9 28.2;" xml:space="preserve"><path class="st0" d="M0.3 1.2l0.9-0.9c0.4-0.4 0.9-0.4 1.3 0l13.2 13.2c0.4 0.4 0.4 0.9 0 1.3L2.5 27.9c-0.4 0.4-0.9 0.4-1.3 0 L0.3 27c-0.4-0.4-0.4-0.9 0-1.3l11-11c0.4-0.4 0.4-0.9 0-1.3l-11-11C-0.1 2.1-0.1 1.5 0.3 1.2"/></svg></a>
            
            

            <ul class="dropdown-menu">
            
               <li>
                    <div class="title-row row">
                        <ul>
                            
                            <li>
                                <p><strong>Cooking Tips</strong></p>
                                <div class="divider dotted"></div>
                            </li>
                            
                            <li>
                                <p><strong>Healthy Living</strong></p>
                                <div class="divider dotted"></div>
                            </li>
                            
                            <li>
                                <p><strong>Your Kids</strong></p>
                                <div class="divider dotted"></div>
                            </li>
                            
                            <li>
                                <p><strong>Recipe Ideas</strong></p>
                                <div class="divider dotted"></div>
                            </li>
                            
                            <li>
                                <p><strong>Entertaining</strong></p>
                                <div class="divider dotted"></div>
                            </li>
                            
                        </ul>
                    </div>
                    <div class="link-row row">
                        
                        <ul>
                            
                            <li>
                                <a href='/cooking-tips/cooking-videos.aspx' >Cooking Videos</a>
                            </li>
                            
                            <li>
                                <a href='/cooking-tips/how-to.aspx' >How To Tips</a>
                            </li>
                            
                            <li>
                                <a href='/cooking-tips/foodbasics/pastaguide.aspx' >Pasta Guide</a>
                            </li>
                            
                            <li>
                                <a href='/cooking-tips/chartsguides.aspx' >Charts & Guides</a>
                            </li>
                            
                            <li>
                                <a href='/cooking-tips/cooking-techniques.aspx' >Cooking Techniques</a>
                            </li>
                            
                            <li>
                                <a href='/cooking-tips/foodbasics/seasonalproduce/winter/whats-in-season-winter.aspx' >Seasonal Produce</a>
                            </li>
                            
                            <li>
                                <a href='/cooking-tips/foodbasics/herb-guide.aspx' >Herb Guide</a>
                            </li>
                            
                        </ul>  
                        <div class="divider dotted vertical"></div>  
                        
                        <ul>
                            
                            <li>
                                <a href='/nutrition' >Nutrition and You</a>
                            </li>
                            
                            <li>
                                <a href='/healthy-living-ideas/diabetes-center.aspx' title='Diabetes Center' >Diabetes Center</a>
                            </li>
                            
                            <li>
                                <a href='/healthy-living-ideas/articles/food-safety.aspx' >Food Safety</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/healthy-living/gluten-aware-recipes.aspx' title='Gluten Aware Recipes' >Gluten-Aware Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/healthy-living/healthy-living-recipes.aspx' >Top Healthy Living Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/healthy-living/smart-suppers.aspx' >Healthy Living Dinner Recipes </a>
                            </li>
                            
                            <li>
                                <a href='/recipes/healthy-living/low-fat-recipes.aspx' >Low-Fat Recipes</a>
                            </li>
                            
                        </ul>  
                        <div class="divider dotted vertical"></div>  
                        
                        <ul>
                            
                            <li>
                                <a href='/recipes/kid-friendly/get-going-breakfasts.aspx' >Breakfast Ideas</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/kid-friendly/picky-eater-recipes.aspx' >Picky Eater Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/kid-friendly/lunch.aspx' >Kid-Friendly Lunches</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/kid-friendly/quick-fix-dinner.aspx' >Quick-Fix Dinners</a>
                            </li>
                            
                            <li>
                                <a href='/yourkids/kids-can-cook.aspx' >Kids Can Cook</a>
                            </li>
                            
                            <li>
                                <a href='/yourkids/kids-nutrition.aspx' >Kids Nutrition</a>
                            </li>
                            
                            <li>
                                <a href='/yourkids/kids-videos.aspx' >Kids Videos</a>
                            </li>
                            
                        </ul>  
                        <div class="divider dotted vertical"></div>  
                        
                        <ul>
                            
                            <li>
                                <a href='/tips-ideas/holiday-list-ideas/top-ten-traditional-irish-recipes.aspx' >Top Irish Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/tips-ideas/holiday-list-ideas/easter-dinner-menu-ideas.aspx' >Easter Dinner Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/tips-ideas/holiday-list-ideas/9-easter-brunch-friendly-philadelphia-cream-cheese-desserts.aspx' >Easter Brunch-Friendly Desserts </a>
                            </li>
                            
                            <li>
                                <a href='/tips-ideas/holiday-list-ideas/spring-vegetables.aspx' >Spring Vegetable Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/tips-ideas/holiday-list-ideas/one-pan-recipes.aspx' >One-Pan Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/tips-ideas/holiday-list-ideas/best-slow-cooker-recipes-for-cold-days.aspx' >Best Slow-Cooker Recipes</a>
                            </li>
                            
                            <li>
                                <a href='/tips-ideas/holiday-list-ideas/13-freezer-friendly-recipes.aspx' >Freezer-Friendly Recipes</a>
                            </li>
                            
                        </ul>  
                        <div class="divider dotted vertical"></div>  
                        
                        <ul>
                            
                            <li>
                                <a href='/yourkids/birthdayparties.aspx' >Birthday Parties</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/menus/parties.aspx' >Party Menus</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/holidays-and-entertaining/entertaining/potluck-menu-ideas.aspx' >Potluck Ideas</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/holidays-and-entertaining/planning/beverage-math.aspx' >Party Planning</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/holidays-and-entertaining/planning/appetizer-math.aspx' >Appetizer Math</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/holidays-and-entertaining/planning/easy-meat-math.aspx' >Easy Meat Math</a>
                            </li>
                            
                            <li>
                                <a href='/recipes/holidays-and-entertaining/planning/wine-cheese-math.aspx' >Wine & Cheese Math</a>
                            </li>
                            
                        </ul>  
                        <div class="divider dotted vertical"></div>  
                                
                    </div>
                    <div class="view-all-row row">
                        <ul>
                            
                                   <li>
                                        <a href='/cooking-tips.aspx' class='view-all-link forward' ><span class="circle-container"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="18.2px" height="30.5px" viewbox="0 0 18.2 30.5" style="enable-background:new 0 0 18.2 30.5;" xml:space="preserve"><path class="st0" d="M17.8 2.4l-1.9-1.9c-0.4-0.4-0.9-0.4-1.3 0L0.4 14.6c-0.4 0.4-0.4 0.9 0 1.3l14.2 14.2c0.4 0.4 0.9 0.4 1.3 0 l1.9-1.9c0.4-0.4 0.4-0.9 0-1.3l-11-11c-0.4-0.4-0.4-0.9 0-1.3l11-11C18.2 3.3 18.2 2.7 17.8 2.4"/></svg></span>View Cooking Tips</a>
                                   </li>
                            
                                   <li>
                                        <a href='/recipes/healthy-living.aspx' class='view-all-link forward' ><span class="circle-container"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="18.2px" height="30.5px" viewbox="0 0 18.2 30.5" style="enable-background:new 0 0 18.2 30.5;" xml:space="preserve"><path class="st0" d="M17.8 2.4l-1.9-1.9c-0.4-0.4-0.9-0.4-1.3 0L0.4 14.6c-0.4 0.4-0.4 0.9 0 1.3l14.2 14.2c0.4 0.4 0.9 0.4 1.3 0 l1.9-1.9c0.4-0.4 0.4-0.9 0-1.3l-11-11c-0.4-0.4-0.4-0.9 0-1.3l11-11C18.2 3.3 18.2 2.7 17.8 2.4"/></svg></span>View Healthy Living</a>
                                   </li>
                            
                                   <li>
                                        <a href='/yourkids.aspx' class='view-all-link forward' ><span class="circle-container"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="18.2px" height="30.5px" viewbox="0 0 18.2 30.5" style="enable-background:new 0 0 18.2 30.5;" xml:space="preserve"><path class="st0" d="M17.8 2.4l-1.9-1.9c-0.4-0.4-0.9-0.4-1.3 0L0.4 14.6c-0.4 0.4-0.4 0.9 0 1.3l14.2 14.2c0.4 0.4 0.9 0.4 1.3 0 l1.9-1.9c0.4-0.4 0.4-0.9 0-1.3l-11-11c-0.4-0.4-0.4-0.9 0-1.3l11-11C18.2 3.3 18.2 2.7 17.8 2.4"/></svg></span>View Your Kids</a>
                                   </li>
                            
                                   <li>
                                        <a href='/tips-ideas/holiday-list-ideas.aspx' class='view-all-link forward' ><span class="circle-container"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="18.2px" height="30.5px" viewbox="0 0 18.2 30.5" style="enable-background:new 0 0 18.2 30.5;" xml:space="preserve"><path class="st0" d="M17.8 2.4l-1.9-1.9c-0.4-0.4-0.9-0.4-1.3 0L0.4 14.6c-0.4 0.4-0.4 0.9 0 1.3l14.2 14.2c0.4 0.4 0.9 0.4 1.3 0 l1.9-1.9c0.4-0.4 0.4-0.9 0-1.3l-11-11c-0.4-0.4-0.4-0.9 0-1.3l11-11C18.2 3.3 18.2 2.7 17.8 2.4"/></svg></span>View Recipe Ideas</a>
                                   </li>
                            
                                   <li>
                                        <a href='/recipes/holidays-and-entertaining/entertaining.aspx' class='view-all-link forward' ><span class="circle-container"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="18.2px" height="30.5px" viewbox="0 0 18.2 30.5" style="enable-background:new 0 0 18.2 30.5;" xml:space="preserve"><path class="st0" d="M17.8 2.4l-1.9-1.9c-0.4-0.4-0.9-0.4-1.3 0L0.4 14.6c-0.4 0.4-0.4 0.9 0 1.3l14.2 14.2c0.4 0.4 0.9 0.4 1.3 0 l1.9-1.9c0.4-0.4 0.4-0.9 0-1.3l-11-11c-0.4-0.4-0.4-0.9 0-1.3l11-11C18.2 3.3 18.2 2.7 17.8 2.4"/></svg></span>View Entertaining</a>
                                   </li>
                            
                        </ul>
                    </div>
                </li>
                
            </ul>
        </li> 
        
        <li class="  5">
            <a href='/coupons/printable-coupons.aspx' title='Coupons' >Coupons<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="15.9px" height="28.2px" viewbox="0 0 15.9 28.2" style="enable-background:new 0 0 15.9 28.2;" xml:space="preserve"><path class="st0" d="M0.3 1.2l0.9-0.9c0.4-0.4 0.9-0.4 1.3 0l13.2 13.2c0.4 0.4 0.4 0.9 0 1.3L2.5 27.9c-0.4 0.4-0.9 0.4-1.3 0 L0.3 27c-0.4-0.4-0.4-0.9 0-1.3l11-11c0.4-0.4 0.4-0.9 0-1.3l-11-11C-0.1 2.1-0.1 1.5 0.3 1.2"/></svg></a>
            
            
        <li class=" dropdown left">
            <a href='https://w1.buysub.com/servlet/OrdersGateway?cds_mag_code=KFF&amp;cds_page_id=60672&amp;cds_response_key=I168KFTGB' target='_blank' title='Subscribe' >Subscribe<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="15.9px" height="28.2px" viewbox="0 0 15.9 28.2" style="enable-background:new 0 0 15.9 28.2;" xml:space="preserve"><path class="st0" d="M0.3 1.2l0.9-0.9c0.4-0.4 0.9-0.4 1.3 0l13.2 13.2c0.4 0.4 0.4 0.9 0 1.3L2.5 27.9c-0.4 0.4-0.9 0.4-1.3 0 L0.3 27c-0.4-0.4-0.4-0.9 0-1.3l11-11c0.4-0.4 0.4-0.9 0-1.3l-11-11C-0.1 2.1-0.1 1.5 0.3 1.2"/></svg></a>
            
            

            <ul class="dropdown-menu">
            
               <li>
                    <div class="title-row row">
                        <ul>
                            
                            <li>
                                <p><strong>Email</strong></p>
                                <div class="divider dotted"></div>
                            </li>
                            
                            <li>
                                <p><strong><span style="letter-spacing:-0.9px"><em>food&family</em> Magazine</span></strong></p>
                                <div class="divider dotted"></div>
                            </li>
                            
                        </ul>
                    </div>
                    <div class="link-row row">
                        
                        <ul>
                            
                            <li>
                                <a href='/registration/rbe.aspx' title='Recipes By Email' >Recipes By Email</a>
                            </li>
                            
                            <li>
                                <a href='/registration/mtd.aspx' title='Make Tonight Delicious' >Make Tonight Delicious</a>
                            </li>
                            
                            <li>
                                <a href='/registration/rbe.aspx' title='Coupons' >Coupons</a>
                            </li>
                            
                        </ul>  
                        <div class="divider dotted vertical"></div>  
                        
                        <ul>
                            
                            <li>
                                <a href='/foodfamilyarchive.aspx' title='food&family Magazine' ><em>food&family</em> Magazine</a>
                            </li>
                            
                            <li>
                                <a href='/foodfamilyarchive/magarchive.aspx' title='food&family Magazine Archive' ><em>food&family</em> Magazine Archive</a>
                            </li>
                            
                            <li>
                                <a href='https://w1.buysub.com/pubs/MR/KFF/Login.jsp?cds_page_id=61315&amp;cds_mag_code=KFF&amp;id=1489676322248&amp;lsid=70750957589020562&amp;vid=2' target='_blank' >Manage <em>food&family</em> subscription</a>
                            </li>
                            
                        </ul>  
                        <div class="divider dotted vertical"></div>  
                                
                    </div>
                    <div class="view-all-row row">
                        <ul>
                            
                                   <li>
                                        
                                   </li>
                            
                                   <li>
                                        
                                   </li>
                            
                        </ul>
                    </div>
                </li>
                
            </ul>
        </li> 
        
    </ul>
</nav>
<!-- Time Rendered: 3/18/2018 6:56:01 PM -->
				


<div class="search">
	<div class="arrowTop"></div>
    <input class="search-bar" name="search-bar" placeholder="Find ingredients, recipes..." type="text" data-search-scope="" data-auto-suggest-search-scope="kraftrecipe,ingredient,products,memberrecipe" data-toggle="popover" data-html="true" data-placement="bottom" autocomplete="off" />
    <button id="searchButton" rel="nofollow" class="search-button" data-search-url="/search.aspx" type="submit">
		<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="14.5px" height="14.4px" viewbox="0 0 14.5 14.4" style="enable-background:new 0 0 14.5 14.4;" xml:space="preserve"><path d="M14.3 12.7l-3.2-3.2c0.7-1 1.1-2.2 1.1-3.4c0-0.8-0.2-1.6-0.5-2.4c-0.3-0.8-0.8-1.4-1.3-1.9c-0.5-0.5-1.2-1-1.9-1.3 S6.9 0 6.1 0C5.3 0 4.5 0.2 3.7 0.5S2.3 1.2 1.8 1.8C1.2 2.3 0.8 3 0.5 3.7S0 5.2 0 6.1c0 0.8 0.2 1.6 0.5 2.4s0.8 1.4 1.3 1.9 c0.5 0.5 1.2 1 1.9 1.3c0.8 0.3 1.5 0.5 2.4 0.5c1.3 0 2.4-0.4 3.4-1.1l0 0l3.2 3.2c0.2 0.2 0.6 0.2 0.8 0l0.8-0.8 C14.5 13.3 14.5 12.9 14.3 12.7 M8.8 8.8C8 9.6 7.1 9.9 6.1 9.9s-2-0.4-2.7-1.1C2.6 8 2.2 7.1 2.2 6.1c0-1.1 0.4-2 1.1-2.7 C4.1 2.6 5 2.2 6.1 2.2s2 0.4 2.7 1.1C9.6 4.1 9.9 5 9.9 6.1C9.9 7.1 9.6 8 8.8 8.8"/></svg>
	</button>
</div>

			 </div>
		</div>
	</div>
	 

<div class="jump-links visible-xs-block">
    <div class="row">
        <a class="jumpto_what-you-need col-xs-4">Ingredients</a>
        <a class="jumpto_make-it col-xs-4">
            <div class="divider dotted vertical"></div>
            Make It</a>
        <a class="jumpto_ratings-reviews col-xs-4">
            <div class="divider dotted vertical"></div>
            Reviews</a>
        <a class="jumpto_our-tastemakers col-xs-4">
                Meet our Tastemakers</a>
    </div>
</div>
	
    <a class="closeLink">
		<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="12px" height="12px" viewbox="0 0 12 12" style="enable-background:new 0 0 12 12;" xml:space="preserve"><path class="st0" d="M12 5.5c0-0.4-0.3-0.7-0.7-0.7H7.4H4.6H0.7C0.3 4.8 0 5.1 0 5.5v1c0 0.4 0.3 0.7 0.7 0.7h3.9h2.7h3.9 c0.4 0 0.7-0.3 0.7-0.7V5.5z"/><path class="st0" d="M5.5 0C5.1 0 4.8 0.3 4.8 0.7v3.9v2.7v3.9c0 0.4 0.3 0.7 0.7 0.7h1c0.4 0 0.7-0.3 0.7-0.7V7.4V4.6V0.7 C7.2 0.3 6.9 0 6.5 0H5.5z"/></svg>
	</a>
	<a class="searchLink">
		<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="14.5px" height="14.4px" viewbox="0 0 14.5 14.4" style="enable-background:new 0 0 14.5 14.4;" xml:space="preserve"><path d="M14.3 12.7l-3.2-3.2c0.7-1 1.1-2.2 1.1-3.4c0-0.8-0.2-1.6-0.5-2.4c-0.3-0.8-0.8-1.4-1.3-1.9c-0.5-0.5-1.2-1-1.9-1.3 S6.9 0 6.1 0C5.3 0 4.5 0.2 3.7 0.5S2.3 1.2 1.8 1.8C1.2 2.3 0.8 3 0.5 3.7S0 5.2 0 6.1c0 0.8 0.2 1.6 0.5 2.4s0.8 1.4 1.3 1.9 c0.5 0.5 1.2 1 1.9 1.3c0.8 0.3 1.5 0.5 2.4 0.5c1.3 0 2.4-0.4 3.4-1.1l0 0l3.2 3.2c0.2 0.2 0.6 0.2 0.8 0l0.8-0.8 C14.5 13.3 14.5 12.9 14.3 12.7 M8.8 8.8C8 9.6 7.1 9.9 6.1 9.9s-2-0.4-2.7-1.1C2.6 8 2.2 7.1 2.2 6.1c0-1.1 0.4-2 1.1-2.7 C4.1 2.6 5 2.2 6.1 2.2s2 0.4 2.7 1.1C9.6 4.1 9.9 5 9.9 6.1C9.9 7.1 9.6 8 8.8 8.8"/></svg>
	</a>
    

<div class="mobile-nav-overlay">
    <div class="screen"></div>
    <div class="loading">
        <svg width='48px' height='48px' xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid" class="uil-default"><rect x="0" y="0" width="100" height="100" fill="none" class="bk frame" shape-rendering="optimizeQuality"></rect><rect  x='45' y='40' width='10' height='20' rx='5' ry='5' fill='#003366' transform='rotate(0 50 50) translate(0 -25)' shape-rendering="optimizeQuality">	<animate attributeName='opacity' from='1' to='0' dur='1s' begin='0s' repeatCount='indefinite'/></rect><rect  x='45' y='40' width='10' height='20' rx='5' ry='5' fill='#003366' transform='rotate(40 50 50) translate(0 -25)' shape-rendering="optimizeQuality">  <animate attributeName='opacity' from='1' to='0' dur='1s' begin='0.1111111111111111s' repeatCount='indefinite'/></rect><rect  x='45' y='40' width='10' height='20' rx='5' ry='5' fill='#003366' transform='rotate(80 50 50) translate(0 -25)' shape-rendering="optimizeQuality">  <animate attributeName='opacity' from='1' to='0' dur='1s' begin='0.2222222222222222s' repeatCount='indefinite'/></rect><rect  x='45' y='40' width='10' height='20' rx='5' ry='5' fill='#003366' transform='rotate(120 50 50) translate(0 -25)' shape-rendering="optimizeQuality">  <animate attributeName='opacity' from='1' to='0' dur='1s' begin='0.3333333333333333s' repeatCount='indefinite'/></rect><rect  x='45' y='40' width='10' height='20' rx='5' ry='5' fill='#003366' transform='rotate(160 50 50) translate(0 -25)' shape-rendering="optimizeQuality">  <animate attributeName='opacity' from='1' to='0' dur='1s' begin='0.4444444444444444s' repeatCount='indefinite'/></rect><rect  x='45' y='40' width='10' height='20' rx='5' ry='5' fill='#003366' transform='rotate(200 50 50) translate(0 -25)' shape-rendering="optimizeQuality">  <animate attributeName='opacity' from='1' to='0' dur='1s' begin='0.5555555555555556s' repeatCount='indefinite'/></rect><rect  x='45' y='40' width='10' height='20' rx='5' ry='5' fill='#003366' transform='rotate(240 50 50) translate(0 -25)' shape-rendering="optimizeQuality">  <animate attributeName='opacity' from='1' to='0' dur='1s' begin='0.6666666666666666s' repeatCount='indefinite'/></rect><rect  x='45' y='40' width='10' height='20' rx='5' ry='5' fill='#003366' transform='rotate(280 50 50) translate(0 -25)' shape-rendering="optimizeQuality"> <animate attributeName='opacity' from='1' to='0' dur='1s' begin='0.7777777777777778s' repeatCount='indefinite'/></rect><rect  x='45' y='40' width='10' height='20' rx='5' ry='5' fill='#003366' transform='rotate(320 50 50) translate(0 -25)' shape-rendering="optimizeQuality"><animate attributeName='opacity' from='1' to='0' dur='1s' begin='0.8888888888888888s' repeatCount='indefinite'/></rect></svg>    
    </div>
</div>

<div class="mobile-nav">
    
                  
<div class="ajax-menu">
    <ul class=" mobile-nav-tier_1" data-ajax-url="/layers/mobile">
        <li><a href="/" data-sitecore-id="86B52446F2CA4F2F99AB7587C21CE23E"> </a></li>
        
            <ul class="mobile-nav-tier_2">
               <li><a href="/recipes/dessert.aspx" data-sitecore-id="C7FE228A4CBD48CE8D8A7E57449192CC">Desserts</a></li>
            
            <ul class="mobile-nav-tier_3 active">
               
               <li><a href="/recipes/dessert/brownie-blondies.aspx" data-sitecore-id="4244B578FFB54D10B396143DDCA2DE68">Brownie and Blondie Recipes</a></li>
            
            
            <ul class="mobile-nav-tier_4">
            
            </ul>
            
        </ul></ul>
    </ul>
</div>

<div class="non-ajax-menu">
    <ul>
        <li>
            <a href="/recipes/recipe-box.aspx" rel="nofollow" class="recipe-box auth-link">
<div class="svgholder">
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="27.9px" height="24px" viewbox="0 0 27.9 24" style="enable-background:new 0 0 27.9 24;" xml:space="preserve"><path d="M2 3.9l1.3-3.5C3.4 0.2 3.6 0 3.9 0h8.8c0.2 0 0.4 0.1 0.5 0.3l0.5 1.2c0.1 0.2 0.3 0.3 0.5 0.3h10.6c0.3 0 0.5 0.2 0.6 0.4 l0.5 1.6c0.1 0.4-0.2 0.8-0.6 0.8H2.5C2.1 4.7 1.8 4.3 2 3.9 M27.9 7.8l-1.6 15.7c0 0.3-0.3 0.5-0.6 0.5H2.2c-0.3 0-0.6-0.2-0.6-0.5 L0 7.8c0-0.4 0.2-0.7 0.6-0.7h26.7C27.6 7.1 27.9 7.4 27.9 7.8 M19.3 16.9c0.8-0.7 1.2-1.8 1.2-2.9c0-2.2-1.7-3.9-3.8-3.9 c-0.9 0-1.8 0.3-2.4 0.9c-0.2 0.2-0.5 0.2-0.7 0c-0.7-0.6-1.5-0.9-2.4-0.9C9 10 7.3 11.8 7.3 14c0 1.2 0.5 2.2 1.2 2.9h0l4.1 4.3 c0.4 0.4 0.8 0.9 1.2 0.9s0.8-0.4 1.2-0.9L19.3 16.9L19.3 16.9z"/></svg>
</div>
<span>Recipe Box</span>
</a>

        </li>

        
        <li>
            <a href="/account/sign-in.aspx" class="sign-in">
<div class="svgholder">
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="12px" height="10px" viewbox="0 0 12 10" style="enable-background:new 0 0 12 10;" xml:space="preserve"><path d="M11 0H8.8h-1H7.2C7 0 6.9 0.1 6.9 0.3v0.1c0 0.2 0.1 0.3 0.3 0.3h0.7h1h1.2c0.5 0 1 0.5 1 1v6.6c0 0.6-0.5 1-1 1H8.8 c0 0 0 0 0 0H7.2C7 9.3 6.9 9.4 6.9 9.6v0.1C6.9 9.8 7 10 7.2 10h0.1h1.5H11c0.5 0 1-0.5 1-1V1C12 0.5 11.5 0 11 0"/><path d="M9.3 4.7L5.2 0.6c-0.1-0.1-0.4-0.1-0.5 0l-1 1C3.6 1.8 3.6 2 3.7 2.2l1.7 1.7H0.6C0.3 3.9 0 4.2 0 4.5v1 c0 0.3 0.3 0.6 0.6 0.6h4.8L3.7 7.8c-0.1 0.1-0.1 0.4 0 0.5l1 1c0.1 0.1 0.4 0.1 0.5 0l4.1-4.1C9.4 5.2 9.4 5.1 9.4 5 C9.4 4.9 9.4 4.8 9.3 4.7"/></svg>
</div>
<span>Sign In/Register</span>
</a>

        </li>
        

        <li><a href="http://www.comidakraft.com" class="sign-out">
            <div class="svgholder">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="13px" height="10px" viewbox="0 0 13 10" style="enable-background:new 0 0 13 10;" xml:space="preserve"><path class="st0" d="M2.6 4H1.5C1.2 4 1 4.2 1 4.5v4C1 8.8 1.2 9 1.5 9h6C7.8 9 8 8.8 8 8.5V7.4l1 0v1.1C9 9.3 8.3 10 7.5 10h-6 C0.7 10 0 9.3 0 8.5v-4C0 3.7 0.7 3 1.5 3h1.2L2.6 4z"/><path class="st0" d="M11.5 8h-8C2.7 8 2 7.3 2 6.5v-5C2 0.7 2.7 0 3.5 0h8C12.3 0 13 0.7 13 1.5v5C13 7.3 12.3 8 11.5 8 M3.5 1 C3.2 1 3 1.2 3 1.5v5C3 6.8 3.2 7 3.5 7h8C11.8 7 12 6.8 12 6.5v-5C12 1.2 11.8 1 11.5 1H3.5z"/></svg>
            </div>
            <span>Comida Kraft</span>
        </a></li>
    </ul>
</div>

</div>
<!-- Time Rendered: 3/18/2018 6:56:01 PM -->
</header>


<script>

    $(document).ready(function () {
        $('.mm_t10_main_wrap').addClass('hidden-xs');
    });

    $(window).load(function () {
        var queryString = getParameterByName("cm_mmc");        
        var email = false;
        if (queryString != null) {
            email = queryString.startsWith("eml");
        }
        
        if (window.location.href.toLowerCase().indexOf('feedtheworld') == -1) {
            if (email == true && readCookie("kr_email") == null) {
                setCookie("kr_email", queryString, 20 * 365);
            }
            if (kraft.viewportWidth > kraft.breakpoint) {   //DMSUP-12499 --> The lightbox should not trigger when a consumer is on a mobile site.
                if (readCookie("pcount") != null && readCookie("kr_email") == null) {
                    var cookieVal = readCookie("pcount");  //grab the cookie
                    var cookieValue = parseInt(cookieVal, 10);  //convert it to number

                    if (cookieValue < 5) {
                        cookieValue++;  //increment the value
                        createcookie("pcount", cookieValue, 1); //save new value
                    }
                    if (readCookie("pcount") == "4" && readCookie('lbp-remindemelater') == null && readCookie('lbp-nothanks') == null && readCookie('lbp-alreadysubscribed') == null) {
                        $(".acquisition-modal").click();
                    }
                }
                if (readCookie("pcount") == null && readCookie("kr_email") == null && readCookie('lbp-remindemelater') == null && readCookie('lbp-nothanks') == null && readCookie('lbp-alreadysubscribed') == null) {
                    $(".acquisition-modal").click();
                }
            }
        }
    });

    function readCookie(name) {
        var nameEQ = name + "=";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') c = c.substring(1, c.length);
            if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
        }
        return null;
    }

    function getParameterByName(name) {
        var url = window.location.href;
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }

    function setCookie(c_name,value,exdays) {
        var exdate=new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var c_value=escape(value) + ((exdays==null) ? "" : ";expires="+exdate.toUTCString());
        document.cookie=c_name + "=" + c_value;
    }

    function createcookie(name, value, days) {
        var expires = "";
        if (days) {
            var date = new Date();
            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
            expires = "; expires=" + date.toGMTString();
        } else {
            expires = "";
        }
        document.cookie = name + "=" + value + expires + "; path=/";
    }
</script>


        <div class="container-fluid kraft-breadcrumb" id="breadId">
            <div class="wrapper">
                <ul itemprop="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList">
    
        <li id="header_1_rptBreadcrumbs_liItem_0" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem" class="first">                
                <a itemprop="item" href="/" ><span itemprop="name">Home</span></a>
            </li>
        
    
       
    
        <li id="header_1_rptBreadcrumbs_liItem_1" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">                
                <a itemprop="item" href="/recipes.aspx" ><span itemprop="name"> Recipes: Browse All of Our Recipes</span></a>
            </li>
        
    
       
    
        <li id="header_1_rptBreadcrumbs_liItem_2" itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem" class="parent">                
                <a itemprop="item" href="/recipes/dessert.aspx" ><span itemprop="name">Desserts</span></a>
            </li>
        
    
       
    
        
        
            <li>
                Brownie and Blondie Recipes
            </li>
        
    
        </ul>
	</div>
	<div class="divider dotted"></div>
        </div>
    


        <div class="main container-fluid " id="bodyDiv">
            <div class="mask"></div>
            <div class="wrapper">
                


<div class="tracking-pixel">  
    
    
</div>

<div class="shadow recipe-listing-shell two-col">
	<div class="right-rail-gradient"></div>
	<div class="row">
		<div class="col-sm-8 bg-white main-left-col">

			<h1 itemprop="name" class="mobile-container-padding">Brownie and Blondie Recipes<span class="healthy-icon"></span></h1>

			
<div class="jcarousel-wrapper hero">
    <div data-sliderid="popularRecipes" data-sliderenv="2" data-mobilestyle="double-peek" data-desktopstyle="slideshow" class="jcarousel">
        <!-- data-ajaxed="false" data-moreItems="/components/card-items/card-item-everything.html" -->
        <ul class="clearfix">
            
                    <li class="slide">
                        <a href="/recipes/blonde-coffee-blondies-211778.aspx" id="main_0_content_0_rptRecipeList_RecipeImageUrl_0" class="image">
                            <div id="main_0_content_0_rptRecipeList_ShowImagePanel_0">
	
                                <img id="main_0_content_0_rptRecipeList_RecipeImage_0" title="Blonde Coffee Blondies" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="Blonde Coffee Blondies" data-yo-delayType="lazy" data-yo-src="//cdn-us-ec.yottaa.net/5637a31d312e585f7100086c/www.kraftrecipes.com/v~22.121/-/media/assets/2018-spring/blonde-coffee-blondies-211778-580x250.jpg?yocs=1V_1Y_2b_&amp;yoloc=us" />
                            
</div>
                            
                        </a>
                        <div class="caption with-rating">
                            <div class="inner">
                                <div class="desc">
                                    <a href="/recipes/blonde-coffee-blondies-211778.aspx" id="main_0_content_0_rptRecipeList_recipeTitleUrl_0" class="title bvInlineRating" data-pid="211778">Blonde Coffee Blondies
                                        
                                        
                                    </a>
                                    <div class="rate-review" data-pid="211778" data-url="/recipes/blonde-coffee-blondies-211778.aspx"><div id="BVRRInlineRating-211778-71d7ed1a-7424-4f58-8745-6dc7c697b9d8"></div></div>
                                      
                                  
                                </div>
                                <a href="/recipes/blonde-coffee-blondies-211778.aspx" id="main_0_content_0_rptRecipeList_RecipeUrl_0" class="view-all-link forward bvInlineRating" data-pid="211778">
                                    <span class="circle-container">
                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="18.2px" height="30.5px" viewbox="0 0 18.2 30.5" style="enable-background:new 0 0 18.2 30.5;" xml:space="preserve"><path class="st0" d="M17.8 2.4l-1.9-1.9c-0.4-0.4-0.9-0.4-1.3 0L0.4 14.6c-0.4 0.4-0.4 0.9 0 1.3l14.2 14.2c0.4 0.4 0.9 0.4 1.3 0 l1.9-1.9c0.4-0.4 0.4-0.9 0-1.3l-11-11c-0.4-0.4-0.4-0.9 0-1.3l11-11C18.2 3.3 18.2 2.7 17.8 2.4"/></svg>
                                    </span>
                                    View Recipe
                                </a>
                            </div>
                        </div>
                    </li>
                
        </ul>
    </div>

    <a href="#" class="jcarousel-control-prev hidden-xs" data-jcarouselcontrol="true">
        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="18.2px" height="30.5px" viewbox="0 0 18.2 30.5" style="enable-background:new 0 0 18.2 30.5;" xml:space="preserve"><path class="st0" d="M17.8 2.4l-1.9-1.9c-0.4-0.4-0.9-0.4-1.3 0L0.4 14.6c-0.4 0.4-0.4 0.9 0 1.3l14.2 14.2c0.4 0.4 0.9 0.4 1.3 0 l1.9-1.9c0.4-0.4 0.4-0.9 0-1.3l-11-11c-0.4-0.4-0.4-0.9 0-1.3l11-11C18.2 3.3 18.2 2.7 17.8 2.4"/></svg>
    </a>
    <a href="#" class="jcarousel-control-next hidden-xs" data-jcarouselcontrol="true">
        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="18.2px" height="30.5px" viewbox="0 0 18.2 30.5" style="enable-background:new 0 0 18.2 30.5;" xml:space="preserve"><path class="st0" d="M17.8 2.4l-1.9-1.9c-0.4-0.4-0.9-0.4-1.3 0L0.4 14.6c-0.4 0.4-0.4 0.9 0 1.3l14.2 14.2c0.4 0.4 0.9 0.4 1.3 0 l1.9-1.9c0.4-0.4 0.4-0.9 0-1.3l-11-11c-0.4-0.4-0.4-0.9 0-1.3l11-11C18.2 3.3 18.2 2.7 17.8 2.4"/></svg>
    </a>
</div>

            
            <div class="read-more-wrapper">
				<div class="romance-copy mobile-container-padding flipboard-subtitle">
                    <div>
Earn some brownie points&mdash;or <a href="http://www.kraftrecipes.com/recipes/caramel-swirl-blondies-56934.aspx">blondie</a> points&mdash;with one of these brownie or blondie recipes! Wondering what the difference is between brownie and blondie recipes? Generally, brownies are made with cocoa; blondies are brown-sugar-based. If you're leaning toward <a href="http://www.kraftrecipes.com/recipes/dessert/brownie-recipes/main.aspx">brownies</a>, check out our <a href="http://www.kraftrecipes.com/recipes/dessert/chocolate-center/chocolate-101-workshop.aspx">chocolate baking tips</a>. It may also help (for either brownie or blondie recipes) to visit our <a href="tips/cooking-videos/kitchen-basics-videos/how-to-melt-caramels.aspx">how to melt caramels video</a>. For more <a href="http://www.kraftrecipes.com/recipes/dessert/potluck-desserts.aspx">great potluck dessert</a> ideas, try one of our <a href="http://www.kraftrecipes.com/recipes/dessert/bars-squares-recipes.aspx">bars and square desserts</a>.
</div>
				</div>
                
				<div class="read-more visible-xs-block">
				    <p><span class="more">Read More</span><span class="less">Read Less</span><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="18.2px" height="30.5px" viewbox="0 0 18.2 30.5" style="enable-background:new 0 0 18.2 30.5;" xml:space="preserve"><path class="st0" d="M17.8 2.4l-1.9-1.9c-0.4-0.4-0.9-0.4-1.3 0L0.4 14.6c-0.4 0.4-0.4 0.9 0 1.3l14.2 14.2c0.4 0.4 0.9 0.4 1.3 0 l1.9-1.9c0.4-0.4 0.4-0.9 0-1.3l-11-11c-0.4-0.4-0.4-0.9 0-1.3l11-11C18.2 3.3 18.2 2.7 17.8 2.4"/></svg></p>
				</div>
			</div>
            
			<div class="hidden-xs divider slitshadow">
				<div class="falloff-shadow"></div>
			</div>

			<div class="visible-xs col-xs-12 scallop top">
				<div class="border"></div>
			</div>
             
            


        <div class="row recipe-listing-utility clearfix">
            <div class="col-xs-8 utility-title">
                <!-- TODO: confirm  w/ SEO about being a header? -->
                <h3>(12) Brownie Recipes and Blondie Recipes</h3>
            </div>
            <div class="col-xs-4 utility-view">
                <div class="view-grid-trigger view-trigger active">
                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="18px" height="16.2px" viewbox="0 0 18 16.2" style="enable-background:new 0 0 18 16.2;" xml:space="preserve"><path class="st0" d="M7 7.1H1c-0.6 0-1-0.4-1-1V1c0-0.6 0.4-1 1-1h6c0.6 0 1 0.4 1 1v5.1C8 6.7 7.6 7.1 7 7.1"/><path class="st0" d="M17 7.1h-6c-0.6 0-1-0.4-1-1V1c0-0.6 0.4-1 1-1h6c0.6 0 1 0.4 1 1v5.1C18 6.7 17.5 7.1 17 7.1"/><path class="st0" d="M7 16.2H1c-0.5 0-1-0.4-1-1V10c0-0.5 0.4-1 1-1h6c0.5 0 1 0.4 1 1v5.2C8 15.7 7.6 16.2 7 16.2"/><path class="st0" d="M17 16.2h-6c-0.6 0-1-0.4-1-1V10c0-0.6 0.4-1 1-1h6c0.6 0 1 0.4 1 1v5.2C18 15.7 17.5 16.2 17 16.2"/></svg>
                </div>
                <div class="views-divider"></div>
                <div class="view-list-trigger view-trigger">
                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="18px" height="16.2px" viewbox="0 0 18 16.2" style="enable-background:new 0 0 18 16.2;" xml:space="preserve"><path class="st0" d="M16.9 4.1H8c-0.6 0-1-0.5-1-1V1c0-0.6 0.5-1 1-1h8.9c0.6 0 1 0.5 1 1v2.1C18 3.7 17.5 4.1 16.9 4.1"/><path class="st0" d="M4 10.1H1c-0.6 0-1-0.4-1-1V7c0-0.6 0.4-1 1-1h3c0.6 0 1 0.4 1 1v2.1C5 9.7 4.5 10.1 4 10.1"/><path class="st0" d="M16.9 10.1H8c-0.6 0-1-0.4-1-1V7c0-0.6 0.4-1 1-1h8.9c0.6 0 1 0.4 1 1v2.1C18 9.7 17.5 10.1 16.9 10.1"/><path class="st0" d="M4 16.2H1c-0.6 0-1-0.4-1-1V13c0-0.6 0.4-1 1-1h3c0.6 0 1 0.4 1 1v2.1C5 15.7 4.5 16.2 4 16.2"/><path class="st0" d="M17 16.2H8c-0.6 0-1-0.4-1-1V13c0-0.6 0.4-1 1-1h9c0.6 0 1 0.4 1 1v2.1C18 15.7 17.5 16.2 17 16.2"/><path class="st0" d="M4 4.1H1c-0.6 0-1-0.4-1-1V1c0-0.6 0.4-1 1-1h3c0.6 0 1 0.4 1 1v2.1C5 3.7 4.5 4.1 4 4.1"/></svg>
                </div>
            </div>
            
        </div>
        <div class="divider slitshadow visible-xs">
            <div class="falloff-shadow"></div>
        </div>

        <ul class="three-tile-grid view-grid clearfix recipe-listing-results "data-ajaxlist-id="recipelist-list-1">
            

            <!-- begin listing -->
            



        
        <li id="main_0_contentbody_0_ctl01_CuratedRecipes_RecipeCard_0_RecipeCardItem_0" data-recipe-id="0" data-in-recipe-box="False" class="card recipe">
    <div class="card-shadow"></div>
    <div class="inner-card">
        
        
        
        
        <div class="card-top">

            
               <a href="/recipes/bakers-one-bowl-white-chocolate-blonde-brownies-60075.aspx"  class='bvInlineRating' data-pid="60075">
                 
                <img src="http://assets.kraftfoods.com/recipe_images/opendeploy/60075_290x194.jpg" alt="BAKER'S ONE BOWL White Chocolate Blonde Brownies" title="BAKER'S ONE BOWL White Chocolate Blonde Brownies" />
                
             </a>
             
        </div>
        <div class="card-bottom">
            <div class="card-details">
                <a class="title" href="/recipes/bakers-one-bowl-white-chocolate-blonde-brownies-60075.aspx">BAKER'S ONE BOWL White Chocolate Blonde Brownies
                    
                    
                    
                </a>
                
                    <div class="rate-review"  data-pid="60075" data-url="/recipes/bakers-one-bowl-white-chocolate-blonde-brownies-60075.aspx">
                             
                       <div id="BVRRInlineRating-60075-8ab95221-a40c-414a-a43d-7a68b3b8d8ea"></div>
                
                    </div>
                
                
                
                
    <p class="card-total-time">
        
        <span class="min">50</span>
        <span class="time">min.</span>

        
    </p>


            </div>
        </div>
        

        

        
    </div>
    
        <div class="divider dotted"></div>
    
    <a href="/recipes/bakers-one-bowl-white-chocolate-blonde-brownies-60075.aspx" class="mobile-click-mask"></a>
    
</li>


    
        
        <li id="main_0_contentbody_0_ctl01_CuratedRecipes_RecipeCard_1_RecipeCardItem_1" data-recipe-id="0" data-in-recipe-box="False" class="card recipe">
    <div class="card-shadow"></div>
    <div class="inner-card">
        
        
        
        
        <div class="card-top">

            
               <a href="/recipes/maple-blondies-170618.aspx"  class='bvInlineRating' data-pid="170618">
                 
                <img src="http://assets.kraftfoods.com/recipe_images/opendeploy/170618_290x194.jpg" alt="Maple Blondies" title="Maple Blondies" />
                
             </a>
             
        </div>
        <div class="card-bottom">
            <div class="card-details">
                <a class="title" href="/recipes/maple-blondies-170618.aspx">Maple Blondies
                    
                    
                    
                </a>
                
                    <div class="rate-review"  data-pid="170618" data-url="/recipes/maple-blondies-170618.aspx">
                             
                       <div id="BVRRInlineRating-170618-d051971d-963a-47fb-8e25-51df3fc960bb"></div>
                
                    </div>
                
                
                
                
    <p class="card-total-time">
        
        <span class="min">40</span>
        <span class="time">min.</span>

        
    </p>


            </div>
        </div>
        

        

        
    </div>
    
        <div class="divider dotted"></div>
    
    <a href="/recipes/maple-blondies-170618.aspx" class="mobile-click-mask"></a>
    
</li>


    
        
        <li id="main_0_contentbody_0_ctl01_CuratedRecipes_RecipeCard_2_RecipeCardItem_2" data-recipe-id="0" data-in-recipe-box="False" class="card recipe">
    <div class="card-shadow"></div>
    <div class="inner-card">
        
        
        
        
        <div class="card-top">

            
               <a href="/recipes/cool-whip-walnut-blondies-208110.aspx"  class='bvInlineRating' data-pid="208110">
                 
                <img src="http://assets.kraftfoods.com/recipe_images/opendeploy/208110-2c463c28196af95589d727d5e4ef87abc663c39f_291x194.jpg" alt="COOL WHIP Walnut Blondies" title="COOL WHIP Walnut Blondies" />
                
             </a>
             
        </div>
        <div class="card-bottom">
            <div class="card-details">
                <a class="title" href="/recipes/cool-whip-walnut-blondies-208110.aspx">COOL WHIP Walnut Blondies
                    
                    
                    
                </a>
                
                    <div class="rate-review"  data-pid="208110" data-url="/recipes/cool-whip-walnut-blondies-208110.aspx">
                             
                       <div id="BVRRInlineRating-208110-9fc60fb1-1c70-468e-bb8f-22b630a6e20a"></div>
                
                    </div>
                
                
                
                
    <p class="card-total-time">
        
        <span class="min">35</span>
        <span class="time">min.</span>

        
    </p>


            </div>
        </div>
        

        

        
    </div>
    
        <div class="divider dotted"></div>
    
    <a href="/recipes/cool-whip-walnut-blondies-208110.aspx" class="mobile-click-mask"></a>
    
</li>


    
        
        <li id="main_0_contentbody_0_ctl01_CuratedRecipes_RecipeCard_3_RecipeCardItem_3" data-recipe-id="0" data-in-recipe-box="False" class="card recipe">
    <div class="card-shadow"></div>
    <div class="inner-card">
        
        
        
        
        <div class="card-top">

            
               <a href="/recipes/double-chocolate-chunk-blondies-155534.aspx"  class='bvInlineRating' data-pid="155534">
                 
                <img src="http://assets.kraftfoods.com/recipe_images/opendeploy/Double-Chocolate-Chunk-Blondies-63789_290x194.jpg" alt="Double-Chocolate Chunk Blondies" title="Double-Chocolate Chunk Blondies" />
                
             </a>
             
        </div>
        <div class="card-bottom">
            <div class="card-details">
                <a class="title" href="/recipes/double-chocolate-chunk-blondies-155534.aspx">Double-Chocolate Chunk Blondies
                    
                    
                    
                </a>
                
                    <div class="rate-review"  data-pid="155534" data-url="/recipes/double-chocolate-chunk-blondies-155534.aspx">
                             
                       <div id="BVRRInlineRating-155534-9016e58e-afeb-42fb-860a-3919a30e3268"></div>
                
                    </div>
                
                
                
                
    <p class="card-total-time">
        
        <span class="min">55</span>
        <span class="time">min.</span>

        
    </p>


            </div>
        </div>
        

        

        
    </div>
    
        <div class="divider dotted"></div>
    
    <a href="/recipes/double-chocolate-chunk-blondies-155534.aspx" class="mobile-click-mask"></a>
    
</li>


    
        
        <li id="main_0_contentbody_0_ctl01_CuratedRecipes_RecipeCard_4_RecipeCardItem_4" data-recipe-id="0" data-in-recipe-box="False" class="card recipe">
    <div class="card-shadow"></div>
    <div class="inner-card">
        
        
        
        
        <div class="card-top">

            
               <a href="/recipes/bakers-one-bowl-brownies-54515.aspx"  class='bvInlineRating' data-pid="54515">
                 
                <img src="http://assets.kraftfoods.com/recipe_images/opendeploy/54515_290x194.jpg" alt="BAKER'S ONE BOWL Brownies" title="BAKER'S ONE BOWL Brownies" />
                
             </a>
             
        </div>
        <div class="card-bottom">
            <div class="card-details">
                <a class="title" href="/recipes/bakers-one-bowl-brownies-54515.aspx">BAKER'S ONE BOWL Brownies
                    
                    
                    
                </a>
                
                    <div class="rate-review"  data-pid="54515" data-url="/recipes/bakers-one-bowl-brownies-54515.aspx">
                             
                       <div id="BVRRInlineRating-54515-a99e02a3-9202-4269-9df3-0f4835ceead1"></div>
                
                    </div>
                
                
                
                
    <p class="card-total-time">
        
        <span class="min">50</span>
        <span class="time">min.</span>

        
    </p>


            </div>
        </div>
        

        

        
    </div>
    
        <div class="divider dotted"></div>
    
    <a href="/recipes/bakers-one-bowl-brownies-54515.aspx" class="mobile-click-mask"></a>
    
</li>


    
        
        <li id="main_0_contentbody_0_ctl01_CuratedRecipes_RecipeCard_5_RecipeCardItem_5" data-recipe-id="0" data-in-recipe-box="False" class="card recipe">
    <div class="card-shadow"></div>
    <div class="inner-card">
        
        
        
        
        <div class="card-top">

            
               <a href="/recipes/layered-cheesecake-brownies-171896.aspx"  class='bvInlineRating' data-pid="171896">
                 
                <img src="http://assets.kraftfoods.com/recipe_images/172221_STK_65920v0EC_WP.jpg" alt="Layered Cheesecake Brownies" title="Layered Cheesecake Brownies" />
                
             </a>
             
        </div>
        <div class="card-bottom">
            <div class="card-details">
                <a class="title" href="/recipes/layered-cheesecake-brownies-171896.aspx">Layered Cheesecake Brownies
                    
                    
                    
                </a>
                
                    <div class="rate-review"  data-pid="171896" data-url="/recipes/layered-cheesecake-brownies-171896.aspx">
                             
                       <div id="BVRRInlineRating-171896-76aaeedc-a20d-490b-bcca-632d0fcc63ef"></div>
                
                    </div>
                
                
                
                
    <p class="card-total-time">
        
        <span class="min">55</span>
        <span class="time">min.</span>

        
    </p>


            </div>
        </div>
        

        

        
    </div>
    
        <div class="divider dotted"></div>
    
    <a href="/recipes/layered-cheesecake-brownies-171896.aspx" class="mobile-click-mask"></a>
    
</li>


    
        
        <li id="main_0_contentbody_0_ctl01_CuratedRecipes_RecipeCard_6_RecipeCardItem_6" data-recipe-id="0" data-in-recipe-box="False" class="card recipe">
    <div class="card-shadow"></div>
    <div class="inner-card">
        
        
        
        
        <div class="card-top">

            
               <a href="/recipes/blissful-applesauce-brownies-52910.aspx"  class='bvInlineRating' data-pid="52910">
                 
                <img src="http://assets.kraftfoods.com/recipe_images/opendeploy/52910_290x194.jpg" alt="Blissful Applesauce Brownies" title="Blissful Applesauce Brownies" />
                
             </a>
             
        </div>
        <div class="card-bottom">
            <div class="card-details">
                <a class="title" href="/recipes/blissful-applesauce-brownies-52910.aspx">Blissful Applesauce Brownies
                    
                    
                    
                        <span class="healthy-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="39px" height="37px" viewbox="0 0 39 37" style="enable-background:new 0 0 39 37;" xml:space="preserve"><path d="M28.3 10.8c-2.5-2.1-6.6-2.1-9.6-1.1c-2.3 0.8-4.4 1.9-6.2 3.5c-1.8 1.5-3.6 3.5-4 5.9c-0.1 0.8-0.1 1.6 0 2.5 c0.4 2.1 1.7 4 3.6 5.1c2.2 1.3 4.8 1.6 7.3 1.3c1.2-0.1 2.5-0.3 3.5-0.8c2.1-0.9 4-2.3 5.4-4.1c-0.2-0.1-0.4-0.2-0.6-0.1 c-0.2 0.1-0.4 0.2-0.6 0.3c-1.1 0.8-2.2 1.6-3.5 2c-1.4 0.5-2.9 0.8-4.5 0.8c-2.8 0-5.8-1.4-6.9-4.2c-1.7-4.2 1.6-7.7 5.2-9.2 c1.9-0.8 4.4-1.5 6.3-0.8c2.6 1 4.4 4.4 2.5 6.8c-0.6 0.8-1.4 1.3-2.3 1.7c-0.9 0.4-2 0.8-3 0.6c-0.8-0.2-1.6-0.7-1.9-1.5 c-0.3-0.6-0.2-1.4 0.1-1.9c0.4-0.6 1.1-0.8 1.4-1.5c0.1-0.4 0.1-0.8-0.2-1.1c-0.3-0.2-0.7-0.1-1.1 0c-1.7 0.6-3.1 2.2-3.4 4 c-0.3 2.1 2.2 3.5 3.9 3.8c2.3 0.4 4.9-0.4 6.8-1.7c1.6-1.1 3.2-2.9 3.6-4.8c0.2-1.4 0-2.9-0.7-4.1C29.3 11.8 28.8 11.3 28.3 10.8 M0.8 26.8c-0.4 0.3-0.9 0.8-0.7 1.3c0.1 0.3 0.4 0.5 0.7 0.6c0.3 0.1 0.7 0 1-0.1c0.3-0.1 0.6-0.1 0.9-0.2c0.9-0.2 1.8-0.5 2.6-0.9 c0.5-0.2 1-0.5 1.4-1C7 26 7.2 25.4 6.9 24.8C6 22.7 1.7 26.1 0.8 26.8 M19.1 5.7c0.1 0.3 0.2 0.5 0.4 0.7c0.2 0.2 0.5 0.3 0.8 0.3 c0.5-0.1 0.7-0.6 0.7-1.1C21 5.4 21 5.2 21.1 5c0-0.9-0.2-1.8-0.5-2.6c-0.3-0.7-0.6-1.5-1.1-2c-0.6-0.6-1.6-0.4-1.8 0.5 c-0.2 0.8 0.3 1.7 0.5 2.5C18.4 4.1 18.8 4.9 19.1 5.7 M36.3 6.9c0.1-0.2 0.3-0.5 0.3-0.7c0.1-0.3 0-0.6-0.2-0.8c0 0 0 0 0 0 c-0.8-0.6-3 1.1-3.6 1.5c-0.9 0.6-1.8 1.3-2.4 2.3c-0.1 0.2-0.3 0.5-0.3 0.8c0 0.3 0 0.6 0.2 0.8c0.3 0.3 0.8 0.2 1.2 0 C33.5 10 35.2 8.6 36.3 6.9 M15.9 30.2c-0.3-0.5-1-0.4-1.4-0.1c-0.4 0.3-0.6 0.7-0.8 1.2c-0.6 1.5-0.9 3.3-0.8 4.9 c0 0.3 0.1 0.6 0.3 0.7c0.1 0.1 0.3 0 0.4 0c0.1-0.1 0.2-0.2 0.4-0.3c1-1.1 1.7-2.6 1.9-4.1c0.1-0.6 0.3-1.6 0.1-2.2 C16 30.3 16 30.3 15.9 30.2 M29.8 32.9c-0.2-0.6-0.4-1.2-0.5-1.8c-0.3-0.8-0.6-2-1.3-2.5c-0.6-0.4-1.6-0.3-1.7 0.5 c0 0.3 0.1 0.5 0.1 0.8c0.5 1.4 1.3 2.7 2.4 3.8c0.3 0.2 0.6 0.5 0.9 0.3c0.3-0.2 0.3-0.7 0.2-1.1C29.8 33 29.8 33 29.8 32.9 M10.1 10.9c0-0.3-0.2-0.5-0.3-0.7c0 0 0 0 0 0C9.2 9.3 8.4 8.5 7.5 8C6.8 7.6 5.3 6.8 4.4 7.1c-0.7 0.3 0.3 1.6 0.6 2 c0.8 1 1.9 1.8 3.1 2.2C8.7 11.5 10.2 12.1 10.1 10.9 M39 20.3c-0.2 0.1-0.8 0-1-0.1c-0.5-0.1-0.9-0.2-1.4-0.4 c-0.9-0.3-1.8-0.6-2.8-0.7c-0.4 0-0.7 0-1 0.2c-0.3 0.2-0.6 0.5-0.6 0.8c0 0.3 0.2 0.7 0.5 0.9c0.3 0.2 0.6 0.3 0.9 0.4 C34.9 21.9 38.6 22.3 39 20.3C39 20.3 39 20.3 39 20.3"/></svg>
                        </span>
                    
                </a>
                
                    <div class="rate-review"  data-pid="52910" data-url="/recipes/blissful-applesauce-brownies-52910.aspx">
                             
                       <div id="BVRRInlineRating-52910-7120eb52-7f70-4565-83a5-503491a98bb3"></div>
                
                    </div>
                
                
                
                
    <p class="card-total-time">
        
        <span class="min">35</span>
        <span class="time">min.</span>

        
    </p>


            </div>
        </div>
        

        

        
    </div>
    
        <div class="divider dotted"></div>
    
    <a href="/recipes/blissful-applesauce-brownies-52910.aspx" class="mobile-click-mask"></a>
    
</li>


    
        
        <li id="main_0_contentbody_0_ctl01_CuratedRecipes_RecipeCard_7_RecipeCardItem_7" data-recipe-id="0" data-in-recipe-box="False" class="card recipe">
    <div class="card-shadow"></div>
    <div class="inner-card">
        
        
        
        
        <div class="card-top">

            
               <a href="/recipes/caramel-swirl-blondies-56934.aspx"  class='bvInlineRating' data-pid="56934">
                 
                <img src="http://assets.kraftfoods.com/recipe_images/opendeploy/56934_290x194.jpg" alt="Caramel Swirl Blondies" title="Caramel Swirl Blondies" />
                
             </a>
             
        </div>
        <div class="card-bottom">
            <div class="card-details">
                <a class="title" href="/recipes/caramel-swirl-blondies-56934.aspx">Caramel Swirl Blondies
                    
                    
                    
                </a>
                
                    <div class="rate-review"  data-pid="56934" data-url="/recipes/caramel-swirl-blondies-56934.aspx">
                             
                       <div id="BVRRInlineRating-56934-a8d95460-8cb7-42c0-9a4e-11d9f4260177"></div>
                
                    </div>
                
                
                
                
    <p class="card-total-time">
        
        <span class="min">58</span>
        <span class="time">min.</span>

        
    </p>


            </div>
        </div>
        

        

        
    </div>
    
        <div class="divider dotted"></div>
    
    <a href="/recipes/caramel-swirl-blondies-56934.aspx" class="mobile-click-mask"></a>
    
</li>


    
        
        <li id="main_0_contentbody_0_ctl01_CuratedRecipes_RecipeCard_8_RecipeCardItem_8" data-recipe-id="0" data-in-recipe-box="False" class="card recipe">
    <div class="card-shadow"></div>
    <div class="inner-card">
        
        
        
        
        <div class="card-top">

            
               <a href="/recipes/salted-caramel-brownies-126811.aspx"  class='bvInlineRating' data-pid="126811">
                 
                <img src="http://assets.kraftfoods.com/recipe_images/opendeploy/126811_290x194.jpg" alt="Salted Caramel Brownies" title="Salted Caramel Brownies" />
                
             </a>
             
        </div>
        <div class="card-bottom">
            <div class="card-details">
                <a class="title" href="/recipes/salted-caramel-brownies-126811.aspx">Salted Caramel Brownies
                    
                    
                    
                </a>
                
                    <div class="rate-review"  data-pid="126811" data-url="/recipes/salted-caramel-brownies-126811.aspx">
                             
                       <div id="BVRRInlineRating-126811-aac44e54-5b81-42be-902c-0ae5ceddf7d8"></div>
                
                    </div>
                
                
                
                
    <p class="card-total-time">
        
        <span class="min">45</span>
        <span class="time">min.</span>

        
    </p>


            </div>
        </div>
        

        

        
    </div>
    
        <div class="divider dotted"></div>
    
    <a href="/recipes/salted-caramel-brownies-126811.aspx" class="mobile-click-mask"></a>
    
</li>


    
        
        <li id="main_0_contentbody_0_ctl01_CuratedRecipes_RecipeCard_9_RecipeCardItem_9" data-recipe-id="0" data-in-recipe-box="False" class="card recipe">
    <div class="card-shadow"></div>
    <div class="inner-card">
        
        
        
        
        <div class="card-top">

            
               <a href="/recipes/gevalia-espresso-one-bowl-brownies-155565.aspx"  class='bvInlineRating' data-pid="155565">
                 
                <img src="http://assets.kraftfoods.com/recipe_images/opendeploy/155565_290x194.jpg" alt="GEVALIA Espresso ONE BOWL Brownies" title="GEVALIA Espresso ONE BOWL Brownies" />
                
             </a>
             
        </div>
        <div class="card-bottom">
            <div class="card-details">
                <a class="title" href="/recipes/gevalia-espresso-one-bowl-brownies-155565.aspx">GEVALIA Espresso ONE BOWL Brownies
                    
                    
                    
                </a>
                
                    <div class="rate-review"  data-pid="155565" data-url="/recipes/gevalia-espresso-one-bowl-brownies-155565.aspx">
                             
                       <div id="BVRRInlineRating-155565-3dff896d-7428-452c-91f1-91dd50c7455f"></div>
                
                    </div>
                
                
                
                
    <p class="card-total-time">
        
        <span class="min">47</span>
        <span class="time">min.</span>

        
    </p>


            </div>
        </div>
        

        

        
    </div>
    
        <div class="divider dotted"></div>
    
    <a href="/recipes/gevalia-espresso-one-bowl-brownies-155565.aspx" class="mobile-click-mask"></a>
    
</li>


    
        
        <li id="main_0_contentbody_0_ctl01_CuratedRecipes_RecipeCard_10_RecipeCardItem_10" data-recipe-id="0" data-in-recipe-box="False" class="card recipe">
    <div class="card-shadow"></div>
    <div class="inner-card">
        
        
        
        
        <div class="card-top">

            
               <a href="/recipes/blonde-rocky-road-brownies-51328.aspx"  class='bvInlineRating' data-pid="51328">
                 
                <img src="http://assets.kraftfoods.com/recipe_images/opendeploy/51328_290x194.jpg" alt="Blonde Rocky Road Brownies" title="Blonde Rocky Road Brownies" />
                
             </a>
             
        </div>
        <div class="card-bottom">
            <div class="card-details">
                <a class="title" href="/recipes/blonde-rocky-road-brownies-51328.aspx">Blonde Rocky Road Brownies
                    
                    
                    
                </a>
                
                    <div class="rate-review"  data-pid="51328" data-url="/recipes/blonde-rocky-road-brownies-51328.aspx">
                             
                       <div id="BVRRInlineRating-51328-a4043272-029a-4698-a5c6-f0879e0dda98"></div>
                
                    </div>
                
                
                
                
    <p class="card-total-time">
        
        <span class="min">43</span>
        <span class="time">min.</span>

        
    </p>


            </div>
        </div>
        

        

        
    </div>
    
        <div class="divider dotted"></div>
    
    <a href="/recipes/blonde-rocky-road-brownies-51328.aspx" class="mobile-click-mask"></a>
    
</li>


    
        
        <li id="main_0_contentbody_0_ctl01_CuratedRecipes_RecipeCard_11_RecipeCardItem_11" data-recipe-id="0" data-in-recipe-box="False" class="card recipe">
    <div class="card-shadow"></div>
    <div class="inner-card">
        
        
        
        
        <div class="card-top">

            
               <a href="/recipes/white-chocolate-blonde-brownies-54026.aspx"  class='bvInlineRating' data-pid="54026">
                 
                <img src="http://assets.kraftfoods.com/recipe_images/White-Chocolate-Blonde-Brownies-780.jpg" alt="White Chocolate Blonde Brownies" title="White Chocolate Blonde Brownies" />
                
             </a>
             
        </div>
        <div class="card-bottom">
            <div class="card-details">
                <a class="title" href="/recipes/white-chocolate-blonde-brownies-54026.aspx">White Chocolate Blonde Brownies
                    
                    
                    
                </a>
                
                    <div class="rate-review"  data-pid="54026" data-url="/recipes/white-chocolate-blonde-brownies-54026.aspx">
                             
                       <div id="BVRRInlineRating-54026-a9edb8a7-5570-4fb2-8947-b7444ce644e3"></div>
                
                    </div>
                
                
                
                
    <p class="card-total-time">
        
        <span class="min">40</span>
        <span class="time">min.</span>

        
    </p>


            </div>
        </div>
        

        

        
    </div>
    
        <div class="divider dotted"></div>
    
    <a href="/recipes/white-chocolate-blonde-brownies-54026.aspx" class="mobile-click-mask"></a>
    
</li>


    
            <!-- end listing -->
        </ul>
        <button type="button" class="show-more-items hidden" 
            data-ajaxlist-trigger="recipelist-list-1" 
            data-totalItems="12" 
            data-pagecounter="1" 
            data-list-url="/recipes/dessert/brownie-blondies.aspx?ajaxLayout=1">
            <span class="more">Show More Recipes</span>
            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="15.9px" height="28.2px" viewbox="0 0 15.9 28.2" style="enable-background:new 0 0 15.9 28.2;" xml:space="preserve"><path class="st0" d="M0.3 1.2l0.9-0.9c0.4-0.4 0.9-0.4 1.3 0l13.2 13.2c0.4 0.4 0.4 0.9 0 1.3L2.5 27.9c-0.4 0.4-0.9 0.4-1.3 0 L0.3 27c-0.4-0.4-0.4-0.9 0-1.3l11-11c0.4-0.4 0.4-0.9 0-1.3l-11-11C-0.1 2.1-0.1 1.5 0.3 1.2"/></svg>
        </button>
       


<div class="additional-content flipboard-remove"> </div>

            <div class="additional-content flipboard-remove">
                
            </div>

            <div class="visible-xs col-xs-12 scallop bottom">
                <div class="border"></div>
            </div>
            <div class="Taboola"> 
 <div id="divTaboola" style="margin: 0 18px 10px; border-top: 1px solid #FFFFFF !important;
                                        border-bottom: 1px solid #FFFFFF !important;">
                                 <script type="text/javascript">
                                     var taboolaURL = '';
                                     if (window.location.href.indexOf('kraftrecipes.com') != -1) {
                                         taboolaURL = 'http://cdn.taboola.com/libtrc/kraft-kraftrecipes/loader.js';
                                     }
                                     else {
                                         taboolaURL = 'http://cdn.taboola.com/libtrc/kraft-comida/loader.js';
                                     }
                                     window._taboola = window._taboola || [];
                                     _taboola.push({ article: 'auto' });
                                     !function (e, f, u) {
                                         e.async = 1;
                                         e.src = u;
                                         f.parentNode.insertBefore(e, f);
                                     }(document.createElement('script'),
                                      document.getElementsByTagName('script')[0], taboolaURL);
                                 </script>
 
                                 
 
                                
                                     <div id="taboola-below-article-thumbnails"></div>
                                    <script type="text/javascript">
                                        window._taboola = window._taboola || [];
                                        _taboola.push(
                                    {
                                        mode: 'alternating-thumbnails-a',
                                        container: 'taboola-below-article-thumbnails',
                                        placement: 'Below Article Thumbnails',
                                        target_type: 'mix'
                                    }
                                    );
                                    </script>
 
                                 <style type="text/css">
                                     .taboolaDiv {
                                         border-top: 1px solid #EEE;
                                         border-bottom: 1px solid #EEE;
                                         padding: 30px 0;
                                     }
 
                                 </style>
 
                                 <script type="text/javascript">
                                     window._taboola = window._taboola || [];
                                     _taboola.push({ flush: true });
                                 </script>
                              </div></div>
		</div>

		<aside class="col-xs-12 col-sm-4 right-rail">
			<div class="row">
				    <div class="clearfix">
				    <div id="addthis-toolbox" class="addthis_default_style addthis_32x32_style social-bar hidden-xs">
                        

<div class="fb-like" data-layout="button" data-action="like" data-show-faces="false" data-share="false"></div>
                    </div>	

                    </div>	

                
	

<!--
alert('False');
alert('RecipeCategory');     
	alert('RecipeCollection'); 
alert('True'); -->
     

<!-- alert('False');     
	alert('640'); 
	alert('aria2/1.32.0'); 
	alert('False'); 
 -->

                                        <div id="div-gpt-square-flex-1" data-tier="1" style="margin-bottom:20px"></div>
                                
                    
              <!--What On Hands module added for recipecollection page-->


<div class="col-xs-12">
<div class="what-on-hand sidebar-card">
	<div class="title-ribbon">
		<h3 class="header3 text-center">Use What's On Hand</h3>
	</div>

	<div class="card">
		<div class="inner-card">
			<div class="modal-form-wrapper whatOnHandIngredients">
				<div role="form" class="ingredientForm validate" data-form-id="whatOnHandIngredients">
					<div class="row">
							<p>Not sure what to make? Tell us which ingredients you'd like to use, and we'll make a suggestion.</p>
						
							<div class="col-xs-12">
									<div>
										<label for="ingredient1"></label>
										<input class="ingredientName" type="text" id="ingredient1" placeholder="Ingredient" name="ingredient1" data-toggle="popover" data-html="true" data-placement="bottom" autocomplete="off" />

									</div>
									<div>
										<label for="ingredient2"></label>
										<input class="ingredientName" type="text" id="ingredient2" placeholder="Ingredient" name="ingredient2" data-toggle="popover" data-html="true" data-placement="bottom" autocomplete="off" />
									</div>
									<div>
										<label for="ingredient3"></label>
										<input class="ingredientName" type="text" id="ingredient3" placeholder="Ingredient" name="ingredient3" data-toggle="popover" data-html="true" data-placement="bottom" autocomplete="off" />
									</div>
									<div>
										<label for="category"></label> 
									<div class="styled-select">
										<div class="arrow">
											<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="18.2px" height="30.5px" viewbox="0 0 18.2 30.5" style="enable-background:new 0 0 18.2 30.5;" xml:space="preserve"><path class="st0" d="M17.8 2.4l-1.9-1.9c-0.4-0.4-0.9-0.4-1.3 0L0.4 14.6c-0.4 0.4-0.4 0.9 0 1.3l14.2 14.2c0.4 0.4 0.9 0.4 1.3 0 l1.9-1.9c0.4-0.4 0.4-0.9 0-1.3l-11-11c-0.4-0.4-0.4-0.9 0-1.3l11-11C18.2 3.3 18.2 2.7 17.8 2.4"/></svg>
										</div>
										<select id="category" name="category" data-defaultselectedindex="0">
										  
                                                    <option value="Main+dishes">Main Dishes</option>
                                                
                                                    <option value="Breakfast%2Fbrunch">Breakfast and Brunch</option>
                                                
                                                    <option value="Appetizers">Appetizers</option>
                                                
                                                    <option value="Beverages">Beverages</option>
                                                
                                                    <option value="Desserts">Desserts</option>
                                                
                                                    <option value="Breads">Breads</option>
                                                
                                                    <option value="Soups/Stews">Soups/Stews</option>
                                                
                                                    <option value="Sandwiches">Sandwiches</option>
                                                
                                                    <option value="Salads%20%26%20sides">Salads & Sides</option>
                                                
										</select>
									</div>
								</div>
									<button type="button" class="button primary submit-ingredients" data-modalurl="/search.aspx">Submit</button> 
                                 
                                    <input type="hidden" id="searchJSConfig" value="true" />
                                    <script>
                                        console.log('WOH toggle val:' + '1');                                        
                                    </script>
									<a class="clear-ingredients-form" href="javascript:">Clear</a>
							</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>



                    
                                        <div id="div-gpt-square-fixed-1" data-tier="2" style="margin-bottom:20px"></div>
                                 

                     


<!-- Time Rendered: 3/18/2018 7:00:23 PM -->

<!--below style tag added for fixing overlapping contextnavigation and recentltviewedrecipe in collectionpage-->
<div class="collection-list sidebar-card hidden-xs" style="display:table">
    <div class="title-ribbon">
        <h3 class="header3 text-center">
            Desserts
        </h3>
    </div>
    <div class="card">
        <div class="inner-card">
            <div class="back-to-parent">
               
                      <a class="back-to-link" href="/recipes/dessert.aspx">
                          <span class="circle-container">
                               <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="18.2px" height="30.5px" viewbox="0 0 18.2 30.5" style="enable-background:new 0 0 18.2 30.5;" xml:space="preserve"><path class="st0" d="M17.8 2.4l-1.9-1.9c-0.4-0.4-0.9-0.4-1.3 0L0.4 14.6c-0.4 0.4-0.4 0.9 0 1.3l14.2 14.2c0.4 0.4 0.9 0.4 1.3 0 l1.9-1.9c0.4-0.4 0.4-0.9 0-1.3l-11-11c-0.4-0.4-0.4-0.9 0-1.3l11-11C18.2 3.3 18.2 2.7 17.8 2.4"/></svg>
                          </span>
                          Back To Desserts
                      </a>
               
            </div>
            
                <div class="divider dotted"></div>

                <div class="row">
                    
                            <div class="col-sm-6">
                                <ul class="left">
                        
                            
                                <li><a href="/recipes/dessert/angel-food-cake.aspx">Angel Food Cake Desserts</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/apple-crisp.aspx">Apple Crisp Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/apple-crumb-pie.aspx">Apple Crumb Pie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/apple-desserts.aspx">Apple Dessert Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/apple-pie.aspx">Apple Pie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/germans-chocolate-recipes.aspx">BAKER'S GERMAN'S Chocolate Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/banana-cake-recipes.aspx">Banana Cake Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/banana-desserts.aspx">Banana Dessert Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/banana-pudding.aspx">Banana Pudding Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/bars-squares-recipes.aspx">Dessert Bar and Dessert Square Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/berry.aspx">Berry Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/best-pie.aspx">Best Pie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/blueberry.aspx">Blueberry Desserts & More</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/bread-pudding-recipes.aspx">Bread Pudding Recipes</a></li>
                                
                            
                        
                            
                            
                                <li><span>Brownie and Blondie Recipes</span></li>
                            
                        
                            
                                <li><a href="/recipes/dessert/brownie-recipes.aspx">Brownie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/bundt-cake-recipes.aspx">Bundt® Cake Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/cake-filling-recipes.aspx">Cake Filling Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/cakes.aspx">Cake Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/caramel-apples.aspx">Caramel Apple Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/caramel-desserts.aspx">Caramel Dessert Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/carrot-cake.aspx">Carrot Cake Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/cherry-desserts.aspx">Cherry Dessert Recipes - Pies & More</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/cherry-pie.aspx">Cherry Pie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/chocolate-cake-recipes.aspx">Chocolate Cake Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/chocolate-cookies.aspx">Chocolate Cookie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/chocolate-dipped.aspx">Chocolate-Dipped Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/chocolate-fondue-recipes.aspx">Chocolate Fondue Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/chocolate-pie.aspx">Chocolate Pie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/chocolate-pudding.aspx">Chocolate Pudding Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/churros.aspx">Churros Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/cinnamon.aspx">Cinnamon Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/citrus.aspx">Citrus Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/classic-desserts.aspx">Classic Desserts</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/classic-pies.aspx">Recipes for Classic Pies</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/cobbler-recipes.aspx">Cobbler Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/coconut.aspx">Coconut Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/coconut-cream-pie.aspx">Coconut Cream Pie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/coffee-cakes.aspx">Coffee Cake Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/cookie-ball-recipes.aspx">Cookie Ball Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/cookie-recipes.aspx">Cookie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/cool-whip-desserts.aspx">Cool Whip Dessert Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/cream-cheese-brownie-recipes.aspx">Cream Cheese Brownie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/cream-cheese-frosting-recipes.aspx">Cream Cheese Frosting Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/crescent-roll-dessert-recipes.aspx">Crescent Roll Dessert Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/easy-cream-pie.aspx">Easy Cream Pie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/crisp.aspx">Crisp Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/custard-recipes.aspx">Custard Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/dessert-dips.aspx">Dessert Dip Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/dessert-pizza-recipes.aspx">Dessert Pizza Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/donut-recipes.aspx">Donut Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/caramel-pie.aspx">Easy Caramel Pie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/easy-chocolate.aspx">Easy Chocolate Dessert Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/easy-peanut-butter-cookies.aspx">Easy Peanut Butter Cookie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/easy-pie.aspx">Easy Pie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/eclair-cake.aspx">Eclair Cake Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/festive-desserts.aspx">Festive Desserts</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/flan-recipes.aspx">Flan Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/frozen-desserts.aspx">Frozen Dessert Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/frosting-recipes.aspx">Frosting Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/fruit-pizza.aspx">Fruit Pizza Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/fruit-tart.aspx">Fruit Tart Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/fruity-desserts.aspx">Fruity Dessert Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/fruit-topped-cheesecake.aspx">Fruit-Topped Cheesecakes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/fudge-recipes.aspx">Fudge Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/gelatin-desserts.aspx">Gelatin Desserts</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/gevalia.aspx">GEVALIA Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/gingerbread.aspx">Gingerbread Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/gluten-aware-desserts.aspx">Gluten-Aware Desserts</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/healthy-living-chocolate.aspx">Healthy Living Chocolate Dessert Ideas</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/holiday-jello-recipes.aspx">Holiday Jell-O Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/chocolate-chip-cookies.aspx">Homemade Chocolate Chip Cookie Recipes</a></li>
                                
                            
                        
                            </ul>
                        </div>
                        
                            <div class="col-md-6">
                                <ul class="right">
                        
                            
                                <li><a href="/recipes/dessert/ice-cream-cake.aspx">Ice Cream Cake Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/ice-cream-desserts.aspx">Ice Cream Desserts</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/ice-pop.aspx">Ice Pop Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/jello-for-all-seasons.aspx">Jell-O Recipes for All Seasons</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/jello-mold-recipes.aspx">JELL-O Mold Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/jello-recipes-center.aspx">Jell-O Recipes Center</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/layered-desserts.aspx">Layered Dessert Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/lemon-bar-recipes.aspx">Lemon Bar Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/lemon-cake.aspx">Lemon Cake Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/lemon-pie.aspx">Lemon Pie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/marshmallow-crispy-squares-treats.aspx">Rice Krispies® Treats™</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/mexican-desserts.aspx">Mexican Dessert Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/microwave-desserts.aspx">Microwave Desserts</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/mini-cheesecake.aspx">Mini Cheesecakes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/mini-dessert-recipes.aspx">Mini Dessert Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/mocha-desserts.aspx">Easy Mocha Dessert Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/mug-cake-recipes.aspx">Mug Cake Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/nobake-desserts.aspx">No-Bake Desserts</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/oatmeal-cookie-recipes.aspx">Oatmeal Cookie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/oreo-dessert-recipes.aspx">OREO Dessert Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/parfait.aspx">Parfait Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/jello-holiday.aspx">Patriotic Jell-O Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/peach-cobbler.aspx">Peach Cobbler Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/peach-pie.aspx">Peach Pie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/pear-desserts.aspx">Pear Dessert Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/peanut-butter-cookies.aspx">Peanut Butter Cookies and Treats Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/peanut-butter-fudge.aspx">Peanut Butter Fudge Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/peanut-butter-pie.aspx">Peanut Butter Pie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/pecan.aspx">Pecan Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/pecan-pie.aspx">Pecan Pie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/peppermint-recipes.aspx">Peppermint Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/pie-recipes.aspx">Pie Recipes </a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/poke-cake.aspx">Poke Cake Recipes </a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/potluck-desserts.aspx">Potluck Desserts</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/pound-cake.aspx">Easy Pound Cake Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/pudding-pop.aspx">Pudding Pop Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/pumpkin-bread.aspx">Pumpkin Bread Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/pumpkin-cake.aspx">Pumpkin Cake Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/pumpkin-chocolate-recipes.aspx">Pumpkin Chocolate Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/pumpkin-cookies.aspx">Pumpkin Cookie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/pumpkin-recipes.aspx">Pumpkin Desserts</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/pumpkin-spice.aspx">Pumpkin Spice Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/quick-desserts.aspx">Quick and Easy Desserts</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/raspberry-desserts.aspx">Raspberry Desserts</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/marshmallow-recipes.aspx">Recipes with Marshmallows</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/red-velvet.aspx">Red Velvet Desserts</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/red-white-blue.aspx">Red, White, and Blue Desserts</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/reveal-cakes-cupcakes.aspx">Reveal Cake and Cupcake Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/rice-pudding.aspx">Rice Pudding Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/rhubarb-recipes.aspx">Rhubarb Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/savory-desserts.aspx">Savory Desserts</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/seasonal-desserts.aspx">Seasonal Desserts</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/shortbread-cookie-recipes.aspx">Shortbread Cookie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/slow-cooker-dessert.aspx">Slow-Cooker Dessert Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/smores-recipes.aspx">Fun S'mores Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/sour-cream-pound-cake.aspx">Sour Cream Pound Cake Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/spring-desserts.aspx">Spring Dessert Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/strawberry-cake-recipes.aspx">Strawberry Cake Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/strawberry-dessert-recipes.aspx">Strawberry Dessert Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/strawberry-recipes.aspx">Strawberry Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/strawberry-shortcake.aspx">Strawberry Shortcake Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/sugar-cookies.aspx">Sugar Cookie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/summer-cake-recipes.aspx">Summer Cake Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/summer-desserts.aspx">Summer Dessert Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/sweet-potato-pie.aspx">Sweet Potato Pie Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/tiramisu-recipes.aspx">Tiramisu Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/trifle-recipes.aspx">Trifle Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/tres-leches-cake.aspx">Tres Leches Cake Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/upside-down-cake.aspx">Upside-Down Cake Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/vanilla-pudding.aspx">Vanilla Pudding Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/warm-desserts.aspx">Warm Dessert Recipes</a></li>
                                
                            
                        
                            
                                <li><a href="/recipes/dessert/yellow-cake-recipes.aspx">Yellow Cake Recipes</a></li>
                                
                            
                        
                            </ul>
                        </div>
                        
                </div>
            
        </div>
    </div>
</div>
	

<!--
alert('False');
alert('RecipeCategory');     
	alert('RecipeCollection'); 
alert('True'); -->
     

                                    
                                    <div id="div-gpt-square-fixed-2" data-tier="3" style="margin-bottom:20px"></div>
                                    
                        <!-- <div id="div-gpt-square-fixed-1"></div> -->
                        <!-- <div id="div-gpt-remnant-square-fixed"></div> -->


                    
                 


<!-- Time Rendered: 3/18/2018 7:00:23 PM -->
<div class="rbe-wrapper col-xs-12 ">
    <div class="recipes-by-email">
        <div class="divider slitshadow">
            <div class="falloff-shadow"></div>
        </div>
        <div class="title">
            <div class="icon">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="29px" height="20px" viewbox="0 0 29 20" style="enable-background:new 0 0 29 20;" xml:space="preserve"><path d="M28.5 0H0.5C0.2 0 0 0.2 0 0.5v18.9C0 19.8 0.2 20 0.5 20h27.9c0.3 0 0.5-0.2 0.5-0.5V0.5C29 0.2 28.8 0 28.5 0 M1.5 2.8 C1.6 2.1 2 1.6 2.7 1.5h23.6c0.7 0.2 1.2 0.8 1.2 1.6v0.4C27.2 4 26.9 4.5 26 5.2l-8.9 5.3c-1.9 1.2-3.6 1.1-5.2 0L3 5.3l0 0 C2.1 4.6 1.7 4 1.5 3.4V2.8z M27 18.5H2c-0.3 0-0.5-0.2-0.5-0.5v-12l10.4 6.3c1.5 1.1 3.5 1.2 5.2 0L27.5 6l0.1-0.1v12.2 C27.5 18.3 27.3 18.5 27 18.5"/></svg>
            </div>
            <div class="divider dotted vertical"></div>
            <div class="content">
                <div>Recipes by Email</div>
                <p>Receive <strong>free</strong> expert tips &amp; inspiring weekly recipes right to your inbox.</p>
            </div>
            
        </div>

        <div id="recipe-by-email-form" role="form" class="form validate">
            <input name="main_0$contentrightrail_3$rbe_email" type="text" id="main_0_contentrightrail_3_rbe_email" class="recipe-email" data-rule-required="true" data-rule-email="true" placeholder="Enter Email Address" data-msg-required="Please enter your Email Address" data-msg-email="Invalid Format" />
            <button id="main_0_contentrightrail_3_rbe_submit" type="button" class="email-submit" data-modalURL="/email-sign-up.aspx">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="30px" height="30px" viewbox="0 0 30 30" style="enable-background:new 0 0 30 30;" xml:space="preserve"><path d="M15 0C6.7 0 0 6.7 0 15s6.7 15 15 15s15-6.7 15-15S23.3 0 15 0"/><path class="st0" d="M20.1 16.2H7.8c-0.3 0-0.6-0.3-0.6-0.6v-2.4c0-0.3 0.3-0.6 0.6-0.6h12.3c0.3 0 0.6 0.3 0.6 0.6v2.4 C20.7 15.9 20.4 16.2 20.1 16.2"/><path class="st0" d="M22.5 14l-6.7-6.7c-0.2-0.2-0.6-0.2-0.8 0L13.3 9c-0.2 0.2-0.2 0.6 0 0.8l4.6 4.6L13.3 19 c-0.2 0.2-0.2 0.6 0 0.8l1.7 1.7c0.2 0.2 0.6 0.2 0.8 0l6.7-6.7c0.1-0.1 0.2-0.3 0.2-0.4C22.6 14.3 22.6 14.1 22.5 14"/></svg></button>
            <div class="email-success"></div>
        </div>
    </div>
</div>


<div id="div-gpt-square-fixed-3" data-tier="4" style="margin-bottom:20px"></div>

<div class="row">
<div class="col-xs-12">
    <div class="card-cta">
    
                    <input type="hidden" class="genericCtasubscribeMobileUrl" value="https://w1.buysub.com/servlet/OrdersGateway?cds_mag_code=KFF&amp;cds_page_id=118286&amp;cds_response_key=I168KFMB8"   />
                   
                    <a href='https://w1.buysub.com/servlet/OrdersGateway?cds_mag_code=KFF&amp;cds_page_id=60672&amp;cds_response_key=I168KFRRA' class='genericCtaSubscribe' target='_blank' >
	    <div class="card-shadow"></div>
	    <div class="inner-card">
		    <div class="card-top">
			    <h3><span></span><br></h3>
			    
		    </div>
		    <div class="card-bottom clearfix">
		        <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" class="version-big" alt="Save BIG + get a FREE COOKBOOK!" title="Save BIG + get a FREE COOKBOOK!" data-yo-delayType="lazy" data-yo-src="//cdn-us-ec.yottaa.net/5637a31d312e585f7100086c/www.kraftrecipes.com/v~22.121/-/media/images/kr/imagerepository/mar18/foodandfamily/sp18_ff_rr_300x200.jpg?h=200&amp;w=300&amp;la=en&amp;hash=DBF59F5040281A32A02EE575269EE3BB5F7202D8&amp;yocs=1V_1Y_2b_&amp;yoloc=us" />

                <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" class="version-small" alt="Save BIG + get a FREE COOKBOOK!" title="Save BIG + get a FREE COOKBOOK!" data-yo-delayType="lazy" data-yo-src="//cdn-us-ec.yottaa.net/5637a31d312e585f7100086c/www.kraftrecipes.com/v~22.121/-/media/images/kr/imagerepository/mar18/foodandfamily/sp18_ff_rr_300x200.jpg?h=200&amp;w=300&amp;la=en&amp;hash=DBF59F5040281A32A02EE575269EE3BB5F7202D8&amp;yocs=1V_1Y_2b_&amp;yoloc=us" />
		    </div>		
	    </div>
        </a>
    </div>
</div>
</div>

<div class="tracking-pixel">
    <style type="text/css">
	@media (min-width: 768px){
	.recipesLanding .category-list .card-cta .inner-card{height: 193px;}
		.recipesLanding .category-list .card-cta .inner-card .card-bottom{height: 193px;}
	}
</style>

	<script>
//Tile: Food and Family - Category Pages
		$('img[title="Save BIG + get a FREE COOKBOOK!"]').parent().prev().css("display", "none");
		$('img[title="Save BIG + get a FREE COOKBOOK!"]').parent().css("padding", "0px").css("background-color","#fef8a2" );
		$('img[title="Save BIG + get a FREE COOKBOOK!"]').css("width", "300px");
</script>
    
</div>

<div class="row">
<div class="col-xs-12">
    <div class="card-cta">
    
	    <div class="card-shadow"></div>
	    <div class="inner-card">
		    <div class="card-top">
			    <h3><span></span><br>Easter Menus, Recipes & More</h3>
			    <style type="text/css"> 	.right-rail .card-cta .inner-card .card-top {padding: 0 20px;} 	.listiclemodule .listicle-copy{text-align: left; padding:10px 0;}	 	.listiclemodule ul li{ text-align: left;} 	.listiclemodule .divider.dotted{margin-bottom:10px;} 	.right-rail .card-cta .inner-card .card-top h3 {padding-top:0px;} 	.listiclemodule ul.left{margin-bottom: 0px;} .listiclemodule ul.right{margin-bottom: 10px;} 	 /*fix right rail */	 .right-rail .card-bottom.clearfix img{padding-bottom: 4px;} .right-rail .card-details{min-height:97px;}  @media (max-width: 767px){ .right-rail .card-cta .inner-card .card-bottom img { width: 100%; padding-bottom:0px;} }  </style>   <div class="listiclemodule"> <div class="listicle-copy">Celebrate Easter with our carefully curated springtime recipes. Find seasonal veggies and favorites, brunchtime-worthy desserts and more to tempt taste buds at the Easter table.</div>             <div class="divider dotted"></div> <div class="row"> <div class="col-sm-6"> <ul class="left">   <li><a href="/tips-ideas/holiday-list-ideas/easter-dinner-menu-ideas.aspx">Easter Dinner Menu Ideas</a></li>   <li><a href="/tips-ideas/holiday-list-ideas/9-easter-brunch-friendly-philadelphia-cream-cheese-desserts.aspx">Easter Brunch-Friendly PHILADELPHIA Desserts</a></li> </ul> </div>                          <div class="col-md-6"> <ul class="right">   <li><a href="/tips-ideas/holiday-list-ideas/spring-vegetables.aspx">Springtime Vegetable Recipes</a></li>   <li><a href="/tips-ideas/holiday-list-ideas/our-favorite-april-recipes.aspx">April Favorites</a></li>  </ul> </div> </div> </div>
		    </div>
		    <div class="card-bottom clearfix">
		        <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" class="version-big" alt="PHILADELPHIA Easter Mini Cheesecakes" title="PHILADELPHIA Easter Mini Cheesecakes" data-yo-delayType="lazy" data-yo-src="http://cdn-us-ec.yottaa.net/5637a31d312e585f7100086c/www.kraftrecipes.com/v~22.121/-/media/assets/kr-feb-seo/philadelphia-easter-mini-cheesecakes-174451-642x428.jpg?db=web&amp;h=428&amp;w=642&amp;la=en&amp;hash=65BB862C69213EF54D8879FACF26F4D7AE1DDB5D&amp;yocs=1V_1Y_2b_&amp;yoloc=us" />

                <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" class="version-small" alt="PHILADELPHIA Easter Mini Cheesecakes" title="PHILADELPHIA Easter Mini Cheesecakes" data-yo-delayType="lazy" data-yo-src="http://cdn-us-ec.yottaa.net/5637a31d312e585f7100086c/www.kraftrecipes.com/v~22.121/-/media/assets/kr-feb-seo/philadelphia-easter-mini-cheesecakes-174451-580x250.jpg?db=web&amp;h=250&amp;w=580&amp;la=en&amp;hash=FDA6C8219BCD057DCCCA9C439DE26B8A3B2778A2&amp;yocs=1V_1Y_2b_&amp;yoloc=us" />
		    </div>		
	    </div>
        
    </div>
</div>
</div>

<div class="tracking-pixel">
    
    
</div>


				<div class="col-xs-12">
					
				</div>
			</div>
		</aside>
	</div>
</div>

<!-- Adding in stuff for the automony crawl -->
<div style="display:none">
    <span class="autonomytitle">Brownie Recipes and Blondie Recipes</span>
    <span class="autonomydescription"><div>
Earn some brownie points&mdash;or <a href="http://www.kraftrecipes.com/recipes/caramel-swirl-blondies-56934.aspx">blondie</a> points&mdash;with one of these brownie or blondie recipes! Wondering what the difference is between brownie and blondie recipes? Generally, brownies are made with cocoa; blondies are brown-sugar-based. If you're leaning toward <a href="http://www.kraftrecipes.com/recipes/dessert/brownie-recipes/main.aspx">brownies</a>, check out our <a href="http://www.kraftrecipes.com/recipes/dessert/chocolate-center/chocolate-101-workshop.aspx">chocolate baking tips</a>. It may also help (for either brownie or blondie recipes) to visit our <a href="tips/cooking-videos/kitchen-basics-videos/how-to-melt-caramels.aspx">how to melt caramels video</a>. For more <a href="http://www.kraftrecipes.com/recipes/dessert/potluck-desserts.aspx">great potluck dessert</a> ideas, try one of our <a href="http://www.kraftrecipes.com/recipes/dessert/bars-squares-recipes.aspx">bars and square desserts</a>.
</div></span>
    <span class="autonomyimageurl">/-/media/assets/2018-spring/blonde-coffee-blondies-211778-642x428.jpg</span>
</div>
<script type="application/ld+json">{
"@context": "http://schema.org/",
"@type": "ItemList",
"mainEntityOfPage": {
"@type": "CollectionPage",
"@id": "http://www.kraftrecipes.com/recipes/dessert/brownie-blondies.aspx?gclsrc=ds"},
"itemListElement":[
{"@type": "ListItem","Position":1,"url":"http://www.kraftrecipes.com/recipes/bakers-one-bowl-white-chocolate-blonde-brownies-60075.aspx"},
{"@type": "ListItem","Position":2,"url":"http://www.kraftrecipes.com/recipes/maple-blondies-170618.aspx"},
{"@type": "ListItem","Position":3,"url":"http://www.kraftrecipes.com/recipes/cool-whip-walnut-blondies-208110.aspx"},
{"@type": "ListItem","Position":4,"url":"http://www.kraftrecipes.com/recipes/double-chocolate-chunk-blondies-155534.aspx"},
{"@type": "ListItem","Position":5,"url":"http://www.kraftrecipes.com/recipes/bakers-one-bowl-brownies-54515.aspx"},
{"@type": "ListItem","Position":6,"url":"http://www.kraftrecipes.com/recipes/layered-cheesecake-brownies-171896.aspx"},
{"@type": "ListItem","Position":7,"url":"http://www.kraftrecipes.com/recipes/blissful-applesauce-brownies-52910.aspx"},
{"@type": "ListItem","Position":8,"url":"http://www.kraftrecipes.com/recipes/caramel-swirl-blondies-56934.aspx"},
{"@type": "ListItem","Position":9,"url":"http://www.kraftrecipes.com/recipes/salted-caramel-brownies-126811.aspx"},
{"@type": "ListItem","Position":10,"url":"http://www.kraftrecipes.com/recipes/gevalia-espresso-one-bowl-brownies-155565.aspx"},
{"@type": "ListItem","Position":11,"url":"http://www.kraftrecipes.com/recipes/blonde-rocky-road-brownies-51328.aspx"},
{"@type": "ListItem","Position":12,"url":"http://www.kraftrecipes.com/recipes/white-chocolate-blonde-brownies-54026.aspx"}
]}</script>


                
            </div>
        </div>
        <!-- end main -->

        <!-- footer -->
        

<div class="ad-footer floater-wall">
    <div class="wrapper">

    <div id="div-gpt-leaderboard-fixed-1" data-tier="4"></div>

        
	

<!--
alert('False');
alert('RecipeCategory');     
	alert('RecipeCollection'); 
alert('False'); -->
     
 


<!-- Time Rendered: 3/18/2018 7:00:23 PM -->


    </div>
</div>

<footer class="floater-wall">
	<div class="container-fluid">
		<div class="wrapper container-sm-height">
			<div class="row row-sm-height">
				<div class="col-xs-12 col-sm-4 col-sm-height">
					<a href="/" class="logo">            
                       <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="" data-yo-delayType="lazy" data-yo-src="//cdn-us-ec.yottaa.net/5637a31d312e585f7100086c/www.kraftrecipes.com/v~22.121/Assets/images/Kraft_FamilyGreatly_Lockup_Small_NO_BKGRND-117x68.png?yocs=1V_1Y_2b_&amp;yoloc=us">           
                      
			
					</a>
                    

<!-- TODO: can we delete this? -->

        <ul class="social">
    
            <li>
                <a href='http://www.facebook.com/kraftfoods' class='social-facebook' target='_blank' title='Facebook' ><svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="45px" height="45px" viewbox="0 0 45 45" style="enable-background:new 0 0 45 45;" xml:space="preserve">
<circle class="st0" cx="22" cy="22" r="21"/>
<path d="M18.3,23.1v12.4h5.1V23.1h4.2l0.6-4.8h-4.8v-3.1c0-0.8,0.2-1.4,0.5-1.8c0.3-0.4,1-0.6,1.9-0.6h2.6V8.5
	c-0.9-0.1-2.1-0.2-3.8-0.2c-1.9,0-3.4,0.6-4.6,1.7c-1.1,1.1-1.7,2.7-1.7,4.7v3.6h-4.2v4.8H18.3z"/>
</svg></a>
            </li>
    
            <li>
                <a href='http://www.pinterest.com/kraftrecipes/' class='social-pinterest' target='_blank' title='Pinterest' ><svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="45px" height="45px" viewbox="0 0 45 45" style="enable-background:new 0 0 45 45;" xml:space="preserve">
<circle class="st0" cx="22" cy="22" r="21"/>
<path d="M10.5,28.7c1.5,2.2,3.5,3.9,5.9,5c0-1.3,0-2.3,0.2-3.1l1.8-7.4C18.1,22.6,18,21.9,18,21c0-1,0.3-1.8,0.8-2.5
	c0.5-0.7,1.1-1,1.9-1c0.6,0,1,0.2,1.4,0.6c0.3,0.4,0.5,0.9,0.5,1.5c0,0.4-0.1,0.8-0.2,1.3c-0.1,0.5-0.3,1.1-0.5,1.8
	c-0.2,0.7-0.4,1.2-0.5,1.7c-0.2,0.7,0,1.3,0.4,1.9c0.4,0.5,1,0.8,1.7,0.8c1.3,0,2.3-0.7,3.1-2.1c0.8-1.4,1.2-3.1,1.2-5.1
	c0-1.5-0.5-2.8-1.5-3.8c-1-1-2.4-1.5-4.2-1.5c-2,0-3.6,0.6-4.8,1.9c-1.2,1.3-1.9,2.8-1.9,4.6c0,1.1,0.3,2,0.9,2.7
	c0.2,0.2,0.3,0.5,0.2,0.8c0,0.1-0.1,0.2-0.1,0.5c-0.1,0.3-0.1,0.5-0.1,0.5c-0.1,0.4-0.3,0.5-0.7,0.4c-0.9-0.4-1.6-1-2.1-2
	c-0.5-0.9-0.7-2-0.7-3.2c0-0.8,0.1-1.6,0.4-2.4c0.3-0.8,0.6-1.6,1.2-2.3c0.5-0.7,1.2-1.4,1.9-2c0.7-0.6,1.7-1,2.7-1.4
	c1.1-0.3,2.2-0.5,3.5-0.5c1.7,0,3.2,0.4,4.5,1.1c1.3,0.7,2.4,1.7,3.1,2.9c0.7,1.2,1.1,2.4,1.1,3.8c0,1.8-0.3,3.4-0.9,4.8
	c-0.6,1.4-1.5,2.5-2.6,3.3c-1.1,0.8-2.4,1.2-3.8,1.2c-0.7,0-1.4-0.2-2-0.5c-0.6-0.3-1.1-0.7-1.3-1.2c-0.5,2.1-0.8,3.3-1,3.7
	c-0.2,0.8-0.7,1.8-1.4,2.9c1.3,0.4,2.5,0.6,3.9,0.6c2.5,0,4.7-0.6,6.8-1.8c2.1-1.2,3.7-2.9,4.9-5c1.2-2.1,1.8-4.4,1.8-6.8
	c0-2.5-0.6-4.7-1.8-6.8c-1.2-2.1-2.9-3.7-4.9-5c-2.1-1.2-4.4-1.8-6.8-1.8c-2.5,0-4.7,0.6-6.8,1.8c-2.1,1.2-3.7,2.9-4.9,5
	c-1.2,2.1-1.8,4.4-1.8,6.8C8.3,24,9,26.5,10.5,28.7"/>
</svg></a>
            </li>
    
            <li>
                <a href='https://twitter.com/kraftrecipes' class='social-twitter' target='_blank' title='Twitter' ><svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="45px" height="45px" viewbox="0 0 45 45" style="enable-background:new 0 0 45 45;" xml:space="preserve">
<circle class="st0" cx="22" cy="22" r="21"/>
<path d="M16.8,33.5c2,0,3.8-0.3,5.6-1c1.7-0.7,3.2-1.5,4.5-2.7c1.2-1.1,2.3-2.4,3.2-3.8s1.6-3,2-4.5c0.4-1.6,0.7-3.2,0.7-4.7
	c0-0.3,0-0.6,0-0.8c1.1-0.8,2-1.9,2.8-3c-1.1,0.5-2.1,0.8-3.2,0.9c1.2-0.8,2-1.8,2.5-3.2c-1.1,0.7-2.3,1.2-3.5,1.4
	c-1.1-1.2-2.5-1.9-4.1-1.9c-1.5,0-2.9,0.6-3.9,1.7c-1.1,1.1-1.6,2.5-1.6,4.2c0,0.4,0,0.9,0.1,1.3c-2.3-0.1-4.4-0.7-6.4-1.8
	c-2-1.1-3.7-2.5-5.1-4.3c-0.5,0.9-0.8,1.9-0.8,3c0,1,0.2,1.9,0.7,2.8c0.4,0.9,1.1,1.6,1.8,2.1c-0.9,0-1.7-0.3-2.5-0.7v0.1
	c0,1.4,0.4,2.7,1.3,3.7c0.8,1.1,1.9,1.8,3.2,2c-0.5,0.1-1,0.2-1.5,0.2c-0.3,0-0.7,0-1.1-0.1c0.4,1.2,1,2.1,2,2.9
	c1,0.8,2,1.2,3.2,1.2c-2,1.7-4.3,2.5-6.9,2.5c-0.5,0-0.9,0-1.3-0.1C10.9,32.7,13.7,33.5,16.8,33.5"/>
</svg></a>
            </li>
    
            <li>
                <a href='http://kraftrecipes.tumblr.com/' class='social-tumblr' target='_blank' title='Tumblr' ><svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="45px" height="45px" viewbox="0 0 45 45" style="enable-background:new 0 0 45 45;" xml:space="preserve">
<circle class="st0" cx="22" cy="22" r="21"/>
<path d="M16.9,18.9V28c0,1.2,0.1,2.1,0.4,2.7c0.2,0.6,0.7,1.2,1.3,1.8c0.7,0.6,1.4,1,2.3,1.3c0.9,0.3,1.9,0.5,3.1,0.5
	c1.1,0,2-0.1,2.8-0.3c0.8-0.2,1.8-0.6,2.9-1.1v-4.1c-1.3,0.9-2.5,1.3-3.8,1.3c-0.7,0-1.4-0.2-1.9-0.5c-0.4-0.3-0.7-0.6-0.9-1
	c-0.2-0.4-0.2-1.4-0.2-2.9v-6.6h6v-4.1h-6V8.3h-3.6c-0.2,1.3-0.5,2.4-0.9,3.3c-0.4,0.9-1,1.6-1.7,2.2c-0.7,0.6-1.5,1.1-2.5,1.4v3.7
	H16.9z"/>
</svg></a>
            </li>
    
            <li>
                <a href='https://www.instagram.com/kraftrecipes/' class='social-instagram' target='_blank' title='Instagram' ><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="43.1px" height="43.1px" viewbox="0 0 43.1 43.1" style="enable-background:new 0 0 43.1 43.1;" xml:space="preserve"><circle class="st0" cx="21.6" cy="21.6" r="21.1"/><path class="st1" d="M30.7 19.7h-2.1c0.2 0.6 0.2 1.2 0.2 1.8c0 4-3.3 7.3-7.3 7.3c-4 0-7.3-3.3-7.3-7.3c0-0.6 0.1-1.2 0.2-1.8h-2.1 v10.1c0 0.5 0.4 0.9 0.9 0.9h16.5c0.5 0 0.9-0.4 0.9-0.9V19.7z M30.7 13.3c0-0.5-0.4-0.9-0.9-0.9H27c-0.5 0-0.9 0.4-0.9 0.9v2.7 c0 0.5 0.4 0.9 0.9 0.9h2.7c0.5 0 0.9-0.4 0.9-0.9V13.3z M21.6 17C19 17 17 19 17 21.6c0 2.5 2 4.6 4.6 4.6c2.5 0 4.6-2 4.6-4.6 C26.1 19 24.1 17 21.6 17 M30.7 33.5H12.4c-1.5 0-2.7-1.2-2.7-2.7V12.4c0-1.5 1.2-2.7 2.7-2.7h18.3c1.5 0 2.7 1.2 2.7 2.7v18.3 C33.5 32.2 32.2 33.5 30.7 33.5"/></svg></a>
            </li>
    
            <li>
                <a href='https://plus.google.com/+KraftRecipes' target='_blank' title='Google Plus' ><svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="45px" height="45px" viewbox="0 0 45 45" style="enable-background:new 0 0 45 45;" xml:space="preserve">
<circle class="st0" cx="22" cy="22" r="21"/>
<path d="M12.1,32.6c0.6,1,1.5,1.8,2.7,2.3c1.2,0.5,2.5,0.7,3.8,0.7c1.6,0,3.2-0.3,4.6-0.9c1.4-0.6,2.5-1.6,3.3-2.9
	c0.5-0.9,0.7-1.8,0.7-2.8c0-0.9-0.2-1.6-0.5-2.3c-0.3-0.7-0.7-1.3-1.2-1.7c-0.5-0.4-0.9-0.8-1.4-1.2c-0.5-0.4-0.9-0.7-1.2-1.1
	c-0.3-0.4-0.5-0.8-0.5-1.2c0-0.4,0.1-0.7,0.4-1.1c0.3-0.3,0.6-0.7,0.9-1c0.4-0.3,0.7-0.7,1.1-1.1c0.4-0.4,0.7-0.9,0.9-1.5
	c0.3-0.6,0.4-1.3,0.4-2.1c0-1-0.2-1.9-0.6-2.6c-0.4-0.8-1-1.5-1.7-2.2h2L28,8.3h-6.5c-1.2,0-2.3,0.2-3.4,0.5c-1.1,0.3-2,0.9-2.8,1.6
	c-0.7,0.6-1.2,1.3-1.5,2.1c-0.4,0.8-0.6,1.7-0.6,2.6c0,1.6,0.5,2.9,1.6,4c1.1,1.1,2.3,1.6,3.9,1.6c0.2,0,0.6,0,1.1-0.1
	c-0.2,0.5-0.3,1-0.3,1.4c0,0.4,0.1,0.8,0.2,1.2c0.2,0.3,0.4,0.8,0.7,1.2c-2.8,0.2-4.9,0.7-6.3,1.6c-0.8,0.5-1.4,1.1-1.8,1.9
	c-0.5,0.8-0.7,1.6-0.7,2.5C11.5,31.2,11.7,31.9,12.1,32.6 M14.8,27.9c0.3-0.5,0.6-0.9,1.1-1.2c0.4-0.3,0.9-0.6,1.5-0.8
	s1.1-0.3,1.7-0.4c0.5-0.1,1.1-0.1,1.6-0.1c0.3,0,0.6,0,0.7,0c0,0,0.2,0.2,0.6,0.4c0.3,0.3,0.6,0.4,0.6,0.5c0.1,0.1,0.3,0.2,0.6,0.5
	c0.3,0.3,0.5,0.4,0.6,0.6s0.3,0.3,0.5,0.6c0.2,0.3,0.3,0.5,0.4,0.7c0.1,0.2,0.2,0.4,0.2,0.7c0.1,0.3,0.1,0.5,0.1,0.8
	c0,0.7-0.1,1.3-0.4,1.8c-0.3,0.5-0.7,0.9-1.1,1.2c-0.5,0.3-1,0.5-1.5,0.6c-0.6,0.1-1.1,0.2-1.7,0.2c-0.7,0-1.3-0.1-2-0.2
	c-0.6-0.2-1.3-0.4-1.9-0.7c-0.6-0.3-1.1-0.8-1.4-1.4c-0.4-0.6-0.5-1.3-0.5-2C14.4,29,14.6,28.5,14.8,27.9 M16.8,10.8
	c0.3-0.4,0.6-0.6,1-0.9c0.4-0.2,0.8-0.3,1.3-0.3c0.7,0,1.3,0.2,1.8,0.7c0.5,0.4,1,1,1.3,1.7s0.6,1.4,0.8,2.1s0.3,1.4,0.3,2
	c0,1.1-0.3,2-0.8,2.6c-0.3,0.3-0.6,0.5-1,0.7c-0.4,0.2-0.8,0.3-1.2,0.3c-0.5,0-1-0.1-1.5-0.4c-0.5-0.3-0.9-0.6-1.2-1.1
	c-0.3-0.4-0.6-1-0.8-1.5c-0.2-0.6-0.4-1.1-0.5-1.7c-0.1-0.6-0.2-1.1-0.2-1.6C16.1,12.3,16.3,11.4,16.8,10.8 M31.2,21.4V25h1.6v-3.6
	h3.3v-1.8h-3.3v-3.6h-1.6v3.6h-3.3v1.8H31.2z"/>
</svg></a>
            </li>
    
            <li>
                <a href='http://www.youtube.com/kraftfoods' class='social-youtube' target='_blank' title='YouTube' ><svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="45px" height="45px" viewbox="0 0 45 45" style="enable-background:new 0 0 45 45;" xml:space="preserve">
<circle class="st0" cx="22" cy="22" r="21"/>
<path d="M11.9,32.3c0.1,0.6,0.4,1.1,0.8,1.5c0.4,0.4,0.9,0.6,1.4,0.7c1.7,0.2,4.2,0.3,7.5,0.3c3.4,0,5.9-0.1,7.5-0.3
	c0.5-0.1,1-0.3,1.4-0.7c0.4-0.4,0.7-0.9,0.8-1.5c0.2-1.2,0.4-2.9,0.4-5.3c0-2.4-0.1-4.2-0.4-5.3c-0.1-0.6-0.4-1.1-0.8-1.5
	s-0.9-0.6-1.4-0.7c-1.7-0.2-4.2-0.3-7.5-0.3c-3.4,0-5.9,0.1-7.5,0.3c-0.5,0.1-1,0.3-1.4,0.7c-0.4,0.4-0.7,0.9-0.8,1.5
	c-0.2,1.2-0.4,2.9-0.4,5.3C11.5,29.4,11.6,31.2,11.9,32.3 M13,21.8h4.2v1.4h-1.5v8.6h-1.4v-8.6H13V21.8z M15.6,10.5
	c0.4,1.4,0.7,2.5,0.8,3.2v4.1h1.4v-4.1l1.6-6.1h-1.4l-0.9,4l-1-4l-1.4,0C15,8.5,15.3,9.4,15.6,10.5 M17.4,24.4h1.2v5.5
	c0,0.3,0,0.5,0,0.5c0,0.2,0.1,0.3,0.3,0.3c0.2,0,0.5-0.2,0.8-0.6v-5.7h1.2v7.5h-1.2V31c-0.5,0.6-0.9,0.9-1.4,0.9
	c-0.4,0-0.7-0.2-0.8-0.6c-0.1-0.2-0.1-0.6-0.1-1.1V24.4z M19.9,17.1c0.3,0.5,0.8,0.8,1.4,0.8c0.6,0,1.1-0.3,1.4-0.8
	c0.3-0.4,0.4-1,0.4-1.8v-2.7c0-0.8-0.1-1.4-0.4-1.8c-0.3-0.5-0.8-0.8-1.4-0.8c-0.6,0-1.1,0.3-1.4,0.8c-0.3,0.4-0.4,1-0.4,1.8v2.7
	C19.5,16.1,19.6,16.7,19.9,17.1 M20.7,12.4c0-0.7,0.2-1,0.6-1c0.4,0,0.6,0.3,0.6,1v3.2c0,0.7-0.2,1.1-0.6,1.1
	c-0.4,0-0.6-0.4-0.6-1.1V12.4z M22,21.8h1.2v3.3c0.4-0.5,0.8-0.8,1.3-0.8c0.5,0,0.8,0.3,1,0.9c0.1,0.3,0.1,0.8,0.1,1.5v3
	c0,0.7,0,1.2-0.1,1.5c-0.2,0.6-0.5,0.8-1,0.8c-0.4,0-0.9-0.3-1.3-0.8v0.7H22V21.8z M23.8,30.7c0.4,0,0.5-0.3,0.5-1v-3.2
	c0-0.7-0.2-1-0.5-1c-0.2,0-0.4,0.1-0.6,0.3v4.6C23.4,30.6,23.6,30.7,23.8,30.7 M24.2,17.3c0.1,0.4,0.4,0.6,0.8,0.6
	c0.5,0,0.9-0.3,1.4-0.9v0.8h1.2v-7.6h-1.2V16c-0.3,0.4-0.5,0.7-0.8,0.7c-0.2,0-0.3-0.1-0.3-0.3c0,0,0-0.2,0-0.5v-5.6h-1.2v6
	C24.1,16.7,24.1,17.1,24.2,17.3 M26.5,26.8c0-0.8,0.1-1.4,0.4-1.8c0.4-0.5,0.8-0.8,1.5-0.8c0.6,0,1.1,0.3,1.4,0.8
	c0.2,0.4,0.4,1,0.4,1.8v1.6h-2.4v1.3c0,0.7,0.2,1,0.6,1c0.3,0,0.5-0.2,0.5-0.5c0-0.1,0-0.4,0-0.9h1.2v0.2c0,0.5,0,0.8,0,0.9
	c0,0.3-0.1,0.5-0.3,0.8C29.5,31.7,29,32,28.3,32c-0.6,0-1.1-0.3-1.5-0.8c-0.3-0.4-0.4-1-0.4-1.8V26.8z M28.9,27.2v-0.7
	c0-0.7-0.2-1-0.6-1c-0.4,0-0.6,0.3-0.6,1v0.7H28.9z"/>
</svg></a>
            </li>
    
        </ul>
    		
				</div>
				<div class="hidden-xs divider dotted vertical col-sm-height"></div>
                                
        <div class="hidden-xs col-sm-2 col-sm-height ">
	        <div class="gutter first">
		        <div class="header4">Help & Support</div>
                   
                        <ul>
                    
                        
                        
                            <li>
                                <a href='http://kraftfoods.custhelp.com/app/answers/list' target='_blank' >FAQs</a>
                               
                            </li>
                        
                    
                        
                        
                            <li>
                                <a href='http://kraftfoods.custhelp.com/app/answers/list' target='_blank' >Contact Us</a>
                               
                            </li>
                        
                    
                        
                        
                            <li>
                                <a href='/about/site-map.aspx' >Site Map</a>
                               
                            </li>
                        
                    
                        </ul>
                          
	        </div>
        </div>
                    
        <div class="hidden-xs col-sm-2 col-sm-height footer-sm-wide">
	        <div class="gutter ">
		        <div class="header4">Get To Know Kraft</div>
                   
                        <ul>
                    
                        
                        
                            <li>
                                <a href='/about/aboutkraft.aspx' >About Kraft</a>
                               
                            </li>
                        
                    
                        
                        
                            <li>
                                <a href='/about/useragreement.aspx' >Terms of Use</a>
                               
                            </li>
                        
                    
                        
                        
                            <li>
                                <a href='http://ir.kraftfoodsgroup.com/' target='_blank' >Investor Relations</a>
                               
                            </li>
                        
                    
                        
                        
                            <li>
                                <a href='http://www.kraftcareers.com/en-us/' target='_blank' >Kraft Careers</a>
                               
                            </li>
                        
                    
                        
                        
                            <li>
                                <a href='https://www.linkedin.com/company/the-kraft-heinz-company' target='_blank' title='Kraft Heinz LinkedIn' >Kraft Heinz LinkedIn</a>
                               
                            </li>
                        
                    
                        
                        
                            <li>
                                <a href='/about/privacynotice.aspx' >Privacy Notice</a>
                               
                            </li>
                        
                    
                        
                        
                            <li>
                                <a href='http://www.kraftrecipes.com/about/PrivacyNotice.aspx#12' title='Interest Based Ads' >Interest Based Ads</a>
                               
                            </li>
                        
                    
                        
                        
                            <li>
                                <a href='/about/advertise-with-us.aspx' >Advertise With Us</a>
                               
                            </li>
                        
                    
                        </ul>
                          
	        </div>
        </div>
                    
        <div class="hidden-xs col-sm-2 col-sm-height footer-sm-narrow">
	        <div class="gutter ">
		        <div class="header4">Kraft Sites</div>
                   
                        <ul>
                    
                        
                        
                            <li>
                                <a href='http://www.kraftfoodsgroup.com/home/index.aspx' target='_blank' >Kraft Heinz Corporate</a>
                               
                            </li>
                        
                    
                        
                        
                            <li>
                                <a href='http://www.kraftrecipes.com/home.aspx' target='_blank' >Kraft Recipes</a>
                               
                            </li>
                        
                    
                        
                        
                            <li>
                                <a href='http://www.comidakraft.com/sp/home.aspx' target='_blank' >Comida Kraft</a>
                               
                            </li>
                        
                    
                        
                        
                            <li>
                                <a href='http://www.kraftcanada.com/' target='_blank' >Kraft Canada</a>
                               
                            </li>
                        
                    
                        
                        
                            <li>
                                <a href='http://www.kraftfoodservice.com/welcome.aspx' target='_blank' >Foodservice</a>
                               
                            </li>
                        
                    
                        
                        
                            <li>
                                <a href='/about/otherkraftfoodsites.aspx' >Other Kraft Heinz Sites</a>
                               
                            </li>
                        
                    
                        </ul>
                          
	        </div>
        </div>
                    
        <div class="hidden-xs col-sm-2 col-sm-height footer-sm-wide">
	        <div class="gutter ">
		        <div class="header4">Get Us On The Go</div>
                   
                        <ul>
                    
                        
                        
                            <li>
                                <a href='http://www.kraftrecipes.com/?promptRegistration=true' >Recipe By Email</a>
                               
                            </li>
                        
                    
                        
                        
                            <li>
                                <a href='https://w1.buysub.com/servlet/OrdersGateway?cds_mag_code=KFF&amp;cds_page_id=60672&amp;cds_response_key=I168KFGBR' target='_blank' >Subscribe to Magazine</a>
                               
                            </li>
                        
                    
                        
                            <li><a rel="nofollow" class="sign-in" data-modalurl="/account/sign-in.aspx">Sign In/Register</a></li>
                        
                        
                    
                        
                        
                    
                        </ul>
                          
	        </div>
        </div>
    

            </div>
		</div>
	</div>
    <div class="container-fluid footer-secondary-nav">
        
<div class="wrapper">
    <div class="row">
	    <div class="col-xs-12">
            
                <ul class="mnalinks-alignment">
                    <li> <span class="segment-title">All Recipes :</span></li>
                
                    <li>
                            <a href='http://allrecipes.com' target='_blank' rel='nofollow' >Allrecipes.com</a>
                    </li>
                
                    <li>
                            <a href='http://recipe.com' target='_blank' rel='nofollow' >Recipe.com</a>
                    </li>
                
                    <li>
                            <a href='http://eatingwell.com' target='_blank' rel='nofollow' >Eating Well</a>
                    </li>
                
                    <li>
                            <a href='http://rachaelraymag.com' target='_blank' rel='nofollow' >Rachael Ray Magazine</a>
                    </li>
                
                    <li>
                            <a href='http://diabeticlivingonline.com' target='_blank' rel='nofollow' >Diabetic Living</a>
                    </li>
                
                    <li>
                            <a href='http://eatthis.com' target='_blank' rel='nofollow' >Eat This, Not That</a>
                    </li>
                
                    <li>
                            <a href='http://kraftrecipes.com' target='_blank' >Kraft Recipes</a>
                    </li>
                
                </ul>
                
        </div>
    </div>
</div>
    </div>
	<div class="container-fluid footer-secondary-nav">
		<div class="divider dotted"></div>
		<div class="wrapper">
			<div class="row">
				<div class="col-xs-12 col-sm-8" style="width:76%;">
                    
                            <ul>
                        
                                <li style="margin-right:10px;">
                                     <a href='http://www.kraftrecipes.com/contactus.aspx' target='_blank' ><span style="font-size: 14px !important;">Contact Us</span></a>
                                </li>
                        
                                <li style="margin-right:10px;">
                                     <a href='http://www.kraftrecipes.com/about/UserAgreement.aspx' ><span style="font-size: 14px !important;">Terms of Use</span></a>
                                </li>
                        
                                <li style="margin-right:10px;">
                                     <a href='/about/PrivacyNotice.aspx' ><span style="font-size: 14px !important;">Privacy</span></a>
                                </li>
                        
                                <li style="margin-right:10px;">
                                     <a href='/products/productlocator.aspx' ><span style="font-size: 14px !important;">Product Locator</span></a>
                                </li>
                        
                            </ul>
                        
				</div>
				<div class="col-xs-12 col-sm-4" style="width:24%;">
					<div class="copyright">&copy; 2018 Kraft Foods <br> H.J. Heinz Company Brands LLC.<br> All Rights Reserved</div>
				</div>
			</div>
		</div>
	</div>
</footer>


<div class="fixed-toolbar visible-xs-block">
    

<!-- start fpo -->
<div class="social-bar-toggle-wrapper">
	<div class="social-bar-toggle">
		<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="15.9px" height="28.2px" viewbox="0 0 15.9 28.2" style="enable-background:new 0 0 15.9 28.2;" xml:space="preserve"><path class="st0" d="M0.3 1.2l0.9-0.9c0.4-0.4 0.9-0.4 1.3 0l13.2 13.2c0.4 0.4 0.4 0.9 0 1.3L2.5 27.9c-0.4 0.4-0.9 0.4-1.3 0 L0.3 27c-0.4-0.4-0.4-0.9 0-1.3l11-11c0.4-0.4 0.4-0.9 0-1.3l-11-11C-0.1 2.1-0.1 1.5 0.3 1.2"/></svg>
        <!--This need to be coming from sitecore -->
        <span class="morelink">Menu</span>
	</div>
</div>
<div class="social-bar">
	<div id="addthis-toolbox-mobile" class="wrapper clearfix">
		

<div class="fb-like" data-layout="button" data-action="like" data-show-faces="false" data-share="false"></div>
	</div>
</div>
<!-- end fpo -->
	<div class="ad-leaderboard">
		<div class="wrapper">
>
		      
		</div>
	</div>
</div>


<div class="kraft-modal modal fade">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-content-inner">
				<div class="modal-header clearfix">
					<button type="button" class="close" data-dismiss="modal" id="lbp-close">
						<!-- <span aria-hidden="true">&times;</span>
						<span class="sr-only">Close</span> -->
						<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" width="22px" height="22px" viewbox="0 0 22 22" style="enable-background:new 0 0 22 22;" xml:space="preserve"><path d="M20.5 5.5c-1-1.7-2.3-3-4-4C14.8 0.5 13 0 11 0C9 0 7.2 0.5 5.5 1.5c-1.7 1-3 2.3-4 4C0.5 7.2 0 9 0 11c0 2 0.5 3.8 1.5 5.5 c1 1.7 2.3 3 4 4C7.2 21.5 9 22 11 22c2 0 3.8-0.5 5.5-1.5c1.7-1 3-2.3 4-4c1-1.7 1.5-3.5 1.5-5.5C22 9 21.5 7.2 20.5 5.5 M16.7 14.8c0.2 0.2 0.2 0.6 0 0.8l-1.1 1.1c-0.2 0.2-0.6 0.2-0.8 0L11 12.9l-3.8 3.8C7 17 6.6 17 6.3 16.7l-1.1-1.1 C5 15.4 5 15 5.3 14.8L9.1 11L5.3 7.2C5 7 5 6.6 5.3 6.3l1.1-1.1C6.6 5 7 5 7.2 5.3L11 9.1l3.8-3.8C15 5 15.4 5 15.7 5.3l1.1 1.1 C17 6.6 17 7 16.7 7.2L12.9 11L16.7 14.8z"/></svg>
						<span>Close</span>	
					</button>
				</div>

				<div class="modal-body">
					<!-- content goes here -->
				</div>				
			</div>
		</div>
	</div>
</div>

    </form>
     
     <!-- subscribe FF based on view port switching to mobile subscribe page -->	
   	<script type="text/javascript" src="//cdn-us-ec.yottaa.net/5637a31d312e585f7100086c/www.kraftrecipes.com/v~22.121/Assets/js/components/Kraft.subscribeFF.js?yocs=1V_1Y_25_&amp;yoloc=us"></script>
    

<!-- Google Ad Code-->


    <script>

     


        (function (window) {


            window.adService = {

           
                mobileAds: false, /* set by user-agent in most cases */

                unitValues: {

                   

                    channel: 'recipes', /* Set to the top level category id/s1 */

                    parent: 'meal', /* Set to the secondary level category id/s2 */

                    child: 'dessert' /* Set to the tertiary level category id/s3 */

                },

                pageTargetingValues: { /* Additional key-values can be added */

	
                    id: 'brownie-blondies',
                    
                    kw: [''],
                    
                    type:'category',
                    
                        category: 'Brownie_Recipes_and_Blondie_Recipes', /* STAN 1231 fix for #1 changing Collection to category on all pages */
                       
                    s4: 'brownie-blondies', /* extra custom criteria for the s4 level */
                    pid: '4244b578ffb54d10b396143ddca2de68' ,/*Set to a page-specific unique id/pid */
                                        
                },
                allTiersAllTheTime: true /* Moving this code here to test without appeding parameter in url STAN 945Added for Karma conversion to tiers*/

            };


            var karmaCore = document.createElement("script");

            karmaCore.src = "//karma.mdpcdn.com/service/js-min/karma.footer.js";

            var node = document.getElementsByTagName("script")[0];

            node.parentNode.insertBefore(karmaCore, node);



        })(window);

</script>



    <script type="yo/sequence/lazy/.social-bar" data-yo-src="https://connect.facebook.net/en_US/all.js"></script>
   
    <!-- third party js -->
    <script type="text/javascript">
        kraft.facebookAppId = '130791333621603';
    </script>
    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-54ad88b263c25932"></script>
    <!-- grocery server js -->
<!-- grocery server js -->
        <script type="text/javascript"> var _debugMode = true;</script>
        <script type="text/javascript" src=""></script>
    
        
        <script type="text/javascript" src=""></script>
        <script type="text/javascript">
            var gsSessionServiceUrl = "gsid/create";
        </script>
  
        <script type="text/javascript" src="//cdn-us-ec.yottaa.net/5637a31d312e585f7100086c/www.kraftrecipes.com/v~22.121/assets/js/kraft.gs.js?yocs=1V_1Y_25_&amp;yoloc=us"></script>
          
                 <script type="text/javascript"> var hasGsPlugin = false;</script>
             
        
    <!-- Template-specific javascript -->
    
    
<script type="text/javascript" src="//cdn-us-ec.yottaa.net/5637a31d312e585f7100086c/www.kraftrecipes.com/v~22.121/assets/js/templates/kraft.recipeList.js?636569922985679017&amp;yocs=1V_1Y_25_&amp;yoloc=us"></script>

<!-- Bazaarvoice Inline Ratings -->
<script>
    $(document).ready(function () {
        CreateAndExecuteBVInline();
        
    });
    function CreateAndExecuteBVInline() {

        var count = 0;
        var pidsSTR = "$BV.ui('rr', 'inline_ratings',{productIds : {";
        $('.rate-review').each(function (i) {
            if (count > 0) {
                pidsSTR += ",\r\n'" + $(this).data("pid") + "':{\r\nurl:'" + $(this).data("url") + "',\r\n containerId : '" + $(this).find(':first-child').attr("id") + "'}";
            }
            else {
                pidsSTR += "\r\n'" + $(this).data("pid") + "':{\r\nurl:'" + $(this).data("url") + "',\r\n containerId : '" + $(this).find(':first-child').attr("id") + "'}";
            }
            count++;
        });
        pidsSTR += "},containerPrefix : 'BVRRInlineRating'});";
        console.warn(pidsSTR);
        eval(pidsSTR);
        setTimeout(function () {
            //wait 2 secods before calling
            backfillEmptyBV();
        }, 2000);
    }


    function backfillEmptyBV() {

        var count = 0;
        var idsSTR;
        $('.rate-review').each(function (i) {
            if ($(this).find(':first-child').text().length == 0) {
                //Find 	
                $(this).find(':first-child').text(copyBVRatingContent($(this).find(':first-child').attr('id'), $(this).data("pid")));
                count++;
            }
        });

    }
    function copyBVRatingContent(copyTo, pid) {
        var content;
        $('.rate-review').each(function (i) {
            if ($(this).data("pid") == pid && $(this).find(':first-child').text().length > 0) {
                $('#' + copyTo).html($(this).find(':first-child').html());
            }
        });
    }
</script>

    
<script type="text/javascript">
    socialBarText = {
        pinterest: "Pin It",
        facebookShare: "Share",
        twitterShare: "Share",
        googleShare: "Share",
        email: "Email",
        print: "Print",
        expanded: "More Options"
    };
</script>
    
	<script type="text/javascript">	   
	        if (window.innerWidth < 767) {
	            subscribeNavFF();
	        }
	    
 </script> 



<script src="//cdn-us-ec.yottaa.net/5637a31d312e585f7100086c/www.kraftrecipes.com/v~22.121/Assets/js/plugins/brightcove.coremetrics.plugin.js?yocs=1V_1Y_25_&amp;yoloc=us"></script>

     <noscript>
        <iframe src="//s.thebrighttag.com/iframe?ctx=KSNUeWE" width="1" height="1" frameborder="0" scrolling="no" marginheight="0" style="display: none;"></iframe>
    </noscript>
    
<!-- CCr139 Ghostrey CA Compliance Tool Intergration for Coockie Notification -->

    <div id="mobile-filter-container" tabindex="0"></div>

    <!-- Adding the Nextopia scripts for Ingridient auto suggest on Whats on Hand Module -->
    
    <link rel="stylesheet" href="http://cdn.nextopia.net/kraft/nxt.autocomplete.css" />
<script type="text/javascript" src="http://cdn.nextopia.net/kraft/nxt.autocomplete.js"></script>
         
     <script type="text/javascript" src="http://cdn.nextopia.net/kraft/7a1fdde83d7af719db1621c0ffc9cabb-terms.js"></script>
    
<link href="//cdn-us-ec.yottaa.net/5637a31d312e585f7100086c/www.kraftrecipes.com/v~22.121/assets/plugin/swiper/3.4.0/css/swiper.min.css?yocs=1Y_&amp;yoloc=us" rel="stylesheet" />
<script type="text/javascript">
    new nxtAutocomplete('.ingredientName', terms);
</script>
   

</body>
</html>
