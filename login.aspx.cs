using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class login : System.Web.UI.Page
{
    Servico ws = new Servico();

    private void Page_PreInit(object sender, EventArgs e)
    {
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        { 
        
        }
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        int idIusuario=ws.loginUsuario(UserName.Text, Password.Text);
        if (idIusuario == 0)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "clientscript", "<script language='JavaScript'>alert('Usuario e/ou Senha Invalido(s)! Verifique'); </script>", false);
            UserName.Text = "";
            Password.Text = "";
        }
        else
        {
            string senha = SenhaHASH(Convert.ToString(DateTime.Now));
            Session["h"] = senha;
            Session["u"] = idIusuario.ToString();
            Response.Redirect("convite.aspx");
            UserName.Text = "";
            Password.Text = "";
        }

    }

    public string SenhaHASH(string Senha)
    {
        return FormsAuthentication.HashPasswordForStoringInConfigFile(Senha, "sha1");
    }

}