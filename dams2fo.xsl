<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
>
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4"
                                       page-height="29.7cm"
                                       page-width="21cm"
                                       margin-top="1cm"
                                       margin-bottom="1cm"
                                       margin-left="1.5cm"
                                       margin-right="1.5cm">
                    <fo:region-body margin="1cm"/>
                    <fo:region-after extent="1cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="A4">
                <fo:flow flow-name="xsl-region-body">

                    <fo:block font-family="DejaVu Sans"
                              font-size="24pt"
                              font-weight="bold"
                              text-align="center"
                              space-after="20pt"
                              line-height="1.5"
                              color="#333"
                              padding-top="8cm">
                        ПРОЕКТ:
                        <fo:inline color="#006699">
                            Каталог на язовирите в България
                        </fo:inline>
                    </fo:block>

                    <fo:block font-family="DejaVu Sans"
                              font-size="12pt"
                              line-height="1.5"
                              text-align="center"
                              space-after="10pt"
                              color="#444">
                    </fo:block>

                    <fo:block font-family="DejaVu Sans"
                              font-size="10pt"
                              text-align="center"
                              line-height="1.4"
                              space-after="20pt"
                              color="#666">
                        Изготвен от: <fo:inline font-weight="bold" color="#000">Виктор Райков(9MI0600099) и Петър Марковски(7MI0600409)</fo:inline>
                        <fo:block>Година: 2025</fo:block>
                    </fo:block>

                    <fo:block space-before="10cm" text-align="center" font-family="DejaVu Sans">
                        © 2025, Каталог на язовирите в България
                    </fo:block>

                </fo:flow>
            </fo:page-sequence>

            <fo:page-sequence master-reference="A4">
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block font-size="10pt"
                              font-family="DejaVu Sans"
                              text-align="center"
                              color="#fff"
                              background-color="#999"
                              padding="3pt">
                        Съдържание (стр. <fo:page-number/>)
                    </fo:block>
                </fo:static-content>

                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-family="DejaVu Sans"
                              font-size="16pt"
                              font-weight="bold"
                              space-after="15pt"
                              color="#333">
                        Съдържание / Регионите
                    </fo:block>

                    <fo:list-block>
                        <xsl:for-each select="catalog/region">
                            <fo:list-item space-before="6pt">
                                <fo:list-item-label end-indent="label-end()">
                                    <fo:block>•</fo:block>
                                </fo:list-item-label>
                                <fo:list-item-body start-indent="body-start()">
                                    <fo:block font-family="DejaVu Sans" font-size="11pt" color="#333">
                                        <xsl:value-of select="name"/>
                                    </fo:block>
                                </fo:list-item-body>
                            </fo:list-item>
                        </xsl:for-each>
                    </fo:list-block>

                </fo:flow>
            </fo:page-sequence>

            <xsl:for-each select="catalog/region">
                <fo:page-sequence master-reference="A4">
                    
                    <fo:static-content flow-name="xsl-region-after">
                        <fo:block font-size="9pt"
                                  font-family="DejaVu Sans"
                                  text-align="center"
                                  color="white"
                                  background-color="#444"
                                  padding="3pt">
                            Регион: <xsl:value-of select="name"/> – стр. <fo:page-number/>
                        </fo:block>
                    </fo:static-content>

                    <fo:flow flow-name="xsl-region-body">

                        <fo:block break-before="page"/>

                        <fo:block font-family="DejaVu Sans"
                                  font-size="14pt"
                                  font-weight="bold"
                                  color="#003366"
                                  space-before="10pt"
                                  space-after="8pt"
                                  line-height="1.4">
                            <xsl:value-of select="name"/>
                        </fo:block>

                        <fo:block font-family="DejaVu Sans"
                                  font-size="10pt"
                                  font-style="italic"
                                  line-height="1.6"
                                  space-after="10pt"
                                  background-color="#EAF4FF"
                                  padding="5pt">
                            <xsl:value-of select="description"/>
                        </fo:block>

                        <xsl:if test="sightseeing">
                            <fo:block font-family="DejaVu Sans"
                                      font-size="10pt"
                                      line-height="1.4"
                                      background-color="#FFFAAA"
                                      border="1pt solid #EEDD66"
                                      padding="6pt"
                                      space-after="10pt">
                                <fo:block font-weight="bold" margin-bottom="4pt"
                                          color="#666">
                                    Забележителности:
                                </fo:block>
                                <fo:block>
                                    <xsl:value-of select="sightseeing"/>
                                </fo:block>
                            </fo:block>
                        </xsl:if>

                        <fo:table table-layout="fixed" width="95%" space-after="10pt">

                            <fo:table-column column-width="3cm"/>
                            <fo:table-column column-width="7cm"/>
                            <fo:table-column column-width="5cm"/>

                            <fo:table-header>
                                <fo:table-row background-color="#DEE7EE">
                                    <fo:table-cell border="1pt solid #ccc" padding="3pt">
                                        <fo:block font-family="DejaVu Sans" font-weight="bold"
                                                  text-align="center" color="#333">
                                            Язовир
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid #ccc" padding="3pt">
                                        <fo:block font-family="DejaVu Sans" font-weight="bold"
                                                  text-align="center" color="#333">
                                            Детайли
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt solid #ccc" padding="3pt">
                                        <fo:block font-family="DejaVu Sans" font-weight="bold"
                                                  text-align="center" color="#333">
                                            Изображение
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-header>

                            <fo:table-body keep-together.within-page="always">
                                <xsl:for-each select="dam">
                                    <fo:table-row>
                                        <fo:table-cell border="1pt solid #ccc"
                                                       padding="4pt">
                                            <fo:block font-family="DejaVu Sans"
                                                      font-size="11pt"
                                                      font-weight="bold"
                                                      color="#993300">
                                                <xsl:value-of select="name"/>
                                            </fo:block>
                                        </fo:table-cell>

                                        <fo:table-cell border="1pt solid #ccc"
                                                       padding="5pt"
                                                       font-family="DejaVu Sans"
                                                       font-size="9pt"
                                                       line-height="1.4"
                                                       color="#444">
                                            
                                            <xsl:if test="usage">
                                                <fo:block space-after="4pt">
                                                    <fo:block font-weight="bold">Предназначение:</fo:block>
                                                    <fo:block><xsl:value-of select="usage"/></fo:block>
                                                </fo:block>
                                            </xsl:if>

                                            <fo:block space-before="4pt">
                                                <fo:block font-weight="bold">Местоположение:</fo:block>
                                                <fo:block><xsl:value-of select="location"/></fo:block>
                                            </fo:block>

                                            <xsl:if test="capacity">
                                                <fo:block space-before="4pt">
                                                    <fo:block font-weight="bold">Обем:</fo:block>
                                                    <fo:block><xsl:value-of select="capacity"/></fo:block>
                                                </fo:block>
                                            </xsl:if>

                                            <xsl:if test="coordinates">
                                                <fo:block space-before="4pt">
                                                    <fo:block font-weight="bold">Координати:</fo:block>
                                                    <fo:block><xsl:value-of select="coordinates"/></fo:block>
                                                </fo:block>
                                            </xsl:if>

                                            <fo:block space-before="4pt">
                                                <fo:block font-weight="bold">Характеристики:</fo:block>
                                                <fo:block><xsl:value-of select="characteristics"/></fo:block>
                                            </fo:block>

                                            <xsl:if test="note">
                                                <fo:block space-before="4pt"
                                                          background-color="#F6F6F6"
                                                          padding="4pt">
                                                    <fo:block font-weight="bold" color="#666">
                                                        Допълнителна бележка:
                                                    </fo:block>
                                                    <fo:block font-style="italic" color="#333">
                                                        <xsl:value-of select="note"/>
                                                    </fo:block>
                                                </fo:block>
                                            </xsl:if>
                                        </fo:table-cell>

                                        <fo:table-cell border="1pt solid #ccc"
                                                       padding="5pt"
                                                       text-align="center"
                                                       overflow="hidden">
                                            <fo:block>
                                                <fo:external-graphic
                                                    src="{image}"
                                                    scaling="uniform"
                                                    content-width="4.8cm"
                                                    border="1pt solid #999"/>
                                            </fo:block>
                                        </fo:table-cell>

                                    </fo:table-row>
                                </xsl:for-each>
                            </fo:table-body>

                        </fo:table>

                    </fo:flow>
                </fo:page-sequence>
            </xsl:for-each>

        </fo:root>
    </xsl:template>

</xsl:stylesheet>
