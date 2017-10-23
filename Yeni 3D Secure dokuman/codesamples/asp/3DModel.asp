<html>
<head>
<title>3D</title>
<meta http-equiv="Content-Language" content="tr">

  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-9">

  <meta http-equiv="Pragma" content="no-cache">

  <meta http-equiv="Expires" content="now">
  
  

</head>

<body>

<!-- #include file = "hex_sha1_js.asp" -->

<%

      	'ASAGIDA 3D SECURE ISLEMI I�IN GEREKLI ALANLAR VE KULLANIMLARI ILE ASP KOD �RNEGI VERILMISTIR. GIRILEN DEGERLER TEST AMA�LI GIRILMISTIR.
        '3D MODEL �ZERINE D�ZENLENMIS KOD �RNEGIDIR. IS YERLERI KENDI DEGERLERIYLE DEGISKENLERI TANIMLAMALIDIR. 
        'IS YERLERINE REFERANS AMA�LI OLUSTURULMUSTUR.
        



'    gerekli parametreler

Dim clientId,amount,oid,okUrl,failUrl,rnd,taksit,islemtipi,storekey,hashstr,hash1,hash,storetype

clientId = "XXXXXXXXX"  'Banka tarafindan magazaya verilen isyeri numarasi
amount = "9.95"         'Islem tutari
oid = ""                'Siparis numarasi
okUrl = "http://<sunucu_adresi>/3DModelOdeme.asp"    '3D islemi basariliysa(�deme islemi degil) d�n�lecek web sayfasi
failUrl = "http://<sunucu_adresi>/3DModelOdeme.asp"  '3D islemi basarisizsa(�deme islemi degil) d�n�lecek web sayfasi
rnd = now()       'Kontrol ve g�venlik ama�li s�rekli degisen bir deger tarih gibi
 
storekey = "xxxxxx"            'Magaza anahtari
storetype = "3d"               '3D secure modeli


hashstr = clientId & oid & amount & okUrl & failUrl & rnd & storekey


hash = b64_sha1(hashstr)        'G�venlik ama�li olusturulan hash
%>

<center>
            <form method="post" action="https://<sunucu_adresi>/<3dgate_path>">
                <table>
                    <tr>
                        <td>Kredi Kart Numarasi:</td>
                        <td><input type="text" name="pan" size="20"/>
                    </tr>
                    
                    <tr>
                        <td>G�venlik Kodu:</td>
                        <td><input type="text" name="cv2" size="4" value=""/></td>
                    </tr>
                    
                    <tr>
                        <td>Son Kullanma Yili:</td>
                        <td><input type="text" name="Ecom_Payment_Card_ExpDate_Year" value=""/></td>
                    </tr>
                    
                    <tr>
                        <td>Son Kullanma Ayi:</td>
                        <td><input type="text" name="Ecom_Payment_Card_ExpDate_Month" value=""/></td>
                    </tr>
                    
                    <tr>
                        <td>Visa/MC secimi</td>
                        <td><select name="cardType">
                            <option value="1">Visa</option>
                            <option value="2">MasterCard</option>
                        </select>
                    </tr>
                    
                    <tr>
                        <td align="center" colspan="2">
                            <input type="submit" value="�demeyi Tamamla"/>
                        </td>
                    </tr>
                    
                </table>
                <input type="hidden" name="clientid" value="<%=clientId%>">
		
                <input type="hidden" name="amount" value="<%=amount%>">
                <input type="hidden" name="oid" value="<%=oid%>">	
                <input type="hidden" name="okUrl" value="<%=okUrl%>">
                <input type="hidden" name="failUrl" value="<%=failUrl%>">
                <input type="hidden" name="rnd" value="<%=rnd%>" >
                <input type="hidden" name="hash" value="<%=hash%>" >
                
                <input type="hidden" name="storetype" value="<%=storetype%>" >		
                <input type="hidden" name="lang" value="tr">
				<input type="hidden" name="currency" value="949">
                
               
            </form>
            <br>
            <b>Kullanilan Hidden Parametreler</b>
            <br>
            
            &lt;input type="hidden" name="clientid" value=""&gt;<br>
                &lt;input type="hidden" name="amount" value=""&gt;<br>
                &lt;input type="hidden" name="oid" value=""&gt;	<br>
                &lt;input type="hidden" name="okUrl" value=""&gt;<br>
                &lt;input type="hidden" name="failUrl" value=""&gt;<br>
                &lt;input type="hidden" name="rnd" value="" &gt;<br>
                &lt;input type="hidden" name="hash" value="" &gt;<br>
                
                &lt;input type="hidden" name="storetype" value="" &gt;	<br>	
                &lt;input type="hidden" name="lang" value=""&gt;<br>
        </center>
    </body>
</html>