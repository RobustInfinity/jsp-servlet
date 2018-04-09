<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
     <%@page import="com.mayank.mfg.MfgController" %>
     <%@ taglib prefix="m" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        .list-group{
            padding-left: 30px;
        }
    </style>
</head>
<body>

<m:header></m:header>
	<c:if test="${not empty manufacturerList}">
	 <div class="item-list col-md-12 container-fluid">
        <div class="row">
                <div class="heading col-md-10"><h2>MANUFACTURER LIST</h2></div>
            <div class="add col-md-2">
                <!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#itemlist">
			        Add Manufacturer
			      </button>
      
      <!-- Modal -->
      <div class="modal fade" id="itemlist" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLongTitle">Add company</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
            <form action="manufacturer" method="post">
                    <div class="form-group">
                            <label for="exampleInputEmail1">Company Name</label>
                            <input name ="companyName" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Item name">
                        </div>
                    <div class="form-group">
                            <label for="exampleInputEmail1">Supervisor</label>
                            <input name ="supervisor" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Item Price">
                        </div>
                        <div class="container-fluid col-md-12">
                        <div class="row">
                    <div class="form-group col-md-6">
                            <label for="exampleInputEmail1">Contact No.</label>
                            <input name="contactNo"  type="text"  class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="CGST">
                    </div>
                    <div class="form-group col-md-6">
                            <label for="exampleInputEmail1">Address</label>
                            <input name="address" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="SGST">
                    </div>
                    </div>
                    </div>
                    <div class="form-group">
                            <label for="exampleInputEmail1">GSTIN</label>
                            <input name="gstinNo" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Manufacturer Name">
                    </div>
                    <button name="button" value="save" type="submit" class="btn btn-primary">Save</button>
                    </form>
            </div>
            
          </div>
        </div>
      </div>
            </div> 
            
            
            <div class="add col-md-2">
                <!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#removeditemlist">
			        Removed Companies
			      </button>
      
      <!-- Modal -->
      <div class="modal fade" id="removeditemlist" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLongTitle">Removed Companies</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
            <div class="list col-md-12 container-fluid">
                <div class="row">
                <div class="list-group col-md-12 ">
                        <button type="button" class="list-group-item list-group-item-action disabled">
                                <div class="title col-md-12 container-fluid">
                                        <div class="row">
                                            <div class="col-md-2">Company No</div> 
                                            <div class="col-md-2">Company Name</div>
                                            <div class="col-md-1">Supervisor</div>
                                            <div class="col-md-2">Contact No</div>
                                            <div class="col-md-3">Address</div>
                                            <div class="col-md-2">GSTIN</div>
                                        </div>
                                    </div>
                        </button>
                        <c:forEach var="mfg" items="${manufacturerList}">
                        <c:if test="${mfg.status == 'N' }">
                        <form action="manufacturer" method="post">
                        <div class="col-md-12">
                        <button type="button" class="list-group-item list-group-item-action">
                                <div class="title col-md-12 container-fluid">
                                        <div class="row">
                                            <div class="col-md-2">${mfg.companyNo}</div>
                                            <div class="col-md-2">${mfg.companyName}</div>
                                            <div class="col-md-1">${mfg.supervisor}</div>
                                            <div class="col-md-2">${mfg.contactNo}</div>
                                            <div class="col-md-3">${mfg.address}</div>
                                            <div class="col-md-2">${mfg.gstinNo}</div>
                                            </div>
                                        </div>
                        </button>
                        			<button name="button" value="${mfg.companyNo}"  type="submit" class="btn btn-success">Add</button>
                        			</div>
                        			</form>
                        			</c:if>
                        </c:forEach>
                        </div>
                </div>
            </div>
            </div>
          </div>
        </div>
      </div>
            </div> 
            
            <div class="list col-md-12 container-fluid">
                <div class="row">
                <div class="list-group col-md-12 ">
                        <button type="button" class="list-group-item list-group-item-action disabled">
                                <div class="title col-md-12 container-fluid">
                                        <div class="row">
                                            <div class="col-md-1">Company No</div> 
                                            <div class="col-md-3">Company Name</div>
                                            <div class="col-md-2">Supervisor</div>
                                            <div class="col-md-1">Contact No</div>
                                            <div class="col-md-2">Address</div>
                                            <div class="col-md-2">GSTIN</div>
                                        </div>
                                    </div>
                        </button>
                        <c:forEach var="mfg" items="${ manufacturerList}">
                        <c:if test="${mfg.status == 'Y' }">
                        <form action="manufacturer" method="post">
                        <div class="col-md-12">
                        <button type="button" class="list-group-item list-group-item-action">
                                <div class="title col-md-12 container-fluid">
                                        <div class="row">
                                            <div class="col-md-1">${mfg.companyNo }</div>
                                            <div class="col-md-3">${mfg.companyName}</div>
                                            <div class="col-md-2">${mfg.supervisor}</div>
                                            <div class="col-md-1">${mfg.contactNo}</div>
                                            <div class="col-md-2">${mfg.address}</div>
                                            <div class="col-md-2">${mfg.gstinNo}</div>
                                            </div>
                                        </div>
                        </button>
                        			<button name="button" value="${mfg.companyNo}"  type="submit" class="btn btn-danger">Remove</button>
                        			</div>
                        			</form>
                        			</c:if>
                        </c:forEach>
                        </div>
                </div>
            </div>
        </div>
    </div>
    </c:if>
			
</body>

<m:script></m:script>
</html>