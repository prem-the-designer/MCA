<%@ Page Language="Vb" AspCompat="true" %>

<script runat="server">
    
    Sub Page_Load(sender As Object, e As EventArgs)
        If (IsPostBack() = False) Then
            Session("captcha") = GenerateDynaText()
            Image1.ImageUrl = "CircleMsg.aspx?msg=" & Session("captcha")
        End If
    End Sub

    Sub SendSMS(mobile As String, otp As String)
        Dim httpUrl, Token, Credit, Senderid, TemplateID, strResp, Message As String
        httpUrl = "http://pay4sms.in/sendsms/index.php"
        Token = "0514a87879eeb2fe841924da6282365a"
        Credit = "2"
        Senderid = "YJACOB"
        TemplateID = 1707166852607742941
        Message = "The OTP for login is " & otp & ". Pls do not share with others.-YJACOB"
        Message = Server.UrlEncode(Message)
        httpUrl = httpUrl & "?token=" & Token & "&credit=" & Credit & "&sender=" & Senderid & "&templateid=" & TemplateID & "&message=" & Message & "&number=" & mobile
        If mobile <> "" Then
            Dim xmlhttp
            Try
                xmlhttp = Server.CreateObject("Microsoft.XMLHTTP")
                xmlhttp.Open("GET", httpUrl, True)
                xmlhttp.Send()
                GreetingLabel.Text = "OTP Send to " & mobile
            Catch
                GreetingLabel.Text = "Failed " & httpUrl
            
                ' strResp = Trim(xmlhttp.responseText)
                'xmlhttp = Nothing
                ' GreetingLabel.Text = strResp          
            End Try
        End If
    End Sub
    Sub Login_Click(sender As Object,
                            e As EventArgs)
      
        Dim clickedButton As Button = sender
        If (Session("captcha") = txtCaptcha.Text.Trim) Then
            Dim otp = CInt(Rnd() * 100000 + 10000)
            Session("otp") = otp
            SendSMS(txtUID.Text, otp)
            clickedButton.Enabled = False
        
            Image1.ImageUrl = "CircleMsg.aspx?msg=" & Session("captcha")
            otpLabel.Visible = True
            txtOTP.Visible = True
            GreetingLabel.Visible = True
            SUBMIT.Visible = True
        Else
            GreetingLabel.Text = "Not matching captcha " & Session("captcha") & "and " & txtCaptcha.Text
            GreetingLabel.Visible = True
        End If
    End Sub

    Sub Submit_Click(sender As Object,
                            e As EventArgs)
  
        If (Session("OTP") = txtOTP.Text) Then
            Session("OTPVerified") = True
            GreetingLabel.Text = "Wonderful..."
            Server.Transfer("Start.aspx")
            'Response.Redirect("https://nmcc.ac.in")
            GreetingLabel.Visible = True
        Else
            Session("OTPVerified") = False
        End If
    End Sub
    
    Public Function GenerateDynaText() As String
        Dim dynaText As String
        Dim i As Integer
        dynaText = ""
        Randomize()
        For i = 1 To 5
            If (i Mod 3) = 0 Then
                dynaText = dynaText & Chr(CInt(Rnd() * 100 + 9) Mod 10 + 48)
            Else
                dynaText = dynaText & Chr(CInt(Rnd() * 100 + 9) Mod 26 + 65)
            End If
        Next
        GenerateDynaText = dynaText
    End Function

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body style="background-image:url(SineWave.aspx)">
    <form id="form1" runat="server" style="background-image : linear-gradient( cyan  ,white ,blue )">
        <table>
            <tr>
                <td colspan="2">

                    <h3 align="center">Welcome to Login </h3>
                </td>
            </tr>
            <tr>
                <td>User ID </td><td>
            <asp:TextBox ID="txtUID" Text="" runat="server"></asp:TextBox>
                </td>

            </tr>

            <tr>
                <td>Captcha :</td>
                <td>
                    <asp:Image ID="Image1" runat="server" AlternateText="Circle" ImageUrl="CircleMsg.aspx" />
                </td>
            </tr>
            <tr>
                <td>Enter Captcha </td>
                <td>
                    <asp:TextBox ID="txtCaptcha" Text="" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="Login"
                        Text="Login"
                        OnClick="Login_Click"
                        runat="server" /></td>
            </tr>
            <br />
            <br />
            <tr>
                <td>
                    <asp:Label ID="otpLabel" Text="Enter OTP  :" Visible="false" runat="server"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtOTP" Text="" runat="server" Visible="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="SUBMIT"
                        Text="Submit"
                        OnClick="Submit_Click"
                        runat="server" Visible="false" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="GreetingLabel" runat="server"
                        Visible="false" Text="Hello World!" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
