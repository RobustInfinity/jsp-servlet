<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <%@page import="com.mayank.item.ItemController" %>
    <%@page import="com.mayank.mfg.MfgController" %>
    <%@taglib prefix="m" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>

 <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-warning">
            <a class="navbar-brand" href="#">Navbar</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
          
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto" id="myTab">
                
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Master
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/Software/item">Item</a>
                    <a class="dropdown-item" href="/Software/manufacturer"> Manufacturer</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#tax">Tax</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#reference">Reference</a>
                  </div>
                  
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Ledger</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">Purchase</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">Stock</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">Estimate</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Sales
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                      <a class="dropdown-item" href="#">Sale Invoice</a>
                      <a class="dropdown-item" href="#"> Challan Invoice</a>
                      <a class="dropdown-item" href="#">Bill to Supply</a>
                    </div>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Voucher
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                      <a class="dropdown-item" href="#">Receipt</a>
                      <a class="dropdown-item" href="#"> Payment</a>
                      <a class="dropdown-item" href="#">Bank</a>
                    </div>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Return
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                      <a class="dropdown-item" href="#">Sale Return</a>
                      <a class="dropdown-item" href="#"> Purchase Return</a>
                    </div>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Report
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                      <a class="dropdown-item" href="#">Sale Report</a>
                      <a class="dropdown-item" href="#"> Bill to Supply Report</a>
                      <a class="dropdown-item" href="#"> Challan Report</a>
                      <a class="dropdown-item" href="#"> Daily Sale Report</a>
                      <a class="dropdown-item" href="#"> Estimate Report</a>
                      <a class="dropdown-item" href="#"> Purchase Return Report</a>
                      <a class="dropdown-item" href="#"> Sale Return Report</a>
                      <a class="dropdown-item" href="#"> Ledger Report</a>
                      <a class="dropdown-item" href="#"> Product Report</a>
                      <a class="dropdown-item" href="#"> Profit</a>
                      <a class="dropdown-item" href="#"> Summary</a>
                      <a class="dropdown-item" href="#"> Dr/Cr Report</a>
                    </div>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">Settings</a>
                  </li>
              </ul>
              
              <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
              </form>
            </div>
          </nav>
    </header>
   
</body>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</html>