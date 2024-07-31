<%@ page import="dao.CustomerDao" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Customer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    Customer customer = (Customer) session.getAttribute("customer");
    if (customer == null) {
        response.sendRedirect("login.jsp?error=SessionExpired");
        return;
    }
%>

<%
String error = request.getParameter("error");
String success = request.getParameter("success");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: #E9E4F0;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .container {
            max-width: 800px;
            width: 100%;
            background: white;
            padding: 20px;
            margin: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #5A3E8C;
            font-weight: 300;
        }
        .message {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            text-align: center;
        }
        .message.error {
            background-color: #F8D7DA;
            color: #721C24;
        }
        .message.success {
            background-color: #D4EDDA;
            color: #155724;
        }
        p {
            background: #F5F3F8;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
            margin-bottom: 15px;
        }
        form {
            background: #F5F3F8;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }
        input[type="number"], input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #CCC;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }
        button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #5A3E8C;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 16px;
        }
        button:hover {
            background-color: #4A3271;
        }
        #logoutForm button {
            background-color: #28A745;
        }
        #logoutForm button:hover {
            background-color: #218838;
        }
        .hidden {
            display: none;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Welcome, <%= customer.getFullName() %></h1>
    <% if (error != null) { %>
        <p class="message error">
            <% if ("PasswordsMismatch".equals(error)) { %>
                New passwords do not match.
            <% } else if ("InvalidCurrentPassword".equals(error)) { %>
                Current password is incorrect.
            <% } else if ("PasswordChangeFailed".equals(error)) { %>
                Failed to change password. Please try again.
            <% } %>
        </p>
    <% } %>

    <% if ("PasswordChanged".equals(success)) { %>
        <p class="message success">Password changed successfully.</p>
    <% } %>
    <p>Account Number: <%= customer.getAccountNo() %></p>
    <p>Balance: <%= customer.getBalance() %></p>

    <form action="CustomerController" method="post">
        <input type="hidden" name="action" value="deposit">
        <input type="hidden" name="accountNo" value="<%= customer.getAccountNo() %>">
        <label for="amount">Deposit Amount:</label>
        <input type="number" id="amount" name="amount" required>
        <button type="submit">Deposit</button>
    </form>

    <form action="CustomerController" method="post">
        <input type="hidden" name="action" value="withdraw">
        <input type="hidden" name="accountNo" value="<%= customer.getAccountNo() %>">
        <label for="amount">Withdraw Amount:</label>
        <input type="number" id="withdrawAmount" name="amount" required>
        <button type="submit">Withdraw</button>
    </form>

  <%--   <form action="CustomerController" method="post">
        <input type="hidden" name="action" value="transfer">
        <input type="hidden" name="accountNo" value="<%= customer.getAccountNo() %>">
        <label for="transferAmount">Transfer Amount:</label>
        <input type="number" id="transferAmount" name="transferAmount" required>
        <label for="transferAccountNo">Transfer Account No:</label>
        <input type="text" id="transferAccountNo" name="transferAccountNo" required>
        <button type="submit">Transfer</button>
    </form> --%>

    <form action="CustomerController" method="post">
        <input type="hidden" name="action" value="viewTransactions">
        <button type="submit">View Transactions</button>
    </form>

    <form action="CustomerController" method="post">
        <input type="hidden" name="action" value="changePassword">
        <input type="hidden" name="accountNo" value="<%= customer.getAccountNo() %>">
        <label for="currentPassword">Current Password:</label>
        <input type="password" id="currentPassword" name="currentPassword" required>
        <label for="newPassword">New Password:</label>
        <input type="password" id="newPassword" name="newPassword" required>
        <label for="confirmPassword">Confirm New Password:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required><br>
        <button type="submit">Change Password</button>
    </form>

    <form id="logoutForm" action="CustomerController" method="post">
        <input type="hidden" name="action" value="logout">
        <button type="submit">Logout</button>
    </form>
    <h2>Close Account</h2>
    <form action="CloseAccountServlet" method="post">
        Account Number: <input type="text" name="account_no" required><br>
        Password: <input type="password" name="password" required><br>
        <input type="submit" value="Close Account">
    </form>
    <form id="logoutForm" action="CustomerController" method="post">
        <input type="hidden" name="action" value="logout">
        <button type="submit">Logout</button>
</div>

</body>
</html>
