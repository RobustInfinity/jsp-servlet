<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@page import="com.mayank.item.ItemController" %>
    <%@page import="com.mayank.index.SearchController" %>
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
	<c:if test="${not empty search }">
	<div class="heading col-md-10"><h4>Showing results for "<c:out value="${search}"></c:out>"</h4></div>
	<c:choose> 
	<c:when test="${not empty searchItemList}">
			    <div class="list col-md-12 container-fluid">
                <div class="row">
                <div class="list-group col-md-12 ">
                <div class="row">
                <div class="col-md-12">
                        <button type="button" class="list-group-item list-group-item-action disabled">
                                <div class="title col-md-12 container-fluid">
                                        <div class="row">
                                            <div class="col-md-1">Batch No</div> 
                                            <div class="col-md-3">Item Name</div>
                                            <div class="col-md-2">Item Price</div>
                                            <div class="col-md-1">CGST</div>
                                            <div class="col-md-1">SGST</div>
                                            <div class="col-md-2">Manufacturer</div>
                                            <div class="col-md-1">HSN No.</div>
                                        </div>
                                    </div>
                        </button>
                        </div>
                        <c:forEach var="item" items="${searchItemList}">
                        <c:if test="${item.status == 'Y' }">
                        <div class="col-md-12">
                        <button type="button" class="list-group-item list-group-item-action">
                                <div class="title col-md-12 container-fluid">
                                        <div class="row">
                                            <div class="col-md-1">${item.batchNo }</div>
                                            <div class="col-md-3">${item.itemName}</div>
                                            <div class="col-md-2">${item.itemPrice}</div>
                                            <div class="col-md-1">${item.cgst}</div>
                                            <div class="col-md-1">${item.sgst}</div>
                                            <div class="col-md-2">${item.manufacturer}</div>
                                            <div class="col-md-1">${item.hsnNo}</div>
                                            </div>
                                        </div>
                        </button>
                        			</div>
                        			</c:if>
                        </c:forEach>
                        </div>
                        </div>
                </div>
            </div>
	</c:when>
	<c:when test="${fn:length(searchItemList) == 0}"  >
				<div class="heading col-md-10"><h6><c:out value="${message}"></c:out></h6></div>
	</c:when>
	</c:choose>
	</c:if>
	<c:if test="${not empty itemList}">
	 <div class="item-list col-md-12 container-fluid">
        <div class="row">
                <div class="heading col-md-10"><h2>ITEM LIST</h2></div>
            <div class="add col-md-2">
                <!-- Button trigger modal -->
			  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#itemlist">
			        Add Item
			      </button>
      
      <!-- Modal -->
      <div class="modal fade" id="itemlist" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLongTitle">Add your Item</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
            <form action="item" method="post">
                    <div class="form-group">
                            <label for="exampleInputEmail1">Item Name</label>
                            <input name ="itemName" value="" type="text" class="form-control" id="inputItemName" aria-describedby="emailHelp" placeholder="Item name">
                        </div>
                    <div class="form-group">
                            <label for="exampleInputEmail1">Item Price</label>
                            <input name ="itemPrice" value="" type="text" class="form-control" id="inputItemPrice" aria-describedby="emailHelp" placeholder="Item Price">
                        </div>
                        <div class="container-fluid col-md-12">
                        <div class="row">
                    <div class="form-group col-md-6">
                            <label for="exampleInputEmail1">Tax(CGST)</label>
                            <input name="cgst" value="" type="text" class="form-control" id="inputCgst" aria-describedby="emailHelp" placeholder="CGST">
                    </div>
                    <div class="form-group col-md-6">
                            <label for="exampleInputEmail1">Tax(SGST)</label>
                            <input name="sgst" value="" type="text" class="form-control" id="inputSgst" aria-describedby="emailHelp" placeholder="SGST">
                    </div>
                    </div>
                    </div>
                    <div class="form-group">
                            <label for="exampleInputEmail1">Manufacturer</label>
                            <input name="manufacturer" value="" type="text" class="form-control" id="inputManufacturer" aria-describedby="emailHelp" placeholder="Manufacturer Name">
                    </div>
                    <div class="form-group">
                            <label for="exampleInputEmail1">HSN No.</label>
                            <input name="hsnNo"  value="" type="text" class="form-control" id="inputHsnNo" aria-describedby="emailHelp" placeholder="HSN No.">
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
			        Removed Items
			      </button>
      
      <!-- Modal -->
      <div class="modal fade" id="removeditemlist" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLongTitle">Removed Item Lists</h5>
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
                                            <div class="col-md-1">Batch No</div> 
                                            <div class="col-md-3">Item Name</div>
                                            <div class="col-md-2">Item Price</div>
                                            <div class="col-md-1">CGST</div>
                                            <div class="col-md-1">SGST</div>
                                            <div class="col-md-2">Manufacturer</div>
                                            <div class="col-md-1">HSN No.</div>
                                        </div>
                                    </div>
                        </button>
                        <c:forEach var="item" items="${itemList}">
                        <c:if test="${item.status == 'N' }">
                        <form action="item" method="post">
                        <div class="col-md-12">
                        <button type="button" class="list-group-item list-group-item-action">
                                <div class="title col-md-12 container-fluid">
                                        <div class="row">
                                            <div class="col-md-1">${item.batchNo }</div>
                                            <div class="col-md-3">${item.itemName}</div>
                                            <div class="col-md-2">${item.itemPrice}</div>
                                            <div class="col-md-1">${item.cgst}</div>
                                            <div class="col-md-1">${item.sgst}</div>
                                            <div class="col-md-2">${item.manufacturer}</div>
                                            <div class="col-md-1">${item.hsnNo}</div>
                                            </div>
                                        </div>
                        </button>
                        			<button name="button" value="${item.batchNo}"  type="submit" class="btn btn-success">Add</button>
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
                                            <div class="col-md-1">Batch No</div> 
                                            <div class="col-md-3">Item Name</div>
                                            <div class="col-md-2">Item Price</div>
                                            <div class="col-md-1">CGST</div>
                                            <div class="col-md-1">SGST</div>
                                            <div class="col-md-2">Manufacturer</div>
                                            <div class="col-md-1">HSN No.</div>
                                        </div>
                                    </div>
                        </button>
                        <c:forEach var="item" items="${itemList}">
                        <c:if test="${item.status == 'Y' }">
                        <form action="item" method="post">
                        <div class="col-md-12">
                        <button type="button" class="list-group-item list-group-item-action">
                                <div class="title col-md-12 container-fluid">
                                        <div class="row">
                                            <div class="col-md-1" >${item.batchNo }</div>
                                            <div class="col-md-3" class="itemName">${item.itemName}</div>
                                            <div class="col-md-2" class="itemPrice">${item.itemPrice}</div>
                                            <div class="col-md-1" class="cgst">${item.cgst}</div>
                                            <div class="col-md-1" class="sgst">${item.sgst}</div>
                                            <div class="col-md-2" class="manufacturer">${item.manufacturer}</div>
                                            <div class="col-md-1" class="hsnNo">${item.hsnNo}</div>
                                            </div>
                                        </div>
                        </button>
                        			<button name="button" value="${item.batchNo}"  type="submit" class="btn btn-danger">Remove</button>
                        			</div>
                        			</form>
                        			<form action="item">
                        				<!-- Button trigger modal -->
										  <button name="update" value="update}" type="button"  class="btn btn-warning" data-toggle="modal" data-target="#itemlist">
										       	Update
										      </button>
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