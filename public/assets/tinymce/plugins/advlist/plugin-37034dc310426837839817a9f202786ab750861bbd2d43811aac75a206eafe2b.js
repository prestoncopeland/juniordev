tinymce.PluginManager.add("advlist",function(t){function e(t,e){var n=[];return tinymce.each(e.split(/[ ,]/),function(t){n.push({text:t.replace(/\-/g," ").replace(/\b\w/g,function(t){return t.toUpperCase()}),data:"default"==t?"":t})}),n}function n(e,n){var l,o=t.dom,a=t.selection;l=o.getParent(a.getNode(),"ol,ul"),l&&l.nodeName==e&&n!==!1||t.execCommand("UL"==e?"InsertUnorderedList":"InsertOrderedList"),n=n===!1?i[e]:n,i[e]=n,l=o.getParent(a.getNode(),"ol,ul"),l&&(o.setStyle(l,"listStyleType",n?n:null),l.removeAttribute("data-mce-style")),t.focus()}function l(e){var n=t.dom.getStyle(t.dom.getParent(t.selection.getNode(),"ol,ul"),"listStyleType")||"";e.control.items().each(function(t){t.active(t.settings.data===n)})}var o,a,i={};o=e("OL",t.getParam("advlist_number_styles","default,lower-alpha,lower-greek,lower-roman,upper-alpha,upper-roman")),a=e("UL",t.getParam("advlist_bullet_styles","default,circle,disc,square")),t.addButton("numlist",{type:"splitbutton",tooltip:"Numbered list",menu:o,onshow:l,onselect:function(t){n("OL",t.control.settings.data)},onclick:function(){n("OL",!1)}}),t.addButton("bullist",{type:"splitbutton",tooltip:"Bullet list",menu:a,onshow:l,onselect:function(t){n("UL",t.control.settings.data)},onclick:function(){n("UL",!1)}})});