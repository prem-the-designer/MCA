<%@ Page Language="Vb" ContentType = "image/png"%>
<%@ Import Namespace = "System.Drawing" %>
<%@ Import Namespace = "System.Drawing.Imaging" %>

<Script Runat = "Server">

Sub Page_Load
        Dim cirObj As Bitmap
        Dim grObj As Graphics
        cirObj = New Bitmap(100, 30)
        grObj = Graphics.FromImage(cirObj)
        
        grObj.DrawEllipse(New Pen(Color.FromArgb(Rnd() * 255, Rnd() * 255, Rnd() * 255, Rnd() * 255), Rnd() * 5), 0, 0, 100, 28)
        grObj.DrawString(Request.QueryString("msg"), New Font("Arial", 18), Brushes.AliceBlue, 5, 5)
        cirObj.Save(Response.OutputStream, ImageFormat.Png)
        cirObj.Dispose()
        grObj.Dispose()
End Sub

</Script>