<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:output method="xhtml" encoding="utf-8" indent="yes"/>

    <!-- <xsl:strip-space elements="*"/> -->

    <xsl:template match="/">

        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
                <title>Elia Peattie</title>

                <link rel="stylesheet" type="text/css" href="styles/font.css"/>
                <link rel="stylesheet" type="text/css" href="styles/style2.css"/>
                <link rel="stylesheet" type="text/css" href="styles/reset.css"/>

                <!--[if IE ]>
                    <link rel="stylesheet" type="text/css" href="styles/ie.css" />
                    <![endif]-->



                <!--<script src="http://www.protonotes.com/js/protonotes.js" type="text/javascript"></script>
                <script type="text/javascript">
                    var groupnumber="ATdtbPBWMjus";
                </script> -->




            </head>
            <body>
                <div class="top">
                    <a href="index.html">
                        <h1>Elia Peattie, an Uncommon Woman</h1>
                        <p>&#160;</p>
                        <img src="images/jpgs/pic.png"/>
                    </a>
                </div>
                <div class="middle">
                    <div class="middlecontainer">
                        <div><h2>Works:</h2>
                            <a href="owh.html">Omaha World-Herald</a> | <a href="ss.html">Short Stories of the West</a> | <a href="gs.html">Ghost Stories</a> | <a
                                href="nov.html">Short Novels</a> | <a href="misc.html"
                            >Miscellaneous</a></div>
                    </div>
                </div>

                <div class="shadow">

                    <div class="bottom">

                        <div class="left">

                            <div class="list">
                                <a href="index.html">
                                    <h1>Home</h1>
                                </a>
                                <ul>
                                    <li>
                                        <a href="ep.biography.html">Biography</a>
                                    </li>
                                    <li>
                                        <a href="ep.bibliography.html">Bibliography</a>
                                    </li>
                                    <li>
                                        <a href="ep.timeline.html">Timeline</a>
                                    </li>
                                    <li>
                                        <a href="ep.quotes.html">Quotables</a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="content">

                            <!-- main content goes here -->

                            <xsl:apply-templates/>



                            <xsl:if
                                test="/TEI/teiHeader/fileDesc/sourceDesc/bibl[1]/title[@level='j']">
                                <xsl:apply-templates
                                    select="/TEI/teiHeader/fileDesc/sourceDesc/bibl[1]/title[@level='j']"
                                />
                            </xsl:if>

                            <xsl:if
                                test="TEI/teiHeader/fileDesc/sourceDesc/bibl/title[@level='j'] and /TEI/teiHeader/fileDesc/sourceDesc/bibl/date"
                                >, </xsl:if>

                            <xsl:if test="/TEI/teiHeader/fileDesc/sourceDesc/bibl[1]/date">
                                <xsl:apply-templates
                                    select="/TEI/teiHeader/fileDesc/sourceDesc/bibl[1]/date[1]"/>
                            </xsl:if>
                            
                            
                            <xsl:if test="/TEI/teiHeader/fileDesc/sourceDesc/bibl[1]/biblScope">
                                 <xsl:text>, </xsl:text><xsl:apply-templates
                                    select="/TEI/teiHeader/fileDesc/sourceDesc/bibl[1]/biblScope[1]"/>
                            </xsl:if>

                        </div>
                    </div>
                </div>


                <div class="footer">
                    <div class="footerimg">
                        <div class="footerbox">
                            <div class="links">
                                <ul>
                                    <li>
                                        <a href="about.html">About the Project</a>
                                    </li>
                                    <li>
                                        <a href="contact.html">Contact Us</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <img src="images/jpgs/N.gif"/>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="head">
        <xsl:choose>
            <xsl:when test="preceding::head">
                <br/>
                <h3>
                    <xsl:apply-templates/>
                </h3>
            </xsl:when>
            <xsl:otherwise>
                <br/>
                <h2>
                    <xsl:apply-templates/>
                </h2>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


        
        <xsl:template match="//epigraph/bibl">
            <blockquote>
            <xsl:text>&#8213;</xsl:text><xsl:apply-templates/>
          </blockquote>
    </xsl:template>

    <xsl:template match="hi[@rend='underline']">
        <u>
            <xsl:apply-templates/>
        </u>
    </xsl:template>

    <xsl:template match="hi[@rend='italic']">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>

    <xsl:template match="sic[@corr]">
        <xsl:value-of select="@corr"/>
    </xsl:template>

    <xsl:template match="teiHeader"/>

    <xsl:template match="p">

        <xsl:choose>
            <xsl:when test="child::note">
                <div><xsl:attribute name="class">note</xsl:attribute><xsl:value-of select="."/>
                    <a>
                        <xsl:attribute name="name">
                            <xsl:value-of select="child::note/@id"/>
                        </xsl:attribute>
                    </a> &#160; <a>
                        <xsl:attribute name="href">
                            <xsl:text>#</xsl:text>
                            <xsl:value-of select="child::note/@id"/>
                            <xsl:text>b</xsl:text>
                        </xsl:attribute>
                        <xsl:text>[back to text]</xsl:text>
                    </a></div>
            </xsl:when>
            <xsl:otherwise>
                <p>
                    <xsl:apply-templates/>
                </p>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <xsl:template match="note">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="bibl">
        <p class="bibl">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="milestone">
        <hr width="70%"/>
    </xsl:template>

    <!--
    <xsl:template match="lg">
        <blockquote>
            <xsl:apply-templates/>
        </blockquote>
        <br/>
        <br/>
    </xsl:template>
    
    -->

    <xsl:template match="l">
        <xsl:apply-templates/>
        <br/>
    </xsl:template>

    <xsl:template match="seg | closer | signed">
        <xsl:apply-templates/>
        <br/>
    </xsl:template>

    <xsl:template match="pb"/>

    <xsl:template match="gap"> [<xsl:value-of select="@reason"/>] </xsl:template>

    <xsl:template
        match="pubPlace | publisher | date | div1 | div3 | div4 | biblScope | editor | byline | orig | unclear">
        <xsl:apply-templates/>
    </xsl:template>

    <!--<xsl:template
        match="*[not(name()='head')]
        [not(name()='text')]
        [not(name()='p')]
        [not(name()='hi')]
        [not(name()='teiHeader')]
        [not(name()='TEI')]
        [not(name()='sic')]
        [not(name()='lb')]
        [not(name()='body')]
        [not(name()='bibl')]
        [not(name()='title')]
        [not(name()='div1')]
        [not(name()='div2')]
        [not(name()='div3')]
        [not(name()='div4')]
        [not(name()='pubPlace')]
        [not(name()='publisher')]
        [not(name()='date')]
        [not(name()='author')]
        [not(name()='editor')]
        [not(name()='note')]
        [not(name()='biblScope')]
        [not(name()='milestone')]
        [not(name()='byline')]
        [not(name()='lg')]
        [not(name()='l')]
        [not(name()='seg')]
        [not(name()='orig')]
        [not(name()='unclear')]
        [not(name()='gap')]
        [not(name()='xref')]
        [not(name()='closer')]
        [not(name()='signed')]
        [not(name()='pb')]
        [not(name()='list')]
        [not(name()='item')]
        [not(name()='ref')]
        [not(name()='note')]
        [not(name()='figure')]
        [not(name()='table')]
        [not(name()='row')]
        [not(name()='cell')]
        [not(name()='quote')]
