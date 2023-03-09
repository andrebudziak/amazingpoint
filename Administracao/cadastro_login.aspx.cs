using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administracao_cadastro_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblHash.Visible = false;
            btnSalvar.Enabled = false;
            if (Session["hash"] != null)
            {
                lblCodigo.Text = "0";
            }
            else
            {
                Response.Redirect("login.aspx");
                lblCodigo.Text = "0";

            }
        }
    }

    protected void ObjectDataSource3_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["v_codigo"] = lblCodigo.Text;
        lblCodigo.Text = "0";
    }

    protected void ObjectDataSource3_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        if (lblCodigo.Text == "0")
            e.InputParameters["v_codigo"] = 0;
        else
            e.InputParameters["v_codigo"] = Convert.ToInt32(lblCodigo.Text);

        e.InputParameters["v_login"] = txtUsuario.Text;
        e.InputParameters["v_senha"] = txtSenha.Text;
        e.InputParameters["v_idCliente"] = ddlSelCliente.SelectedValue;

    }

    protected void grdDados_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {

            WebControl wc = ((WebControl)e.CommandSource);
            GridViewRow row = ((GridViewRow)wc.NamingContainer);

            lblCodigo.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblCodigo")).Text;
            txtUsuario.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblLogin")).Text;
            txtSenha.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblSenha")).Text;
            ddlSelCliente.SelectedValue = ((DropDownList)grdDados.Rows[row.RowIndex].FindControl("ddlCliente")).SelectedValue;
            btnSalvar.Enabled = true;
            btnIncluir.Enabled = false;
        }

    }

    protected void grdDados_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
       int index = e.RowIndex;
       int codigo = Convert.ToInt32(((Label)grdDados.Rows[index].FindControl("lblCodigo")).Text);
       lblCodigo.Text = codigo.ToString();
    }

    protected void grdDados_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

        }
    }

    protected void btnIncluir_Click(object sender, EventArgs e)
    {
       ObjectDataSource3.Insert();
       ObjectDataSource3.Select();

       string myScript = @"alert('Registro Incluido!');";
       ScriptManager.RegisterStartupScript(Page, Page.GetType(), "clientscript", "<script language='JavaScript'>" + myScript + "</script>", false);

    }

    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        ObjectDataSource3.Insert();
        ObjectDataSource3.Select();

        string myScript = @"alert('Registro Salvo!');";
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "clientscript", "<script language='JavaScript'>" + myScript + "</script>", false);
        btnSalvar.Enabled = false;
        btnIncluir.Enabled = true;
    }
}