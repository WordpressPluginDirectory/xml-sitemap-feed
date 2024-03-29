<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
	xmlns:news="http://www.google.com/schemas/sitemap-news/0.9"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Google News Sitemap</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<style type="text/css">body{font-family:"Lucida Grande","Lucida Sans Unicode",Tahoma,Verdana,sans-serif;font-size:13px}#header,#footer{padding:2px;margin:10px;font-size:8pt;color:gray}a{color:black}td{font-size:11px}th{text-align:left;padding-right:30px;font-size:11px}tr.high{background-color:whitesmoke}#footer img{vertical-align:middle}</style>
</head>
<body>
	<h1>Google News Sitemap</h1>
	<div id="header">
		<p>This XML Sitemap is generated by WordPress to make your content more visible for search engines. <a href="https://www.sitemaps.org/">Learn more about XML sitemaps.</a></p>
	</div>
	<div id="content">
		<table cellpadding="5">
			<tr class="high">
				<th>#</th>
				<th>Title</th>
				<th>Language</th>
				<th>Keyword(s)</th>
				<th>Stock(s)</th>
				<th>Publication Date</th>
			</tr>
<xsl:variable name="lower" select="'abcdefghijklmnopqrstuvwxyz'"/>
<xsl:variable name="upper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
<xsl:for-each select="sitemap:urlset/sitemap:url">
			<tr><xsl:if test="position() mod 2 != 1"><xsl:attribute  name="class">high</xsl:attribute></xsl:if>
				<td><xsl:value-of select="position()"/></td>
				<td><xsl:variable name="itemURL"><xsl:value-of select="sitemap:loc"/></xsl:variable>
					<a href="{$itemURL}"><xsl:value-of select="news:news/news:title"/></a>
				</td>
				<td><xsl:value-of select="news:news/news:publication/news:language"/></td>
				<td><xsl:value-of select="news:news/news:keywords"/></td>
				<td><xsl:value-of select="news:news/news:stock_tickers"/></td>
				<td><xsl:value-of select="concat(substring(news:news/news:publication_date,0,11),concat(' ', substring(news:news/news:publication_date,12,8)))"/> (<xsl:value-of select="substring(news:news/news:publication_date,20,6)"/>)</td>
			</tr>
</xsl:for-each>
		</table>
	</div>
	<div id="footer">
		<p><img src="data:image/gif;base64,R0lGODlhUAAPAJEAAGZmZv////9mAImOeSwAAAAAUAAPAAACoISPqcvtD0+YtNqLs968myCE4kiW5jkGw8q27gvDwYfWdq3G+i7T9w/M8Ya7GQAUoiSTEyYSKYA2nSKhdXUdCIlaXzRVDVdB0+dS2lJZ1bkt0Sgti6NysvM5jbq2ai2WywJHYrZUaEhIWJXm99foNiRI9XUoV4g4GJjJyEgBGAkEivIIyPUZeppCqorlheo6ulr00UFba3uLEaG7y9urUAAAOw%3D%3D" alt="XML Sitemap" title="XML Sitemap" /> generated by <a href="https://status301.net/wordpress-plugins/xml-sitemap-feed/">XML Sitemap &amp; Google News</a>.</p>
	</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
