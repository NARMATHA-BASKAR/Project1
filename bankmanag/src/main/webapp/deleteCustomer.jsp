<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Customer</title>
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
            margin-bottom: 30px;
        }
        form {
            max-width: 400px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #5A3E8C;
        }
        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #5A3E8C;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #4A3271;
        }
    </style>
</head>
<body>
    <h1>Delete Customer</h1>
    <form action="AdminController" method="post">
        <input type="hidden" name="action" value="delete">
        <label for="accountNo">Account No:</label>
        <input type="text" id="accountNo" name="accountNo" required>
        <button type="submit">Delete Customer</button>
    </form>
</body>
</html>
