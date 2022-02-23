<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
<xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-doctype" />

<!-- Plantilla principal: intercalamos código HTML con datos XML -->
<xsl:template match="/eventos" >

<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta name="description" content="Carreras" />
		<title>Carreras</title>
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
		
		<section class="carreras">
			<h1>Carreras hasta 15 km</h1>
      <xsl:for-each select="carrera[kilometros &lt;= 15]">
        <article>
        <a href="{informacion}">
          <img src="../img/{img}" alt="{nombre}" />
          <p class="texto"><xsl:value-of select="nombre"/></p>
        </a>
          </article>
      </xsl:for-each>
		</section>
		<section class="carreras">
			<h1>Carreras de más de 15 km</h1>
			<xsl:for-each select="carrera[kilometros &gt; 15]">
        <article>
        <a href="{informacion}">
          <img src="../img/{img}" alt="{nombre}" />
          <p class="texto"><xsl:value-of select="nombre"/></p>
        </a>
          </article>
      </xsl:for-each>
		</section>
		<footer>
			<address>&#169; 2020 desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

</xsl:stylesheet>