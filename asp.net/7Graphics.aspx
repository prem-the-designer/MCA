<%@ Page Language="Vb" ContentType = "image/png"%>
<%@ Import Namespace = "System.Drawing" %>
<%@ Import Namespace = "System.Drawing.Imaging" %>

<Script Runat = "Server">

Sub Page_Load

        Dim dynaText As String
Dim objBitmap As Bitmap
Dim objGraphics As Graphics

objBitmap = New Bitmap(200, 200)
objGraphics = Graphics.FromImage(objBitmap)
        dynaText = ""
        For i = 1 To 5
            dynaText = dynaText & Chr(CInt(Rnd() * 100 + 9) Mod 26 + 65)
        Next
        objGraphics.DrawLine(New Pen(Color.Red), 0, 100, 200, 100)
        objGraphics.DrawEllipse(New Pen(Color.Blue), 0, 100, 200, 200)
        objGraphics.DrawString(dynaText, New Font(Drawing.FontFamily.GenericSerif, 14), Brushes.LightCoral, New Point(0, 100))
        objBitmap.Save(Response.OutputStream, ImageFormat.Png)

objBitmap.Dispose()
objGraphics.Dispose()
End Sub

</Script>