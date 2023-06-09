<%@ Page Language="Vb" %> 
<%  
    Dim radius As Integer
    Dim a As Single
    radius = CInt(Request.QueryString("Radius"))
    a = Area(CInt(radius))
    Display(radius, a)
%>
<script runat="server">
   
    Sub Display(ByVal r As Integer, ByVal a As Single)
        Response.Write("Radius of the Circle is " & r)
        Response.Write("<br>")
        Response.Write("Area of the Circle is " & a)
    End Sub
    
    Function Area(ByVal rad As Integer) As Single
        rad = CInt(Request.QueryString("Radius"))
        Area = Math.PI * rad ^ 2
    End Function
</script>
