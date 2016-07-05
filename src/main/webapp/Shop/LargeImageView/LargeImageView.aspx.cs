using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using JinsLibrary;
using JinsLibrary.FILE;
using JinsLibrary.IMAGE;
using JinsLibrary.CONFIG;

namespace ADMIN
{
    public partial class Shop_LargeImageView_LargeImageView : System.Web.UI.Page
    {
        private string gcID;
        private string fileName, fileDESC, GdsUploadDir;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //이창을 포커싱한다.
                ClientAction.WindowFocus(null);

                //이미지경로 받아서 이미지
                if (Request.QueryString["gcID"] != null)
                {
                    gcID = Request.QueryString["gcID"];
                    if (this.LargeImageViewBind())
                    {
                        System.Drawing.Size drawingSize = ImageLib.Self.GetDrawingImageSize(this.imgLIV.ImageUrl);
                        //사이즈수정
                        if (drawingSize.IsEmpty)
                        {
                            ClientAction.WindowResizeTo(Convert.ToUInt16(imgLIV.Width.Value + 120), Convert.ToUInt16(imgLIV.Height.Value + 165));
                        }
                        else
                        {
                            ClientAction.WindowResizeTo(Convert.ToUInt16(drawingSize.Width + 200), Convert.ToUInt16(drawingSize.Height + 170));
                            //ImageLib.Self.ImageResize(ref imgLIV, 1000, 1000);
                        }
                    }
                    else
                        ClientAction.ShowMsgAndClose("해당 데이터가 없습니다.");
                }
                else
                    ClientAction.ShowMsgAndClose("정상적인 접근이 아닙니다");


                //타이틀명 설정
                if (Request.QueryString["tn"] != null)
                    ClientAction.SetBrowserTitleBar("이미지확대 - [" + Request.QueryString["tn"] + "]");
                else
                    ClientAction.AddBrowserTitleBar("이미지확대");

                //기타 설정
                if (Request.QueryString["etc"] != null)
                { }
            }
        }

        #region 수신인데이터 바인딩
        private Boolean LargeImageViewBind()
        {
            DBLib dbUtil = new DBLib();
            SqlDataReader drLIV = dbUtil.Select_DR("fileName,fileDESC", "t_GdsCellFiles", "gCode_id=" + gcID + " AND fileName LIKE 'S3%'", "fileDESC");
            if (drLIV.HasRows)
            {
                GdsUploadDir = SystemConfig.GetValue("GdsUploadDir") + "GC" + gcID + "/";
                this.rptThumbImg.DataSource = drLIV;
                this.rptThumbImg.DataBind();
                return true;
            }
            else
                return false;
        }

        #endregion

        protected void rptThumbImg_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            //이거편하냉
            //System.UriBuilder builder = new  UriBuilder("http://www.codeproject.com/aspnet/UrlBuilder.asp?cat=4");
            //Response.Write(builder.ToString());
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string standardImgText;
                fileName = ((System.Data.Common.DbDataRecord)e.Item.DataItem).GetValue(0).ToString();
                fileDESC = ((System.Data.Common.DbDataRecord)e.Item.DataItem).GetValue(1).ToString();
                //Thumb Nail
                System.Web.UI.WebControls.Image imgThumb = (System.Web.UI.WebControls.Image)e.Item.FindControl("imgThumb");
                imgThumb.ImageUrl = GdsUploadDir + fileName;
                imgThumb.Attributes["style"] = "CURSOR: hand";
                //선택이미지조정
                ImageLib.Self.ImageResize(ref imgThumb, 100, 100);
                if (fileName.IndexOf("Basic") > 0)
                {
                    standardImgText = "Basic";
                    imgThumb.ToolTip = "표준보기";
                    //기본디폴트값
                    this.imgLIV.ImageUrl = GdsUploadDir + fileName;
                }
                else if (fileName.IndexOf("Front") > 0)
                {
                    standardImgText = "Front";
                    imgThumb.ToolTip = "전면보기";
                }
                else if (fileName.IndexOf("Left") > 0)
                {
                    standardImgText = "Left";
                    imgThumb.ToolTip = "좌측면보기";
                }
                else if (fileName.IndexOf("Rear") > 0)
                {
                    standardImgText = "Rear";
                    imgThumb.ToolTip = "후면보기";
                }
                else if (fileName.IndexOf("Right") > 0)
                {
                    standardImgText = "Right";
                    imgThumb.ToolTip = "우측면보기";
                }
                else if (fileName.IndexOf("Top") > 0)
                {
                    standardImgText = "Top";
                    imgThumb.ToolTip = "윗면보기";
                }
                else if (fileName.IndexOf("Bottom") > 0)
                {
                    standardImgText = "Bottom";
                    imgThumb.ToolTip = "아랫면보기";
                }
                else if (fileName.IndexOf("Inside") > 0)
                {
                    standardImgText = "Inside";
                    imgThumb.ToolTip = "내부보기";
                }
                else if (fileName.IndexOf("Magnify") > 0)
                {
                    standardImgText = "Magnify";
                    imgThumb.ToolTip = "확대보기";
                }
                else if (fileName.IndexOf("Ani") > 0)
                {
                    standardImgText = "Ani";
                    imgThumb.ToolTip = "애니메이션보기";
                }
                else
                {
                    standardImgText = fileName.Substring(3, 5);
                    standardImgText.Replace("-", "");
                    imgThumb.ToolTip = ((System.Data.Common.DbDataRecord)e.Item.DataItem).GetValue(1).ToString();
                }
                if (imgThumb.ToolTip != "" && fileDESC != "")
                    imgThumb.ToolTip += "(" + fileDESC + ")";
                else if (imgThumb.ToolTip == "") //기타
                    imgThumb.ToolTip = fileDESC;

                imgThumb.Attributes["OnMouseover"] = "javascript:forms[0].imgLIV.src = " + imgThumb.ClientID + ".src;//ImageResize('imgLIV', 1000, 1000);";

            }

        }
}
}