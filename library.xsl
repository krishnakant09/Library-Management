<?xml version="1.0" encoding="UTF-8"?>
<!--
  Experiment 5: Web Technologies
  File: library.xsl
  Description: XSLT 1.0 template transforming XML book catalog into a styled HTML table.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Digital Library Catalog - XSLT</title>
        <link rel="stylesheet" href="style.css"/>
      </head>
      <body>
        <div class="catalog-container">
          <!-- Header Banner -->
          <header class="catalog-header">
            <div class="header-content">
              <h1>Digital Library Book Catalog</h1>
              <p class="subtitle">XML Data Rendered using XSLT Transformation</p>
            </div>
            <div class="header-stats">
              <div class="stat-box">
                <span class="stat-number"><xsl:value-of select="count(library/book)"/></span>
                <span class="stat-label">Total Books</span>
              </div>
              <div class="stat-box">
                <span class="stat-number available-text">
                  <xsl:value-of select="count(library/book[@status='Available'])"/>
                </span>
                <span class="stat-label">Available</span>
              </div>
            </div>
          </header>

          <!-- Table Container -->
          <div class="table-card">
            <table class="catalog-table">
              <thead>
                <tr>
                  <th>Book ID</th>
                  <th>Title</th>
                  <th>Author</th>
                  <th>Category</th>
                  <th>Publisher</th>
                  <th>Year</th>
                  <th>Price</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
                <!-- Loop through books sorted alphabetically by title -->
                <xsl:for-each select="library/book">
                  <xsl:sort select="title" order="ascending"/>
                  <tr>
                    <td class="id-col"><xsl:value-of select="@id"/></td>
                    <td class="title-col"><xsl:value-of select="title"/></td>
                    <td><xsl:value-of select="author"/></td>
                    <td>
                      <span class="{concat('badge cat-', @category)}">
                        <xsl:value-of select="@category"/>
                      </span>
                    </td>
                    <td><xsl:value-of select="publisher"/></td>
                    <td><xsl:value-of select="year"/></td>
                    <td class="price-col">
                      <xsl:value-of select="price/@currency"/><xsl:text> </xsl:text><xsl:value-of select="price"/>
                    </td>
                    <td>
                      <xsl:choose>
                        <xsl:when test="@status='Available'">
                          <span class="status-badge status-available">Available</span>
                        </xsl:when>
                        <xsl:otherwise>
                          <span class="status-badge status-borrowed">Borrowed</span>
                        </xsl:otherwise>
                      </xsl:choose>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </div>

          <footer class="catalog-footer">
            <p>Web Technologies Lab &#8226; Experiment 5: XML, DTD &amp; XSLT</p>
          </footer>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
