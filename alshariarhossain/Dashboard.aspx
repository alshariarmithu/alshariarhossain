<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="alshariarhossain.Dashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background: #f0f4ff; margin: 0; padding: 0; }
        .container { max-width: 800px; margin: 50px auto; padding: 20px; background: #ffffff; box-shadow: 0 4px 20px rgba(0,0,0,0.1); border-radius: 12px; }
        h1 { color: #1e293b; }
        a.logout { display: inline-block; margin-top: 20px; padding: 10px 15px; background: #1e293b; color: white; text-decoration: none; border-radius: 8px; }
        a.logout:hover { background: #334155; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Welcome, <asp:Label ID="lblEmail" runat="server"></asp:Label>!</h1>
            <p>This is your dashboard.</p>
            <a class="logout" href="Logout.aspx">Logout</a>
        </div>
    </form>
</body>
</html>
