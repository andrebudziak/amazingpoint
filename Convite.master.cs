using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Convite : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string pagina = Page.Request.Url.AbsoluteUri.Substring(Page.Request.Url.AbsoluteUri.Length - 10, Page.Request.Url.AbsoluteUri.IndexOf("/"));
        if (!IsPostBack && pagina !="login")
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

        if (pagina == "login")
        {
            lbtnConvite.Visible = false;
            lbtnEnviarConvite.Visible = false;
            lbtnAgradecimento.Visible = false;        
        }

    }

    protected void lbtnConvite_Click(object sender, EventArgs e)
    {
        Response.Redirect("Convite.aspx");
    }

    protected void lbtnEnviarConvite_Click(object sender, EventArgs e)
    {
        Response.Redirect("enviar_convite.aspx");
    }

    protected void lbtnAgradecimento_Click(object sender, EventArgs e)
    {
        Response.Redirect("agradecimentos.aspx");
    }


}
