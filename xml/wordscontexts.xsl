<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
        <xsl:output method="html"/>
        
        <!--                                                                                                                                                                     -->
        <!--  This style sheet is to generate a glossary of  words and their contexts, currently there are 3 categoreis: transliterated, unknown and practices        -->
        <!--                                                                                                                                                                     -->
        <xsl:template match="/">
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
                                    <li><a href="../index/areaindex.html">By Area</a></li>
                                    <li><a href="../index/yearindex.html">By Date</a></li>
                                    <li><a href="../index/doctypeindex.html">By Document Type</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">Words</a>
                                <ul>
                                    <li><a href="unknown.html">Help: Unknown Words</a></li>
                                    <li><a href="transliterations.html">Transliterations</a></li>
                                    <li><a href="practices.html">Practices</a></li>
                                </ul>
                            </li>
                            <li><a href="resources.html">Resources</a></li>
                        </ul>
                    </header>
                    <div class="xml">
                    <!-- Make sure to change title when you change what words you are selecting-->
                        <h2 align="center">Transliterations</h2>
                        <!-- The code underneath is to find all the categores that are elements ie, practices and unknown-->
                        <!-- <xsl:for-each select="//practice">-->
                        <!-- The code underneath is to find all words that are attributes of elements, ie. transliterated     -->
                        <xsl:for-each select="//*[@transliteration]">
                            <!--This argument is to sort the results alphabetically --> 
                            <xsl:sort select="."/>
                            <!--This argument is to sort by year published -->
                            <!-- <xsl:sort select="ancestor::doc/cd/date/year"/>-->
                            <div class="row" align="center" >
                                <div class="column3">
                                    <p class="word">
                                        <xsl:call-template name="toLowerCase">
                                            <xsl:with-param name="str">
                                                <xsl:value-of select="."/>
                                            </xsl:with-param>    
                                        </xsl:call-template>
                                    </p>
                                </div>
                                <div class="column3">
                                    <p><xsl:value-of select="parent:: node()"/></p>
                                </div>
                                <div class="column3">
                                    <a>
                                        <xsl:attribute name="href">../docpages/<xsl:value-of select="ancestor::index/attribute::location"/>/<xsl:value-of select="ancestor::doc/attribute::docID"/>.html</xsl:attribute>
                                        <xsl:value-of select="ancestor::doc/cd"/>
                                    </a>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                </body>
            </html>
        </xsl:template>

<!-- This template is to transform the content of elements into all lowercase  -->
    <xsl:template name="toLowerCase">
        
        <xsl:param name="str" />
        <xsl:variable name="lowerCaseAlphabet">abcdefghijklmnopqrstuvwxyz</xsl:variable>
        <xsl:variable name="upperCaseAlphabet">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
                
        <xsl:value-of select="translate($str,$upperCaseAlphabet,$lowerCaseAlphabet)"/>
                    
    </xsl:template>
</xsl:stylesheet>
