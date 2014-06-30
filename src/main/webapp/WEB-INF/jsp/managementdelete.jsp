<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" /> 	
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script> 


<script type="text/javascript" src="js/ajaxpaging.js"></script>
<script src="resources/js/jquery_checkbox.js" type="text/javascript"></script>
<script>
function validate()
{
alert("Are sure you wants to delete this record");
 var chks = document.getElementsByName('chkUser');
var hasChecked = false;
for (var i = 0; i < chks.length; i++)
{
if (chks[i].checked)
{
hasChecked = true;
break;
}
}
if (hasChecked == false)
{
alert("Please select at least one.");
return false;
}
var result=confirm("Are you sure.You want to delete the User(s)?");
if(result)
	{
return true;
	}
else
	{ 
	return false;
	}
}	
</script>
</head>
<div id="right_content">

	
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
<tr>
<td>
<div>
  <ul class="horizmenu">
						
	<li  style=" float:left;margin-right:-15px;text-transform:uppercase;">
								<a href="documentdelete" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Document
									
								</a>
							</li>
							 <li  style=" float:left;margin-right:-15px;text-transform:uppercase;">
								<a href="formdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Forms
									
								</a>
							</li>
							 <li  style=" float:left;margin-right:-15px;text-transform:uppercase;">
								<a href="maintenancedelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Maintenance
									
								</a>
							</li>
							<li  style=" float:left;text-transform:uppercase;">
								<a href="nonconformancedelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									NonConformance
								</a>
							</li>
							<li  style=" float:left;margin-right:-15px;text-transform:uppercase;">
								<a href="customersdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Customers
								</a>
							</li>
							<li  style=" float:left;margin-right:-15px;text-transform:uppercase;">
								<a href="customersfeedbackdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Feedback
								</a>
							</li>
							<li  style=" float:left;margin-right:-15px;text-transform:uppercase;">
								<a href="employeesdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Employees
								</a>
							</li>
							<li  style=" float:left;margin-right:-15px;text-transform:uppercase;">
								<a href="internalauditsdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Audits
								</a>
							</li>
							<li  style=" float:left;margin-right:-15px;text-transform:uppercase;">
								<a href="correctiveactionsdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Corrective
								</a>
							</li>
							<li  style=" float:left;margin-right:-15px;text-transform:uppercase;">
								<a href="supplierperformancedelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Supplier
								</a>
							</li>
							<li  style=" float:left;margin-right:-15px;text-transform:uppercase;">
								<a href="managementdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									Review
								</a>
							</li>
							
  </div>
