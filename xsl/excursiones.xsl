<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
<xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-doctype" />

<!-- Plantilla principal: intercalamos código HTML con datos XML -->
<xsl:template match="/eventos" >

<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta name="description" content="Excursiones" />
		<title>Excursiones</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Club de montaña" />
			<a href="asamblea.xml">Asamblea</a>
			<a href="excursiones.xml">Excursiones</a>
			<a href="carreras.xml">Carreras</a>
			<a href="noticias.html">Noticias</a>
			<a href="#">Contacto</a>
		</header>
		
		<section class="excursiones">
			<h1>Excursiones</h1>
      <h2>Total: <xsl:value-of select="count(excursion)" /></h2>
			<table>
				<tr>
					<th>RUTA</th>
					<th>FECHA</th>
					<th>PRECIO</th>
					<th>DIFICULTAD</th>
				</tr>
				<xsl:apply-templates select="excursion" />				
			</table>			
		</section>

		<footer>
			<address>&#169; 2020 desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

<xsl:template match="excursion">
  <tr>
    <td><xsl:value-of select="ruta"/></td>
    <td><xsl:value-of select="salida/@dia"/></td>
    <td><xsl:value-of select="round(precio * 1.21 * 100) div 100"/>€</td>
    <td><xsl:choose>
          <xsl:when test="@dificultad = 'baja'">
            <span class="dificultad verde"><xsl:value-of select="@dificultad"/></span>
          </xsl:when>
          <xsl:when test="@dificultad = 'media'">
            <span class="dificultad naranja"><xsl:value-of select="@dificultad"/></span>
          </xsl:when>
          <xsl:when test="@dificultad = 'alta'">
            <span class="dificultad rojo"><xsl:value-of select="@dificultad"/></span>
          </xsl:when>
        </xsl:choose>
    </td>
  </tr>
</xsl:template>

</xsl:stylesheet>