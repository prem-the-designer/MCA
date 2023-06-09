<%@ Page Language="Vb" ContentType = "image/png"%>
<%@ Import Namespace = "System.Drawing" %>
<%@ Import Namespace = "System.Drawing.Imaging" %>

<Script Runat = "Server">

Sub Page_Load
        Dim cirObj As Bitmap
        Dim grObj As Graphics
        Dim x1, y1, x2, y2 As Integer
        Dim rad As Single
        cirObj = New Bitmap(360, 300)
        grObj = Graphics.FromImage(cirObj)
        x1 = 0
        y1 = 150
        For i = 0 To 359
            rad = Math.PI / 180 * i
            x2 = i
            y2 = 150 - Math.Sin(rad) * 150
            grObj.DrawLine(Pens.Blue, x1, y1, x2, y2)
            x1 = x2
            y1 = y2
        Next
        ' grObj.DrawEllipse(New Pen(Color.FromArgb(Rnd() * 255, Rnd() * 255, Rnd() * 255, Rnd() * 255), Rnd() * 5), 0, 0, 100, 28)
        grObj.DrawString(Request.QueryString("msg"), New Font("Arial", 18), Brushes.AliceBlue, 5, 5)
        cirObj.Save(Response.OutputStream, ImageFormat.Png)
        cirObj.Dispose()
        grObj.Dispose()
End Sub

</Script>