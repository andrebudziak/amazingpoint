<%@ Page Title="Login" Language="C#" MasterPageFile="~/Convite.master" AutoEventWireup="true"  CodeFile="login.aspx.cs" Inherits="login" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
       <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
       </asp:ToolkitScriptManager>
    <asp:Panel ID="Panel1" runat="server">
    <div align="center">
       <table border="0" width="699" cellspacing="0" cellpadding="0">
				<tr>
					<td align="center">
                        <p align="center" style="margin: 0 85px">&nbsp;
                        </p>
                        <p align="center" style="margin: 0 85px">
                        &nbsp;<p align="center" style="margin: 0 85px">
                        <img border="3" src="lay/convite_meninas.jpg" width="500" height="250"><p align="center" style="margin: 0 85px">
                        <font face="Verdana" style="font-size: 11pt; font-weight: 700">
                        Modelo de 
                        convite 
                        meninas</font><p align="center" style="margin: 0 85px">
                        &nbsp;<p align="center" style="margin: 0 85px">
                        &nbsp;<p align="center" style="margin: 0 85px">
                        <img border="3" src="lay/convite_meninos.jpg" width="500" height="250"><p align="center" style="margin: 0 85px">
                        <font face="Verdana" style="font-size: 11pt; font-weight: 700">
                        Modelo de 
                        convite 
                        meninos</font><p align="center" style="margin: 0 85px">
                        &nbsp;<p align="center" style="margin: 0 85px">
                        &nbsp;<p style="margin-top: 0; margin-bottom: 0">
		     </td>
	      </tr>
	   </table>       
    </div>
    <div align="center">  
    <asp:Panel id="pnLogin" runat="server" Width="500px" >
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate> 

            <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification" 
                 ValidationGroup="LoginUserValidationGroup"/>
           
                <fieldset style="width:380px; border-color:White; border-width:3px; ">
                    <legend style="font-family:Verdana;font-size:14px; text-align:center;">Acesso ao Convite</legend>
                    <p>
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" style="font-family:Verdana;font-size:12px;">Usuario:</asp:Label>
                        <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                             CssClass="failureNotification" ErrorMessage="Nome de usuario obrigatório." ToolTip="Nome de usuário obrigatório." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" style="font-family:Verdana;font-size:12px;">Senha:</asp:Label>
                        <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                             CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                </fieldset>
                <p class="submitButton">
                    <asp:ImageButton ID="btnLogin" runat="server" CommandName="Login" Text="Login" 
                        ValidationGroup="LoginUserValidationGroup" 
                        ImageUrl="jpg/buttonA.gif" onclick="LoginButton_Click" />
                </p>
                </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">            
                <ProgressTemplate>
                   <center>
                    <img alt="" src="imagens/wait.gif" />Aguarde...
                   </center>
                </ProgressTemplate>
                </asp:UpdateProgress>

          </asp:Panel>
    </div>
    </asp:Panel>
    
       
</asp:Content>