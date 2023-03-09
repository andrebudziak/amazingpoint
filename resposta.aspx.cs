using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class teste : System.Web.UI.Page
{
    private string emailresposta;
    Servico ws = new Servico();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["e"] != null)
            {
                emailresposta = Request.QueryString["e"].ToString();
                if (Request.QueryString["rsp"] != null)
                {
                    string rsp = Request.QueryString["rsp"].ToString();
                    ws.ConfirmaPresenca(emailresposta, Convert.ToInt32(rsp));

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "clientscript", "<script language='JavaScript'>alert('Convite confirmado com sucesso!'); </script>", false);

                    Response.Redirect("http://www.buffetkidscuritiba.com.br/");

                }
            }
        }
    }
}