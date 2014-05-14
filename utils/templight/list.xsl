<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:math="http://exslt.org/math"
>
<xsl:output method="text" encoding="UTF-8" indent="no"/>
<xsl:template name="template">
<xsl:param name="current"/>
 <xsl:value-of select="@id"/>;<xsl:value-of select="@memUsage"/>;<xsl:value-of select="count($current/Template)"/><xsl:text>
 </xsl:text>
<!--xsl:for-each select="$current/Template">
  <xsl:value-of select="@memUsage"/> <xsl:text> </xsl:text> <xsl:value-of select="@id"/><xsl:text>
  </xsl:text>
  </xsl:for-each-->
  <xsl:if test="$current/Template">
  <xsl:variable name="maxUsage" select="math:max($current/Template/@memUsage)"/>
<xsl:for-each select="$current/Template[$maxUsage=@memUsage]">
<xsl:call-template name="template"><xsl:with-param name="current" select="."/></xsl:call-template>
</xsl:for-each>
</xsl:if>
 </xsl:template>
<xsl:template match="/Trace">
<xsl:choose>
<xsl:when test="string-length($root)&gt;0">
<xsl:call-template name="template"><xsl:with-param name="current" select="//Template[@id=$root]"/></xsl:call-template>
</xsl:when>
<xsl:otherwise>
  <xsl:for-each select="Template[Template/*]">
  <xsl:sort data-type="number" select="@memUsage"/>
  <xsl:value-of select="@memUsage"/> <xsl:text> </xsl:text> <xsl:value-of select="@id"/> : <xsl:value-of select="Context/@context"/><xsl:text>
  </xsl:text>
  </xsl:for-each>
  <xsl:value-of select="count(Template)"/><xsl:text>
  </xsl:text>
  <xsl:value-of select="count(Template[Template/*])"/>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="Template">
<xsl:value-of select="Context/@context"/><xsl:text>
</xsl:text>
</xsl:template>

</xsl:stylesheet>
