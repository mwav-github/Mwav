using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using JinsLibrary;
using JinsLibrary.FILE;
using JinsLibrary.IMAGE;

namespace WebRoot.PartsOfContent.ZoomImage
{
    public partial class ZoomImage : System.Web.UI.Page
    {
        private string _pathInfo;
        //private System.Drawing.Image drawingImage;
        private System.Drawing.Size _drawingSize;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //이창을 포커싱한다.
                ClientAction.WindowFocus(null);

                //이미지경로 받아서 이미지
                if (Request.QueryString["pi"] != null)
                {
                    //ClientAction.ShowInfoMsg("a=" + imgZoom.Width.Value.ToString());

                    //사이즈수정
                    //ClientAction.WindowResizeTo(800, 800);
                    _pathInfo = Request.QueryString["pi"];
                    _drawingSize = ImageLib.Self.GetDrawingImageSize(_pathInfo);

                    if (_drawingSize.IsEmpty)
                    {
                        ClientAction.WindowResizeTo(Convert.ToUInt16(imgZoom.Width.Value + 120), Convert.ToUInt16(imgZoom.Height.Value + 190));
                    }
                    else
                    {
                        imgZoom.ImageUrl = _pathInfo;
                        imgZoom.Width = _drawingSize.Width;
                        imgZoom.Height = _drawingSize.Height;
                        ClientAction.WindowResizeTo(Convert.ToUInt16(_drawingSize.Width + 120), Convert.ToUInt16(_drawingSize.Height + 190));
                    }
                    imgZoom.Dispose();
                }

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
    }
}