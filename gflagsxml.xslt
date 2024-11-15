<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- we need to avoid emitting xml prolog -->
  <xsl:output method="text" />
  <xsl:strip-space elements="*" />

  <!-- Match the root element -->
  <xsl:template match="/AllFlags">
    <xsl:text># Flags for </xsl:text><xsl:value-of select="program"/><xsl:text>&#10;&#10;</xsl:text>
    <xsl:text>## Usage&#10;</xsl:text><xsl:value-of select="usage"/><xsl:text>&#10;&#10;</xsl:text>
    <!-- Process each flag -->
    <xsl:apply-templates select="flag"/>
  </xsl:template>

  <!-- Template for each flag -->
  <xsl:template match="flag">
    <xsl:text>### `</xsl:text><xsl:value-of select="name"/><xsl:text>`&#10;&#10;</xsl:text>
    <xsl:text>- **File:** </xsl:text><xsl:value-of select="file"/><xsl:text>&#10;</xsl:text>
    <xsl:text>- **Type:** </xsl:text><xsl:value-of select="type"/><xsl:text>&#10;</xsl:text>
    <xsl:text>- **Default:** </xsl:text><xsl:value-of select="default"/><xsl:text>&#10;</xsl:text>
    <xsl:text>- **Current:** </xsl:text><xsl:value-of select="current"/><xsl:text>&#10;</xsl:text>
    <xsl:text>- **Description:** </xsl:text><xsl:value-of select="meaning"/><xsl:text>&#10;</xsl:text>
    <!-- Optional elements -->
    <xsl:if test="short_name">
      <xsl:text>- **Short Name:** </xsl:text><xsl:value-of select="short_name"/><xsl:text>&#10;</xsl:text>
    </xsl:if>
    <xsl:if test="key">
      <xsl:text>- **Key:** </xsl:text><xsl:value-of select="key"/><xsl:text>&#10;</xsl:text>
    </xsl:if>
    <xsl:if test="lower_bound">
      <xsl:text>- **Lower Bound:** </xsl:text><xsl:value-of select="lower_bound"/><xsl:text>&#10;</xsl:text>
    </xsl:if>
    <xsl:if test="upper_bound">
      <xsl:text>- **Upper Bound:** </xsl:text><xsl:value-of select="upper_bound"/><xsl:text>&#10;</xsl:text>
    </xsl:if>
    <xsl:if test="enum_value">
      <xsl:text>- **Enum Values:** </xsl:text>
      <xsl:for-each select="enum_value">
        <xsl:value-of select="."/>
        <xsl:if test="position() != last()">, </xsl:if>
      </xsl:for-each>
      <xsl:text>&#10;</xsl:text>
    </xsl:if>
    <xsl:if test="list_separator">
      <xsl:text>- **List Separator:** </xsl:text><xsl:value-of select="list_separator"/><xsl:text>&#10;</xsl:text>
    </xsl:if>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

</xsl:stylesheet>
