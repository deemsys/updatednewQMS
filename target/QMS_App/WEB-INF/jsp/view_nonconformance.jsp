<%-- <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<div id="right_content">
	
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
<tr>
<td>
 <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_nonconformance" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Nonconformance</span>
									
								</a>
							</li>

							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_nonconformance" class="<c:choose>
								<c:when test="${menu=='nonconformance'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Nonconformance</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="nonconformance_report" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Nonconformance Report</span>
									
								</a>
							</li>
					
  </div>
</td>
</tr>
			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Non Conformance</h2>
						</div>
						
						<div class="contentbox">
							<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<form action="findnonconformance" method="get">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="10%"> NC ID:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="nc_id" class="input_txtbx1" id="nc_id"></td>
							    <td align="left" valign="middle" width="20%">&nbsp;&nbsp;&nbsp;&nbsp;Type of Non Conformance:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="type_of_non_conformance" id="type_of_non_conformance" class="input_txtbx1"></td>
							    <td align="left" valign="middle" width="8%">&nbsp;&nbsp;Product Id:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="product_id" id="product_id" class="input_txtbx1"></td>
							    <td align="center" valign="middle" width="38%"><input type="submit" class="submit_btn" value="Find"></td>
							  </tr>
							</table>
							</form>
						</div>
				<form action="?do=viewparticipants" name="dashboard" method="POST">			
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="title">
									<td valign="top" align="left" width="5%">Id</td>
									<td valign="top" align="left" width="20%">Source of NonConformance</td>
									<td valign="top" align="left" width="10%">External ID</td>
									<td valign="top" align="left" width="20%">Type of Non Conformance</td>
									<td valign="top" align="left" width="10%">Product Id</td>
									<td valign="top" align="left" width="10%">Quantity Suspect</td>
									<td valign="top" align="left" width="25%">Action</td>
									
									</tr>

								<!-- Display Admin Userd here  Suresh--> 
								<% int i=1; %>
							       		
									<c:forEach items="${nonConformanceForm.nonconformance}" var="nonconformance" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
								           	<td valign="top" align="left"  width="10%">${nonconformance.id}</td>
											<td valign="top" align="left" width="15%">${nonconformance.source_of_nonconformance}</td>
											<td valign="top" align="left" width="10%">${nonconformance.external_id}</td>
											<td valign="top" align="left" width="10%">${nonconformance.type_of_nonconformance}</td>
											<td valign="top" align="left" width="10%">${nonconformance.product_id}</td>
											<td valign="top" align="left" width="15%">${nonconformance.quantity_suspect}</td>
											<td valign="top" align="left" width="15%">
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_nonconformance?id=${nonconformance.id}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_nonconformance?id=${nonconformance.id }"/>" onclick="return confirmation()">Remove</a>
											
											<a href="edit_nonconformance?id=<c:out value="${nonconformance.id}"/>">Edit</a>
											<a href="delete_nonconformance?id=<c:out value="${nonconformance.id}"/>">Delete</a>
											
											</td>
										</tr>
							    	</c:forEach>
						    	

								<tr><td colspan="7">  <div class="extrabottom">
              						<ul class="pagination">
                						<li class="text"><input type="submit" name="view" value="View All" class="submit_btn"></li>
                						<li class="text"></li>
                					</ul></div></td></tr>

								</table>

								<div style="clear: both;"></div>
								</div>
								</div>
								</td>
								</tr>
								<tr>
									<td valign="top" align="left">&nbsp;</td>
								</tr>
								
							</table>
							</form>
						</div>
<jsp:include page="footer.jsp"></jsp:include> --%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css"/ type="text/css">

 
<div id="right_content">
	
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
<tr>
<td>
 <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_nonconformance" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Nonconformance</span>
									
								</a>
							</li>

							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_nonconformance" class="<c:choose>
								<c:when test="${menu=='nonconformance'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Nonconformance</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="nonconformance_report" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Nonconformance Report</span>
									
								</a>
							</li>
							</ul>
  </div>
