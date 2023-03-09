using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Administracao_cadastro_convite : System.Web.UI.Page
{
    Servico ws = new Servico();
    
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

        e.InputParameters["v_idCliente"] = ddlSelCliente.SelectedValue;
        e.InputParameters["v_texto"] = "";
        e.InputParameters["v_arquivo"] = txtArquivo.Text;
        e.InputParameters["v_ativo"] = ddlStatus.SelectedValue;
        e.InputParameters["v_nome"] = txtNome.Text;
        e.InputParameters["v_idade"] = txtIdade.Text;
        e.InputParameters["v_dia"] = Convert.ToDateTime(txtDia.Text);
        e.InputParameters["v_hora"] = txtHora.Text;
        e.InputParameters["v_local"] = "";
        e.InputParameters["v_fone"] = "";
    }

    protected void grdDados_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {

            WebControl wc = ((WebControl)e.CommandSource);
            GridViewRow row = ((GridViewRow)wc.NamingContainer);

            lblCodigo.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblCodigo")).Text;

            txtArquivo.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblArquivo")).Text;
            ddlSelCliente.SelectedValue = ((DropDownList)grdDados.Rows[row.RowIndex].FindControl("ddlCliente")).SelectedValue;
            ddlStatus.SelectedValue = ((DropDownList)grdDados.Rows[row.RowIndex].FindControl("ddlStatus")).SelectedValue;
            txtNome.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblNome")).Text;
            txtIdade.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblIdade")).Text;
            txtDia.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblDia")).Text;
            txtHora.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblHora")).Text;
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
            Label lblData = (Label)e.Row.FindControl("lblDia");
            if(lblData.Text != string.Empty)
               lblData.Text = Convert.ToDateTime(lblData.Text).ToString("dd/MM/yyyy");
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

    protected void AsyncFileUpload1_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    {
        System.Threading.Thread.Sleep(5000);
        if (fileUploadArquivo.HasFile)
        {
            string strPath = MapPath("~/convite/") + fileUploadArquivo.FileName;
            fileUploadArquivo.SaveAs(strPath);
        }
    }
}