<%@ Page Title="" Language="C#" MasterPageFile="~/Administracao/Site.master" AutoEventWireup="true" CodeFile="cadastro_cliente.aspx.cs" Inherits="Administracao_cadastro_cliente" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <center>   
       <asp:ToolkitScriptManager ID="ToolkitScriptManager1" EnableScriptGlobalization="true" runat="server">
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
            <legend>Cadastro de Cliente </legend>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
               <ContentTemplate>
                  <asp:Panel ID="Panel1" runat="server">
                                   <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
                                       <tr>
                                           <td align="right">
                                              <asp:Label ID="Label1" Text="Tipo de Pessoa:" runat="server" CssClass="label"></asp:Label>                                             
                                           </td>
                                           <td align="left">
                                              <asp:DropDownList ID="ddlTpPessoa" runat="server" AutoPostBack="True" CssClass="botao" Width="150px" 
                                                   onselectedindexchanged="ddlTpPessoa_SelectedIndexChanged">
                                                   <asp:ListItem Value="0">[Selecione]</asp:ListItem>
                                                   <asp:ListItem Value="1">Pessoa Física</asp:ListItem>
                                                   <asp:ListItem Value="2">Pessoa Jurídica</asp:ListItem>
                                               </asp:DropDownList>                           

                                           </td>
                                           <td>
                                               &nbsp;
                                           </td>
                                       </tr>
                                       <tr>
                                           <td align="right">                                               
                                               <asp:Label ID="Label8" runat="server" CssClass="label" Text="Codigo:"></asp:Label>
                                           </td>
                                           <td align="left">
                                               <asp:Label ID="lblCodigo" runat="server" CssClass="label"></asp:Label>
                                               
                                           </td>
                                           <td>
                                               &nbsp;
                                           </td>
                                       </tr>
                                       <tr>
                                           <td>
                                               &nbsp;
                                           </td>
                                           <td>
                                               &nbsp;
                                           </td>
                                           <td>
                                               &nbsp;
                                           </td>
                                       </tr>
                                   </table>
                               </asp:Panel>
                               <asp:Panel ID="pnPessoaFisica" runat="server">
                               <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
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
                                       <asp:Label ID="Label9" runat="server" CssClass="label" Text="Nome:"></asp:Label>
                                   </td>
                                   <td align="left">
                                       <asp:TextBox ID="txtNome" runat="server" CssClass="edit" Width="250px"></asp:TextBox>
                                   </td>
                                   <td>
                                       &nbsp;</td>
                               </tr>
                                   <tr>
                                       <td align="right">
                                           <asp:Label ID="Label30" runat="server" CssClass="label" Text="Sexo:"></asp:Label>
                                       </td>
                                       <td align="left">
                                           <asp:RadioButton ID="rbMasculino" Text="Masculino" CssClass="label" 
                                               runat="server" oncheckedchanged="rbMasculino_CheckedChanged" 
                                               Width="70px" />
                                           <asp:RadioButton ID="rbFeminino" Text="Feminino" CssClass="label" 
                                               runat="server" oncheckedchanged="rbFeminino_CheckedChanged" 
                                               Width="70px" />
                                       </td>
                                       <td>
                                           &nbsp;</td>
                                   </tr>
                                   <tr>
                                       <td align="right">
                                           <asp:Label ID="Label28" runat="server" CssClass="label" Text="CPF:"></asp:Label>
                                       </td>
                                       <td align="left">
                                           <asp:TextBox ID="txtCpf" runat="server" CssClass="edit" Width="100px"></asp:TextBox>
                                       </td>
                                       <td>
                                           &nbsp;</td>
                                   </tr>
                                   <tr>
                                       <td align="right">
                                           <asp:Label ID="Label29" runat="server" CssClass="label" Text="Rg:"></asp:Label>
                                       </td>
                                       <td align="left">
                                           <asp:TextBox ID="txtRg" runat="server" CssClass="edit" Width="100px"></asp:TextBox>
                                       </td>
                                       <td>
                                           &nbsp;</td>
                                   </tr>
                               <tr>
                                   <td align="right">
                                       <asp:Label ID="Label11" runat="server" CssClass="label" Text="Telefone:"></asp:Label>
                                   </td>
                                   <td align="left">
                                       <asp:TextBox ID="txtTelefone" runat="server" CssClass="edit" Width="100px"></asp:TextBox>
                                   </td>
                                   <td>
                                       &nbsp;</td>
                               </tr>
                               <tr>
                                   <td align="right">
                                       <asp:Label ID="Label12" runat="server" CssClass="label" Text="E-mail:"></asp:Label>
                                   </td>
                                   <td align="left">
                                       <asp:TextBox ID="txtEmail" runat="server" CssClass="edit" Width="250px"></asp:TextBox>
                                   </td>
                                   <td>
                                       &nbsp;</td>
                               </tr>
                               <tr>
                                   <td align="right">
                                       <asp:Label ID="Label23" runat="server" CssClass="label" Text="Celular:"></asp:Label>
                                   </td>
                                   <td align="left">
                                       <asp:TextBox ID="txtCelular" runat="server" CssClass="edit" Width="100px"></asp:TextBox>
                                   </td>
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
                           </table>                               
                               </asp:Panel>
                               <asp:Panel ID="pnPessoaJuridica" runat="server">
                               <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
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
                                       <asp:Label ID="Label13" runat="server" CssClass="label" Text="Razão Social Empresa:"></asp:Label>
                                   </td>
                                   <td align="left">
                                       <asp:TextBox ID="txtRazaoSocial" runat="server" CssClass="edit" Width="250px"></asp:TextBox>
                                   </td>
                                   <td>
                                       &nbsp;</td>
                               </tr>
                                   <tr>
                                       <td align="right">
                                           <asp:Label ID="Label33" runat="server" CssClass="label" Text="Nome Fantasia:"></asp:Label>
                                       </td>
                                       <td align="left">
                                           <asp:TextBox ID="txtNomeFantasia" runat="server" CssClass="edit" Width="250px"></asp:TextBox>
                                       </td>
                                       <td>
                                           &nbsp;</td>
                                   </tr>
                               <tr>
                                   <td align="right">
                                       <asp:Label ID="Label15" runat="server" CssClass="label" Text="CNPJ:"></asp:Label>
                                   </td>
                                   <td align="left">
                                  
                                       <asp:TextBox ID="txtCnpj" runat="server" CssClass="edit" Width="200px"></asp:TextBox>
                                  
                                   </td>
                                   <td>
                                       &nbsp;</td>
                               </tr>                               
                               <tr>
                                   <td align="right">
                                       <asp:Label ID="Label25" runat="server" CssClass="label" Text="Telefone:"></asp:Label>
                                   </td>
                                   <td align="left">
                                       <asp:TextBox ID="txtTelefoneEmpresa" runat="server" CssClass="edit" Width="100px"></asp:TextBox>
                                   </td>
                                   <td>
                                       &nbsp;</td>
                               </tr>
                               <tr>
                                   <td align="right">
                                       <asp:Label ID="Label27" runat="server" CssClass="label" Text="Responsavel:"></asp:Label>
                                   </td>
                                   <td align="left">
                                       <asp:TextBox ID="txtResponsavel" runat="server" CssClass="edit" Width="150px"></asp:TextBox>
                                   </td>
                                   <td>
                                       &nbsp;</td>
                               </tr>                          
                               <tr>
                                   <td align="right">
                                       <asp:Label ID="Label26" runat="server" CssClass="label" Text="E-mail Responsavel:"></asp:Label>
                                   </td>
                                   <td align="left">
                                       <asp:TextBox ID="txtEmailResponsavel" runat="server" CssClass="edit" Width="250px"></asp:TextBox>
                                   </td>
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
                           </table>                               
                               </asp:Panel>                               
                    
        <p>
            <asp:Button ID="btnIncluir" runat="server" Text="Incluir" CssClass="edit" 
                Width="150px" onclick="btnIncluir_Click"/>
        &nbsp;&nbsp;
            <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="edit" 
                Width="150px" onclick="btnSalvar_Click"/>
        </p>
               </ContentTemplate>
             </asp:UpdatePanel>


            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">            
            <ProgressTemplate>
                <img src="../imagens/wait.gif" />
            </ProgressTemplate>
            </asp:UpdateProgress>
       
        </fieldset>
     

        <fieldset class="register">
            <legend>Clientes Cadastrados</legend>
       
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
                                       <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                                           DeleteMethod="excluiCliente" InsertMethod="incluiCliente" 
                                           ondeleting="ObjectDataSource3_Deleting" 
                                           oninserting="ObjectDataSource3_Inserting" 
                                           onselecting="ObjectDataSource4_Selecting" SelectMethod="consultaCliente" 
                                           TypeName="Servico" UpdateMethod="incluiCliente">
                                           <DeleteParameters>
                                               <asp:Parameter Name="v_codigo" Type="Int32" />
                                           </DeleteParameters>
                                           <InsertParameters>
                                               <asp:Parameter Name="v_codigo" Type="Int32" />
                                               <asp:Parameter Name="v_razao_social" Type="String" />
                                               <asp:Parameter Name="v_cnpj" Type="String" />
                                               <asp:Parameter Name="v_cpf" Type="String" />
                                               <asp:Parameter Name="v_rg" Type="String" />
                                               <asp:Parameter Name="v_endereco" Type="String" />
                                               <asp:Parameter Name="v_cep" Type="String" />
                                               <asp:Parameter Name="v_bairro" Type="String" />
                                               <asp:Parameter Name="v_cidade" Type="String" />
                                               <asp:Parameter Name="v_email" Type="String" />
                                               <asp:Parameter Name="v_telefone" Type="String" />
                                               <asp:Parameter Name="v_nome_fantasia" Type="String" />
                                               <asp:Parameter Name="v_data_cadastro" Type="DateTime" />
                                               <asp:Parameter Name="v_tipo_sexo" Type="Int32" />
                                               <asp:Parameter Name="v_tipo_cliente" Type="Int32" />
                                               <asp:Parameter Name="v_responsavel" Type="String" />
                                               <asp:Parameter Name="v_email_responsavel" Type="String" />
                                               <asp:Parameter Name="v_nome" Type="String" />
                                           </InsertParameters>
                                           <SelectParameters>
                                               <asp:Parameter DefaultValue="0" Name="v_codigo" Type="Int32" />
                                               <asp:Parameter DefaultValue="0" Name="v_tipo_cliente" Type="Int32" />
                                           </SelectParameters>
                                           <UpdateParameters>
                                               <asp:Parameter Name="v_codigo" Type="Int32" />
                                               <asp:Parameter Name="v_razao_social" Type="String" />
                                               <asp:Parameter Name="v_cnpj" Type="String" />
                                               <asp:Parameter Name="v_cpf" Type="String" />
                                               <asp:Parameter Name="v_rg" Type="String" />
                                               <asp:Parameter Name="v_endereco" Type="String" />
                                               <asp:Parameter Name="v_cep" Type="String" />
                                               <asp:Parameter Name="v_bairro" Type="String" />
                                               <asp:Parameter Name="v_cidade" Type="String" />
                                               <asp:Parameter Name="v_email" Type="String" />
                                               <asp:Parameter Name="v_telefone" Type="String" />
                                               <asp:Parameter Name="v_nome_fantasia" Type="String" />
                                               <asp:Parameter Name="v_data_cadastro" Type="DateTime" />
                                               <asp:Parameter Name="v_tipo_sexo" Type="Int32" />
                                               <asp:Parameter Name="v_tipo_cliente" Type="Int32" />
                                               <asp:Parameter Name="v_responsavel" Type="String" />
                                               <asp:Parameter Name="v_email_responsavel" Type="String" />
                                               <asp:Parameter Name="v_nome" Type="String" />
                                           </UpdateParameters>
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
                                           GridLines="None" Width="800px" AllowPaging="True" 
                                           DataSourceID="ObjectDataSource1" onrowdeleting="grdDados_RowDeleting" 
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
                                             <asp:TemplateField HeaderText="Codigo" SortExpression="idCliente">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# Eval("idCliente") %>'/>
                                                 </ItemTemplate>                                                
                                              </asp:TemplateField>                                              
                                              <asp:TemplateField HeaderText="Nome" SortExpression="nome">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblNome" runat="server" Text='<%# Eval("nome") %>'  />
                                                 </ItemTemplate>                                              
                                              </asp:TemplateField>                                    
                                             <asp:TemplateField HeaderText="CPF" SortExpression="cpf">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblCpf" runat="server" Text='<%# Eval("cpf") %>'  />
                                                 </ItemTemplate>                                                
                                              </asp:TemplateField>
                                             <asp:TemplateField HeaderText="RG" SortExpression="rg">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblRg" runat="server" Text='<%# Eval("rg") %>'  />
                                                 </ItemTemplate>                                                
                                              </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Telefone" SortExpression="telefone">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblTelefone" runat="server" Text='<%# Eval("telefone") %>'  />
                                                 </ItemTemplate>                                                
                                              </asp:TemplateField>
                                            <asp:TemplateField HeaderText="E-mail" SortExpression="email">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("email") %>' />
                                                 </ItemTemplate>                                                
                                              </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Celular" SortExpression="celular">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblCelular" runat="server" Text='<%# Eval("celular") %>'  />
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
                                      <asp:GridView ID="grdJuridica" runat="server" AutoGenerateColumns="False" 
                                           CellPadding="4" Font-Names="Verdana" Font-Size="11px" ForeColor="#333333" 
                                           GridLines="None" Width="800px" AllowPaging="True" 
                                           DataSourceID="ObjectDataSource1" onrowdeleting="grdJuridica_RowDeleting" 
                                           onrowcommand="grdJuridica_RowCommand" 
                                           onrowdatabound="grdJuridica_RowDataBound">
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
                                             <asp:TemplateField HeaderText="Codigo" SortExpression="idCliente">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# Eval("idCliente") %>'/>
                                                 </ItemTemplate>                                                
                                              </asp:TemplateField>                                              
                                              <asp:TemplateField HeaderText="Razão Social" SortExpression="razao_social">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblRazaoSocial" runat="server" Text='<%# Eval("razao_social") %>'  />
                                                 </ItemTemplate>                                              
                                              </asp:TemplateField>                                                                                      
                                              <asp:TemplateField HeaderText="Nome Fantasia" SortExpression="nome_fantasia">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblNomeFantasia" runat="server" Text='<%# Eval("nome_fantasia") %>'  />
                                                 </ItemTemplate>                                              
                                              </asp:TemplateField>                                                                                      
                                             <asp:TemplateField HeaderText="CNPJ" SortExpression="cnpj">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblCnpj" runat="server" Text='<%# Eval("cnpj") %>'  />
                                                 </ItemTemplate>                                                
                                              </asp:TemplateField>                                                                                     
                                             <asp:TemplateField HeaderText="Telefone" SortExpression="telefone">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblTelefoneEmpresa" runat="server" Text='<%# Eval("telefone") %>'  />
                                                 </ItemTemplate>                                                
                                              </asp:TemplateField>                                      
                                              <asp:TemplateField HeaderText="Responsavel" SortExpression="responsavel">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblResponsavel" runat="server" Text='<%# Eval("responsavel") %>'  />
                                                 </ItemTemplate>                                              
                                              </asp:TemplateField>                                                                                                                    
                                            <asp:TemplateField HeaderText="E-mail" SortExpression="email_responsavel">
                                                 <ItemTemplate>
                                                    <asp:Label ID="lblEmailResponsavel" runat="server" Text='<%# Eval("email_responavel") %>' />
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


                       <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel1">            
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
