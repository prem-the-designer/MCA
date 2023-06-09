<%@ Page Language="Vb" %> 
<%  
    Response.Write("Welcome to ASPX " & Request.QueryString(0))
    Response.Write("<br>")
    Response.Write("Query String : ")
    Response.Write(Request.QueryString)
    Response.Write("<br> Request From IP " & Request.UserHostAddress)
    Response.Write("<br> Request From Name " & Request.UserHostName)
%>

