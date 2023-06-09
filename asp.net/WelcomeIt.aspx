<%@ Page Language="Vb" %> 
<%  
    Response.Write("Welcome to ASPX " & Request.QueryString(0))
    Response.Write("<br>")
    Response.Write("Query String : " & Request.QueryString)
    Response.Write(" From " & Request.UserHostAddress & Request.UserHostName)
%>

