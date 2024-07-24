<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.CustomerDao"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Customer"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background: linear-gradient(120deg, #D3CCE3 0%, #E9E4F0 100%);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 2rem auto;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        }
        h1 {
            color: #4A235A;
            text-align: center;
            margin-bottom: 2rem;
            font-weight: 300;
            letter-spacing: 2px;
        }
        .action-buttons {
            display: flex;
            justify-content: space-around;
            margin-bottom: 2rem;
        }
        .btn {
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 25px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            text-align: center;
            display: inline-block;
        }
        .btn-primary { background-color: #8E44AD; }
        .btn-primary:hover { background-color: #7D3C98; }
        .btn-danger { background-color: #27AE60; }
        .btn-danger:hover { background-color: #229954; }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 2rem;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #8E44AD;
            color: white;
        }
        tr { background-color: #F4ECF7; }
        tr:hover { background-color: #E8DAEF; }
        .btn-table {
            padding: 0.4rem 1rem;
            font-size: 0.9rem;
            border-radius: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Dashboard</h1>
        
        <div class="action-buttons">
            <a href="createCustomer.jsp" class="btn btn-primary">Create Customer</a>
            <a href="deleteCustomer.jsp" class="btn btn-primary">Delete Customer</a>
            <form action="LogoutController" method="post" style="display:inline;">
                <button type="submit" class="btn btn-danger">Logout</button>
            </form>
        </div>

        <table>
            <thead>
                <tr>
                    <th>Account No</th>
                    <th>Full Name</th>
                    <th>Email ID</th>
                    <th>Account Type</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                CustomerDao customerDao = new CustomerDao();
                List<Customer> customers = customerDao.getAllCustomers();
                for (Customer customer : customers) {
                %>
                <tr>
                    <td><%= customer.getAccountNo() %></td>
                    <td><%= customer.getFullName() %></td>
                    <td><%= customer.getEmailId() %></td>
                    <td><%= customer.getAccountType() %></td>
                    <td>
                        <form action="AdminController" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="accountNo" value="<%= customer.getAccountNo() %>">
                            <button type="submit" class="btn btn-primary btn-table">Edit</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
