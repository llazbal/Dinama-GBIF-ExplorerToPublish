<#ftl strip_whitespace=true>
<#include "../inc/functions.ftl">
<#include "../inc/global-functions.ftl">
<head>
<title>${rc.getMessage("cwt.http404.title")}</title>
<@cssAsset fileName="occportal" version=(page.currentVersion)! useMinified=false/>
</head>
<div id="body" style="min-height: 269px;">
	<div id="content" class="no_side_bar">
		<h1>${rc.getMessage("cwt.http404.title")}</h1>
		<p>${rc.getMessage("cwt.http404.message")}</p>
	</div>
</div>
