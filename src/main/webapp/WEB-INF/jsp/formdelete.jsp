<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<head>
<script  language="javascript">
function validate()
{
alert("fname");
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
								<a href="addform" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Form</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_form" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Form</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="form_report" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Form Report</span>
									
								</a>
							</li>
							 <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="formdelete" class="<c:choose>
								<c:when test="${menu=='document'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Delete Forms</span>
									
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
						
					<form action="deleteform" name="dashboard" onsubmit="return validate()" method="POST">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="title">
									<td valign="top" align="left" width="10%">select</td>
									<td valign="top" align="left" width="10%">Auto Number</td>
									<td valign="top" align="left" width="10%">Form/Rec ID</td>
									<td valign="top" align="left" width="10%">Process</td>
									
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
								           	<td valign="top" align="left"  width="10%">${form.auto_number}</td>
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
                  <li class="page"><a href="view_form" class="paging_select">Back</a></li>
                  
           <%--    </c:otherwise>
              </c:choose>			 --%>		
		 
		</ul></div></td></table></div>
						
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
<%-- <jsp:include page="footer.jsp"></jsp:include> --%>