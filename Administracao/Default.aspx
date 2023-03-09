<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Administracao/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Account_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<div style="width:100%; height:150px;">       
   <table border="0" width="100%" cellspacing="0" cellpadding="0" height="25" background="mytnr/barra2.png">
	<tr>
		<td>     
            <div id="menu">
            <ul>
              <li><h2>Convite</h2>
                <ul>
                   <li><asp:LinkButton ID="lbtnCadastroLogin" runat="server" Font-Names="Arial" Font-Size="12px" ForeColor="Black" onclick="lbtnCadastroLogin_Click">Usuario</asp:LinkButton></li>
                   <li><asp:LinkButton ID="lbtnCadastroConvite" runat="server" Font-Names="Arial" Font-Size="12px" ForeColor="Black" onclick="lbtnCadastroConvite_Click">Convite</asp:LinkButton></li>
                   <li><asp:LinkButton ID="lbtnCadastroCliente" runat="server" Font-Names="Arial" Font-Size="12px" ForeColor="Black" onclick="lbtnCadastroCliente_Click" >Cliente</asp:LinkButton></li>
                </ul>
              </li>
            </ul>
            <ul>
              <li><h2>Album</h2>
                <ul>
                   <li><asp:LinkButton ID="lbtnCadastroAlbum" runat="server" Font-Names="Arial" Font-Size="12px" ForeColor="Black" onclick="lbtnCadastroAlbum_Click" >Criar Album</asp:LinkButton></li>
                   <li><asp:LinkButton ID="lbtnCadastroItemAlbum" runat="server" Font-Names="Arial" Font-Size="12px" ForeColor="Black" onclick="lbtnCadastroItemAlbum_Click" >Enviar dados</asp:LinkButton></li>       
                </ul>
              </li>
            </ul>
            <ul>
              <li><h2>Chat</h2>
              </li>
            </ul>
            <ul>
              <li><h2>Catálogo</h2>
              </li>
            </ul>
            <ul>
              <li><h2>Tema</h2>
              </li>
            </ul>
            <ul>
              <li><h2>Ajuda</h2>
              </li>
            </ul>
            </div>           
       </td>
	</tr>
   </table>
</div>        





 

                   
<asp:Panel ID="Panel1" Height="400px" runat="server">
</asp:Panel>
  
</asp:Content>
