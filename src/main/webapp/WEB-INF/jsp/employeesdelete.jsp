<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					
							<li  style=" float:left;margin-right:-5px;text-transform:uppercase;">
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
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
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
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Review
								</a>
							</li>
							
							
							
  </div>
</td>
</tr>
			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Delete Employees</h2>
						</div>
						 <div class="contentbox">
						 <div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<form action="findemployees" method="get">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="10%"> Type&nbsp;</td>
							    <!-- <td align="left" valign="middle" width="5%"><input type="text" name="type_of_training" class="input_txtbx2" id="type"></td>
							     -->
							     <td valign="top" align="left" class="input_txt"><select	name="type_of_training" class="input_cmbbx1">
                 	<option value="">--Select--</option>
				                  									
                  										<option
															<c:if test="${Employee.type_of_training eq 'Classroom'}"><c:out value="Selected"/></c:if>
															value="Classroom">Classroom</option>
														<option
															<c:if test="${Employee.type_of_training eq 'Hands on'}"><c:out value="Selected"/></c:if>
															value="Hands on">Hands on</option>
														</select></td>
                
							     <td align="right" valign="middle" width="12%">QualifiedBy&nbsp; </td>
							    <td valign="top" align="left" class="input_txt"><select	name="qualified_by" class="input_cmbbx1">
                  											<option value="">--Select--</option>
				                  									
                  										<option
															<c:if test="${Employee.qualified_by eq 'Education'}"><c:out value="Selected"/></c:if>
															value="Education">Education</option>
														<option
															<c:if test="${Employee.qualified_by eq 'Experience'}"><c:out value="Selected"/></c:if>
															value="Experience">Experience</option>
														<option
															<c:if test="${Employee.qualified_by eq 'Training'}"><c:out value="Selected"/></c:if>
															value="Training">Training</option>
														
															</select><span class="err"><form:errors path="Employee.qualified_by"></form:errors></span></td>
                <!-- 
							    <td align="left" valign="middle" width="10%"><input type="text" name="qualified_by" id="qualifiedby" class="input_txtbx2"></td>
				 -->				<td align="right" valign="middle" width="12%"> Trainer&nbsp;</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="trainer" class="input_txtbx2" id="trainer"></td>
							  
	<!-- 						    <td align="center" valign="middle"><input type="submit" class="submit_btn" value="Find"></td>
	 -->						  
							    <td align="center" valign="middle" width="38%"><input type="submit" class="submit_btn1" value="Find"></td>
							     <td align="center" valign="middle"><input type="reset" class="submit_btn1" value="Clear"></td>
							  </tr>
							  </table>
							  </form>
							  </div>
				
					<form action="deleteemployees" name="dashboard" onsubmit="return validate()" method="POST">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="title">
								<td valign="top" align="left" width="10%">Select</td>
								<td valign="top" align="left" width="20%">Employee&nbsp;ID</td>
					         	<td valign="top" align="left" width="25%">Name</td>
					         	<td valign="top" align="left" width="20%">Type</td>
								<td valign="top" align="left" width="20%">Qualified By</td>
								<td valign="top" align="left" width="20%">Trainer</td>
          						<td valign="top" align="left" width="20%">Attachments</td>
          						<td valign="top" align="left" width="20%"></td>
									
									
									</tr>

								<!-- Display Admin Userd here  Suresh--> 
								<% int i=1; %>
							       		
									<c:forEach items="${employeeForm.employees}" var="employees" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
							       		<td valign="top" align="left" width="10%"><input type="checkbox" name="chkUser" value="${employees.employee_id}"/></td>
					<%-- 			           	<td valign="top" align="left"  width="10%">${documentMains.document_id}</td> --%>
									        <td valign="top" align="left" width="10%">${employees.employee_id}</td>
									        <td valign="top" align="left" width="15%">${employees.name}</td>
											<td valign="top" align="left" width="10%">${employees.type_of_training}</td>											
											<td valign="top" align="left" width="10%">${employees.qualified_by}</td>											
											<td valign="top" align="left" width="10%">${employees.trainer}</td>
											<c:choose>
											<c:when test="${employees.attachment_name!='null'}">
											<td valign="top" align="left" width="10%"><a href="<c:out value="downloademployeefile?eid=${employees.employee_id}"></c:out>">Download</a></td>
										</c:when>
										<c:otherwise><td valign="top" align="center" width="10%">No Document</td>
										</c:otherwise>
										</c:choose>		
												<td valign="top" align="left" width="15%">
												
											
											
											<td valign="top" align="left" width="15%">
											
											
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
	<!-- <div class="extrabottom">
      -->        <ul class="pagination">
        
           <%--   <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewformreport_page?page=${currentpage - 1}" >Prev</a></li> 
               </c:if>
              
           
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewformreport_page?page=${i}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewformreport_page?page=${currentpage+1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallformreport" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise> --%>
                  <li class="page"><a href="viewemployees" class="paging_select">Back</a></li>
                  
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
 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 <jsp:include page="footer.jsp"></jsp:include> 