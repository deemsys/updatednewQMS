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
<div>  <ul class="horizmenu">
						
	
				<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="documentdelete" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
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
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
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
						<a title="Close" href="documentdelete">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>
						</p>
					</div></td>
			</tr>
		</c:if>
			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Delete Documents</h2>
						</div>
						 <div class="contentbox">
						 <form action="findDocuments" method="get">
						<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							
							
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="30%"> Document Type&nbsp;: </td>
							    <td><select name="document_type" id="search_document_type" class="input_txtbx" style="width:200px;">
              					<option value="">--Select--</option>
                				<c:forEach items="${documentTypeForm.documentTypes}" var="documenttype" varStatus="status">
        				       <option value="${documenttype.document_type}" <c:if test="${documenttype.document_type==documentMain}"><c:out value="selected"></c:out></c:if>>${documenttype.document_type}</option>
			                  </c:forEach> </select></td>
               
							    <td align="left" valign="middle" width="30%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Process Area&nbsp;:</td>
							    <td align="left" valign="middle" width="10%">
							    <select name="search_process" id="search_process"  class="input_txtbx" style="width:200px;">
               					<option value="">--Select--</option>
              					 <c:forEach items="${processForm.processes}" var="processes" varStatus="true">
              					 <option value="${processes.process_name}" <c:if test="${processes.process_name==documentMain1}"><c:out value="selected"></c:out></c:if>>${processes.process_name}</option>
             				  </c:forEach>
               					</select></td>   
							    <td align="center" valign="middle" width="38%"><input type="submit" value="Find" class="submit_btn1"  "></td>
							    <td align="center" valign="middle" width="38%"><!-- <input type="reset" value="Clear" class="submit_btn1"> --></td>
							 </tr>
							</table>
							
						</div></form>
					<form action="deletedocument" name="dashboard" onsubmit="return validate()" method="POST">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="title">
									<td valign="top" align="left" width="10%">Select</td>
									<td valign="top" align="left" width="10%">Document Id</td>
									<td valign="top" align="left" width="10%">Document Type</td>
									<td valign="top" align="left" width="10%">Process Area</td>
									<td valign="top" align="left" width="10%">Media Type</td>		
	          						<td valign="top" align="center" width="15%">External Document(Y/N)</td>
								<!-- 	<td valign="top" align="left" width="10%"></td> -->
									
									
									</tr>

								<!-- Display Admin Userd here  Suresh--> 
								<% int i=1; %>
							       		
									<c:forEach items="${documentMainForm.documentMains}" var="documentMains" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
							       		<td valign="top" align="left" width="10%"><input type="checkbox" name="chkUser" value="${documentMains.document_id}"/></td>
					<%-- 			           	<td valign="top" align="left"  width="10%">${documentMains.document_id}</td> --%>
									        <td valign="top" align="left" width="10%">${documentMains.document_id}</td>
									         <td valign="top" align="left" width="10%">${documentMains.document_type}</td>
											<td valign="top" align="left" width="10%">${documentMains.process}</td>
											<c:choose>
											<c:when test="${documentMains.media_type=='electronic'}">
											<td valign="top" align="left" width="10%"><a href="<c:out value="downloadMaindoc?id=${documentMains.document_id}"></c:out>">Download</a></td>
										</c:when>
										<c:when test="${documentMains.media_type=='hardcopy'}">
										<td valign="top" align="left" width="10%">Hard Copy </td>
										</c:when>
										<c:otherwise>
										<td valign="top" align="left" width="10%"><a href="<c:out value="downloadMaindoc?id=${documentMains.document_id}"></c:out>">Download</a>&nbsp;<label>and</</label>&nbsp;<label>Hard Copy </label></td>
										</c:otherwise>
										</c:choose>	
											<td valign="top" align="left" width="15%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<c:choose>
											<c:when test="${documentMains.external=='Yes'}">
											<c:out value="Yes"></c:out>
											</c:when>	
											<c:otherwise>
											<c:out value="No"></c:out>
											</c:otherwise>							
											</c:choose>
											
											
											
											
											
											
											</td>
										</tr>
							    	</c:forEach>
						    				


								</table>
								<br>
								<li class="page">&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Delete" class="submit_btn1"></li>
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
        
              <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewdocumentdelete_page?page=${currentpage - 1}&documenttype=${documentMain}&processarea=${documentMain1}" >Prev</a></li> 
               </c:if>
              
           
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewdocumentdelete_page?page=${i}&documenttype=${documentMain}&processarea=${documentMain1}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewdocumentdelete_page?page=${currentpage+1}&documenttype=${documentMain}&processarea=${documentMain1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewalldocumentdelete?documenttype=${documentMain}&processarea=${documentMain1}" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise> 
                  <li class="page"><a href="documentdelete" class="paging_select">Back</a></li>
                  
               </c:otherwise>
              </c:choose>			 	
		 
		</ul></div></td></table></div>
		<table height="2%"><tr><td></td></tr><tr height="50"></tr></table>
								
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