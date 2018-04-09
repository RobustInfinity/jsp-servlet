
<%@ tag language="java" pageEncoding="UTF-8"%>

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
                            <input name ="itemName" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Item name">
                        </div>
                    <div class="form-group">
                            <label for="exampleInputEmail1">Item Price</label>
                            <input name ="itemPrice" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Item Price">
                        </div>
                        <div class="container-fluid col-md-12">
                        <div class="row">
                    <div class="form-group col-md-6">
                            <label for="exampleInputEmail1">Tax(CGST)</label>
                            <input name="cgst" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="CGST">
                    </div>
                    <div class="form-group col-md-6">
                            <label for="exampleInputEmail1">Tax(SGST)</label>
                            <input name="sgst" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="SGST">
                    </div>
                    </div>
                    </div>
                    <div class="form-group">
                            <label for="exampleInputEmail1">Manufacturer</label>
                            <input name="manufacturer" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Manufacturer Name">
                    </div>
                    <div class="form-group">
                            <label for="exampleInputEmail1">HSN No.</label>
                            <input name="hsnNo" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="HSN No.">
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
                        			<button name="button" value="${item.batchNo}"  type="submit" class="btn btn-danger">Remove</button>
                        			</div>
                        			</form>
                        			</c:if>
                        </c:forEach>
                        </div>
                </div>
            </div>
        </div>
    </div>