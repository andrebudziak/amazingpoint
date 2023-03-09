using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

/// <summary>
/// Summary description for Servico
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class Servico : System.Web.Services.WebService
{
    private string connstring = ConfigurationManager.AppSettings["ConnectionString"];
    MySqlConnection con = new MySqlConnection();

    public Servico()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod(Description = "Abre Conexao")]
    public void abreConexao()
    {
        con.ConnectionString = connstring;
        con.Open();
    }

    [WebMethod(Description = "Fecha Conexao")]
    public void FechaConexao()
    {
        con.Close();
    }

    [WebMethod(Description = "login Usuario")]
    public int loginUsuario(string usuario, string senha)
    {
        abreConexao();

        string comando = "";
        comando = " SELECT u.idusuario,u.login,u.senha FROM kidscuritiba.usuario u " +
                  "where u.login ='" + usuario + "' and u.senha ='" + senha + "'  ";

        MySqlCommand cmd = new MySqlCommand(comando, con);


        MySqlDataReader MyDataReader = cmd.ExecuteReader();

        if (MyDataReader.Read())
        {
            return (int)MyDataReader["idusuario"];
        }
        else
        {
            return 0;
        }

        cmd.Dispose();  //Dispose of the Command object.

        FechaConexao();

        return 0;
    }


    [WebMethod(Description = "Inclui Usuario")]
    public int incluiUsuario(Int32 v_codigo, string v_login, string v_senha, Int32 v_idCliente)
    {
        #region Inclui Usuario
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_inclui_usuario", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_idusuario", MySqlDbType.Int32).Value = v_codigo;
            MyCommand4.Parameters.Add("?v_login", MySqlDbType.String).Value = v_login;
            MyCommand4.Parameters.Add("?v_senha", MySqlDbType.String).Value = v_senha;
            MyCommand4.Parameters.Add("?v_idCliente", MySqlDbType.Int32).Value = v_idCliente;


            MyCommand4.ExecuteNonQuery();
            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return 1;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return 0;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return 0;
    }

    [WebMethod(Description = "Exclui Usuario")]
    public int excluiUsuario(Int32 v_codigo)
    {
        #region Inclui Usuario
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_exclui_usuario", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_idusuario", MySqlDbType.Int32).Value = v_codigo;

            MyCommand4.ExecuteNonQuery();
            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return 1;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return 0;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return 0;
    }

    [WebMethod(Description = "Consulta Usuario")]
    public DataSet consultaUsuario(Int32 v_codigo)
    {
        #region Consulta Usuario
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_consulta_usuario", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_idusuario", MySqlDbType.Int32).Value = v_codigo;


            MySqlDataAdapter adpt = new MySqlDataAdapter(MyCommand4);

            // Cria e preenche o DataTable
            DataTable dtData = new DataTable("usuario");
            adpt.Fill(dtData);
            DataSet ds = new DataSet();
            ds.Tables.Add(dtData);

            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return ds;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return null;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return null;
    }


    [WebMethod(Description = "Inclui Album")]
    public int incluiAlbum(Int32 v_codigo, string v_descricao, string v_texto, string v_foto, DateTime v_dataCadastro)
    {
        #region Inclui Album
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_inclui_album", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_idalbum", MySqlDbType.Int32).Value = v_codigo;
            MyCommand4.Parameters.Add("?v_descricao", MySqlDbType.String).Value = v_descricao;
            MyCommand4.Parameters.Add("?v_texto", MySqlDbType.String).Value = v_texto;
            MyCommand4.Parameters.Add("?v_foto", MySqlDbType.String).Value = v_foto;
            MyCommand4.Parameters.Add("?v_dataCadastro", MySqlDbType.Date).Value = v_dataCadastro;

            MyCommand4.ExecuteNonQuery();
            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return 1;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return 0;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return 0;
    }

    [WebMethod(Description = "Exclui Album")]
    public int excluiAlbum(Int32 v_codigo)
    {
        #region Exclui Album
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_exclui_album", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_idalbum", MySqlDbType.Int32).Value = v_codigo;

            MyCommand4.ExecuteNonQuery();
            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return 1;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return 0;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return 0;
    }

    [WebMethod(Description = "Consulta Album")]
    public DataSet consultaAlbum(Int32 v_codigo)
    {
        #region Consulta Album
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_consulta_album", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_idalbum", MySqlDbType.Int32).Value = v_codigo;


            MySqlDataAdapter adpt = new MySqlDataAdapter(MyCommand4);

            // Cria e preenche o DataTable
            DataTable dtData = new DataTable("album");
            adpt.Fill(dtData);
            DataSet ds = new DataSet();
            ds.Tables.Add(dtData);

            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return ds;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return null;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return null;
    }



    [WebMethod(Description = "Inclui Cliente")]
    public int incluiCliente(Int32 v_codigo, string v_razao_social, string v_cnpj, string v_cpf, string v_rg, string v_endereco, string v_cep, string v_bairro,
                           string v_cidade, string v_email, string v_telefone, string v_nome_fantasia, DateTime v_data_cadastro, Int32 v_tipo_sexo, Int32 v_tipo_cliente,
                           string v_responsavel, string v_email_responsavel, string v_nome, string v_celular)
    {
        #region Inclui Cliente
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_inclui_cliente", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_idCliente", MySqlDbType.Int32).Value = v_codigo;
            MyCommand4.Parameters.Add("?v_razao_social", MySqlDbType.String).Value = v_razao_social;
            MyCommand4.Parameters.Add("?v_cnpj", MySqlDbType.String).Value = v_cnpj;
            MyCommand4.Parameters.Add("?v_cpf", MySqlDbType.String).Value = v_cpf;
            MyCommand4.Parameters.Add("?v_rg", MySqlDbType.String).Value = v_rg;
            MyCommand4.Parameters.Add("?v_endereco", MySqlDbType.String).Value = v_endereco;
            MyCommand4.Parameters.Add("?v_cep", MySqlDbType.String).Value = v_cep;
            MyCommand4.Parameters.Add("?v_bairro", MySqlDbType.String).Value = v_bairro;
            MyCommand4.Parameters.Add("?v_cidade", MySqlDbType.String).Value = v_cidade;
            MyCommand4.Parameters.Add("?v_email", MySqlDbType.String).Value = v_email;
            MyCommand4.Parameters.Add("?v_telefone", MySqlDbType.String).Value = v_telefone;
            MyCommand4.Parameters.Add("?v_nome_fantasia", MySqlDbType.String).Value = v_nome_fantasia;
            MyCommand4.Parameters.Add("?v_data_cadastro", MySqlDbType.Date).Value = v_data_cadastro;
            MyCommand4.Parameters.Add("?v_tipo_sexo", MySqlDbType.Int32).Value = v_tipo_sexo;
            MyCommand4.Parameters.Add("?v_tipo_cliente", MySqlDbType.Int32).Value = v_tipo_cliente;
            MyCommand4.Parameters.Add("?v_responsavel", MySqlDbType.String).Value = v_responsavel;
            MyCommand4.Parameters.Add("?v_email_responsavel", MySqlDbType.String).Value = v_email_responsavel;
            MyCommand4.Parameters.Add("?v_nome", MySqlDbType.String).Value = v_nome;
            MyCommand4.Parameters.Add("?v_celular", MySqlDbType.String).Value = v_celular;

            MyCommand4.ExecuteNonQuery();
            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return 1;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return 0;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return 0;
    }

    [WebMethod(Description = "Exclui Cliente")]
    public int excluiCliente(Int32 v_codigo)
    {
        #region Exclui Cliente
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_exclui_cliente", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_idCliente", MySqlDbType.Int32).Value = v_codigo;

            MyCommand4.ExecuteNonQuery();
            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return 1;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return 0;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return 0;
    }

    [WebMethod(Description = "Consulta Cliente")]
    public DataSet consultaCliente(Int32 v_codigo, Int32 v_tipo_cliente)
    {
        #region Consulta Cliente
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_consulta_cliente", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_idCliente", MySqlDbType.Int32).Value = v_codigo;
            MyCommand4.Parameters.Add("?v_tipo_cliente", MySqlDbType.Int32).Value = v_tipo_cliente;

            MySqlDataAdapter adpt = new MySqlDataAdapter(MyCommand4);

            // Cria e preenche o DataTable
            DataTable dtData = new DataTable("cliente");
            adpt.Fill(dtData);
            DataSet ds = new DataSet();
            ds.Tables.Add(dtData);

            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return ds;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return null;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return null;
    }

    [WebMethod(Description = "Inclui Item Album")]
    public int incluiItemAlbum(Int32 v_codigo, Int32 v_idAlbum, string v_arquivo, string v_descricao, Int32 v_ativo, DateTime v_data_cadastro)
    {
        #region Inclui Item Album
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_inclui_itemAlbum", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_iditem_album", MySqlDbType.Int32).Value = v_codigo;
            MyCommand4.Parameters.Add("?v_idalbum", MySqlDbType.Int32).Value = v_idAlbum;
            MyCommand4.Parameters.Add("?v_arquivo", MySqlDbType.String).Value = v_arquivo;
            MyCommand4.Parameters.Add("?v_descricao", MySqlDbType.Text).Value = v_descricao;
            MyCommand4.Parameters.Add("?v_ativo", MySqlDbType.Int32).Value = v_ativo;
            MyCommand4.Parameters.Add("?v_data_cadastro", MySqlDbType.Date).Value = v_data_cadastro;

            MyCommand4.ExecuteNonQuery();
            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return 1;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return 0;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return 0;
    }

    [WebMethod(Description = "Exclui Item Album")]
    public int excluiItemAlbum(Int32 v_codigo)
    {
        #region Exclui Item Album
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_exclui_ItemAlbum", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_iditem_album", MySqlDbType.Int32).Value = v_codigo;

            MyCommand4.ExecuteNonQuery();
            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return 1;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return 0;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return 0;
    }

    [WebMethod(Description = "Consulta Item Album")]
    public DataSet consultaItemAlbum(Int32 v_codigo)
    {
        #region Consulta Item Album
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_consulta_itemAlbum", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_iditem_album", MySqlDbType.Int32).Value = v_codigo;


            MySqlDataAdapter adpt = new MySqlDataAdapter(MyCommand4);

            // Cria e preenche o DataTable
            DataTable dtData = new DataTable("item_album");
            adpt.Fill(dtData);
            DataSet ds = new DataSet();
            ds.Tables.Add(dtData);

            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return ds;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return null;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return null;
    }

    [WebMethod(Description = "Inclui Convite")]
    public int incluiConvite(Int32 v_codigo, Int32 v_idCliente, string v_arquivo, string v_texto, Int32 v_ativo, string v_nome, string v_idade, DateTime v_dia, string v_hora, string v_local, string v_fone)
    {
        #region Inclui Convite
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_inclui_convite", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_idconvite", MySqlDbType.Int32).Value = v_codigo;
            MyCommand4.Parameters.Add("?v_idCliente", MySqlDbType.Int32).Value = v_idCliente;
            MyCommand4.Parameters.Add("?v_arquivo", MySqlDbType.String).Value = v_arquivo;
            MyCommand4.Parameters.Add("?v_texto", MySqlDbType.Text).Value = v_texto;
            MyCommand4.Parameters.Add("?v_ativo", MySqlDbType.Int32).Value = v_ativo;
            MyCommand4.Parameters.Add("?v_nome", MySqlDbType.String).Value = v_nome;
            MyCommand4.Parameters.Add("?v_idade", MySqlDbType.String).Value = v_idade;
            MyCommand4.Parameters.Add("?v_dia", MySqlDbType.Date).Value = v_dia;
            MyCommand4.Parameters.Add("?v_hora", MySqlDbType.String).Value = v_hora;
            MyCommand4.Parameters.Add("?v_local", MySqlDbType.String).Value = v_local;
            MyCommand4.Parameters.Add("?v_fone", MySqlDbType.String).Value = v_fone;

            MyCommand4.ExecuteNonQuery();
            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return 1;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return 0;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return 0;
    }

    [WebMethod(Description = "Exclui Convite")]
    public int excluiConvite(Int32 v_codigo)
    {
        #region Exclui Convite
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_exclui_convite", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_idconvite", MySqlDbType.Int32).Value = v_codigo;

            MyCommand4.ExecuteNonQuery();
            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return 1;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return 0;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return 0;
    }

    [WebMethod(Description = "Consulta Convite")]
    public DataSet consultaConvite(Int32 v_codigo)
    {
        #region Consulta Convite
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_consulta_convite", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_idconvite", MySqlDbType.Int32).Value = v_codigo;


            MySqlDataAdapter adpt = new MySqlDataAdapter(MyCommand4);

            // Cria e preenche o DataTable
            DataTable dtData = new DataTable("convite");
            adpt.Fill(dtData);
            DataSet ds = new DataSet();
            ds.Tables.Add(dtData);

            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return ds;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return null;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return null;
    }

    [WebMethod(Description = "Inclui Convite Cliente")]
    public int incluiConviteCliente(Int32 v_codigo, Int32 v_idConvite, string v_nome, string v_email, Int32 v_status)
    {
        #region Inclui Convite Cliente
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_inclui_convite_cliente", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_idconvite_cliente", MySqlDbType.Int32).Value = v_codigo;
            MyCommand4.Parameters.Add("?v_id_convite", MySqlDbType.Int32).Value = v_idConvite;
            MyCommand4.Parameters.Add("?v_nome", MySqlDbType.String).Value = v_nome;
            MyCommand4.Parameters.Add("?v_email", MySqlDbType.Text).Value = v_email;
            MyCommand4.Parameters.Add("?v_status", MySqlDbType.Int32).Value = v_status;

            MyCommand4.ExecuteNonQuery();
            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return 1;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return 0;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return 0;
    }

    [WebMethod(Description = "Exclui Convite Cliente")]
    public int excluiConviteCliente(Int32 v_codigo)
    {
        #region Exclui Convite Cliente
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_exclui_convite_cliente", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_idconvite_cliente", MySqlDbType.Int32).Value = v_codigo;

            MyCommand4.ExecuteNonQuery();
            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return 1;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return 0;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return 0;
    }

    [WebMethod(Description = "Consulta Convite Cliente")]
    public DataSet consultaConviteCliente(Int32 v_codigo)
    {
        #region Consulta Convite Cliente
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_consulta_convite_cliente", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_idconvite_cliente", MySqlDbType.Int32).Value = v_codigo;


            MySqlDataAdapter adpt = new MySqlDataAdapter(MyCommand4);

            // Cria e preenche o DataTable
            DataTable dtData = new DataTable("convite_cliente");
            adpt.Fill(dtData);
            DataSet ds = new DataSet();
            ds.Tables.Add(dtData);

            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return ds;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return null;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return null;
    }

    [WebMethod(Description = "Consulta Convite Cliente por Usuario")]
    public DataSet consultaConviteClienteUsuario(Int32 v_codigo)
    {
        #region Consulta Convite Cliente Usuario
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_consulta_convitecliente_usuario", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_idUsuario", MySqlDbType.Int32).Value = v_codigo;


            MySqlDataAdapter adpt = new MySqlDataAdapter(MyCommand4);

            // Cria e preenche o DataTable
            DataTable dtData = new DataTable("convite_cliente");
            adpt.Fill(dtData);
            DataSet ds = new DataSet();
            ds.Tables.Add(dtData);

            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return ds;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return null;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return null;
    }


    [WebMethod(Description = "Confirma Presença")]
    public int ConfirmaPresenca(string v_email, Int32 v_status)
    {
        #region Confirma Presenca
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_confirma_presenca", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_email", MySqlDbType.Text).Value = v_email;
            MyCommand4.Parameters.Add("?v_status", MySqlDbType.Int32).Value = v_status;

            MyCommand4.ExecuteNonQuery();
            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return 1;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return 0;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return 0;
    }

    [WebMethod(Description = "Consulta Convite Cliente por Usuario - Confirmado")]
    public DataSet consultaConviteClienteUsuario_confirmado(Int32 v_codigo)
    {
        #region Consulta Convite Cliente Usuario Confirmado
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_consultaconviteusuario_confirmado", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_idUsuario", MySqlDbType.Int32).Value = v_codigo;


            MySqlDataAdapter adpt = new MySqlDataAdapter(MyCommand4);

            // Cria e preenche o DataTable
            DataTable dtData = new DataTable("convite_cliente");
            adpt.Fill(dtData);
            DataSet ds = new DataSet();
            ds.Tables.Add(dtData);

            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return ds;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return null;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return null;
    }


    [WebMethod(Description = "Consulta Item Album por Album")]
    public DataSet consultaItemAlbum_Album(Int32 v_codigo)
    {
        #region Consulta Item Album por Album
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_consulta_itemAlbum_Album", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_idalbum", MySqlDbType.Int32).Value = v_codigo;


            MySqlDataAdapter adpt = new MySqlDataAdapter(MyCommand4);

            // Cria e preenche o DataTable
            DataTable dtData = new DataTable("item_album");
            adpt.Fill(dtData);
            DataSet ds = new DataSet();
            ds.Tables.Add(dtData);

            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return ds;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return null;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return null;
    }


    [WebMethod(Description = "Consulta Convite ID Usuario")]
    public DataSet consultaConviteIDUsuario(Int32 v_codigo)
    {
        #region Consulta Convite Cliente Usuario
        abreConexao();

        MySqlCommand MyCommand4 = new MySqlCommand("sp_consulta_convite_idUsuario", con);
        MySqlTransaction transacao2;

        transacao2 = con.BeginTransaction(IsolationLevel.ReadCommitted);
        MyCommand4.Connection = con;
        MyCommand4.Transaction = transacao2;

        try
        {

            MyCommand4.CommandType = CommandType.StoredProcedure;
            MyCommand4.Parameters.Add("?v_idUsuario", MySqlDbType.Int32).Value = v_codigo;


            MySqlDataAdapter adpt = new MySqlDataAdapter(MyCommand4);

            // Cria e preenche o DataTable
            DataTable dtData = new DataTable("convite_cliente");
            adpt.Fill(dtData);
            DataSet ds = new DataSet();
            ds.Tables.Add(dtData);

            transacao2.Commit();
            MyCommand4.Dispose();
            FechaConexao();

            return ds;
        }
        catch (Exception ex)
        {
            // Attempt to roll back the transaction.
            try
            {
                transacao2.Rollback();
                return null;
            }
            catch (Exception ex2)
            {
            }

        }
        MyCommand4.Dispose();  //Dispose of the Command object.
        FechaConexao();
        #endregion
        return null;
    }

}
