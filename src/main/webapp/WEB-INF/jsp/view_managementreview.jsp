<%-- <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />

<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css"
	type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table" >
	<tr>
		<td>
			<div>
				<ul class="horizmenu">
<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addmanagementreview" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Management Review</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewmanagementreview" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Management Review</span>
									
								</a>
							</li>
						
				         <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="managementreview_report" class="<c:choose>
								<c:when test="${menu=='review'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Reports</span>
									
								</a>
							</li>
							</ul>
			</div></td>
	</tr>
	<tr>
		<c:if test="${success==true}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 0;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
							<a title="Close" href="maintenance_list">x</a>
						</p>
						<p>
							<img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.
						</p>
					</div>
			</tr>
		</c:if>
	</tr>
<tr><td>
<table cellpadding="0" cellspacing="0" border="0" width="98%"
	class="margin_table">
	<tr>
		<td valign="top" align="left">
				<div class="headings altheading">
							<h2>Management Review</h2>
						</div>
							<div class="contentbox">
						<form action="search_review" name="dashboard" method="GET">
					<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="10%"><b>Review ID:</b></td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="review_id" class="input_txtbx1" id="id"></td>
							    <td align="left" valign="middle" width="30%"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Management Review Date:</b></td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="management_review_date" class="input_txtbx1" id="datepicker"></td>
							    <td align="left" valign="middle" width="15%"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Category</b></td>
							    <td align="left" valign="middle" width="10%">
				                  
							    <select name="category" class="input_cmbbx1">
				                  		<option value="">--Select--</option>
						                      
						                  <option  value="audits" >audits</option>
						                  <option  value="corrective and prev actions" >corrective and prev actions</option>
										  <option value="cost of non conformance" >cost of nonconformance</option>
										  <option  value="customer satisfaction" >customer satisfaction</option>
										  <option  value="suppliers" >suppliers</option>
										  <option  value="human resources" >human resources</option>
										  <option  value="product/service conformity" >product/service conformity</option>
										  <option  value="previous items" >previous items</option>
										  <option  value="recommendations for improvement" >recommendations for improvement</option>
										  <option  value="significant changes to the QMS" >significant changes to the QMS</option>	
				                   	</select></td>
							    <td align="center" valign="middle" width="38%">
							  <input type="submit" class="submit_btn" name="search" id="id_submit" onmouseover="showTooltip('tooltip_id','inp_id3');" /></td>
							  </tr>
							</table>
						</div>
