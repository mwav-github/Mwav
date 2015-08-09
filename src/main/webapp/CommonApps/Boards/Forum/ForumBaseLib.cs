using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

using JinsLibrary;

namespace KistelSite.CommonApps.Boards.Forum
{
	public class ForumBase : ForumBaseLib
	{
	}
	/// <summary>
	/// PollBaseLib에 대한 요약 설명입니다.
	/// </summary>
	public class ForumBaseLib : System.Web.UI.Page
	{
		//그래프그리기 (상속해서 숨김)
		/*
		public static System.Web.UI.WebControls.Image DrawGraph(int point, int pollSum)
		{
			System.Web.UI.WebControls.Image imgCntGraph;
			double widthPercent = 0;
			if(pollSum > 0)
				widthPercent = Math.Round(MathLib.GetPercent(point, pollSum), 1);
			
			imgCntGraph = new System.Web.UI.WebControls.Image();
			imgCntGraph.ImageUrl = @"/CommonApps/MemberPoll/Images/green.gif";
			imgCntGraph.Width = Unit.Percentage(widthPercent * 1.4);
			imgCntGraph.Height = 10;
			imgCntGraph.AlternateText = Unit.Percentage(widthPercent).ToString();
			imgCntGraph.ImageAlign = ImageAlign.AbsMiddle;
			imgCntGraph.Visible = true;
			return imgCntGraph;
		}
		*/
		public ForumBaseLib()
		{
			//
			// TODO: 여기에 생성자 논리를 추가합니다.
			//
		}
	}
}
