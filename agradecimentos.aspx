<%@ Page Title="Agradecimentos" Language="C#" MasterPageFile="~/Convite.master" AutoEventWireup="true" CodeFile="agradecimentos.aspx.cs" Inherits="agradecimentos" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">    
<head id="Head1" runat="server" />
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <center>   
       <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnablePartialRendering="true" EnableScriptGlobalization="true">
       </asp:ToolkitScriptManager>
        <table style="width:100%;" border="0" cellpadding="0" cellspacing="0">
        <tr>
           <td>&nbsp;</td>
           <td>&nbsp;</td>
           <td>&nbsp;</td>
        </tr>
        </table>

            <asp:Label ID="lblHash" runat="server" Text=""></asp:Label>            
            <asp:Label ID="lblIdUsuario" runat="server" Text=""></asp:Label>            
        <asp:Panel ID="Panel1" CssClass="album" Width="800px" runat="server">

        <fieldset class="register" >
            <legend>Preencher Agradecimento </legend>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
               <ContentTemplate>

                    <table style="width:800px;" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="right">
                            &nbsp;</td>
                        <td align="left">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                        <tr>
                       
                            <td align="center" colspan="3">
                                &nbsp;
                                <cc1:Editor ID="edtAgradecimento" runat="server" Width="750px" Height="234px"/>
                            </td>
                            
                        </tr>
                        <tr>
                            <td align="center" colspan="3">
                                &nbsp;</td>
                        </tr>
                    </table>
               </ContentTemplate>
             </asp:UpdatePanel>
       
            <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2">            
            <ProgressTemplate>
                &nbsp;<img alt="" src="imagens/wait.gif" />Aguarde...</ProgressTemplate>
            </asp:UpdateProgress>

        </fieldset>

        <p>
        </p>

       
           <asp:UpdatePanel ID="UpdatePanel1" runat="server">
           <ContentTemplate>           
            <fieldset class="register" >
            <legend>Convidados </legend>
       
            <table style="width:100%;" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="right">
                        &nbsp;</td>
                    <td align="left">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" colspan="3">
                       <asp:Panel ID="pnDados" Width="800px" ScrollBars="Auto" runat="server">
                      
                           <table style="width:100%;" border="0" cellpadding="0" cellspacing="0">
                               <tr>
                                   <td >
                                       &nbsp;</td>
                                   <td>
                                       <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
                                           SelectMethod="consultaConviteClienteUsuario_confirmado"  TypeName="Servico" 
                                           onselecting="ObjectDataSource3_Selecting">
                                           <SelectParameters>
                                               <asp:Parameter Name="v_codigo" Type="Int32" />
                                           </SelectParameters>
                                       </asp:ObjectDataSource>
                                   </td>
                                   <td >
                                       &nbsp;</td>
                               </tr>
                               <tr>
                                   <td >
                                       &nbsp;</td>
                                   <td>
                                       &nbsp;</td>
                                   <td>
                                       &nbsp;</td>
                               </tr>
                               <tr>
                                   <td align="center" colspan="3">
                                       <asp:GridView ID="grdDados" runat="server" AutoGenerateColumns="False" 
                                           CellPadding="4" Font-Names="Verdana" Font-Size="11px" ForeColor="#333333" 
                                           GridLines="None" Width="750px" AllowPaging="True" 
                                           DataSourceID="ObjectDataSource3" onrowdatabound="grdDados_RowDataBound">
                                           <PagerSettings Position="Top" />
                                           <RowStyle BackColor="#EFF3FB" />
                                           <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                           <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                           <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                           <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                           <EditRowStyle BackColor="#2461BF" />
                                           <AlternatingRowStyle BackColor="White" />
                                           <Columns>     
                                              <asp:TemplateField HeaderText="Envia" ShowHeader="True">
                                                 <HeaderTemplate>
                                                    <asp:CheckBox AutoPostBack="true" ID="ckTodos" runat="server"  OnCheckedChanged="chkTodos_CheckedChanged"></asp:CheckBox>
                                                 </HeaderTemplate>
                                                 <ItemTemplate>
                                                    <asp:CheckBox AutoPostBack="true" ID="ckEnvia" runat="server"></asp:CheckBox>
                                                 </ItemTemplate>                                                
                                              </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Codigo" SortExpression="codigo">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# Eval("idconvite_cliente") %>'  />
                                                 </ItemTemplate>                                                
                                              </asp:TemplateField>                                            
                                              <asp:TemplateField HeaderText="Nome" SortExpression="nome">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblNome" runat="server" Text='<%# Eval("nome") %>'  />
                                                 </ItemTemplate>                                              
                                              </asp:TemplateField>                                        
                                             <asp:TemplateField HeaderText="E-mail" SortExpression="email">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("email") %>'   />
                                                 </ItemTemplate>                                                
                                              </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Status" SortExpression="status">
                                                 <ItemTemplate>
                                                    <asp:Image ID="imgStatus" runat="server" ImageAlign="Middle"></asp:Image>
                                                    <asp:DropDownList ID="ddlStatus" runat="server" Enabled="false" 
                                                       SelectedValue='<%# Bind("status")%>'
                                                       CssClass="botao" Width="120px">      
                                                       <asp:ListItem Text="Confirmado" Value="1"></asp:ListItem>
                                                       <asp:ListItem Text="Sem Resposta" Value="0"></asp:ListItem>                               
                                                       <asp:ListItem Text="Não irá" Value="2"></asp:ListItem>                               
                                                    </asp:DropDownList>                                                                 
                                                 </ItemTemplate>                                                
                                              </asp:TemplateField>                                            
                                           </Columns>   
                                       </asp:GridView>
                                   </td>                             
                               </tr>
                               <tr>
                                   <td >
                                       &nbsp;</td>
                                   <td>
                                       &nbsp;</td>
                                   <td>
                                       &nbsp;</td>
                               </tr>
                               <tr>
                                   <td>
                                       &nbsp;</td>
                                   <td>
                                       &nbsp;</td>
                                   <td>
                                       &nbsp;</td>
                               </tr>
                               <tr>
                                   <td>
                                       &nbsp;</td>
                                   <td>
                                       &nbsp;</td>
                                   <td>
                                       &nbsp;</td>
                               </tr>
                               <tr>
                                  <td align="center" colspan="3">
                                     <asp:Button ID="btnEnvia" runat="server" CssClass="edit" 
                                           Text="Envia Agradecimento" Width="150px" onclick="btnEnvia_Click" />
                                  </td>

                               </tr>
                           </table>
                   
                   
                       </asp:Panel>

                    </td>
                </tr>
                <tr>
                    <td align="right">
                        &nbsp;</td>
                    <td align="left">
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                </table>
       
        </fieldset>                                           

           </ContentTemplate>
           </asp:UpdatePanel>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">            
            <ProgressTemplate>
                
                <img alt="" class="style2" src="imagens/wait.gif" />
                Aguarde...</ProgressTemplate>
            </asp:UpdateProgress>
       
       </asp:Panel>
   <asp:RoundedCornersExtender ID="Panel1_RoundedCornersExtender" runat="server" 
           BorderColor="ActiveBorder" Enabled="True" TargetControlID="Panel1">
       </asp:RoundedCornersExtender>
     

   </center>
</asp:Content>