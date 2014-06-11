<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />

<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="add_internalaudits">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
       <td>
        <div>
  <ul class="horizmenu" style=" float:left;margin-left:190px; margin-top:8px;">
						
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addinternalaudits" class="<c:choose>
								<c:when test="${menu=='audits'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Add Internal Audits</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_internalaudits" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View Internal Audits </span>
									
								</a>
							</li>
						
				         <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="internalaudit_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Reports</span>
									
								</a>
							</li>
				            </ul>
				            
  </div>
       </td>
      </tr>
      <tr>
        <td valign="top" align="left">
        
        
            <div class="headings altheading">
              <h2>Internal Audits Details</h2>
            </div>
            <div class="contentbox">
              <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">Audit ID:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="id" class="input_txtbx" value="<c:out value="${id}"/>"/><br/><span class="err"></span></td>
                </tr>
                <tr class="row1">
						         	<td valign="top" align="left" class="input_txt"> Process :</td>
						          <td valign="top" align="left">
				                  		<%-- <select name="process"  class="input_txtbx" style="height:20px;">
				                  		<option value="">--Select--</option>
						                  <option <c:if test="${internalaudits.process eq 'process1'}"><c:out value="Selected"/></c:if> value="process1" >Process1</option>
											<option <c:if test="${internalaudits.process eq 'process2'}"><c:out value="Selected"/></c:if> value="process2">Process2</option>
											<option  <c:if test="${internalaudits.process eq 'process3'}"><c:out value="Selected"/></c:if> value="process3">Process3</option>
				                   	</select> --%>
				                   	
				        	 <select name="process" id="id_inpprocess" onchange="doAjaxPost_for_process();" class="input_cmbbx1" style="width:200px;">
               				<option value="">--Select--</option>
               				<c:forEach items="${processForm.processes}" var="processes" varStatus="true">
               				<option value="<c:out value="${processes.process_name}"/>"><c:out value="${processes.process_name}"/></option>
               				</c:forEach>
               				</select>
						           		<br/><span class="err"><form:errors path="InternalAudits.process"></form:errors></span>
				                   	</td>	
						         </tr> 
			<tr class="row2">
               <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%"> Auditee Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                 <%--  <input type="text" name="auditee_name" class="input_txtbx" id="inp_auditee_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${internalaudits.auditee_name}"></c:out>' /><br/><span class="err"><form:errors path="InternalAudits.auditee_name"></form:errors></span>
                  --%>  <select name="auditee_name" id="id_inpprocess" class="input_cmbbx1" style="width:200px;">
               <option value="">--Select--</option>
               <c:forEach items="${processForm.processes}" var="processes" varStatus="true">
               <option value="<c:out value="${processes.process_owner}"/>"><c:out value="${processes.process_owner}"/></option>
               </c:forEach>
               </select>
               </td>         		
               </tr>
                  

								
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Audit Start Date :</td>
                  
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="audit_start_date" class="input_txtbx" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${internalaudits.audit_start_date}"></c:out>' /><br/><span class="err"><form:errors path="InternalAudits.audit_start_date"></form:errors></span></td>
               
   
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">Audit Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="audit_due_date" class="input_txtbx" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${internalaudits.audit_due_date}" /><br/><span class="err"><form:errors path="InternalAudits.audit_due_date"></form:errors></span></td>
                </tr>
			<tr class="row1">
							         	<td valign="middle" align="left" class="input_txt"> Auditor :</td>
							           <td valign="top" align="left" class="input_txt">
					                  		<select name="auditor" class="input_txtbx" style="height:20px;">
							                <option value="">--Select--</option>
						                     <option <c:if test="${internalaudits.auditor eq 'name1'}"><c:out value="Selected"/></c:if> value="name1" >Name1</option>
											<option <c:if test="${internalaudits.auditor eq 'name2'}"><c:out value="Selected"/></c:if> value="name2">Name2</option>
											<option  <c:if test="${internalaudits.auditor eq 'name3'}"><c:out value="Selected"/></c:if> value="name3">Name3</option>
				                   	</select>
				                   	<br/><span class="err"><form:errors path="InternalAudits.auditor"></form:errors></span>
					                   	</td>	
							         </tr> 
						         </table>
						         </td>
						         <td align="left" valign="top">
 <table cellpadding="0" cellspacing="0" border="0" width="100%">
								
                      <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%"> Auditor Notes :</td>
                                
                  <td valign="top" align="left" class="input_txt" width="70%"><textarea class="input_txtbx1"  name="auditor_notes"  style="width:59%; height: 70px;">${internalaudits.auditor_notes}</textarea><span class="err"><form:errors path="InternalAudits.auditor_notes"></form:errors></span></td>
                </tr>
                 <tr class="row1">
						         	<td valign="middle" align="left" class="input_txt"> Finding :</td>
						           <td valign="top" align="left" class="input_txt">
				                  		<select name="finding" class="input_txtbx" style="height:20px;">
						                  <option value="">--Select--</option>
						                       <option <c:if test="${internalaudits.finding eq 'ok'}"><c:out value="Selected"/></c:if> value="ok" >Ok</option>
											<option <c:if test="${internalaudits.finding eq 'area of improvement'}"><c:out value="Selected"/></c:if> value="area of improvement">Area Of Improvement </option>
											<option  <c:if test="${internalaudits.finding eq 'nonconformance'}"><c:out value="Selected"/></c:if> value="nonconformance">NonConformance</option>
				                 </select>
				                 <br/><span class="err"><form:errors path="InternalAudits.finding"></form:errors></span>
				                 
				                   	</td>	
						         </tr> 
				
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%"> Completion Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="completion_date" class="input_txtbx" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${internalaudits.completion_date}" /><span class="err"><form:errors path="InternalAudits.completion_date"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%"> Auditor's Initials :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="auditors_initials" class="input_txtbx" id="inp_auditors_initials" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${internalaudits.auditors_initials}" /><span class="err"><form:errors path="InternalAudits.auditors_initials"></form:errors></span></td>
                </tr>
               
                 
                  </table>
                
                  <table align="center" width="100%">
                  <tr >
                  
                  </br>
				  <td><input type="submit"  value="Submit" class="submit_btn1">
				 </td>
                  </tr>
                  </table>
                  </table>
                  </div>
                  </div>
                  </td>
                  </tr></table></div>
                 
                  </form>
                  
                  
 <script>
 function doAjaxPost_for_process() {

		var proceee_name = $('#id_inpprocess').val();
		/*   var education = $('#education').val();	 */		
		$.ajax({
			type : "POST",
			url : "/QMS_App/ajax_getprocess",
			data : "process=" + proceee_name,
			success : function(response) {
				
				$('#process_owner_id').html(response);
			
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	}
 </script>                 
                  
                      
   <script>
 $(function() {
	 $( "#datepicker1" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
   <script>
 $(function() {
           $( "#datepicker" ).datepicker({dateFormat: 'yy-mm-dd'});
         });
 
</script>
   <script>
 $(function() {
	 $( "#datepicker2" ).datepicker({dateFormat: 'yy-mm-dd'});
     
         });
 
</script>
      <jsp:include page="footer.jsp"></jsp:include>
