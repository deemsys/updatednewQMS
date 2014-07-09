<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>
<head>
<script  language="javascript">
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
						
	
				<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="documentdelete" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Document
									
								</a>
							</li>
							 <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="formdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Forms
									
								</a>
							</li>
							 <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="maintenancedelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Maintenance
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="nonconformancedelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									NonConformance
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="customersdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Customers
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="customersfeedbackdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Customers Feedback
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="employeesdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Employees
								</a>
							</li>
							</ul>
							<ul class="horizmenu" style="margin-bottom:5px;">
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="internalauditsdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Internal Audits
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="correctiveactionsdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Corrective & Preventive Actions
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="supplierperformancedelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									Supplier Performance
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="managementdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Management Review
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="hrdelete" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									HR & Training
								</a>
							</li>
							</ul>
													
  </div>
</td>
</tr>
<c:if test="${success=='delete'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 200px;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/removed.png">
						<a title="Close" href="supplierperformancedelete">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Delete SupplierPerformance Records</h2>
						</div>
						 <div class="contentbox">
						<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<form action="findsupplierperformances" method="GET">
							
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="10%">Supplier Name:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="supplier_name" class="input_txtbox" id="suppliername" value="${suppliername}"></td>
							    <td align="left" valign="middle" width="15%">&nbsp;&nbsp;Phone:</td>
								<td align="left" valign="middle" width="10%"><input type="text" name="phone" id="phone" class="input_txtbox" value="${phone}"></td>							    
							    <td align="left" valign="middle" width="8%">&nbsp;&nbsp;Email:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="email_address" id="email" class="input_txtbox" value="${email}"></td>
							    <td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn1" value="Search" name="findsupplierperformances" ></td>
							  	<td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn1" value="Clear" name="welcome" ></td>
							  
							  </tr>
							  
							</table>
							</form>
						</div>
			     
					<form action="deletesupplier" name="dashboard" onsubmit="return validate()" method="POST">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="title">
								<td valign="top" align="left" width="10%">Select</td>
								<td valign="top" align="left" width="10%">&nbsp;ID</td>
					         	<td valign="top" align="left" width="10%">Supplier Name</td>
					         	 <td valign="top" align="left" width="15%">Address</td>
          						<td valign="top" align="left" width="5%">City</td>
          						<td valign="top" align="left" width="10%">State</td>
          						<td valign="top" align="left" width="5%">Country</td>
          						<td valign="top" align="left" >Phone</td>
          						<td valign="top" align="left" >e_mail address</td>
          				</tr>

								<!-- Display Admin Userd here  Suresh--> 
								<% int i=1; %>
							       	<c:if test="${fn:length(supplierPerformanceForm.supplierperformance) gt 0}">	
									<c:forEach items="${supplierPerformanceForm.supplierperformance}" var="supplierperformance" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
							       		<td valign="top" align="left" width="10%"><input type="checkbox" name="chkUser" value="${supplierperformance.supplier_id}"/></td>
				  	 			           	<td valign="top" align="left"  width="10%">${supplierperformance.supplier_id}</td> 
									       <td valign="top" align="left" width="15%">${supplierperformance.supplier_name}</td>
									       <td valign="top" align="left" width="15%">${supplierperformance.address}</td>
									       <td valign="top" align="left" width="15%">${supplierperformance.city}</td>
									       <td valign="top" align="left" width="15%">${supplierperformance.state}</td>
									       <td valign="top" align="left" width="15%">${supplierperformance.country}</td>
											<td valign="top" align="left" width="15%">${supplierperformance.phone}</td>
											<td valign="top" align="left" width="15%">${supplierperformance.email_address}</td>
											
											<td valign="top" align="center" width="15%">
											
											
											
											<td valign="top" align="left" width="15%">
											
											
											</td>
										</tr>
							    	</c:forEach>
							    	</c:if>
							    	<c:if test="${fn:length(supplierPerformanceForm.supplierperformance) == 0}">
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
             <li class="page_unselect"><a href="viewdeletesupplierreport_page?page=${currentpage - 1}&supplier_name=${suppliername}&phone=${phone}&email_address=${email}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}"> --%> 
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewdeletesupplierreport_page?page=${i}&supplier_name=${suppliername}&phone=${phone}&email_address=${email}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewdeletesupplierreport_page?page=${currentpage+1}&supplier_name=${suppliername}&phone=${phone}&email_address=${email}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewalldeletesupplierreport?&supplier_name=${suppliername}&phone=${phone}&email_address=${email}" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="supplierperformancedelete" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>					
		 
		  </ul>
		  </div>
		  </td>
				
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
 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 <jsp:include page="footer.jsp"></jsp:include> 