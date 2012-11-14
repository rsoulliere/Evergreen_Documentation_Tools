<?xml version='1.0'?>
<xsl:stylesheet  
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:import href="docbook-xsl/xhtml/chunk.xsl"/>
<xsl:import href="evergreen_xhtml_graphics.xsl"/> 

<xsl:param name="img.src.path" select="''"/>
<!--<xsl:param name="default.image.width" select="'900px'"/>-->
<xsl:param name="keep.relative.image.uris" select="0"/>
<xsl:param name="use.role.for.media.object" select="1"/>
<xsl:param name="html.stylesheet" select="'../evergreen_doc.css'"/>
<xsl:param name="para.propagates.style" select="1"/> <!-- applies "role" attribute as html class, for tracking changes in draft -->
<xsl:param name="generate.revhistory.link" select="1"/>
<xsl:param name="glossary.sort" select="1"/> <!-- sort glossterms aphabetically regardless of order in xml docs -->
<xsl:param name="glossterm.separation" select="'0.1in'"/> <!-- vertical space between term and definition paragraph -->
<xsl:param name="callout.graphics" select="1" />
<xsl:param name="callout.graphics.extension" select="'.png'" />
<xsl:param name="callout.graphics.path" select="'media/'" />
<xsl:param name="ignore.image.scaling" select="1"></xsl:param> 
<xsl:param name="use.id.as.filename" select="1"></xsl:param> 
<!-- customized header, to add home link -->
    
    <xsl:template name="header.navigation">
        <xsl:param name="prev" select="/d:foo"/>
        <xsl:param name="next" select="/d:foo"/>
        <xsl:param name="nav.context"/>
        
        <xsl:variable name="home" select="/*[1]"/>
        <xsl:variable name="up" select="parent::*"/>
        
        <xsl:variable name="row1" select="$navig.showtitles != 0"/>
        <xsl:variable name="row2" select="count($prev) &gt; 0                                     or (count($up) &gt; 0                                          and generate-id($up) != generate-id($home)                                         and $navig.showtitles != 0)                                     or count($next) &gt; 0"/>
        
        <xsl:if test="$suppress.navigation = '0' and $suppress.header.navigation = '0'">
            <div class="navheader">
                <xsl:if test="$row1 or $row2">
                    <table width="100%" summary="Navigation header">
                        <xsl:if test="$row1">
                            <tr>

 <td style="width:400px; margin:0px; padding:0px"><a href="http://evergreen-ils.org"><img src="media/small_logo_white.jpg" alt="Evergreen" /></a></td>
<td colspan="2" style="text-align: right; padding: 0px; margin:0px"><a
href="Evergreen_Documentation.pdf" title="also available in PDF" ><img
style="height:60px; width:60px;"
src="media/pdf_icon.png"/></a>
</td>


                                                        </tr>
                        </xsl:if>
                        
                        <xsl:if test="$row2">
                            <tr>
                                <td width="20%" align="{$direction.align.start}">
                                    <xsl:if test="count($prev)&gt;0">
                                        
                               <!-- the next line is custom, adds Home link to HTML pages -->         
                                        
                                        <a style="margin-right: 10px;" href="index.html">Home</a>
                                        <a accesskey="p">
                                            <xsl:attribute name="href">
                                                <xsl:call-template name="href.target">
                                                    <xsl:with-param name="object" select="$prev"/>
                                                </xsl:call-template>
                                            </xsl:attribute>
                                            <xsl:call-template name="navig.content">
                                                <xsl:with-param name="direction" select="'prev'"/>
                                            </xsl:call-template>
                                        </a>
                                    </xsl:if>
                                    <xsl:text>&#160;</xsl:text>
                                </td>
                                <th width="60%" align="center">
                                    <xsl:choose>
                                        <xsl:when test="count($up) &gt; 0                                   and generate-id($up) != generate-id($home)                                   and $navig.showtitles != 0">
                                            <xsl:apply-templates select="$up" mode="object.title.markup"/>
                                        </xsl:when>
                                        <xsl:otherwise>&#160;</xsl:otherwise>
                                    </xsl:choose>
                                </th>
                                <td width="20%" align="{$direction.align.end}">
                                    <xsl:text>&#160;</xsl:text>
                                    <xsl:if test="count($next)&gt;0">
                                        <a accesskey="n">
                                            <xsl:attribute name="href">
                                                <xsl:call-template name="href.target">
                                                    <xsl:with-param name="object" select="$next"/>
                                                </xsl:call-template>
                                            </xsl:attribute>
                                            <xsl:call-template name="navig.content">
                                                <xsl:with-param name="direction" select="'next'"/>
                                            </xsl:call-template>
                                        </a>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:if>
                    </table>
                </xsl:if>
                <xsl:if test="$header.rule != 0">
                    <hr/>
                </xsl:if>
            </div>
        </xsl:if>
    </xsl:template>
   
  <!-- custom footer for Evergreen copyright --> 
   
    <xsl:template name="user.footer.navigation">
        
    <div id="footer">
<p>
&#169; 2008-2012 <a href="http://www.georgialibraries.org/"
target="_blank">GPLS</a> and others.  Evergreen is open source software, freely
licensed under <a href="http://www.gnu.org/licenses/gpl-2.0.html"
target="_blank">GNU GPLv2</a> or later.<br />  The <a
href="http://evergreen-ils.org/blog/?p=583" target="_blank">Evergreen Project is
a member</a> of the <a href="http://sfconservancy.org/" target="_blank">Software
Freedom Conservancy</a>.
</p>
</div>
               
    </xsl:template>
    
</xsl:stylesheet>

