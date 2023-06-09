<%@ Page Language="Vb" %> 
<% 
    Display()
    %>
  <Script runat = "server">
Public Sub Display()
    Response.Write("<br>QueryString = ")
    Response.Write(Request.QueryString)
    Response.Write("<br>QueryString(0) = ")
    Response.Write(Request.QueryString(0))
    Response.Write("<br>QueryString(""User"")=")
    Response.Write(Request.QueryString("User"))
    Response.Write("<br>QueryString(1) = ")
    Response.Write(Request.QueryString(1))
    Response.Write("<br>QueryString(""pwd"")=")
    Response.Write(Request.QueryString("pwd"))
End Sub
 </script>  