</td>
</tr>
<c:if test="${success=='delete'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/removed.png">
						<a title="Close" href="managementdelete">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Delete Management Reviews</h2>
						</div>
						 <div class="contentbox">
						<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
						<form action="search_reviews" name="dashboard" method="GET">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							     <td align="left" valign="middle" width="10%"><b>Review ID:</b></td>
							    
							
							    
							    <td align="left" valign="middle" width="10%">
							    <input type="text" name="review_id" class="input_txtbox" id="id"  value="${reviewid}"> </td>
							    <td align="left" valign="middle" width="30%"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Management Review Date:</b></td>
							    <td align="left" valign="middle" width="10%">
							    
							    <input type="text" name="management_review_date" class="input_txtbx2" id="datepicker" value="${managementreviewdate}"></td>
							    <td align="left" valign="middle" width="15%"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Category</b></td>
							    <td align="left" valign="middle" width="10%">
				                  
							    <select name="category" class="input_cmbbx1">
				                  		<option value="">--Select--</option>
						                      
						                  <option <c:if test="${categoryvalue eq 'audits'}"><c:out value="Selected"/></c:if>  value="audits" >Audits</option>
						                  <option <c:if test="${categoryvalue eq 'corrective and prev actions'}"><c:out value="Selected"/></c:if> value="corrective and prev actions" >Corrective and Prev Actions</option>
										  <option <c:if test="${categoryvalue eq 'cost of non conformance'}"><c:out value="Selected"/></c:if> value="cost of non conformance" >Cost of NonConformance</option>
										  <option  <c:if test="${categoryvalue eq 'customer satisfaction'}"><c:out value="Selected"/></c:if> value="customer satisfaction" >Customer Satisfaction</option>
										  <option <c:if test="${categoryvalue eq 'suppliers'}"><c:out value="Selected"/></c:if>  value="suppliers" >Suppliers</option>
										  <option  <c:if test="${categoryvalue eq 'human resources'}"><c:out value="Selected"/></c:if> value="human resources" >Human Resources</option>
										  <option <c:if test="${categoryvalue eq 'product/service conformity'}"><c:out value="Selected"/></c:if>  value="product/service conformity" >Product/Service Conformity</option>
										  <option <c:if test="${categoryvalue eq 'previous items'}"><c:out value="Selected"/></c:if>  value="previous items" >Previous Items</option>
										  <option <c:if test="${categoryvalue eq 'recommendations for improvement'}"><c:out value="Selected"/></c:if>  value="recommendations for improvement" >Recommendations for Improvement</option>
										  <option <c:if test="${categoryvalue eq 'significant changes to the QMS'}"><c:out value="Selected"/></c:if>  value="significant changes to the QMS" >Significant changes to the QMS</option>	
				                   	</select></td>
							    <td align="center" valign="middle" width="38%">
							  <input type="submit" class="submit_btn1" name="search" id="id_submit" onmouseover="showTooltip('tooltip_id','inp_id3');" /></td>
							   <!--  <td align="center" valign="middle" width="38%">
							  <input type="submit" class="submit_btn1" name="Clear" id="id_submit" onmouseover="showTooltip('tooltip_id','inp_id3');" /></td>
							   -->
							  </tr>
							</table>
						</form>
						</div>
						
			     
					<form action="deletemanagement" name="dashboard" onsubmit="return validate()" method="POST">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
							<td valign="top" align="left" width="5%">Select</td>
							<td valign="top" align="left" width="5%">Review id</td>
									<td valign="top" align="left" width="20%">Management Review Date</td>
									<td valign="top" align="left" width="10%">Category</td>
									<td valign="top" align="left" width="15%">Action Due date</td>
									<td valign="top" align="left" width="15%">Completion date</td>	
							</tr>

								<!-- Display Admin Userd here  Suresh--> 
								<% int i=1; %>
							       	<c:if test="${fn:length(managementreviewform.managementreviewdetails) gt 0}">	
									<c:forEach items="${managementreviewform.managementreviewdetails}" var="managementreviewdetails" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
							       		<td valign="top" align="left" width="10%"><input type="checkbox" name="chkUser" value="${maintenance.review_id}"/></td>
						           	        <td valign="top" align="left" width="10%">${managementreviewdetails.review_id}</td>
									       <td valign="top" align="left" width="10%">${managementreviewdetails.management_review_date}</td>
											<td valign="top" align="left" width="15%">${managementreviewdetails.category}</td>
											<td valign="top" align="left" width="15%">${managementreviewdetails.action_due_date}</td>
											<td valign="top" align="left" width="25%">${managementreviewdetails.completion_date}</td> 
												
											<td valign="top" align="center" width="25%">
											
											
											
											</td>
										</tr>
							    	</c:forEach>
							    	</c:if>
							    	<c:if test="${fn:length(managementreviewform.managementreviewdetails) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Participants Found!!!</b></center></td>
							    		
							    	</tr>
							    	</c:if>	
						    				


								</table>
								<li><input type="submit" value="Delete"></li>
</form>
								<div style="clear: both;"></div>
								</div>
								</div>
								</td>
								</tr>
								<tr>
									<td valign="top" align="left">&nbsp;</td>
								</tr>
		
		<tr>	
<td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
        
			<c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewdeletemanagementreport_page?page=${currentpage - 1}&review_id=${reviewid}&category=${categoryvalue}&management_review_date=${managementreviewdate}" >Prev</a></li> 
               </c:if>
             
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewdeletemanagementreport_page?page=${i}&review_id=${reviewid}&category=${categoryvalue}&management_review_date=${managementreviewdate}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewdeletemanagementreport_page?page=${currentpage+1}&review_id=${reviewid}&category=${categoryvalue}&management_review_date=${managementreviewdate}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewalldeletemanagementreport?&review_id=${reviewid}&category=${categoryvalue}&management_review_date=${managementreviewdate}" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="managementdelete" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>							 
		  </ul>
</div></td>
</tr>
		
		
		
		</table></div>
		<table height="2%"><tr><td></td></tr></table>
								
<script  language="javascript">

$(function () {
	$('input[name="chkUser"]').click(function () {
	if ($('input[name="chkUser"]').length == $('input[name="chkUser"]:checked').length) {
	$('input:checkbox[name="chkAll"]').attr("checked", "checked");
	}
	else {
	$('input:checkbox[name="chkAll"]').removeAttr("checked");
	}
	});
	$('input:checkbox[name="chkAll"]').click(function () {
	var slvals = []
	if ($(this).is(':checked')) {
	$('input[name="chkUser"]').attr("checked", true);
	}
	else {
	$('input[name="chkUser"]').attr("checked", false);
	slvals = null;
	}
	});
	});
</script>

 <script>
 $(function() {
           $( "#datepicker" ).datepicker({dateFormat: 'yy-mm-dd'});
         });
 
</script>   

 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 <jsp:include page="footer.jsp"></jsp:include> 