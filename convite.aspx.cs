using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class enviar_convite : System.Web.UI.Page
{
    private Servico ws = new Servico();

    protected void Page_Load(object sender, EventArgs e)
    {        
        if (!IsPostBack)
        {

            lblHash.Visible = false;
            lblIdUsuario.Visible = false;
            lblIdConvite.Visible = false;

            if (Session["u"] != null)
            {
                lblIdUsuario.Text = Session["u"].ToString();
                DataSet dados = ws.consultaConviteIDUsuario(Convert.ToInt32(lblIdUsuario.Text));
                if (dados.Tables[0].Rows.Count > 0)
                {
                   lblIdConvite.Text = dados.Tables[0].Rows[0]["idConvite"].ToString();
                }
                else
                {
                    Response.Redirect("login.aspx");                
                }
            }
            else
            {
                lblCodigo.Text = "0";
                Response.Redirect("login.aspx");
            }


            if (Session["h"] != null)
            {
                lblHash.Text = Session["h"].ToString();
                lblCodigo.Text = "0";
            }
            else
            {
                lblCodigo.Text = "0";
                Response.Redirect("login.aspx");
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

        e.InputParameters["v_idConvite"] = lblIdConvite.Text;
        e.InputParameters["v_nome"] = txtNome.Text;
        e.InputParameters["v_email"] = txtEmail.Text;
        e.InputParameters["v_status"] = 0;
    }

    protected void grdDados_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {

            WebControl wc = ((WebControl)e.CommandSource);
            GridViewRow row = ((GridViewRow)wc.NamingContainer);

            lblCodigo.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblCodigo")).Text;
            txtNome.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblNome")).Text;
            txtEmail.Text = ((Label)grdDados.Rows[row.RowIndex].FindControl("lblEmail")).Text;
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
            DropDownList ddlStatus = (DropDownList)e.Row.FindControl("ddlStatus");
            string status = ddlStatus.SelectedValue;
            Image imgStatus = (Image)e.Row.FindControl("imgStatus");

            switch (status) 
            {
                case "0":
                    {
                        imgStatus.ImageUrl = "~/imagens/ausente.png";
                        break;
                    }

                case "1":
                    {
                        imgStatus.ImageUrl = "~/imagens/online.png";
                        break;
                    }
                case "2":
                    {
                        imgStatus.ImageUrl = "~/imagens/ocupado.png";
                        break;
                    }            
            }

            DataRowView row = (DataRowView)e.Row.DataItem;
            lblIdConvite.Text = row["idConvite"].ToString();

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

    }

    protected void ObjectDataSource3_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        if (lblIdUsuario.Text == "0")
            e.InputParameters["v_codigo"] = 0;
        else
            e.InputParameters["v_codigo"] = Convert.ToInt32(lblIdUsuario.Text);

    }
}