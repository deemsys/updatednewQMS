<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<head>
<script  language="javascript">

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
						
	
							<li  style=" float:left;margin-right:-5px;text-transform:uppercase;">
								<a href="documentdelete" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Document
									
								</a>
							</li>
							 <li  style=" float:left;margin-right:-5px;text-transform:uppercase;">
								<a href="formdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Forms
									
								</a>
							</li>
							 <li  style=" float:left;margin-right:-5px;text-transform:uppercase;">
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
							<li  style=" float:left;margin-right:-5px;text-transform:uppercase;">
								<a href="customersdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Customers
								</a>
							</li>
							<li  style=" float:left;margin-right:-5px;text-transform:uppercase;">
								<a href="employeesdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Employees
								</a>
							</li>
							<li  style=" float:left;margin-right:-5px;text-transform:uppercase;">
								<a href="internalauditsdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Audits
								</a>
							</li>
							<li  style=" float:left;margin-right:-5px;text-transform:uppercase;">
								<a href="correctiveactionsdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Corrective
								</a>
							</li>
							<li  style=" float:left;margin-right:-5px;text-transform:uppercase;">
								<a href="supplierperformancedelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Supplier
								</a>
							</li>
							<li  style=" float:left;margin-right:-5px;text-transform:uppercase;">
								<a href="managementdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									Review
								</a>
							</li>
							
  </div>
</td>
</tr>
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
		<td colspan="6">  
	        <ul class="pagination">
        
          
                  <li class="page"><a href="viewmanagementreview" class="paging_select">Back</a></li>
                  
           <%--    </c:otherwise>
              </c:choose>			 --%>		
		 
		</ul></div></td></table></div>
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

</script> 
 <script>
 $(function() {
           $( "#datepicker" ).datepicker({dateFormat: 'yy-mm-dd'});
         });
 
</script>   

 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 <jsp:include page="footer.jsp"></jsp:include> 