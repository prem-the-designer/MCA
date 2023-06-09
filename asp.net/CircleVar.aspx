<%@ Page ContentType = "image/png"%>
<%@ Import Namespace = "System.Drawing" %>
<%@ Import Namespace = "System.Drawing.Imaging" %>

<Script Runat = "Server">

Sub Page_Load

        Dim objBitmap As Bitmap
	    Dim objGraphics As Graphics
        Dim cirWidth As Integer = 100
        Dim cirHeight As Integer = 100
        try
            cirWidth = CInt(Request.QueryString("Width"))
            cirHeight = CInt(Request.QueryString("Height"))
        Catch
            cirWidth = CInt(100)
            cirHeight = CInt(100)
        End Try
        
        objBitmap = New Bitmap(cirWidth, cirHeight)
        objGraphics = Graphics.FromImage(objBitmap)
        
        objGraphics.DrawEllipse(New Pen(Color.Yellow, 3), 0, 0, cirWidth, cirHeight)
               
        objBitmap.Save(Response.OutputStream, ImageFormat.Png)

        objBitmap.Dispose()
        objGraphics.Dispose()
    End Sub

</Script>