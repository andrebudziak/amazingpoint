<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="contato.aspx.cs" Inherits="contato" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">  
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr>
		<td>
		<div align="center">
			<table border="0" width="800" cellspacing="0" cellpadding="0">
				<tr>
					<td align="center">
					&nbsp;<div align="center">
						<table border="0" width="650" cellspacing="0" cellpadding="0" height="309" background="lay/contato.png">
							<tr>
								<td>
								<p style="margin-top: 0; margin-bottom: 0; margin-left:90px; margin-right:25px">
						&nbsp;<p style="margin-top: 0; margin-bottom: 0; margin-left:90px; margin-right:25px">
						&nbsp;<p style="margin-top: 0; margin-bottom: 0; margin-left:90px; margin-right:25px">
						&nbsp;<p style="margin-top: 15px; margin-bottom: 0; margin-left:100px; margin-right:25px">
						<font face="Verdana" color="#306B54" style="font-size: 11pt">
						<b>Rua Petit Carneiro 352</b></font><p style="margin-top: 0; margin-bottom: 0; margin-left:100px; margin-right:25px">
						<font face="Verdana" color="#306B54"><b>
						<font style="font-size: 11pt">Água 
						Verde - </font></b></font><b>
						<font face="Verdana" color="#306B54" style="font-size: 11pt">Curitiba</font></b><p style="margin-top: 0; margin-bottom: 0; margin-left:100px; margin-right:25px">
						<b>
						<font face="Verdana" color="#306B54" style="font-size: 11pt">
						Tel. </font>
						<font face="Verdana" color="#306B54" style="font-size: 8pt">(41)</font><font face="Verdana" color="#306B54" style="font-size: 11pt"> </font>
						<font face="Verdana" color="#306B54" style="font-size: 13pt">3024-9439</font></b><p style="margin-top: 0; margin-bottom: 0; margin-left:100px; margin-right:25px">
						<b>
						<font face="Verdana" color="#306B54" style="font-size: 11pt">
						Cel. </font></b>
						<font face="Verdana" color="#306B54"><b>
						<font style="font-size: 8pt">
						(41)</font><font style="font-size: 11pt"> 8493-8945</font></b></font><p style="margin-top: 0; margin-bottom: 0; margin-left:100px; margin-right:25px">
						<b>
						<font face="Verdana" color="#306B54" style="font-size: 11pt">
						Cel. </font></b>
						<font face="Verdana" color="#306B54"><b>
						<font style="font-size: 8pt">
						(41)</font><font style="font-size: 11pt"> 9177-6505</font></b></font></td>
							</tr>
						</table>
						<p style="margin-left: 100px; margin-right: 25px; margin-top: 0; margin-bottom: 0">&nbsp;</p>
						<p style="margin-left: 100px; margin-right: 25px; margin-top: 0; margin-bottom: 0">&nbsp;</p>
						<table border="0" width="800" cellspacing="0" cellpadding="0">
							<tr>
								<td width="200">&nbsp;</td>
								<td width="400">
							<div align="right">
								<table border="0" width="360" cellspacing="0" cellpadding="0">
									<tr>
										<td align="center">
                                         <table border="0" width="360" cellspacing="0" cellpadding="0">
									        <tr>
										        <td align="left">
                                                   <asp:Label ID="lblTexto" runat="server" Text=""></asp:Label>
                                                    <table style="width: 100%;" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td>
                                                                &nbsp;<asp:Label ID="lblNome" runat="server" Font-Names="Verdana" Font-Size="11pt" Text="Nome:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                &nbsp;<asp:TextBox ID="txtNome" runat="server" Width="200px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;<asp:Label ID="lblEmail" runat="server" Font-Names="Verdana" Font-Size="11pt" Text="E-mail:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                &nbsp;<asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;<asp:Label ID="lblAssunto" Font-Names="Verdana" Font-Size="11pt" runat="server" Text="Assunto:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                &nbsp;<asp:TextBox ID="txtAssunto" runat="server" Width="200px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblMensagem" runat="server" Font-Names="Verdana" Font-Size="11pt" Text="Mensagem:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtMensagem" runat="server" Height="100px" 
                                                                    TextMode="MultiLine" Width="210px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3" align="center">
                                                                <table style="width: 100%;" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Button ID="btnEnviar" runat="server" Font-Names="Verdana" Font-Size="12pt" 
                                                                                Text="Enviar" Width="100px" onclick="btnEnviar_Click" />
                                                                        </td>
                                                                        <td>
                                                                            <asp:Button ID="btnLimpar" runat="server" Font-Names="Verdana" Font-Size="12pt" 
                                                                                Text="Limpar" Width="100px" onclick="btnLimpar_Click" />
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    </table>
                                                            </td>                                                   
                                                        </tr>
                                                    </table>
		
				
					
					
										</td>
									</tr>
								</table>					
										</td>
									</tr>
								</table>
							</div>
								</td>
								<td width="200">&nbsp;</td>
							</tr>
						</table>
						<p style="margin-left: 100px; margin-right: 25px; margin-top: 0; margin-bottom: 0">&nbsp;</div>
							<p style="margin-top: 0; margin-bottom: 15px">
							&nbsp;</p>
					<p style="margin-top: 0; margin-bottom: 15px">
							<b>
							<font face="Verdana" style="font-size: 11pt" color="#306B54">
							
							MAPA DE LOCALIZAÇÃO </font></b></p>
							
							<iframe width="650" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com.br/maps?f=q&amp;source=s_q&amp;hl=pt-BR&amp;geocode=&amp;q=Rua+Petit+Carneiro,+352,+Curitiba+-+Paran%C3%A1&amp;aq=0&amp;sll=-14.179186,-53.173828&amp;sspn=58.163111,113.818359&amp;ie=UTF8&amp;hq=&amp;hnear=R.+Petit+Carneiro,+352+-+%C3%81gua+Verde,+Curitiba+-+Paran%C3%A1,+80240-050&amp;ll=-25.448429,-49.278939&amp;spn=0.00775,0.013926&amp;z=16&amp;output=embed"></iframe><br />
					<font face="Verdana"><small>
					<a href="http://maps.google.com.br/maps?f=q&amp;source=embed&amp;hl=pt-BR&amp;geocode=&amp;q=Rua+Petit+Carneiro,+352,+Curitiba+-+Paran%C3%A1&amp;aq=0&amp;sll=-14.179186,-53.173828&amp;sspn=58.163111,113.818359&amp;ie=UTF8&amp;hq=&amp;hnear=R.+Petit+Carneiro,+352+-+%C3%81gua+Verde,+Curitiba+-+Paran%C3%A1,+80240-050&amp;ll=-25.448429,-49.278939&amp;spn=0.00775,0.013926&amp;z=16" style="color:#306B54;text-align:left; text-decoration:none; font-weight:700">Exibir mapa ampliado</a></small></font>
					<p style="margin-top: 0; margin-bottom: 15px">
							&nbsp;</p>
					<p style="margin-top: 0; margin-bottom: 15px">
							&nbsp;</p>
					</td>
				</tr>
			</table>
		</div>
		</td>
	</tr>
</table>
</asp:Content>