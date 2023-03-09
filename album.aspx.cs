using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class album : System.Web.UI.Page
{
    Servico ws = new Servico();

    protected void Page_Load(object sender, EventArgs e)
    {
       if (!IsPostBack)
       {
          DataSet dados = ws.consultaAlbum(0);
          ddlAlbum.DataSource = dados;
          ddlAlbum.DataBind();
       }
    }

    protected void ddlAlbum_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        DataRowView dbr = (DataRowView)e.Item.DataItem;
        if (Convert.ToString(DataBinder.Eval(dbr, "foto")) != "")
        {
            string imagem = Convert.ToString(DataBinder.Eval(dbr, "foto"));
            Image imgFoto = (Image)e.Item.FindControl("imgFoto");
            imgFoto.ImageUrl = "album/" + imagem;

            string descricao = Convert.ToString(DataBinder.Eval(dbr, "descricao"));
            HyperLink lnkAlbum = (HyperLink)e.Item.FindControl("lnkAlbum");
            lnkAlbum.Text = descricao;
            lnkAlbum.Attributes["href"] = "item_album.aspx?c=" + Convert.ToString(DataBinder.Eval(dbr, "idAlbum"));

            HyperLink lnkImagem = (HyperLink)e.Item.FindControl("lnkImagem");
            lnkImagem.Attributes["href"] = "item_album.aspx?c=" + Convert.ToString(DataBinder.Eval(dbr, "idAlbum"));

            string texto = Convert.ToString(DataBinder.Eval(dbr, "texto"));
            Label lblTexto = (Label)e.Item.FindControl("lblTexto");
            lblTexto.Text = texto;

        }
        
    }
}