</form>
						
						<form action="?do=viewmanagementreview" name="dashboard" method="POST">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="title">
							
									<td valign="top" align="left" width="5%">Review id</td>
									<td valign="top" align="left" width="20%">Management Review Date</td>
									<td valign="top" align="left" width="10%">Category</td>
									<td valign="top" align="left" width="15%">Completion date</td>
									<!-- <td valign="top" align="left" width="15%">Continuous Improvement project</td>				
									 --><td valign="top" align="left" width="15%">Actions</td>						
									</tr>

					
								<% int i=1; %>
							      	<c:forEach items="${managementreviewform.managementreviewdetails}" var="managementreviewdetails" varStatus="status">
							       		
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>">
								           	
								           	<td valign="top" align="left"  width="10%"><a href="<c:out value="view_review?review_id=${managementreviewdetails.review_id}"/>">${managementreviewdetails.review_id}</a></td>
											
											<td valign="top" align="left" width="10%">${managementreviewdetails.management_review_date}</td>
											<td valign="top" align="left" width="15%">${managementreviewdetails.category}</td>
											<td valign="top" align="left" width="15%">${managementreviewdetails.completion_date}</td>
											<td valign="top" align="left" width="15%">${managementreviewdetails.continuous_improvement_project}</td>
											
											<td valign="top" align="left" width="15%">
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_managementreview?review_id=${managementreviewdetails.review_id}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title="" ><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_managementreview?review_id=${managementreviewdetails.review_id}"/>" onclick="return confirmation()">Remove</a>
											</td>	
											
										</tr>
							    </c:forEach>	
							    
	 <td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
        
           <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewmanagementreviewreport_page?page=${currentpage - 1}" >Prev</a></li> 
               </c:if>
              
             <c:forEach var="count" begin="1" end="${noofrows}"> 
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewmanagementreviewreport_page?page=${i}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewmanagementreviewreport_page?page=${currentpage+1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallmanagementreviewreport" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="viewmanagementreview" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>					
				</ul>
				</div>
				</td>
				</table>
				</form>
				</div>
				</td>
				</tr>
				</table>
				</td>
				</tr>
				</table>
				
<script>
function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete Management Reviews Form ?")
	if (answer){
		return true;
	}
	else{
		return false;
	}
}
</script>
 <script>
 $(function() {
	 $( "#datepicker" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
<jsp:include page="footer.jsp"></jsp:include> --%>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />

<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css"
	type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table" >
	<tr>
		<td>
			<div>
				<ul class="horizmenu">
<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addmanagementreview" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Management Review</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewmanagementreview" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Management Review</span>
									
								</a>
							</li>
						
				         <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="managementreview_report" class="<c:choose>
								<c:when test="${menu=='review'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Reports</span>
									
								</a>
							</li>
							</ul>
			</div></td>
	</tr>
	<tr>
		<c:if test="${success==true}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 0;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
							<a title="Close" href="maintenance_list">x</a>
						</p>
						<p>
							<img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.
						</p>
					</div>
			</tr>
		</c:if>
	</tr>
<tr><td>
<table cellpadding="0" cellspacing="0" border="0" width="98%"
	class="margin_table">
	<tr>
		<td valign="top" align="left">
				<div class="headings altheading">
							<h2>Management Review</h2>
						</div>
							<div class="contentbox">
						<form action="search_review" name="dashboard" method="GET">
					<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="10%"><b>Review ID:</b></td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="review_id" class="input_txtbox" id="id"></td>
							    <td align="left" valign="middle" width="30%"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Management Review Date:</b></td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="management_review_date" class="input_txtbx2" id="datepicker"></td>
							    <td align="left" valign="middle" width="15%"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Category</b></td>
							    <td align="left" valign="middle" width="10%">
				                  
							    <select name="category" class="input_cmbbx1">
				                  		<option value="">--Select--</option>
						                      
						                  <option  value="audits" >audits</option>
						                  <option  value="corrective and prev actions" >corrective and prev actions</option>
										  <option value="cost of non conformance" >cost of nonconformance</option>
										  <option  value="customer satisfaction" >customer satisfaction</option>
										  <option  value="suppliers" >suppliers</option>
										  <option  value="human resources" >human resources</option>
										  <option  value="product/service conformity" >product/service conformity</option>
										  <option  value="previous items" >previous items</option>
										  <option  value="recommendations for improvement" >recommendations for improvement</option>
										  <option  value="significant changes to the QMS" >significant changes to the QMS</option>	
				                   	</select></td>
							    <td align="center" valign="middle" width="38%">
							  <input type="submit" class="submit_btn1" name="search" id="id_submit" onmouseover="showTooltip('tooltip_id','inp_id3');" /></td>
							   <!--  <td align="center" valign="middle" width="38%">
							  <input type="submit" class="submit_btn1" name="Clear" id="id_submit" onmouseover="showTooltip('tooltip_id','inp_id3');" /></td>
							   -->
							  </tr>
							</table>
						</div>
</form>
						
						<form action="?do=viewmanagementreview" name="dashboard" method="POST">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="title">
							
									<td valign="top" align="left" width="5%">Review id</td>
									<td valign="top" align="left" width="20%">Management Review Date</td>
									<td valign="top" align="left" width="10%">Category</td>
									<td valign="top" align="left" width="15%">Completion date</td><!-- 
									<td valign="top" align="left" width="15%">Continuous Improvement project</td> -->				
									<td valign="top" align="left" width="15%">Actions</td>						
									</tr>

					
								<% int i=1; %>
							      	<c:forEach items="${managementreviewform.managementreviewdetails}" var="managementreviewdetails" varStatus="status">
							       		
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>">
								           	
								           	<td valign="top" align="left"  width="10%"><a href="<c:out value="view_review?review_id=${managementreviewdetails.review_id}"/>">${managementreviewdetails.review_id}</a></td>
											
											<td valign="top" align="left" width="10%">${managementreviewdetails.management_review_date}</td>
											<td valign="top" align="left" width="15%">${managementreviewdetails.category}</td>
											<td valign="top" align="left" width="15%">${managementreviewdetails.completion_date}</td><%-- 
											<td valign="top" align="left" width="15%">${managementreviewdetails.continuous_improvement_project}</td> --%>
											
											<td valign="top" align="left" width="15%">
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_managementreview?review_id=${managementreviewdetails.review_id}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title="" ><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_managementreview?review_id=${managementreviewdetails.review_id}"/>" >Remove</a>
											</td>	
											
										</tr>
							    </c:forEach>			
						    		
								</table>
								
</form>
								<div style="clear: both;"></div>
								</div>
							
								</td>
								</tr>
								<tr>
									<td valign="top" align="left">&nbsp;</td>
								</tr>
							
							</table>
							
							
						
						</td>
						</tr>
						<tr>
<td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
        
             <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewmanagementreport_page?page=${currentpage - 1}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}"> --%> 
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewmanagementreport_page?page=${i}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewmanagementreport_page?page=${currentpage+1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallmanagementreport" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="viewmanagementreview" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>					
		 
		  </ul>
		  </div>
		  </td>
		  </tr>
		 

						</table>
						<script>

					/*function confirmation(val) {
							var answer = confirm("Are you Sure You Want to Internal Audits ?")
							if (answer){
								window.location = "?do=deleteparticipant&id="+val;
							}
							else{
								
							}
						}*/
						


</script>
 <script>
 $(function() {
	 $( "#datepicker" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
<jsp:include page="footer.jsp"></jsp:include>