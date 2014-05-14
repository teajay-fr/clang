<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:math="http://exslt.org/math"
>
<xsl:output method="text" encoding="UTF-8" indent="no"/>

<xsl:template name="template">
  <xsl:param name="context"/>
  <xsl:if test="$context/Template">
  <xsl:variable name="maxUsage" select="math:max($context/Template/@memUsage)*0.3"/>
  node<xsl:value-of select="$context/@id"/>[label="<xsl:value-of select="$context/@id"/> : <xsl:value-of select="count(./*)"/> : <xsl:value-of select="$context/following-sibling::Template/@id - $context/@id"/>"];
  <xsl:for-each select="$context/Template[@memUsage &gt; $maxUsage]">
  node<xsl:value-of select="$context/@id"/> -> node<xsl:value-of select="@id"/>[label="<xsl:value-of select="@memUsage"/>"];
  <xsl:call-template name="template"><xsl:with-param name="context" select="."/></xsl:call-template>
  </xsl:for-each>
  </xsl:if>
</xsl:template>


<xsl:template match="/Trace">
digraph Templar {
  <xsl:call-template name="template"><xsl:with-param name="context" select="Template[@id=$root]"/></xsl:call-template><xsl:text>
  </xsl:text>
  }
</xsl:template>

</xsl:stylesheet>
