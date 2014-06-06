<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<html>
<head>
<script  language="javascript">
function validate()
{
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
var result=confirm("Are you sure.You want to delete the Form(s)?");
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
<body>
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
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
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
							<h2>Delete Forms</h2>
						</div>
						 <div class="contentbox">
						 <form action="search_forms" name="dashboard" method="GET">
						<div style="border:#993300 2px solid; padding:15px; margin-bottom:15px;">


							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="20%">Process Area </td>
							   <!--  <td align="left" valign="middle" width="10%"><input type="text" name="process" class="input_txtbx2" id="recordtitle"><span class="err"><form:errors path="Form.responsibility"></form:errors></span></td>
							    <td align="center" valign="middle" width="38%"> -->
							    
							     <td valign="top" align="left" class="input_txt" >
               
               <select name="process" id="id_inpprocess"  class="input_cmbbx1" style="width:200px;">
               <option value="">--Select--</option>
             <c:forEach items="${processForm.processes}" var="processes" varStatus="true">
                <option value="${processes.process_name}"<c:if test="${processes.process_name==processarea}"><c:out value="selected"></c:out></c:if>>${processes.process_name}</option>
               </c:forEach>
               </select>
              </td>
               <td valign="top" align="left" class="input_txt" >
							  <input type="submit" value="Find" class="submit_btn" name="search" id="id_submit" onmouseover="showTooltip('tooltip_id','inp_id3');" /></td>
							  <td align="center" valign="middle" width="38%"><input type="submit" value="Clear" class="submit_btn" ></td>
							  </tr>
							</table>
							
						</div> 
</form>
						
					<form action="deleteform" name="dashboard" onsubmit="return validate()" method="POST">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="title">
									<td valign="top" align="left" width="10%">select</td>
									<td valign="top" align="left" width="10%">Form/Rec ID</td>
									<td valign="top" align="left" width="10%">Process</td>
									<td valign="top" align="left" width="10%"></td>
									<td valign="top" align="left" width="10%"></td>
									</tr>

								<!-- Display Admin Userd here  Suresh--> 
								<% int i=1; %>
							       		
									<c:forEach items="${formForm.form}" var="form" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
							       		<td valign="top" align="left" width="10%"><input type="checkbox" name="chkUser" value="${form.auto_number}"/></td>
								        <%--    	<td valign="top" align="left"  width="10%">${form.auto_number}</td> --%>
									        <td valign="top" align="left" width="10%">${form.form_or_rec_id}</td>
											<td valign="top" align="left" width="10%">${form.process}</td>
											
											
											
											
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
		
	<div class="extrabottom">
             <ul class="pagination">
       
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
                  <li class="page"><a href="view_form" class="paging_select">Back</a>  </li>
                  
           <%--    </c:otherwise>
              </c:choose>			 --%>		
	
		</ul></div>
		
		</td>
	
		</table></div>
						</body>
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
  <table  width=300 height=40>
			<tr height=30><td></td></tr></table>
			<jsp:include page="footer.jsp"></jsp:include>
</html>