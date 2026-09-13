<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:image="http://www.google.com/schemas/sitemap-image/1.1" version="1.0">
<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
<html lang="en">
<head>
<title>XML Sitemap — StudyWithSTEM</title>
<meta charset="UTF-8"/>
<meta name="robots" content="noindex,follow"/>
<style> body { font-family: -apple-system, Segoe UI, Roboto, Arial, sans-serif; margin: 0; padding: 0; background: #f7f8fa; color: #1f2328; } .header { background: #0f172a; color: #fff; padding: 28px 32px; } .header h1 { margin: 0 0 6px 0; font-size: 22px; } .header p { margin: 0; color: #cbd5e1; font-size: 14px; } .wrap { padding: 24px 32px 48px; } .count { color: #475569; font-size: 14px; margin-bottom: 14px; } table { width: 100%; border-collapse: collapse; background: #fff; box-shadow: 0 1px 3px rgba(0,0,0,0.08); border-radius: 8px; overflow: hidden; } th { text-align: left; background: #eef1f6; padding: 10px 14px; font-size: 12px; text-transform: uppercase; letter-spacing: .04em; color: #475569; border-bottom: 1px solid #e2e8f0; } td { padding: 10px 14px; border-bottom: 1px solid #eef1f6; font-size: 14px; vertical-align: top; } tr:last-child td { border-bottom: none; } tr:hover td { background: #f8fafc; } a { color: #2563eb; text-decoration: none; word-break: break-all; } a:hover { text-decoration: underline; } .thumb { width: 48px; height: 48px; object-fit: cover; border-radius: 6px; display: block; background: #e2e8f0; } .muted { color: #94a3b8; font-size: 12px; } .badge { display: inline-block; background: #e0e7ff; color: #3730a3; font-size: 11px; padding: 2px 8px; border-radius: 999px; margin-left: 6px; } </style>
</head>
<body>
<div class="header">
<h1>XML Sitemap</h1>
<p>This is an XML sitemap, meant for search engines and AI crawlers, not for human browsing — but here's a readable view of it.</p>
</div>
<div class="wrap">
<!--  Sitemap index (sitemap.xml pointing at other sitemaps)  -->
<xsl:if test="sitemap:sitemapindex">
<div class="count">
<xsl:value-of select="count(sitemap:sitemapindex/sitemap:sitemap)"/>
sitemap(s) in this index
</div>
<table>
<tr>
<th>Sitemap</th>
<th>Last modified</th>
</tr>
<xsl:for-each select="sitemap:sitemapindex/sitemap:sitemap">
<tr>
<td>
<a href="{sitemap:loc}">
<xsl:value-of select="sitemap:loc"/>
</a>
</td>
<td class="muted">
<xsl:value-of select="sitemap:lastmod"/>
</td>
</tr>
</xsl:for-each>
</table>
</xsl:if>
<!--  Regular urlset (pages/posts/tools sitemaps)  -->
<xsl:if test="sitemap:urlset">
<div class="count">
<xsl:value-of select="count(sitemap:urlset/sitemap:url)"/>
URL(s) in this sitemap
</div>
<table>
<tr>
<th style="width:56px;"/>
<th>URL</th>
<th>Last modified</th>
</tr>
<xsl:for-each select="sitemap:urlset/sitemap:url">
<tr>
<td>
<xsl:if test="image:image/image:loc">
<img class="thumb" src="{image:image/image:loc}" alt=""/>
</xsl:if>
</td>
<td>
<a href="{sitemap:loc}">
<xsl:value-of select="sitemap:loc"/>
</a>
</td>
<td class="muted">
<xsl:value-of select="sitemap:lastmod"/>
</td>
</tr>
</xsl:for-each>
</table>
</xsl:if>
</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
