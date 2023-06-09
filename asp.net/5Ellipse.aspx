<%@ Page Language="Vb" ContentType = "image/png"%>
<%@ Import Namespace = "System.Drawing" %>
<%@ Import Namespace = "System.Drawing.Imaging" %>

<Script Runat = "Server">

    Sub Page_Load()

        Dim objBitmap As Bitmap
        Dim objGraphics As Graphics
        Dim xRad As Integer = 100
        Dim yRad As Integer = 100
        Try
            xRad = CInt(Request.QueryString("xRadius"))
            yRad = CInt(Request.QueryString("yRadius"))
        Catch
            xRad = CInt(100)
            yRad = CInt(100)
        End Try
        
        objBitmap = New Bitmap(xRad, yRad)
        objGraphics = Graphics.FromImage(objBitmap)
        
        objGraphics.DrawEllipse(New Pen(Color.Yellow, 3), 0, 0, xRad, yRad)
               
        objBitmap.Save(Response.OutputStream, ImageFormat.Png)

        objBitmap.Dispose()
        objGraphics.Dispose()
    End Sub

</Script>