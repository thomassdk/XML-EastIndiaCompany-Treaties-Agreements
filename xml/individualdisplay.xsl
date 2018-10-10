<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>
    
    <!--Use this stylesheet to generate the individual document html pages from docID's -->   
    
    <xsl:template match="/">
        <xsl:copy>
            <html>
                <head>
                    <link rel="stylesheet" type="text/css" href="../../../css/theme.css"/>
                </head>
                <!--  -->
                <body>
                    <header >
                        <h1 align="center">
                            Treaties, Agreements, and Engagements, <br/>
                            Between the <em>Honorable East India Company</em> and the <br/>
                            <em>Native Princes, Chiefs, and States, in Western India; The Red Sea; The Persian Gulf; &amp;c.</em><br/>
                            <b>Also Between</b> <br/>
                            <em>Her Britannic Majesty’s Government</em> And <em>Persia, Portugal, and Turkey.</em>
                        </h1>
                        
                        <ul id="nav">
                            <li><a href="../../../index.html">Home</a></li>
                            <li>
                                <a href="#">Index</a>
                                <ul>
                                    <li><a href="../../index/areaindex.html">By Area</a></li>
                                    <li><a href="../../index/yearindex.html">By Date</a></li>
                                    <li><a href="../../index/doctypeindex.html">By Document Type</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">Words</a>
                                <ul>
                                    <li><a href="../../words/unknown.html">Help:Unknown Words</a></li>
                                    <li><a href="../../words/transliterations.html">Transliterations</a></li>
                                    <li><a href="../../words/practices/html">Practices</a></li>
                                </ul>
                            </li>
                            <li><a href="resources.html">Resources</a></li>
                        </ul>
                    </header>
                    
    <div class="row">
        <!--                        Change the doc ID  below in order to generate each unique document         -->
        <xsl:for-each select="source/index/doc[@docID='TAEAHM1']">
            
            <div class="column2">
                <img  >
                    <xsl:attribute name="src" >
                        <xsl:value-of select="concat('../../../images/', image/@src)"/>
                    </xsl:attribute>
                </img >
            </div>
            
            <div class="column2" align="center" >
                
                <h2><xsl:apply-templates select="../@location"/></h2>
                
                <p><xsl:apply-templates select="cd" /> </p>
                
                <xsl:choose>
                    <!-- So far the DTD only defines two types of elements that can constitute the main text (contract or prose) this may change in the future, if so add further <xsl:when> elements here-->
                    <xsl:when test="maintext[contract]">
                        <p><xsl:value-of select="intro"/></p>
                        <xsl:for-each select="maintext/contract/article">                            
                            <p class="article"><xsl:value-of select="."/></p>
                        </xsl:for-each>
                        <p><xsl:apply-templates select="confirmation"/></p>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:for-each select="maintext/prose/p">
                            <p class="prose"><xsl:apply-templates select="."/></p>
                        </xsl:for-each>
                    </xsl:otherwise>
                </xsl:choose>
                
                <p><xsl:apply-templates select="datePlace"/></p>
                <p><xsl:apply-templates select="signatories"/></p>
                <p><xsl:apply-templates select="note"/></p>
                <p><xsl:apply-templates select="memorandum"/></p>
            </div>
            
        </xsl:for-each>
    </div>
       </body>
   </html>
        </xsl:copy>
        
        
    </xsl:template>

</xsl:stylesheet>