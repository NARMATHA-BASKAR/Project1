<%@ page import="java.util.List" %>
<%@ page import="model.Transaction" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>View Transactions</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background-color: #E9E4F0;
        }
        h1 {
            color: #5A3E8C;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #D4C2E8;
            color: #5A3E8C;
        }
        td {
            background-color: #F7F3FA;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #5A3E8C;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #4A3271;
        }
    </style>
</head>
<body>

<%
    List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");

    if (transactions == null || transactions.isEmpty()) {
%>
    <h1>No transactions found.</h1>
<%
    } else {
%>
    <h1>Transaction History</h1>
    <table>
        <tr>
            <th>Transaction ID</th>
            <th>Account No</th>
            <th>Amount</th>
            <th>Transaction Type</th>
            <th>Transaction Date</th>
        </tr>
<%
        for (Transaction transaction : transactions) {
%>
        <tr>
            <td><%= transaction.getTransactionId() %></td>
            <td><%= transaction.getAccountNo() %></td>
            <td><%= transaction.getAmount() %></td>
            <td><%= transaction.getTransactionType() %></td>
            <td><%= transaction.getTransactionDate() %></td>
        </tr>
<%
        }
%>
    </table>
<%
    }
%>

<p><a href="customerDashboard.jsp">Back to Dashboard</a></p>

</body>
</html>
