using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administracao_cadastro_cliente : System.Web.UI.Page
{
    Servico ws = new Servico();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblHash.Visible = false;
            pnPessoaFisica.Visible = false;
            pnPessoaJuridica.Visible = false;
            grdDados.Visible = false;
            grdJuridica.Visible = false;
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

    protected void btnIncluir_Click(object sender, EventArgs e)
    {
        ObjectDataSource1.Insert();
        ObjectDataSource1.Select();

        string myScript = @"alert('Registro Incluido!');";
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "clientscript", "<script language='JavaScript'>" + myScript + "</script>", false);

    }

    protected void grdDados_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int index = e.RowIndex;
        int codigo = Convert.ToInt32(((Label)grdDados.Rows[index].FindControl("lblCodigo")).Text);
        lblCodigo.Text = codigo.ToString();
    }

    protected void grdDados_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {

            WebControl wc = ((WebControl)e.CommandSource);
            GridViewRow row = ((GridViewRow)wc.NamingContainer);

            lblCodigo.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblCodigo")).Text;
            txtNome.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblNome")).Text;
            txtTelefone.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblTelefone")).Text;
            txtEmail.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblEmail")).Text;
            txtCelular.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblCelular")).Text;
            txtCpf.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblCpf")).Text;
            txtRg.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblRg")).Text;
            btnSalvar.Enabled = true;
            btnIncluir.Enabled = false;

        }
    }

    protected void grdDados_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

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

        if (ddlTpPessoa.SelectedValue == "1")
        {

            e.InputParameters["v_nome"] = txtNome.Text;
            e.InputParameters["v_telefone"] = txtTelefone.Text;
            e.InputParameters["v_email"] = txtEmail.Text;
            e.InputParameters["v_celular"] = txtCelular.Text;

            if (rbMasculino.Checked == true)
                e.InputParameters["v_tipo_sexo"] = Convert.ToInt32("1");
            else
                e.InputParameters["v_tipo_sexo"] = Convert.ToInt32("2");

            e.InputParameters["v_razao_social"] = "";
            e.InputParameters["v_nome_fantasia"] = "";
            e.InputParameters["v_cnpj"] = "";
            e.InputParameters["v_tipo_cliente"] = Convert.ToInt32("1");
            e.InputParameters["v_cpf"] = txtCpf.Text;
            e.InputParameters["v_rg"] = txtRg.Text;

        }
        else
        {

            e.InputParameters["v_nome"] = "";
            e.InputParameters["v_telefone"] = txtTelefoneEmpresa.Text;
            e.InputParameters["v_email"] = txtEmailResponsavel.Text;
            e.InputParameters["v_celular"] = "";
            e.InputParameters["v_tipo_sexo"] = Convert.ToInt32("0");
            e.InputParameters["v_razao_social"] = "";
            e.InputParameters["v_cnpj"] = "";
            e.InputParameters["v_tipo_cliente"] = Convert.ToInt32("2");
            e.InputParameters["v_cpf"] = "";
            e.InputParameters["v_rg"] = "";
            e.InputParameters["v_nome_fantasia"] = txtNomeFantasia.Text;
            e.InputParameters["v_cnpj"] = txtCnpj.Text;
        }


    }


    protected void btnSalvar_Click(object sender, EventArgs e)
    {
        ObjectDataSource1.Insert();
        ObjectDataSource1.Select();
        lblCodigo.Text = "0";

        string myScript = @"alert('Registro Salvo!');";
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "clientscript", "<script language='JavaScript'>" + myScript + "</script>", false);
        btnSalvar.Enabled = false;
        btnIncluir.Enabled = true;

    }



    protected void ddlTpPessoa_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlTpPessoa.SelectedValue == "1")
        {
            pnPessoaFisica.Visible = true;
            grdDados.Visible = true;
            pnPessoaJuridica.Visible = false;
            grdJuridica.Visible = false;
            ObjectDataSource1.Select();
        }

        if (ddlTpPessoa.SelectedValue == "2")
        {
            pnPessoaFisica.Visible = false;
            grdDados.Visible = false;
            pnPessoaJuridica.Visible = true;
            grdJuridica.Visible = true;
            ObjectDataSource1.Select();
        }

    }

    protected void grdJuridica_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {

            WebControl wc = ((WebControl)e.CommandSource);
            GridViewRow row = ((GridViewRow)wc.NamingContainer);

            lblCodigo.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblCodigo")).Text;
            txtCnpj.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblCnpj")).Text;
            txtRazaoSocial.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblRazaoSocial")).Text;
            txtTelefoneEmpresa.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblTelefoneEmpresa")).Text;
            txtResponsavel.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblResponsavel")).Text;
            txtEmailResponsavel.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblEmail")).Text;
            txtNomeFantasia.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblNomeFantasia")).Text;

        }
    }

    protected void grdJuridica_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int index = e.RowIndex;
        int codigo = Convert.ToInt32(((Label)grdDados.Rows[index].FindControl("lblCodigo")).Text);
        lblCodigo.Text = codigo.ToString();
    }

    protected void grdJuridica_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void rbMasculino_CheckedChanged(object sender, EventArgs e)
    {
        if (rbMasculino.Checked == true)
            rbFeminino.Checked = false;
    }
    protected void rbFeminino_CheckedChanged(object sender, EventArgs e)
    {
        if (rbFeminino.Checked == true)
            rbMasculino.Checked = false;
    }

    protected void ObjectDataSource4_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {        
        e.InputParameters["v_tipo_cliente"] = ddlTpPessoa.SelectedValue;
    }
}