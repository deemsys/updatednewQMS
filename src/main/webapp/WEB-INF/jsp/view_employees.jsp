<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript" src="js/ajaxpaging.js"></script>

<div id="right_content">
    	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
      		<td>
      		 <div>
  <ul class="horizmenu">
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addemployee" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
								<span>Add Employees</span>
									
								</a>
							</li>
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewemployees" class="<c:choose>
								<c:when test="${menu=='employee'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
								<span>View Employees</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="employee_report" class="<c:choose>
								<c:when test="${menu=='employees'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Employee Report</span>
									
								</a>
							</li>
						
							</ul>
						
  </div>
      		</td>
      		</tr>
      		<tr>
				<td valign="top" align="left" style="padding:5px 0 10px 0;">
					<div class="del_div">
						<p><label style="padding: 0pt 20px 0pt 0pt;"><input type="submit" name="delete" value="" class="icon1" onclick="form.action='?do=deleteparticipant'" /></label></p>
	          		</div>
				</td>
			</tr>
			<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>View Employees</h2>
			        </div>
		        <div class="contentbox">
							<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<form action="findemployee" method="get">
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
							  
	 <table cellpadding="0" cellspacing="0" border="0" width="100%">
				        
				        
							<tr class="title">
								<td valign="top" align="left" width="10%">Employee&nbsp;ID</td>
					         	<td valign="top" align="left" width="15%">Name</td>
					         	<td valign="top" align="left" width="10%">Type</td>
								<td valign="top" align="left" width="10%">Qualified By</td>
								<td valign="top" align="left" width="10%">Trainer</td>
          						<td valign="top" align="left" width="10%">Attachments</td>
          						<td valign="top" align="left" width="15%">Actions</td>
          					</tr>
						
						
						<% int i=1; %>
							       		
									<c:forEach items="${employeeForm.employees}" var="employees" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" ">
								           	<td valign="top" align="left"  width="10%">
								           	<a href="list_employee?id=${employees.employee_id}">${employees.employee_id}</td>
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
												
												
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="editemployee?empid=${employees.employee_id}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deleteemployee?empid=${employees.employee_id}"/>" onclick="return confirmation()">Remove</a>
											
											
											</td>
										</tr>
										</c:forEach>
										 <tr><td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
        
             <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewemployeereport_page?page=${currentpage - 1}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}"> --%> 
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewemployeereport_page?page=${i}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewemployeereport_page?page=${currentpage+1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallemployeereport" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="viewemployees" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>					
		 
		  </ul>
		  </div>
		  </td>
		  </tr>
										
							    	
						    	</table>
						    	</div>
						    	</td>
						    	</tr>
						    	</table>
						    	</div>
						 

<script>
function confirmation(val) {
	var answer = confirm("Are you Sure You Want to Delete Participant ?")
	if (answer){
		return true;
	}
	else{
		
		return false;
		
	}
}
</script>

<script language="javascript">

function selectall(field)
{
	//field.getElementByTagName('checkbox');
	if(document.grid.checkall.checked==true)
	{
		for (i = 0; i < field.length; i++)
			field[i].checked = true ;
	}
	else
	{
		for(i = 0; i < field.length; i++)
			field[i].checked = false;
	}
}

function validate(fname)
{
// alert(fname);
var chks = document.getElementsByName('checkbox[]');

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
return true;
}

function findpart()
{
// alert(document.getElementById("moblie").value);
// alert(document.getElementById("group").value);
// alert(document.getElementById("city").value);
window.location="?do=viewparticipants&moblie="+document.getElementById("moblie").value+"&group="+document.getElementById("group").value+"&city="+document.getElementById("city").value;
}
</script>

<jsp:include page="footer.jsp"></jsp:include>