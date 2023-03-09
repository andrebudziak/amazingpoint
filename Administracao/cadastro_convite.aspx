<%@ Page Title="" Language="C#" MasterPageFile="~/Administracao/Site.master" AutoEventWireup="true" CodeFile="cadastro_convite.aspx.cs" Inherits="Administracao_cadastro_convite" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
<script type="text/javascript" src="../Scripts/jquery-1.4.1.min.js"></script>
<script type="text/javascript">

    function startUpload(sender, args) {
        $('#uploadMessage p').html();
        $('#uploadMessage').hide();
    }

    function uploadComplete(sender, args) {
        showUploadMessage(" Concluido Upload de - " + args.get_fileName() + " - Tamanho - " + args.get_length() + " bytes", '');
        $('#<%= txtArquivo.ClientID %>').val(args.get_fileName());

    }

    function uploadError(sender, args) {
        showUploadMessage("Erro ao realizar upload. " + args.get_errorMessage(), '#ff0000');
    }

    function showUploadMessage(text, color) {
        $('#uploadMessage p').html(text).css('color', color);
        $('#uploadMessage').show();
    }

    </script>
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <center>   
       <asp:ToolkitScriptManager ID="ToolkitScriptManager1" EnableScriptGlobalization="true" runat="server" EnablePartialRendering="true">
       </asp:ToolkitScriptManager>
       <table border="0" width="100%" cellspacing="0" cellpadding="0" height="25" background="mytnr/barra2.png">
   	   <tr>
	      <td>          
          </td>
	   </tr>
       </table>

    <div class="cadastro">
        <fieldset class="register">
            <asp:Label ID="lblHash" runat="server" Text=""></asp:Label>            
            <legend>Cadastro de Convite </legend>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
               <ContentTemplate>

                    <table style="width:600px;" border="0" cellpadding="0" cellspacing="0">
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
                            <td align="right" style="margin-left: 40px">
                                <asp:Label ID="Label10" runat="server" Text="Cliente:"></asp:Label>
                            </td>
                            <td align="left">
                               <asp:DropDownList ID="ddlSelCliente" runat="server" Enabled="true" 
                                  DataTextField="nome" DataValueField="idCliente" 
                                  CssClass="botao" Width="300px" DataSourceID="ObjectDataSource4">                                     
                               </asp:DropDownList>                
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label12" runat="server" Text="Nome:"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtNome" runat="server" CssClass="edit" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label13" runat="server" Text="Idade:"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtIdade" runat="server" CssClass="edit" Width="40px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label14" runat="server" Text="Dia:"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtDia" runat="server" CssClass="edit" Width="100px"></asp:TextBox>
                                <asp:CalendarExtender ID="txtDia_CalendarExtender" runat="server" 
                                    Enabled="True" Format="dd/MM/yyyy" TargetControlID="txtDia">
                                </asp:CalendarExtender>

                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label15" runat="server" Text="Hora:"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtHora" runat="server" CssClass="edit" Width="100px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label11" runat="server" Text="Status:"></asp:Label>
                            </td>
                            <td align="left">
                               <asp:DropDownList ID="ddlStatus" runat="server" Enabled="true" 
                                  CssClass="botao" Width="100px">      
                                  <asp:ListItem Text="Ativo" Value="1"></asp:ListItem>
                                  <asp:ListItem Text="Inativo" Value="0"></asp:ListItem>                               
                               </asp:DropDownList>      
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="Label8" runat="server" Text="Foto:"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:AsyncFileUpload ID="fileUploadArquivo" runat="server" 
                                           CompleteBackColor="#B9FFB9" CssClass="botao" 
                                           OnClientUploadComplete="uploadComplete" 
                                           OnClientUploadStarted="startUpload" 
                                           OnClientUploadError="uploadError" 
                                           onuploadedcomplete="AsyncFileUpload1_UploadedComplete" ThrobberID="Throbber" 
                                           UploadingBackColor="#CCFFFF" Width="300px" />

                                <asp:Label ID="Throbber" runat="server" Style="display: none">
                                    <img src="mytnr/indicator.gif" align="absmiddle" alt="carregando..." />Aguarde...
                                </asp:Label>

                                <asp:TextBox ID="txtArquivo" runat="server" BorderStyle="None" 
                                    ForeColor="White"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">
                                
                            </td>
                            <td align="left" >
                               <div id="uploadMessage"><p></p></div>
                            </td>
                            <td align="right">
                                
                            </td>                        
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
                            <td align="right">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="right">
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
                            <td align="right">
                                &nbsp;</td>
                        </tr>
                    </table>
               </ContentTemplate>
             </asp:UpdatePanel>
       
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">            
            <ProgressTemplate>
                <img alt="Aguarde..." src="../imagens/wait.gif" />Aguarde...
            </ProgressTemplate>
            </asp:UpdateProgress>

        </fieldset>
        <p>
        &nbsp;&nbsp;
            </p>

        <fieldset class="register">
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
                       <asp:Panel ID="pnDados" Width="550px" ScrollBars="Auto" runat="server">
                       <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                          <ContentTemplate>                      
                       
                           <table style="width:100%;" border="0" cellpadding="0" cellspacing="0">
                               <tr>
                                   <td >
                                       &nbsp;</td>
                                   <td>
                                       <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
                                           DeleteMethod="excluiConvite" InsertMethod="incluiConvite" 
                                           ondeleting="ObjectDataSource3_Deleting" 
                                           oninserting="ObjectDataSource3_Inserting" SelectMethod="consultaConvite" 
                                           TypeName="Servico" UpdateMethod="incluiConvite">
                                           <DeleteParameters>
                                               <asp:Parameter Name="v_codigo" Type="Int32" />
                                           </DeleteParameters>
                                           <UpdateParameters>
                                               <asp:Parameter Name="v_codigo" Type="Int32" />
                                               <asp:Parameter Name="v_idCliente" Type="Int32" />
                                               <asp:Parameter Name="v_arquivo" Type="String" />
                                               <asp:Parameter Name="v_texto" Type="String" />
                                               <asp:Parameter Name="v_ativo" Type="Int32" />
                                               <asp:Parameter Name="v_nome" Type="String" />
                                               <asp:Parameter Name="v_idade" Type="String" />
                                               <asp:Parameter Name="v_dia" Type="DateTime" />
                                               <asp:Parameter Name="v_hora" Type="String" />
                                               <asp:Parameter Name="v_local" Type="String" />
                                               <asp:Parameter Name="v_fone" Type="String" />
                                           </UpdateParameters>
                                           <SelectParameters>
                                               <asp:Parameter DefaultValue="0" Name="v_codigo" Type="Int32" />
                                           </SelectParameters>
                                           <InsertParameters>
                                               <asp:Parameter Name="v_codigo" Type="Int32" />
                                               <asp:Parameter Name="v_idCliente" Type="Int32" />
                                               <asp:Parameter Name="v_arquivo" Type="String" />
                                               <asp:Parameter Name="v_texto" Type="String" />
                                               <asp:Parameter Name="v_ativo" Type="Int32" />
                                               <asp:Parameter Name="v_nome" Type="String" />
                                               <asp:Parameter Name="v_idade" Type="String" />
                                               <asp:Parameter Name="v_dia" Type="DateTime" />
                                               <asp:Parameter Name="v_hora" Type="String" />
                                               <asp:Parameter Name="v_local" Type="String" />
                                               <asp:Parameter Name="v_fone" Type="String" />
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
                                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# Eval("idConvite") %>'  />
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
                                              <asp:TemplateField HeaderText="Nome" SortExpression="nome">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblNome" runat="server" Text='<%# Eval("nome") %>'  />
                                                 </ItemTemplate>                                              
                                              </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Idade" SortExpression="idade">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblIdade" runat="server" Text='<%# Eval("idade") %>'  />
                                                 </ItemTemplate>                                              
                                              </asp:TemplateField>                                        
                                              <asp:TemplateField HeaderText="Dia" SortExpression="dia">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblDia" runat="server" Text='<%# Eval("dia") %>'  />
                                                 </ItemTemplate>                                              
                                              </asp:TemplateField>                                        
                                              <asp:TemplateField HeaderText="Hora" SortExpression="hora">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblHora" runat="server" Text='<%# Eval("hora") %>'  />
                                                 </ItemTemplate>                                              
                                              </asp:TemplateField>                                        
                                             <asp:TemplateField HeaderText="Arquivo" SortExpression="arquivo">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblArquivo" runat="server" Text='<%# Eval("arquivo") %>'   />
                                                 </ItemTemplate>                                                
                                              </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Status" SortExpression="ativo">
                                                 <ItemTemplate>
                                                    <asp:DropDownList ID="ddlStatus" runat="server" Enabled="false" 
                                                       SelectedValue='<%# Bind("ativo")%>'
                                                       CssClass="botao" Width="100px">      
                                                       <asp:ListItem Text="Ativo" Value="1"></asp:ListItem>
                                                       <asp:ListItem Text="Inativo" Value="0"></asp:ListItem>                               
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
                          <img alt="Aguarde..." src="../imagens/wait.gif" />Aguarde...
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
