<#include "inc/functions.ftl">
<#include "inc/global-functions.ftl">
<head>
<meta property="og:title" content="${rc.getMessage("page.search.title")}" />
<meta property="og:locale" content="${rc.getLocale().getLanguage()}" />
<meta property="og:type" content="website" />
<title>${rc.getMessage("page.search.title")}</title>
<@cssAsset fileName="occportal" version=page.currentVersion! useMinified=false/>
<link rel="dns-prefetch" href="${tilerProtocol}://${tilerDomain}"/>
<link rel="prefetch" href="${tilerProtocol}://${tilerDomain}"/>
</head>
<div class="content-wrapper fullscreen full_height">
  <#include "inc/control.ftl">
  <div id="view" class="clear_fix">
    <div class="nav_container">

    <#if page.allRecordsTargeted >
      <h1>${rc.getMessage("view.header.results.all", [page.occurrenceCount])}</h1>
    <#else>
      <h1>${rc.getMessage("view.header.results",[page.occurrenceCount])}</h1>
    </#if>
      
      <p class="details">(${rc.getMessage("view.map.header.details")}: ${page.georeferencedOccurrenceCount})</p>
      <ul class="buttons">
        <li><a href="<@searchViewUrl view="map"/>" class="selected">${rc.getMessage("view.map.header.button")}</a></li>
        <li><a href="<@searchViewUrl view="table"/>">${rc.getMessage("view.table.header.button")}</a></li>
        <li><a href="<@searchViewUrl view="stats"/>">${rc.getMessage("view.stats.header.button")}</a></li>
      </ul>
    </div>
    <a id="main-content"></a>
    <div id="map_canvas">
    </div>
  </div>
</div><#-- body -->

<content tag="local_script">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=drawing"></script>
<@jsLibAsset libName="jquery-ui-1.10.4.custom.min.js"/>
<@jsLibAsset libName="underscore-min.js"/>
<@jsLibAsset libName="backbone-min.js"/>
<@jsLibAsset libName="wax.g.min-6.2.0-touched.js"/>
<@jsLibAsset libName="cartodb-gmapsv3-min.js"/>
<@jsLibAsset libName="keynavigator.min.js"/>
<@jsAsset fileName="explorer" version=page.currentVersion! useMinified=page.useMinified/>
<@jsAsset fileName="explorer.utils" version=page.currentVersion! useMinified=page.useMinified/>
<@jsAsset fileName="explorer.portal" version=page.currentVersion! useMinified=page.useMinified/>
<@jsAsset fileName="explorer.backbone" version=page.currentVersion! useMinified=page.useMinified/>
<@jsAsset fileName="explorer.map" version=page.currentVersion! useMinified=page.useMinified/>

<script>
$(function() {
  <@controlJavaScriptSettings/>
  EXPLORER.map.setupMap({
    mapCanvasId : "map_canvas",
    tilerProtocol : "${tilerProtocol}",
    tilerDomain : "${tilerDomain}",
    tilerPort : ${tilerPort},
    mapQuery : "${page.embeddedMapQuery}",
    mapCenter : [${mapDefaultLat}, ${mapDefaultLong}],
    mapZoom : 3
  });
  <@controlJavaScriptInit/>
});
</script>
</content>