">

        <xsl:variable name="unstyledElement">
            <xsl:value-of select="name()"/>
        </xsl:variable>

        <font color="red">
            <xsl:text>&lt;</xsl:text>
            <xsl:value-of select="$unstyledElement"/>
            <xsl:text>&gt;</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>&lt;/</xsl:text>
            <xsl:value-of select="$unstyledElement"/>
            <xsl:text>&gt;</xsl:text>
        </font>

    </xsl:template>-->



<!--  <xsl:template match="ref">
        <a>
            <xsl:attribute name="name">
                <xsl:value-of select="@target"/>
                <xsl:text>b</xsl:text>
            </xsl:attribute>
        </a>
        <a>
            <xsl:attribute name="href">
                <xsl:text>#</xsl:text>
                <xsl:value-of select="@target"/>
            </xsl:attribute> [<xsl:value-of select="@n"/>] </a>
    </xsl:template>-->
    
    

    
    

    <xsl:template match="ref[@target]">
        <a>
            <xsl:attribute name="name">
                <xsl:value-of select="@target"/>
                <xsl:text>b</xsl:text>
            </xsl:attribute>
        </a>
        <a>
            <xsl:attribute name="href">
                <xsl:text>#</xsl:text>
                <xsl:value-of select="@target"/>
            </xsl:attribute> [<xsl:value-of select="@n"/>] </a>
    </xsl:template>
    

    <!--<xsl:template match="note"/>-->

    <xsl:template match="figure">
        <xsl:choose>
            <!--            <xsl:when test="@n='navigation'">
                
                    <img>
                        <xsl:attribute name="src">
                            <xsl:text>images/jpgs/</xsl:text>
                            <xsl:value-of select="@entity"/>
                            <xsl:text>.jpg</xsl:text>
                        </xsl:attribute>
                    </img>
                    
              
            </xsl:when>-->
            <xsl:when test="attribute::entity">
                <a>
                    <xsl:attribute name="href">
                        <xsl:text>images/figures/</xsl:text>
                        <xsl:value-of select="@entity"/>
                        <xsl:text>.jpg</xsl:text>
                    </xsl:attribute>
                    <img>
                        <xsl:attribute name="src">
                            <xsl:text>images/figures/thumbs/</xsl:text>
                            <xsl:value-of select="@entity"/>
                            <xsl:text>.jpg</xsl:text>
                        </xsl:attribute>
                        <xsl:attribute name="class">
                            <xsl:text>figure</xsl:text>
                        </xsl:attribute>
                    </img>

                </a>
            </xsl:when>
            <xsl:otherwise/>

        </xsl:choose>
    </xsl:template>



    <xsl:template match="table">
        <table>
            <xsl:apply-templates/>
        </table>
    </xsl:template>

    <xsl:template match="row">
        <tr>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>

    <xsl:template match="cell">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>

    <xsl:template match="quote">
        <blockquote>
            <xsl:apply-templates/>
        </blockquote>
    </xsl:template>

    <!-- This section is to generate the links -->

    <xsl:template match="xptr[@n='gs_links.html']">

        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@n"/>
            </xsl:attribute>

            <img>
                <xsl:attribute name="src">
                    <xsl:text>images/jpgs/ghost2.jpg</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="class">
                    <xsl:text>navigation</xsl:text>
                </xsl:attribute>
            </img>

        </a>
    </xsl:template>

    <xsl:template match="xptr[@n='owh_links.html']">

        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@n"/>
            </xsl:attribute>

            <img>
                <xsl:attribute name="src">
                    <xsl:text>images/jpgs/omaha2.jpg</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="class">
                    <xsl:text>navigation</xsl:text>
                </xsl:attribute>
            </img>

        </a>
    </xsl:template>

    <xsl:template match="xptr[@n='ss_links.html']">

        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@n"/>
            </xsl:attribute>

            <img>
                <xsl:attribute name="src">
                    <xsl:text>images/jpgs/short2.jpg</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="class">
                    <xsl:text>navigation</xsl:text>
                </xsl:attribute>
            </img>

        </a>
    </xsl:template>

    <xsl:template match="xptr[@n='misc_links.html']">

        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@n"/>
            </xsl:attribute>

            <img>
                <xsl:attribute name="src">
                    <xsl:text>images/jpgs/tpp2.jpg</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="class">
                    <xsl:text>navigation</xsl:text>
                </xsl:attribute>
            </img>

        </a>
    </xsl:template>



    <xsl:template match="xref">

        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@n"/>
            </xsl:attribute>

            <xsl:value-of select="."/>

        </a>
    </xsl:template>
    
    <xsl:template match="ref">
        
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            
            <xsl:value-of select="."/>
            
        </a>
    </xsl:template>
    
<!--<ref n="http://www.yale.edu/ynhti/curriculum/units/1989/1/89.01.09.x.html" rend="new">http://www.yale.edu/ynhti/curriculum/units/1989/1/89.01.09.x.html</ref>.</bibl>-->


    <xsl:template match="div2[@type='boxed']">

        <div>
            <xsl:attribute name="class">
                <xsl:text>novel</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </div>



    </xsl:template>





    <xsl:template match="list">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>

    <xsl:template match="item">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>

    <xsl:template match="q">
        <blockquote>
            <p>
                <xsl:apply-templates/>
            </p>
        </blockquote>
    </xsl:template>

    <xsl:template match="title[@level='m']">
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>
    
    <xsl:template match="title[@level='j']">
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>
    
    <xsl:template match="title">
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>
    
    <xsl:template match="title[@level='a']">
            <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="author">
        <xsl:apply-templates/>
    </xsl:template>

</xsl:stylesheet>
