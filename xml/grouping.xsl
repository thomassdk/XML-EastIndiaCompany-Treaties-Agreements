<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    
    <xsl:template match="/" >
        <xsl:copy>
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="../../css/theme.css"/>
            </head>
            
            <body>
                <!-- A better way to make this modular where the header is kept in a separate file and inserted in each should be found -->
                <header >
                    <h1 align="center">
                        Treaties, Agreements, and Engagements, <br/>
                        Between the <em>Honorable East India Company</em> and the <br/>
                        <em>Native Princes, Chiefs, and States, in Western India; The Red Sea; The Persian Gulf; &amp;c.</em><br/>
                        <b>Also Between</b> <br/>
                        <em>Her Britannic Majesty’s Government</em> And <em>Persia, Portugal, and Turkey.</em>
                    </h1>
                    
                    <ul id="nav">
                        <li><a href="../../index.html">Home</a></li>
                        <li>
                            <a href="#">Index</a>
                            <ul>
                                <li><a href="areaindex.html">By Area</a></li>
                                <li><a href="yearindex.html">By Date</a></li>
                                <li><a href="doctypeindex.html">By Document Type</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">Words</a>
                            <ul>
                                <li><a href="../words/unknown.html">Help: Unknown Words</a></li>
                                <li><a href="../words/transliterations.html">Transliterations</a></li>
                                <li><a href="../words/practices.html">Practices</a></li>
                            </ul>
                        </li>
                        <li><a href="resources.html">Resources</a></li>
                    </ul>
                </header>
                <!--          Remember to change this heading based on what type of grouping you are building eg. build-doctype-index = Document Types, build-book-index =  Source Index     -->
                <h2 align="center">Source Index</h2>
                <div class="row" align="center" >
                    <xsl:apply-templates/>
                </div>
            </body>
        </html>
            </xsl:copy>
    </xsl:template>
     
    <!-- When matching any element with the attribute ref: wrap in this tag- This does not work in this context further work needs to be done in order to fix this-->
<!--    <xsl:template name="ref" match="//*[@ref]" >
        <del><xsl:value-of select="."/></del>
    </xsl:template>-->
     
<!--         These Grouping's were created with the Muenchian Method - http://www.jenitennison.com/xslt/grouping/muenchian.html-->
<!--          It would be useful to wrap the groupings in a javascript on-click event to save space on the page     -->
    
    <!--         Uncomment this block of code when you want to build the index page that from the different document types, remember to comment out when changing groupings  
                    A link to the individual document pages is also embedded                                                                                                                                                                                                        -->
<!--    <xsl:key name="build-doctype-index" match="*//doc" use="@doctypeID" />
    <xsl:template name="build-doctype-index" match="source/index">
        <xsl:for-each select="doc[count(. | key('build-doctype-index', @doctypeID)[1]) = 1]">       
            
            <xsl:sort select="doctypeID" />
                <div class="column2">
                    <p>
                        <xsl:call-template name="doctypeIDexpand"/>
                    </p>
                </div>
                <div class="column2">
                    <xsl:for-each select="key('build-doctype-index', @doctypeID)">
                            <p>
                                <a>
                                    <xsl:attribute name="href">../docpages/<xsl:value-of select="../@location"/>/<xsl:value-of select="@docID"/>.html</xsl:attribute>
                                    <xsl:value-of select="cd"/>
                                </a> 
                            </p>
                        <hr/>
                    </xsl:for-each>
                </div>
        </xsl:for-each>
    </xsl:template>-->
    
    
<!--         Uncomment this block of code when you want to build the index page that matches the source index, remember to comment out when changing groupings -->
     <xsl:key name="build-area-index" match="*//index" use="@location" />
    <xsl:template name="build-area-index" match="source">
        <xsl:for-each select="index[count(. | key('build-area-index', @location)[1]) = 1]">       

            
            <div class="column2">
                <p >
                    <xsl:copy>
                    <xsl:value-of select="@location" />
                    </xsl:copy>
                </p>
            </div>
            <div class="column2">
                <xsl:for-each select="key('build-area-index', @location)">
                        <p>
                            <a>
                                <xsl:attribute name="href">../docpages/<xsl:value-of select="@location"/>/<xsl:value-of select="doc/@docID"/>.html</xsl:attribute>
                                <xsl:value-of select="doc/cd"/>
                            </a>
                        </p>
                    <hr/>
                </xsl:for-each>
            </div>
            
        </xsl:for-each>
    </xsl:template>
    

    
    <!-- Use this template in order to replace the document ID's used in the XML document with their full name. in the future a short description of each type can be added as well as an image. -->
    <xsl:template name="doctypeIDexpand" match="@doctypeID">
        <xsl:choose>
            <xsl:when test="@doctypeID='TAEDTY1'">
                <em>Firman</em>
            </xsl:when>
            <xsl:when test="@doctypeID='TAEDTY2'">
                <em>Notes</em>
            </xsl:when>
            <xsl:when test="@doctypeID='TAEDTY3'">
                <em>Papers</em>
            </xsl:when>
            <xsl:when test="@doctypeID='TAEDTY4'">
                <em>Proclamations</em>
            </xsl:when>
            <xsl:when test="@doctypeID='TAEDTY5'">
                <em>Purwana</em>
            </xsl:when>
            <xsl:otherwise>
                <xsl:copy>
                    <xsl:value-of select="@doctypeID" />
                </xsl:copy>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>