</td>
</tr>
			<tr>
				<td valign="top" align="left">
						<div class="headings altheading">
							<h2>Non Conformance</h2>
						</div>
						
						<div class="contentbox">
							<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<form action="findnonconformance" method="get">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="10%"> NC ID: </td>
							    <td align="left" valign="middle"><input type="text" name="id" class="input_text" id="id"></td>
							    <td align="left" valign="middle">Type of Non Conformance:</td>
							    <td valign="top" align="left" class="input_txt">
				                  									<select name="type_of_nonconformance" id="type_of_nonconformance" class="input_cmbbx1">
				                  										<option value="">--Select--</option>
						                    							<option
				                  										<c:if test="${nonconformance.type_of_nonconformance eq 'Product Quality'}"><c:out value="Selected"/></c:if>
																		value="Product Quality">Product Quality</option>
																		<option
				                  										<c:if test="${nonconformance.type_of_nonconformance eq 'Service Quality'}"><c:out value="Selected"/></c:if>
																		value="Service Quality">Service Quality</option>
																		<option
				                  										<c:if test="${nonconformance.type_of_nonconformance eq 'Late Delivery'}"><c:out value="Selected"/></c:if>
																		value="Late Delivery">Late Delivery</option>
																		<option
				                  										<c:if test="${nonconformance.type_of_nonconformance eq 'Early Delivery'}"><c:out value="Selected"/></c:if>
																		value="Early Delivery">Early Delivery</option>
															
																	</select></td>
							   
							 <!--    <td align="left" valign="middle"><input type="text" name="type_of_nonconformance" id="type_of_nonconformance" class="input_text"></td>
							  --><!--    <td align="left" valign="middle">Product Id:</td>
							    <td align="left" valign="middle"><input type="text" name="product_id" id="product_id" class="input_text"></td>
							   -->
							    <td align="center" valign="middle"><input type="submit" class="submit_btn1" value="Find" name="findnonconformance"></td>
							    <td align="center" valign="middle"><input type="reset" class="submit_btn1" value="Clear"></td>
							  </tr>
							</table>
							</form>
						</div>
				<form action="view_nonconformance" name="dashboard" method="POST">			
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="title">
									<td valign="top" align="left" width="5%">Id</td>
									<!-- <td valign="top" align="left" width="20%">Source of NonConformance</td>
									<td valign="top" align="left" width="10%">External ID</td> -->
									<td valign="top" align="left" width="20%">Type of Non Conformance</td>
									<td valign="top" align="left" width="10%">Product Id</td>
									<td valign="top" align="left" width="10%">Quantity Suspect</td>
									<td valign="top" align="left" width="25%">Action</td>
									
									</tr>

								<!-- Display Admin Userd here  Suresh--> 
								<% int i=1; %>
							       		
									<c:forEach items="${nonConformanceForm.nonconformance}" var="nonconformance" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
								           	<td valign="top" align="left"  width="10%"><a href="list_nonconformance?id=${nonconformance.id}">${nonconformance.id}</a></td>
								           	<%-- 
											<td valign="top" align="left" width="15%">${nonconformance.source_of_nonconformance}</td>
											<td valign="top" align="left" width="10%">${nonconformance.external_id}</td> --%>
											<td valign="top" align="left" width="10%">${nonconformance.type_of_nonconformance}</td>
											<td valign="top" align="left" width="10%">${nonconformance.product_id}</td>
											<td valign="top" align="left" width="15%">${nonconformance.quantity_suspect}</td>
											<td valign="top" align="left" width="15%">
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_nonconformance?id=${nonconformance.id}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_nonconformance?id=${nonconformance.id }"/>" onclick="return confirmation()">Remove</a>
										</td>
										</tr>
							    	</c:forEach>
						    	

								
               <td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
        
             <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewnonconformancereport_page?page=${currentpage - 1}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}"> --%> 
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewnonconformancereport_page?page=${i}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewnonconformancereport_page?page=${currentpage+1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallnonconformancereport" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="view_nonconformance" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>					
		 
		  </ul>
		  </div>
		  </td>
		  </tr>
</table>
</form>
</div>

</td>
</tr>
</table>
</div>


<script>
function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete Supplier Performance Form ?")
	if (answer){
		return true;
	}
	else{
		return false;
	}
}


</script>
						
<jsp:include page="footer.jsp"></jsp:include>


