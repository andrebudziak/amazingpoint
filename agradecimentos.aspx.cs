using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Web.Mail;
using System.Data;

public partial class agradecimentos : System.Web.UI.Page
{
    private void Page_PreInit(object sender, EventArgs e)
    {
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblHash.Visible = false;
            lblIdUsuario.Visible = false;

            if (Session["u"] != null)
            {
                lblIdUsuario.Text = Session["u"].ToString();
            }
            else
            {
                Response.Redirect("login.aspx");
            }


            if (Session["h"] != null)
            {
                lblHash.Text = Session["h"].ToString();
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

    }

    protected void btnEnvia_Click(object sender, EventArgs e)
    {
        string texto = "", emailDestino = "";

        foreach (GridViewRow row in grdDados.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("ckEnvia");
            if (chk.Checked == true)
            {
                Label lblEmail = (Label)row.FindControl("lblEmail");
                emailDestino = lblEmail.Text;
                texto = edtAgradecimento.Content;
                EnviaEmail(texto, emailDestino);
            }
        }
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

        }

    }

    protected void chkTodos_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk;
        foreach (GridViewRow rowItem in grdDados.Rows)
        {
            chk = (CheckBox)(rowItem.Cells[0].FindControl("ckEnvia"));
            chk.Checked = ((CheckBox)sender).Checked;
        }
    }

    protected void EnviaEmail(string texto, string emailDestinatario)
    {
        string message = "";

        message += texto;

        MailMessage Message = new MailMessage();

        // SMTP Authentication
        Message.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", "1");
        Message.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", "contato@buffetkidscuritiba.com.br");
        Message.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", "kids@curitiba");

        Message.To = emailDestinatario;
        Message.From = "contato@buffetfinafestas.com.br";
        Message.Subject = "Convite";
        Message.BodyFormat = MailFormat.Html;
        Message.BodyEncoding = System.Text.Encoding.UTF8;
        Message.Priority = MailPriority.Normal;

        Message.Body = message;
        SmtpMail.SmtpServer = "smtp.buffetkidscuritiba.com.br";

        try
        {
            SmtpMail.Send(Message);
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "clientscript", "<script language='JavaScript'>alert('Agradecimento enviado com sucesso!'); </script>", false);

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "clientscript", "<script language='JavaScript'>alert('" + ex.Message + "'); </script>", false);
        }


    }

    protected void ObjectDataSource3_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        if (lblIdUsuario.Text == "0")
            e.InputParameters["v_codigo"] = 0;
        else
            e.InputParameters["v_codigo"] = Convert.ToInt32(lblIdUsuario.Text);
    }
}