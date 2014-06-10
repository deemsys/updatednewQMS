<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Nonconformance</span>
									
								</a>
							</li>

							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_nonconformance" class="<c:choose>
								<c:when test="${menu=='nonconformance'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View Nonconformance</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="nonconformance_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Nonconformance Report</span>
									
								</a>
							</li>
							</ul>
  </div>
</td>
</tr>
<c:if test="${success=='true'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						
						
							<img alt="Success" src="resources/images/icons/icon_success.png"><span style="color:green;">Successfully Inserted!</span>.
								<a title="Close" href="view_nonconformance" style="color:red;">X</a>
						</p>
					</div></td>
			</tr>
		</c:if>
		<c:if test="${success=='update'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						
						
							<img alt="Success" src="resources/images/icons/icon_success.png"><span style="color:green;">Successfully Updated..!</span>.
								<a title="Close" href="view_nonconformance" style="color:red;">X</a>
						</p>
					</div></td>
			</tr>
		</c:if>
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
							    <td align="left" valign="middle"><input type="text" name="id" class="input_text" id="id" value="${id}"></td>
							    <td align="left" valign="middle">Type of Non Conformance:</td>
							    <td valign="top" align="left" class="input_txt">
				                  									<select name="type_of_nonconformance" id="type_of_nonconformance" class="input_cmbbx1">
				                  										<option value="">--Select--</option>
						                    							<option
						                    							<c:if test="${'Product Quality' eq type}"><c:out value="Selected"/></c:if>
				                  										<c:if test="${nonconformance.type_of_nonconformance eq 'Product Quality'}"><c:out value="Selected"/></c:if>
																		value="Product Quality">Product Quality</option>
																		<option
																		<c:if test="${'Service Quality' eq type}"><c:out value="Selected"/></c:if>
				                  										<c:if test="${nonconformance.type_of_nonconformance eq 'Service Quality'}"><c:out value="Selected"/></c:if>
																		value="Service Quality">Service Quality</option>
																		<option
																		<c:if test="${'Late Delivery' eq type}"><c:out value="Selected"/></c:if>
				                  										<c:if test="${nonconformance.type_of_nonconformance eq 'Late Delivery'}"><c:out value="Selected"/></c:if>
																		value="Late Delivery">Late Delivery</option>
																		<option
																		<c:if test="${'Early Delivery' eq type}"><c:out value="Selected"/></c:if>
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
									<td valign="top" align="left" width="20%">Source of NonConformance</td>
									<td valign="top" align="left" width="10%">External ID</td> 
									<td valign="top" align="left" width="20%">Type of Non Conformance</td>
									<td valign="top" align="left" width="10%">Product Id</td>
									<td valign="top" align="left" width="10%">Quantity Suspect</td>
									<td valign="top" align="left" width="25%">Action</td>
									
									</tr>

								<!-- Display Admin Userd here  Suresh--> 
								<% int i=1; %>
							       	<c:if test="${fn:length(nonConformanceForm.nonconformance) gt 0}">
							       	<c:forEach items="${nonConformanceForm.nonconformance}" var="nonconformance" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
								           	<td valign="top" align="left"  width="10%"><a href="list_nonconformance?id=${nonconformance.id}">${nonconformance.id}</a></td>
								           	
											<td valign="top" align="left" width="15%">${nonconformance.source_of_nonconformance}</td>
											<td valign="top" align="left" width="10%">${nonconformance.external_id}</td> 
											<td valign="top" align="left" width="10%">${nonconformance.type_of_nonconformance}</td>
											<td valign="top" align="left" width="20%">${nonconformance.product_id}</td>
											<td valign="top" align="left" width="25%">${nonconformance.quantity_suspect}</td>
											<td valign="top" align="left" width="15%">
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_nonconformance?id=${nonconformance.id}"/>" style="padding-right:10px;">Edit</a>
										<%-- 	<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_nonconformance?id=${nonconformance.id }"/>" onclick="return confirmation()">Remove</a> --%>
										 </td>
										</tr>
							    	</c:forEach>
						    		</c:if>
						    		

  									<c:if test="${fn:length(nonConformanceForm.nonconformance) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Participants Found!!!</b></center></td>
							    		
							    	</tr>
							    	</c:if>

								
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
	var answer = confirm("Are you Sure You Want to Delete NonConformance Form ?")
	if (answer){
		return true;
	}
	else{
		return false;
	}
}


</script>
						
<jsp:include page="footer.jsp"></jsp:include>


