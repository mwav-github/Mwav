Okay in order for an experienced ASP programmer to get this package working you need to do two things:

(1) Place the following line of code in the FIRST page of your site which is hit when visitors arrive (default start page) (must be ASP page):

<!-- #INCLUDE FILE="shared_log_visit.inc" -->

(2) Place the following code at the top of every ASP page you want visit-logged:

<% sPageName="About Us" %>
<!-- #INCLUDE FILE="shared_log_pageHit.inc" -->

note: sPageName variable tells the database which page was hit. So you would change it to be "Contact Us" when you put the code at the top of your contact us page, etc.

If you come up with any more pieces of advice for this readme, please email to me and I'll add!
Thanks!
Scott Swain
scott@blue-sea.com
