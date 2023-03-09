using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Data;
using System.Web.Mail;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using System.IO;
using System.Collections;

public partial class convite : System.Web.UI.Page
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
        string texto = "",emailDestino="",imagem="",nome="",idade="",dia="",hora="",local="",fone="",convidado="",nome_fantasia="";
        Servico ws = new Servico();
        DataSet dados= ws.consultaConviteClienteUsuario(Convert.ToInt32(lblIdUsuario.Text));
        
        texto = dados.Tables[0].Rows[0]["texto"].ToString();
        imagem = dados.Tables[0].Rows[0]["arquivo"].ToString();
        nome = dados.Tables[0].Rows[0]["aniversariante"].ToString();
        idade = dados.Tables[0].Rows[0]["idade"].ToString();
        dia = Convert.ToDateTime(dados.Tables[0].Rows[0]["dia"].ToString()).ToString("dd/MM/yyyy");
        hora = dados.Tables[0].Rows[0]["hora"].ToString();
        local = dados.Tables[0].Rows[0]["local"].ToString();
        fone = dados.Tables[0].Rows[0]["fone"].ToString();

        string idCliente = dados.Tables[0].Rows[0]["idCliente"].ToString();
        DataSet d = ws.consultaCliente(Convert.ToInt32(idCliente),0);
        nome_fantasia = d.Tables[0].Rows[0]["nome"].ToString();

        foreach (GridViewRow row in grdDados.Rows)
        {
           CheckBox chk = (CheckBox)row.FindControl("ckEnvia");
           if (chk.Checked == true)
           {
               Label lblEmail = (Label)row.FindControl("lblEmail");
               emailDestino = lblEmail.Text;
               Label lblConvidado = (Label)row.FindControl("lblNome");
               convidado = lblConvidado.Text;

               EnviaEmail(texto,emailDestino,imagem,nome,idade,dia,hora,local,fone,convidado,nome_fantasia);
           }
        }
    }

    protected void grdDados_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DropDownList ddlStatus = (DropDownList)e.Row.FindControl("ddlStatus");
            string status = ddlStatus.SelectedValue;
            System.Web.UI.WebControls.Image imgStatus = (System.Web.UI.WebControls.Image)e.Row.FindControl("imgStatus");

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

    protected void EnviaEmail(string texto,string emailDestinatario,string imagem, string nome, string idade,string dia, string hora, string local, string fone, string convidado, string nome_fantasia )
    {
        string message = "";
        
        message += "";

        MailMessage Message = new MailMessage();

        // SMTP Authentication
        Message.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", "1");
        Message.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", "contato@buffetkidscuritiba.com.br");
        Message.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", "2011kids");

        Message.To = emailDestinatario;
        Message.From = "contato@buffetkidscuritiba.com.br";
        Message.Subject = "Convite";
        Message.BodyFormat = MailFormat.Html;
        Message.BodyEncoding = System.Text.Encoding.UTF8;
        Message.Priority = MailPriority.Normal;

        message += "<table style='width: 100%;' border='0' cellpadding='0' cellspacing='0'>";
        message += "<tr>";
        message += "<td>";                           
        message += "Ola! "+ convidado +" ";
        message += "</td> ";
        message += "</tr>";
        message += "<tr>";
        message += "<td>  ";                         
        message += "Este é um convite enviado para festa de aniversario de "+nome+" ";
        message += "</td>";       
        message += "</tr>";
        message += "<tr>";
        message += "<td>";
        message += "O convite em anexo em formato pdf. Por favor confirme a sua presença, abrindo o ";
        message += "documento em pdf e clicando em [SIM] ou [NÃO].</td>";
        message += "</tr>";
        message += "<tr>";
        message += "<td style='height:100px;'>";
        message += "</td> ";                    
        message += "</tr>";
        message += "<tr>";
        message += "<td>";
        message += "</td> ";                    
        message += "</tr>";
        message += "<tr>";
        message += "<td>";
        message += "</td> ";                    
        message += "</tr>";
        message += "<tr>";
        message += "<td>";
        message += "Muito obrigado !!!!</td> ";
        message += "</tr>";
        message += "<tr>";
        message += "<td style='height:50px;'>";
        message += "</td> ";                    
        message += "</tr>";
        message += "<tr>";
        message += "<td>  ";
        message += " "+ nome_fantasia;
        message += "</td>";                  
        message += "</tr>";
        message += "<tr>";
        message += "<td>";
        message += "</td> ";                    
        message += "</tr>";
        message += "</table>";


        //create document
        Document pdfDoc = new Document(PageSize.A4.Rotate(), 0f, 0f, 0f, 0f);
        try
        {
            string imageFilePath = Server.MapPath(".") + "/convite/" + imagem;

            iTextSharp.text.Image jpg = iTextSharp.text.Image.GetInstance(imageFilePath);

            // Page site and margin left, right, top, bottom is defined

            //Resize image depend upon your need
            //For give the size to image
            jpg.ScaleToFit(800, 400);

            //If you want to choose image as background then,

            jpg.Alignment = iTextSharp.text.Image.UNDERLYING;

            //If you want to give absolute/specified fix position to image.
            jpg.SetAbsolutePosition(25, 190);

            PdfWriter.GetInstance(pdfDoc, new FileStream(Server.MapPath(".") + "/convite/" + "convite.pdf", FileMode.Create));

            pdfDoc.Open();

            pdfDoc.NewPage();

            BaseFont Arial = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
            Font font = new Font(Arial, 11);
            font.Color = iTextSharp.text.BaseColor.WHITE;
            font.SetFamily("Verdana");

            BaseFont Arial2 = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
            Font font2 = new Font(Arial, 13);
            font2.Color = iTextSharp.text.BaseColor.WHITE;
            font2.SetFamily("Verdana");

            Font fontSim = new Font(Arial, 11);            
            fontSim.Color = iTextSharp.text.BaseColor.WHITE;
            fontSim.SetFamily("Verdana");
            fontSim.SetStyle("font-weight: bold;");

            Font fontNao = new Font(Arial, 11);
            fontNao.Color = iTextSharp.text.BaseColor.WHITE;
            fontNao.SetFamily("Verdana");
            fontNao.SetStyle("font-weight: bold;");


            PdfPTable datatable = new PdfPTable(5);
            datatable.DefaultCell.Padding = 1;

            float[] headerwidths = { 85,85,85,85,85 }; // percentage
            datatable.SetWidths(headerwidths);
            datatable.WidthPercentage = 85; // percentage

            datatable.DefaultCell.BorderWidth = 0;
            datatable.DefaultCell.HorizontalAlignment = Element.ALIGN_RIGHT;
            
            datatable.HeaderRows = 1;  // this is the end of the table header          

            Phrase text1 = new Phrase(nome, font2);
            Phrase text2 = new Phrase("Idade:"+idade, font);
            Phrase text3 = new Phrase("Data:"+dia , font);
            Phrase text4 = new Phrase("Hora:"+hora, font);
            Phrase text5 = new Phrase("", font);
            Phrase textLocal = new Phrase("", font);
            Phrase text6 = new Phrase("" + "", font);
            Phrase text7 = new Phrase("Confirmação Convite", font2);

            Anchor anchorSim = new Anchor("[Confirmar Presença]", fontSim);
            anchorSim.Reference = "http://www.buffetkidscuritiba.com.br/resposta.aspx?rsp=1&e=" + emailDestinatario;
            Paragraph pS = new Paragraph();
            pS.Add(anchorSim);

            Anchor anchorNao = new Anchor("[Não posso ir]", fontNao);
            anchorNao.Reference = "http://www.buffetkidscuritiba.com.br/resposta.aspx?rsp=2&e=" + emailDestinatario;
            Paragraph pN = new Paragraph();
            pN.Add(anchorNao);

            //adicionando elementos nas celulas
            PdfPCell c1 = new PdfPCell();
            c1.AddElement(text1);
            c1.VerticalAlignment = Element.ALIGN_LEFT;
            c1.BorderWidth = 0;
            c1.PaddingLeft = 15f;

            PdfPCell c2 = new PdfPCell();
            c2.AddElement(text2);
            c2.VerticalAlignment = Element.ALIGN_LEFT;
            c2.BorderWidth = 0;
            c2.PaddingLeft = 15f;

            PdfPCell c3 = new PdfPCell();
            c3.AddElement(text3);
            c3.VerticalAlignment = Element.ALIGN_LEFT;
            c3.BorderWidth = 0;
            c3.PaddingLeft = 15f;

            PdfPCell c4= new PdfPCell();
            c4.AddElement(text4);
            c4.VerticalAlignment = Element.ALIGN_LEFT;
            c4.BorderWidth = 0;
            c4.PaddingLeft = 15f;

            PdfPCell c5 = new PdfPCell();
            c5.AddElement(text5);
            c5.VerticalAlignment = Element.ALIGN_LEFT;
            c5.BorderWidth = 0;
            c5.PaddingLeft = 15f;
            c5.FixedHeight = 20f;

            PdfPCell c6 = new PdfPCell();
            c6.AddElement(textLocal);
            c6.VerticalAlignment = Element.ALIGN_LEFT;
            c6.BorderWidth = 0;
            c6.PaddingLeft = 15f;
            c6.FixedHeight = 20f;

            PdfPCell c7 = new PdfPCell();
            c7.AddElement(text6);
            c7.VerticalAlignment = Element.ALIGN_LEFT;
            c7.BorderWidth = 0;
            c7.PaddingLeft = 15f;
            c7.FixedHeight = 15f;

            PdfPCell c8 = new PdfPCell();
            c8.AddElement(text7);
            c8.VerticalAlignment = Element.ALIGN_LEFT;
            c8.BorderWidth = 0;
            c8.PaddingLeft = 15f;

            PdfPCell c9 = new PdfPCell();
            c9.AddElement(pS);
            c9.VerticalAlignment = Element.ALIGN_LEFT;
            c9.BorderWidth = 0;
            c9.PaddingLeft = 15f;

            PdfPCell c10 = new PdfPCell();
            c10.AddElement(pN);
            c10.VerticalAlignment = Element.ALIGN_LEFT;
            c10.BorderWidth = 0;
            c10.PaddingLeft = 15f;

            PdfPCell cell = new PdfPCell(new Phrase(""));
            cell.Colspan = 5;
            cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
            cell.BorderWidth = 0;

            PdfPCell celt = new PdfPCell(new Phrase(""));
            celt.Colspan = 5;
            celt.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
            celt.BorderWidth = 0;


            datatable.AddCell(cell);

            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);
            datatable.AddCell(celt);


            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell(c1);
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell(c2);
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell(c3);
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell(c4);
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell(c5);
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell(c6);
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell(c7);
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell(c8);
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell(c9);
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell("");
            datatable.AddCell(c10);

            pdfDoc.Add(datatable);

            pdfDoc.Add(jpg);

            pdfDoc.Close();

        }
        catch (Exception exx) 
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "clientscript", "<script language='JavaScript'>alert('Erro ao criar PDF: "+exx.Message.ToString()+"'); </script>", false);        
        }

        MailAttachment MyAttachment = new MailAttachment(MapPath("~/convite/convite.pdf"));
        Message.Attachments.Add(MyAttachment); 


        Message.Body = message;
        SmtpMail.SmtpServer = "smtp.buffetkidscuritiba.com.br";

        try
        {
            SmtpMail.Send(Message);
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "clientscript", "<script language='JavaScript'>alert('Convite enviado com sucesso!'); </script>", false);

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