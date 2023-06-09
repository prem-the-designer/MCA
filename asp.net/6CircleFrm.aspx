<%@ Page Language="Vb" AspCompat="true" %>
<html>
<body>
 <form id="formCir" runat="server">
        Circle created by Circle.aspx 
        <asp:Image ID="Image1" runat="server" AlternateText="Circle" ImageUrl="Circle.aspx" />
       <asp:Image ID="Image2" runat="server" AlternateText="Circle" ImageUrl="Circle.aspx" />
    <div>
      <h3>Simple Button Example</h3>
     
      <asp:Button id="Button1"
           Text="Click here for greeting..."
           OnClick="GreetingBtn_Click" 
           runat="server"/>
      <br />
      <br />
      <asp:Label ID="GreetingLabel" runat="server" 
                 Visible="false" Text="Hello World!" />
    </div>

</form>
  
</body>
</html>
<script runat="server">
    
    Sub Page_Load()
    
    End Sub

    Sub GreetingBtn_Click(sender As Object, e As EventArgs)
        Button1.Text = "...button clicked..."
        Button1.Enabled = False
        
        ' Display the greeting label text.
        GreetingLabel.Visible = True
    End Sub

</script>

