<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
	<head>
		<title> Wykaz </title>
	</head>
	<body style="font-family:Tahoma; background-color:#654321;">
		<table border="0">
			<tr align="left">
				<xsl:value-of select="wykaz/miejsce"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="wykaz/data"/>
			</tr>
		</table>
			<br/><br/>
		<table width="80%" border="1" align="center">
			<tr><th colspan="2"> Wykaz zadluzenia mieszkancow wspolnoty mieszkaniowej
			</th></tr>
			<tr>
				<td width="50%" >
				<span style="font-weight: bold"> Nazwa wspólnoty: </span><xsl:value-of select="wykaz/wspolnota/nazwa"/><br/>
				<span style="font-weight: bold">Adres budynku macierzystego: </span> <xsl:value-of select="wykaz/wspolnota/adres"/><br/>
				<span style="font-weight: bold">Rodzaj budynku: </span><xsl:value-of select="wykaz/wspolnota/rodzaj"/><br/>
				<span style="font-weight: bold">Inne budynki: </span><xsl:value-of select="wykaz/wspolnota/inne"/><br/>
				<span style="font-weight: bold">Administrator: </span><xsl:value-of select="wykaz/wspolnota/administrator"/><br/>
				<span style="font-weight: bold">E-mail: </span><xsl:value-of select="wykaz/wspolnota/email"/><br/>
				</td>
				<td align="center">
					<img>
						<xsl:attribute name="src"><xsl:value-of select="wykaz/zdjecie"/></xsl:attribute>
						<xsl:attribute name="width">250</xsl:attribute>
						<xsl:attribute name="height">175</xsl:attribute>
					</img>
				</td>
			</tr>
		</table>	
			<br/><br/>
		<table width="90%" align="center" >
			<tr>
				<table width="85%" border="1" align="center">
					<xsl:apply-templates select="wykaz/wykaz-lokali" />
				</table>
			</tr>
		</table>
			<br/><br/>
		<table width="70%" border="0" align="center">
			<table border="1" align="center" width="100%">
			<tr align="center" >
				<th width="50%">Wykaz sporządzony przez:</th>
				<th width="50%">Na prosbe:</th>
			</tr>
			<tr align="center" >
				<td width="50%" ><xsl:apply-templates select="wykaz/sporzadzajacy"/></td>
				<td width="50%"><xsl:apply-templates select="wykaz/zlecajacy"/></td>
			</tr>			
			</table>
		<br/><br/>
		<tr > <td colspan="2" align="center" style="border-width:0px;">		
		Niniejszy wykaz moze być podstawa dochodzenia naleznosci na drodze sadowej. <br/><br/>
		W wypadku niezgodnosci ze stanem faktyczny, prosimy lokatorów o złozenie wyjasnien.<br/><br/>
		</td></tr>
		<tr><td width="25%">
		<table  style="border-style:solid; border-width:1px;" >
			<tr align="center"> <span style="font-weight:bold;"> <xsl:value-of select="wykaz/sporzadzajacy/stanowisko"/></span></tr><br/>
			<tr align="center"> <xsl:value-of select="wykaz/sporzadzajacy/imie"/><xsl:text> </xsl:text> <xsl:value-of select="wykaz/sporzadzajacy/imie"/></tr>
		</table>
		</td></tr>
		</table>
	
	</body>
</html>
</xsl:template>

<xsl:template match="wykaz/wykaz-lokali">
	<tr><th>Lp.</th><th>Lokal</th><th>Wlasciciel</th><th>Zadluzenie</th></tr>
	<xsl:for-each select="lokal">
		<tr align="center">
			<td><xsl:number value="position()" format="1" /></td>
			<td><xsl:value-of select="numer-lokalu"/></td>
			<td><xsl:value-of select="wlasciciel"/></td>
			<td><xsl:value-of select="dlug"/></td>
		</tr>
	</xsl:for-each>
</xsl:template>

<xsl:template match="wykaz/sporzadzajacy">
	<tr> <td> <xsl:value-of select="imie"/><xsl:text>  </xsl:text> <xsl:value-of select="nazwisko"/></td></tr>
	<tr> <td><xsl:value-of select="stanowisko"/></td></tr>
</xsl:template>

<xsl:template match="wykaz/zlecajacy">
	<tr> <td> <xsl:value-of select="imie"/><xsl:text>  </xsl:text> <xsl:value-of select="nazwisko"/></td></tr>
	<tr> <td><xsl:value-of select="stanowisko"/></td></tr>
</xsl:template>

</xsl:stylesheet>