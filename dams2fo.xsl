<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4"
                                       page-height="29.7cm" page-width="21cm"
                                       margin-top="1cm" margin-bottom="1cm"
                                       margin-left="1.5cm" margin-right="1.5cm">
                    <fo:region-body margin="1cm"/>
                    <fo:region-after extent="1cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="A4">
                <fo:flow flow-name="xsl-region-body">

                    <fo:block font-family="DejaVu Sans" font-size="22pt"
                              font-weight="bold" text-align="center"
                              space-after="20pt" line-height="1.4">
                        Разширен каталог на язовирите в България
                    </fo:block>

                    <fo:block font-family="DejaVu Sans" font-size="10pt"
                              line-height="1.4" space-after="30pt"
                              text-align="center">
                        Този документ съдържа подробна информация за някои от най-ключовите язовири в страната, 
                        включително координати, бележки, предназначение и изображения.
                    </fo:block>

                    <fo:block font-family="DejaVu Sans" font-size="12pt" font-weight="bold"
                              space-before="10pt" space-after="5pt">
                        Съдържание (региони):
                    </fo:block>
                    <fo:list-block>
                        <xsl:for-each select="catalog/region">
                            <fo:list-item space-before="3pt">
                                <fo:list-item-label end-indent="label-end()">
                                    <fo:block>•</fo:block>
                                </fo:list-item-label>
                                <fo:list-item-body start-indent="body-start()">
                                    <fo:block font-family="DejaVu Sans" font-size="10pt">
                                        <xsl:value-of select="name"/>
                                    </fo:block>
                                </fo:list-item-body>
                            </fo:list-item>
                        </xsl:for-each>
                    </fo:list-block>

                </fo:flow>
            </fo:page-sequence>

            <fo:page-sequence master-reference="A4">
                

                <fo:static-content flow-name="xsl-region-after">
                    <fo:block font-size="10pt" 
                              font-family="DejaVu Sans" 
                              text-align="center"
                              color="white" 
                              background-color="#5E5E5E"
                              line-height="1.4">
                        <xsl:text>Каталог на язовирите - стр. </xsl:text>
                        <fo:page-number/>
                    </fo:block>
                </fo:static-content>

                <fo:flow flow-name="xsl-region-body">
                    
                    <xsl:for-each select="catalog/region">

                        <fo:block font-size="13pt" font-family="DejaVu Sans" 
                                  font-weight="bold" 
                                  background-color="#BCDDFE" 
                                  padding="5pt" 
                                  space-before="15pt" 
                                  space-after="5pt" 
                                  border-bottom="2pt solid #6688BB">
                            <xsl:value-of select="name"/>
                        </fo:block>

                        <fo:block font-family="DejaVu Sans" font-style="italic"
                                  font-size="10pt" space-after="10pt"
                                  line-height="1.4">
                            <xsl:value-of select="description"/>
                        </fo:block>

                        <xsl:if test="sightseeing">
                            <fo:block font-family="DejaVu Sans" font-size="10pt"
                                      margin-bottom="10pt"
                                      background-color="#FFF9D1"
                                      padding="6pt" border="1pt solid #EEDD88">
                                <fo:block font-weight="bold" margin-bottom="4pt">
                                    Забележителности в района:
                                </fo:block>
                                <fo:block>
                                    <xsl:value-of select="sightseeing"/>
                                </fo:block>
                            </fo:block>
                        </xsl:if>

                        <fo:table table-layout="fixed" width="100%" space-after="15pt">
                            <fo:table-column column-width="4cm"/>
                            <fo:table-column column-width="9cm"/>
                            <fo:table-column column-width="4cm"/>

                            <fo:table-header>
                                <fo:table-row background-color="#f0f0f0">
                                    <fo:table-cell padding="4pt" border="solid 1pt #ccc">
                                        <fo:block font-family="DejaVu Sans"
                                                  font-weight="bold"
                                                  text-align="center">
                                            Язовир
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="4pt" border="solid 1pt #ccc">
                                        <fo:block font-family="DejaVu Sans"
                                                  font-weight="bold"
                                                  text-align="center">
                                            Детайли
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="4pt" border="solid 1pt #ccc">
                                        <fo:block font-family="DejaVu Sans"
                                                  font-weight="bold"
                                                  text-align="center">
                                            Изображение
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-header>

                            <fo:table-body>
                                
                                <xsl:for-each select="dam">
                                    <fo:table-row>
                                        <fo:table-cell padding="4pt" border="solid 1pt #ccc">
                                            <fo:block font-family="DejaVu Sans"
                                                      font-size="11pt"
                                                      font-weight="bold">
                                                <xsl:value-of select="name"/>
                                            </fo:block>
                                        </fo:table-cell>

                                        <fo:table-cell padding="4pt" border="solid 1pt #ccc"
                                                       font-family="DejaVu Sans"
                                                       font-size="9pt">
                                            <fo:block>
                                                <fo:block font-weight="bold">Местоположение:</fo:block>
                                                <fo:block><xsl:value-of select="location"/></fo:block>
                                            </fo:block>

                                            <xsl:if test="capacity">
                                                <fo:block space-before="4pt">
                                                    <fo:block font-weight="bold">Обем:</fo:block>
                                                    <fo:block><xsl:value-of select="capacity"/></fo:block>
                                                </fo:block>
                                            </xsl:if>

                                            <xsl:if test="usage">
                                                <fo:block space-before="4pt">
                                                    <fo:block font-weight="bold">Предназначение:</fo:block>
                                                    <fo:block><xsl:value-of select="usage"/></fo:block>
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
                                                          background-color="#EEEEEE"
                                                          padding="4pt">
                                                    <fo:block font-weight="bold">Бележка:</fo:block>
                                                    <fo:block font-style="italic">
                                                        <xsl:value-of select="note"/>
                                                    </fo:block>
                                                </fo:block>
                                            </xsl:if>
                                        </fo:table-cell>

                                        <fo:table-cell padding="4pt" border="solid 1pt #ccc"
                                                       text-align="center">
                                            <fo:block>
                                                <fo:external-graphic src="{image}"
                                                                     scaling="uniform"
                                                                     content-width="3.5cm"/>
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>

                    </xsl:for-each>

                </fo:flow>
            </fo:page-sequence>

        </fo:root>
    </xsl:template>

</xsl:stylesheet>
