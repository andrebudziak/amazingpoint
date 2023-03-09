using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["hash"] != null)
            {
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
    }

    protected void lbtnCadastroCliente_Click(object sender, EventArgs e)
    {
        Response.Redirect("cadastro_cliente.aspx");
    }

    protected void lbtnCadastroLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("cadastro_login.aspx");
    }

    protected void lbtnCadastroConvite_Click(object sender, EventArgs e)
    {
        Response.Redirect("cadastro_convite.aspx");
    }

    protected void lbtnCadastroAlbum_Click(object sender, EventArgs e)
    {
        Response.Redirect("cadastro_album.aspx");
    }

    protected void lbtnCadastroItemAlbum_Click(object sender, EventArgs e)
    {
        Response.Redirect("cadastro_itemAlbum.aspx");
    }

}