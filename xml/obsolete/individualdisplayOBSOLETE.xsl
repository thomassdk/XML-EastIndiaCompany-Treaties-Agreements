<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    
    <!--                                                                                                                                                                     -->
    <!--                             This style sheet is to generate individual documents from the source            -->
    <!--                                                                                                                                                                     -->
    <xsl:template match="/">
        
            <html>
                <head>
                    <link rel="stylesheet" type="text/css" href="../css/theme.css"/>
                </head>
                <!--  -->
                <body>
                    <header>
                        <h1>TREATIES, AGREEMENTS, AND ENGAGEMENTS, BETWEEN THE HONORABLE EAST INDIA COMPANY</h1>
                        <ul id="nav">
                            <li><a href="/">Home</a></li>
                            <li>
                                <a href="/about/">About</a>
                                <ul>
                                    <li><a href="#">About me</a></li>
                                    <li><a href="#">About my work</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="/portfolio/">Treaties</a>
                                <ul>
                                    <li><a href="#">Web</a></li>
                                    <li><a href="#">Print</a></li>
                                    <li><a href="#">Identity</a></li>
                                </ul>
                            </li>
                            <li><a href="/archives/">Archives</a></li>
                            <li><a href="/resources/">Resources</a></li>
                            <li><a href="/contact/">Contact</a></li>
                        </ul>
                    </header>
                    
                    <div class="row">
<!--                                     Change the doc ID  below in order to generate each unique document         -->
                        <xsl:for-each select="source/index/doc[@ID='TAEAHM1']">
                            
                            <div class="column2">
                            <img>
                                <xsl:attribute name="src">
                                    <xsl:value-of select="image/@src"/>
                                </xsl:attribute>
                            </img >
                        </div>
    
                        <div class="column2" align="center" >

                            <h2><xsl:value-of select="../@location"/></h2>
                            
                            <p><xsl:value-of select="sourceDesc"/> </p>
                            
                                <!-- NEED TO FIND A WAY OF SELECTING ALL NODES WITH THE ATTRIBUTE @ref SO THAT THEY CAN BE EXCLUDED IN THE FINAL PRODUCTION -->
                            <xsl:choose>
                                <xsl:when test="maintext[contract]">
                                    <p><xsl:value-of select="intro"/></p>
                                    <xsl:for-each select="maintext/contract/article">

                                        <p class="article"><xsl:value-of select="."/></p>

                                    </xsl:for-each>
                                    <p><xsl:value-of select="confirmation"/></p>
                                </xsl:when>
                                <!-- So far the DTD only defines two types of elements that can constitute the main text (contract or prose) this may change in the future, if so add further <xsl:choose> elements here-->
                                <xsl:otherwise>
                                    <xsl:for-each select="maintext/prose/p">
                                        <p class="prose"><xsl:value-of select="."/></p>
                                    </xsl:for-each>
                                </xsl:otherwise>
                            </xsl:choose>
                            
                            <p><xsl:value-of select="datePlace"/></p>
                            <p><xsl:value-of select="signatories"/></p>
                            <p><xsl:value-of select="note"/></p>
                            <p><xsl:value-of select="memorandum"/></p>
                        </div>
                            
                    </xsl:for-each>
                    </div>
                    
                </body>
                </html>
    </xsl:template>

    <xsl:template name="ref" match="//*[@ref]">
        
        <em>
            <xsl:apply-templates select="." />    
        </em>
        
    </xsl:template>

    </xsl:stylesheet>
