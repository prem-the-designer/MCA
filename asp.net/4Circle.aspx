<%@ Page Language="Vb" ContentType = "image/png"%>
<%@ Import Namespace = "System.Drawing" %>
<%@ Import Namespace = "System.Drawing.Imaging" %>

<Script Runat = "Server">

Sub Page_Load
        Dim cirObj As Bitmap
        Dim grObj As Graphics
        cirObj = New Bitmap(50, 50)
        grObj = Graphics.FromImage(cirObj)
        
        grObj.DrawEllipse(Pens.Blue, 1, 1, 48, 48)
        cirObj.Save(Response.OutputStream, ImageFormat.Png)
        cirObj.Dispose()
        grObj.Dispose()
End Sub

</Script>