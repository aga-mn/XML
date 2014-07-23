<?xml version="1.0" encoding="ISO-8859-2"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="/">
<html>
	<head> <title> Faktura </title> </head>
	<body style="font-family:Tahoma">
	<table width="80%" border="2" align="center"> 
		<tr > <th colspan="2" > Faktura VAT numer <xsl:value-of select="faktura/numer"/></th></tr> 
		<tr >
			<td> <table width="100%" border="1" > <xsl:apply-templates select="faktura/sprzedawca_dane" /> </table> </td>
			<td> <table width="100%" border="1" > <xsl:apply-templates select="faktura/odbiorca_dane" /> </table> </td>
		</tr>
	</table>
		<br/> <br/>
	<table align="center" width="80%" border="1" > 
		<tr> 
			<td>  Data wystawienia: </td> <td> <xsl:value-of select="faktura/data_wyst"/> </td>
			<td> Data sprzedazy: </td> <td> <xsl:value-of select="faktura/data_sprzed" /> </td>
		</tr>
		<tr> 
			<td>Termin zaplaty: </td> <td> <xsl:value-of select="faktura/termin"/> </td>
			<td> Sposob zaplaty: </td> <td> <xsl:value-of select="faktura/sposob_zaplaty" /> </td>
		</tr>
	</table>	
			<br/> <br/>
	<table width="80%" align="center"> 
		<tr> 
			<table width="100%" border="1" >  <xsl:apply-templates select="faktura/lista_towarow" /> </table>
		</tr>
	</table>
			<br/> <br/>
	<table border="2" width="80%" align="center">
		<h3> Do zaplaty zl: </h3>
			 <tr><td style="border:0px">Cyfrowo: <xsl:value-of select="faktura/lista_towarow/razem_vat"/> <br/> <br/>
			 Slownie: <xsl:value-of select="faktura/razem_slownie"/>  </td></tr>
	</table>
		<br/> <br/>
	<table border="1" align="center" width="80%">
		<tr>
			<td width="45%" align="center">
				Osoba upowazniona do odbioru faktury<br/><br/>
					<xsl:value-of select="faktura/osoba_odb"/> 
			</td>
			<td width="45%" align="center">
				Osoba upowazniona do wystawienia faktury<br/><br/>
					<xsl:value-of select="faktura/osoba_wyst"/> 
			</td>
		</tr>
	</table>
</body>
</html>
</xsl:template>

<xsl:template match="faktura/sprzedawca_dane" >

<tr>  <th> Sprzedawca </th></tr>
<tr align="center" > <xsl:value-of select="nazwa" /> </tr>
<tr> <xsl:apply-templates select="adres"/></tr>
<tr align="center" > NIP: <xsl:value-of select="nip" /> </tr>
<tr align="center"> REGON: <xsl:value-of select="regon" /></tr>

</xsl:template>

<xsl:template match="faktura/odbiorca_dane" >

<tr> <th> Odbiorca </th> </tr>
<tr align="center" > <xsl:value-of select="nazwa" /> </tr>
<tr><xsl:apply-templates select="adres"/></tr>
<tr align="center" > NIP: <xsl:value-of select="nip" /> </tr>
<tr align="center" > REGON: <xsl:value-of select="regon" /></tr>

</xsl:template>

<xsl:template match="adres">
	<table width="100%" border="1">
		<tr> 
			<td> <xsl:value-of select="miasto" /> </td> 
			<td> <xsl:value-of select="kod_poczt" /> </td>
		</tr>
		<tr> 
			<td> <xsl:value-of select="ulica" /> </td> 
			<td> <xsl:value-of select="nr"/> </td>
		</tr>
	</table>
</xsl:template>

<xsl:template match="faktura/lista_towarow">
<tr> <th> LP. </th> <th>Nazwa towaru </th> <th> JM </th> <th>Ilosc </th> <th> Cena netto </th> <th>Wartosc netto </th> <th> Stawka VAT </th>
<th>Wartosc z VAT</th>
</tr> 
<xsl:for-each select="pozycja" >
	<tr align="center">
		<td><xsl:value-of select="@lp"/></td>
		<td><xsl:value-of select="nazwa_towaru"/></td>
		<td><xsl:value-of select="jm"/></td>
		<td><xsl:value-of select="ilosc"/></td>
		<td><xsl:value-of select="cena_netto"/></td>
		<td><xsl:value-of select="wartosc_netto"/></td>
		<td><xsl:value-of select="stawka_vat"/>%</td>
		<td><xsl:value-of select="wartosc_vat"/></td>
	</tr>
</xsl:for-each>
<tr >
	<td colspan="5" align="right">RAZEM</td> 
	<td align="center"> <xsl:value-of select="razem_netto"/> </td> 
	<td align="center">-</td>
	<td align="center"> <xsl:value-of select="razem_vat"/> </td>
</tr>
</xsl:template>

</xsl:stylesheet>