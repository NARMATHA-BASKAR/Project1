<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Customer"%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Created Successfully</title>
    <style>
        body {
            font-family: 'Lato', sans-serif;
            background: linear-gradient(45deg, #D3CCE3, #E9E4F0);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #333;
        }
        .container {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(4px);
            border: 1px solid rgba(255, 255, 255, 0.18);
            text-align: center;
            max-width: 500px;
            width: 100%;
        }
        h1 {
            color: #8E44AD;
            margin-bottom: 2rem;
        }
        p {
            font-size: 1.1rem;
            margin: 0.5rem 0;
        }
        .info {
            background-color: #F4ECF7;
            border-radius: 10px;
            padding: 1rem;
            margin: 1rem 0;
            font-size: 1.1rem;
            color: #8E44AD;
        }
        .btn {
            display: inline-block;
            padding: 0.8rem 1.5rem;
            background-color: #8E44AD;
            color: white;
            text-decoration: none;
            border-radius: 25px;
            transition: background-color 0.3s ease;
            margin-top: 1rem;
        }
        .btn:hover {
            background-color: #7D3C98;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Customer Created Successfully</h1>
        <% Customer newCustomer = (Customer) request.getAttribute("newCustomer"); %>
        <p>A new customer account has been created with the following details:</p>
        <div class="info">
            <p><strong>Account Number:</strong> <%= newCustomer.getAccountNo() %></p>
            <p><strong>Temporary Password:</strong> <%= newCustomer.getTempPassword() %></p>
        </div>
        <p>Please provide these details to the customer. They will need to change their password upon first login.</p>
        <a href="adminDashboard.jsp" class="btn">Return to Dashboard</a>
    </div>
</body>
</html>
