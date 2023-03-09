<%@ Page Title="" Language="C#" MasterPageFile="~/Administracao/Site.master" AutoEventWireup="true" CodeFile="cadastro_login.aspx.cs" Inherits="Administracao_cadastro_login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <center>   
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
       <table border="0" width="100%" cellspacing="0" cellpadding="0" height="25" background="mytnr/barra2.png">
   	   <tr>
	      <td>          
          </td>
	   </tr>
       </table>

    <div class="cadastro">
        <fieldset class="register">
            <asp:Label ID="lblHash" runat="server" Text=""></asp:Label>            
            <legend>Cadastro de Usuário </legend>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
               <ContentTemplate>

                    <table style="width:600px;" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label7" runat="server" Text="Codigo:"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:Label ID="lblCodigo" runat="server" Text="Usuário:"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label8" runat="server" Text="Cliente:"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlSelCliente" runat="server" CssClass="botao" 
                                    DataSourceID="ObjectDataSource4" DataTextField="nome" 
                                    DataValueField="idCliente" Enabled="true" Width="300px">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label2" runat="server" Text="Usuário:"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtUsuario" runat="server" Width="200px" CssClass="edit"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label1" runat="server" Text="Senha:"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" Width="200px" 
                                CssClass="edit"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                        <tr>
                            <td align="right">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;</td>
                            <td align="center">
                                <asp:Button ID="btnIncluir" runat="server" CssClass="edit" 
                                    onclick="btnIncluir_Click" Text="Incluir" Width="150px" />
                                &nbsp;
                                <asp:Button ID="btnSalvar" runat="server" CssClass="edit" 
                                    onclick="btnSalvar_Click" Text="Salvar" Width="150px" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
               </ContentTemplate>
             </asp:UpdatePanel>
       
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">            
            <ProgressTemplate>
                <img src="../imagens/wait.gif" />
            </ProgressTemplate>
            </asp:UpdateProgress>
        </fieldset>
        <p>
        &nbsp;&nbsp;
            </p>

        <fieldset class="register">
            <legend>Usuários Cadastrados</legend>
       
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
                       <asp:Panel ID="pnDados" Width="550px" ScrollBars="Auto" runat="server">
                       <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                          <ContentTemplate>                      
                       
                           <table style="width:100%;" border="0" cellpadding="0" cellspacing="0">
                               <tr>
                                   <td >
                                       &nbsp;</td>
                                   <td>
                                       <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
                                           DeleteMethod="excluiUsuario" InsertMethod="incluiUsuario" 
                                           ondeleting="ObjectDataSource3_Deleting" 
                                           oninserting="ObjectDataSource3_Inserting" SelectMethod="consultaUsuario" 
                                           TypeName="Servico" UpdateMethod="incluiUsuario">
                                           <DeleteParameters>
                                               <asp:Parameter Name="v_codigo" Type="Int32" />
                                           </DeleteParameters>
                                           <UpdateParameters>
                                               <asp:Parameter Name="v_codigo" Type="Int32" />
                                               <asp:Parameter Name="v_login" Type="String" />
                                               <asp:Parameter Name="v_senha" Type="String" />
                                               <asp:Parameter Name="v_idCliente" Type="Int32" />
                                           </UpdateParameters>
                                           <SelectParameters>
                                               <asp:Parameter DefaultValue="0" Name="v_codigo" Type="Int32" />
                                           </SelectParameters>
                                           <InsertParameters>
                                               <asp:Parameter Name="v_codigo" Type="Int32" />
                                               <asp:Parameter Name="v_login" Type="String" />
                                               <asp:Parameter Name="v_senha" Type="String" />
                                               <asp:Parameter Name="v_idCliente" Type="Int32" />
                                           </InsertParameters>
                                       </asp:ObjectDataSource>
                                       <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" 
                                           SelectMethod="consultaCliente" TypeName="Servico">
                                           <SelectParameters>
                                               <asp:Parameter DefaultValue="0" Name="v_codigo" Type="Int32" />
                                               <asp:Parameter DefaultValue="0" Name="v_tipo_cliente" Type="Int32" />
                                           </SelectParameters>
                                       </asp:ObjectDataSource>
                                   </td>
                                   <td >
                                       &nbsp;</td>
                               </tr>
                               <tr>
                                   <td align="right" >
                                       <asp:Label ID="Label6" runat="server" CssClass="label" Text="Pesquisar:"></asp:Label>
                                   </td>
                                   <td align="left">
                                       <asp:TextBox ID="txtPesquisa" runat="server" CssClass="edit" Width="200px"></asp:TextBox>
                                   </td>
                                   <td align="center">
                                       <asp:Button ID="btnPesquisar" runat="server" CssClass="botao" Text="Pesquisar" 
                                           Width="150px" />
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
                                   <td align="center" colspan="3">
                                       <asp:GridView ID="grdDados" runat="server" AutoGenerateColumns="False" 
                                           CellPadding="4" Font-Names="Verdana" Font-Size="11px" ForeColor="#333333" 
                                           GridLines="None" Width="600px" AllowPaging="True" 
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
                                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# Eval("idusuario") %>'  />
                                                 </ItemTemplate>                                                
                                              </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Cliente" SortExpression="idCliente">
                                                 <ItemTemplate>
                                                    <asp:DropDownList ID="ddlCliente" runat="server" Enabled="false" 
                                                       DataTextField="nome" DataValueField="idCliente" SelectedValue='<%# Bind("idCliente")%>'
                                                       CssClass="botao" Width="100px" DataSourceID="ObjectDataSource4">                                     
                                                    </asp:DropDownList>                                                                 
                                                 </ItemTemplate>                                                
                                              </asp:TemplateField>             
                                              <asp:TemplateField HeaderText="Login" SortExpression="login">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblLogin" runat="server" Text='<%# Eval("login") %>'  />
                                                 </ItemTemplate>                                              
                                              </asp:TemplateField>                                        
                                             <asp:TemplateField HeaderText="Senha" SortExpression="senha">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblSenha" runat="server" Text='<%# Eval("senha") %>'   />
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
                               <tr>
                                    <td align="right">
                                        &nbsp;</td>
                                    <td align="left">
                                        &nbsp;</td>
                                    <td align="right">
                                    </td>
                                </tr>
                           </table>
                           
                           </ContentTemplate>
                       </asp:UpdatePanel>

                       <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel2">            
                         <ProgressTemplate>
                            <img src="../imagens/wait.gif" />
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
        <table style="width:100%;" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td >
                &nbsp;</td>
            <td align="left">
                &nbsp;</td>
            <td align="right">
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="Default.aspx">
                   <img src="mytnr/voltar.gif" style="border:0;" />
                </asp:HyperLink>
            </td>
        </tr>
        </table>

     </div>  
</center>
</asp:Content>
