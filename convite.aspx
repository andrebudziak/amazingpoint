<%@ Page Title="Enviar Convite" Language="C#" MasterPageFile="~/Convite.master" AutoEventWireup="true" CodeFile="convite.aspx.cs" Inherits="enviar_convite" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">    
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
   <center>   
       <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
       </asp:ToolkitScriptManager>


        <table style="width:100%;" border="0" cellpadding="0" cellspacing="0">
        <tr>
           <td>&nbsp;</td>
           <td>&nbsp;</td>
           <td>&nbsp;</td>
        </tr>
        </table>
    
        <asp:Panel ID="Panel1" CssClass="album" Width="800px" runat="server">
        <fieldset class="register" >
            <asp:Label ID="lblHash" runat="server" Text=""></asp:Label>            
            <asp:Label ID="lblIdUsuario" runat="server" Text=""></asp:Label>            
            <asp:Label ID="lblIdConvite" runat="server" Text=""></asp:Label>            
            <legend>Cadastro de Convite </legend>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
               <ContentTemplate>

                    <table style="width:800px;" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label7" runat="server" Text="Codigo:"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:Label ID="lblCodigo" runat="server"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label10" runat="server" Text="Nome:"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtNome" runat="server" CssClass="edit" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label1" runat="server" Text="E-mail:"></asp:Label>
                        </td>
                        <td align="left">
                            
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="edit" Width="200px"></asp:TextBox>
                            
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                        <tr>
                            <td align="right">
                                &nbsp;</td>
                            <td align="left">
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="right">
                                &nbsp;</td>
                        </tr>
                        <tr>
                       
                            <td align="center" colspan="3">
                                <asp:Button ID="btnIncluir" runat="server" CssClass="edit" 
                                    onclick="btnIncluir_Click" Text="Incluir" Width="150px" />
                                &nbsp;
                                <asp:Button ID="btnSalvar" runat="server" CssClass="edit" 
                                    onclick="btnSalvar_Click" Text="Salvar" Width="150px" />
                            </td>
                            
                        </tr>
                    </table>
               </ContentTemplate>
             </asp:UpdatePanel>
       
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">            
            <ProgressTemplate>
                &nbsp;<img alt="" class="style1" src="imagens/wait.gif" />
            </ProgressTemplate>
            </asp:UpdateProgress>

        </fieldset>
        <p>
        &nbsp;&nbsp;
            </p>

        <fieldset class="register" >
            <legend>Convites Cadastrados</legend>
       
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
                       <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                          <ContentTemplate>                      
                       
                           <table style="width:100%;" border="0" cellpadding="0" cellspacing="0">
                               <tr>
                                   <td >
                                       &nbsp;</td>
                                   <td>
                                       <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
                                           DeleteMethod="excluiConviteCliente" InsertMethod="incluiConviteCliente" 
                                           ondeleting="ObjectDataSource3_Deleting" 
                                           oninserting="ObjectDataSource3_Inserting" SelectMethod="consultaConviteClienteUsuario" 
                                           TypeName="Servico" UpdateMethod="incluiConviteCliente" 
                                           onselecting="ObjectDataSource3_Selecting">
                                           <DeleteParameters>
                                               <asp:Parameter Name="v_codigo" Type="Int32" />
                                           </DeleteParameters>
                                           <UpdateParameters>
                                               <asp:Parameter Name="v_codigo" Type="Int32" />
                                               <asp:Parameter Name="v_idConvite" Type="Int32" />
                                               <asp:Parameter Name="v_nome" Type="String" />
                                               <asp:Parameter Name="v_email" Type="String" />
                                               <asp:Parameter Name="v_status" Type="Int32" />
                                           </UpdateParameters>
                                           <SelectParameters>
                                               <asp:Parameter DefaultValue="0" Name="v_codigo" Type="Int32" />
                                           </SelectParameters>
                                           <InsertParameters>
                                               <asp:Parameter Name="v_codigo" Type="Int32" />
                                               <asp:Parameter Name="v_idConvite" Type="Int32" />
                                               <asp:Parameter Name="v_nome" Type="String" />
                                               <asp:Parameter Name="v_email" Type="String" />
                                               <asp:Parameter Name="v_status" Type="Int32" />
                                           </InsertParameters>
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
                                           DataSourceID="ObjectDataSource3" onrowdeleting="grdDados_RowDeleting" 
                                           onrowcommand="grdDados_RowCommand" onrowdatabound="grdDados_RowDataBound">
                                           <PagerSettings Position="Top" />
                                           <RowStyle BackColor="#EFF3FB" />
                                           <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                           <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                           <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                           <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                           <EditRowStyle BackColor="#2461BF" />
                                           <AlternatingRowStyle BackColor="White" />
                                           <Columns>     
                                              <asp:TemplateField ShowHeader="False">
                                                 <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButtonEdit" runat="server" CausesValidation="False" CommandName="Select" Text="Selecione" />
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
                                              <asp:TemplateField ShowHeader="False">
                                                 <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButtonDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                                       OnClientClick="return confirm('Deseja excluir o registro?');" Text="Deletar" />                                          
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
                           </table>
                           
                           </ContentTemplate>
                       </asp:UpdatePanel>

                       <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2">            
                       <ProgressTemplate>
                          <img alt="" class="style1" src="imagens/wait.gif" />
                       </ProgressTemplate>
                       </asp:UpdateProgress>
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
    </asp:Panel>
   <asp:RoundedCornersExtender ID="Panel1_RoundedCornersExtender" runat="server" 
           BorderColor="ActiveBorder" Enabled="True" TargetControlID="Panel1">
       </asp:RoundedCornersExtender>

    

   </center>
</asp:Content>