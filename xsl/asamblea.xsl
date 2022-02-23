<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
<xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-doctype" />

<!-- Plantilla principal: intercalamos código HTML con datos XML -->
<xsl:template match="/eventos" >

<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta name="description" content="Asambleas" />
		<title>Asambleas</title>
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
		
		<main class="principal">
			<section class="asamblea">
				<h1>ASAMBLEA</h1>
          <xsl:apply-templates select="asamblea" >
              <xsl:sort select="convocatoria/fecha" order="descending" />
          </xsl:apply-templates>
				<p>Te esperamos</p>
			</section>
		</main>

		<footer>
			<address>&#169; 2020 desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

<xsl:template match="asamblea">
  <xsl:if test="position() = 1">
    <p>El <xsl:value-of select="convocatoria/fecha"/> celebraremos una asamblea <xsl:value-of select="convocatoria/@tipo"/>.</p>
	  <p>Los temas a tratar serán:</p>
	  <ol>
      <xsl:for-each select="orden_dia/tema">
        <li><xsl:value-of select="."/></li>
      </xsl:for-each>
	  </ol>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>