<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:math="http://exslt.org/math"
>
<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
<xsl:template match="@*|node()">
<xsl:copy>
<xsl:apply-templates select="@*|node()"/>
</xsl:copy>
</xsl:template> 
<xsl:template match="Template">
<xsl:copy>
<xsl:attribute name="memUsage"><xsl:value-of select="./MemoryUsageEnd/@bytes - ./MemoryUsageStart/@bytes"/></xsl:attribute> 
<xsl:attribute name="compileTime"><xsl:value-of select="./TimeStampEnd/@time - ./TimeStampStart/@time"/></xsl:attribute> 
<xsl:apply-templates select="@*|node()"/>
</xsl:copy>
 </xsl:template>
</xsl:stylesheet>
