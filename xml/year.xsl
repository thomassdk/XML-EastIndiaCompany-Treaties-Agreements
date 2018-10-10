<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:template match="/" >
        <xsl:copy>
            <html>
                <head>
                    <link rel="stylesheet" type="text/css" href="../../css/theme.css"/>
                </head>
                
                <body>
                    <!-- A better way to make this modular where the header is kept in a separate file and inserted in each xsl stylesheet should be found -->
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
                    <h2 align="center">Documents Organised By Year</h2>
                    <div class="row" align="center" >
                        <xsl:for-each select="source/index/doc/cd/date[@calendar='gregorian']">
                            
                            <xsl:sort select="@isovalue"/>
                            <copy>
                            <div class="column2" style="text-transform:lowercase">
                            
                                <xsl:apply-templates select="../date[@calendar='gregorian']"/>
                        </div>


                        <div class="column2">
                            <p>
                                <a>
                                    <xsl:attribute name="href">../docpages/<xsl:value-of select="../../../@location"/>/<xsl:value-of select="../../@docID"/>.html</xsl:attribute>
                                    <xsl:value-of select="../../cd"/>
                                </a> 
                            </p>
                            <hr/>
                            
                        </div>
                            </copy>
                        </xsl:for-each>
                    </div>
                </body>
            </html>
        </xsl:copy>
    </xsl:template>
    <!-- When matching any element with the attribute ref: wrap in this tag-->
    <xsl:template name="era" match="//era" >
        <del><xsl:value-of select="."/></del>
    </xsl:template>
    
</xsl:stylesheet>

