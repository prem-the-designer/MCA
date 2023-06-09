    <%@ Page Language="Vb" ContentType = "image/png"%>
    <%  If (Session("OTPVerified") = True) Then
            Response.Write("Two Factor Authentication Successfull.")
            Response.Redirect("https://nmcc.ac.in")
        Else
           Server.Transfer("Login.aspx")
        End If
    %>