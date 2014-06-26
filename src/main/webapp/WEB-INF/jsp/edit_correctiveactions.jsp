<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />

<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" enctype="multipart/form-data"  action="updatecorrectiveAndPreventiveActions">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
       <td>
        <div>
  <ul class="horizmenu" style=" float:left;margin-left:190px; margin-top:8px;">
						
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addcorrectiveAndPreventiveActions" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Add Corrective And Preventive Actions
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="correctiveactions_list" class="<c:choose>
								<c:when test="${menu=='corrective'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									View Corrective And Preventive Actions
									
								</a>
							</li>
						
				         <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="capa_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Reports
								</a>
							</li>
				            </ul>
				            
  </div>
       </td>
      </tr>
      <tr>
      
       <td valign="top" align="left">
        
        
            <div class="headings altheading">
              <h2>Corrective And Preventive Actions Details</h2>
            </div>
            <div class="contentbox">
              <c:set value="${correctiveAndPreventiveActionsForm.correctiveAndPreventiveActions[0]}" var="correctiveAndPreventiveActions"> </c:set>
               <table cellpadding="0" cellspacing="0" border="0" width="100%" style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
             <!--  <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              --> <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="30%">CAPA ID:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="capa_id" class="input_txtbx" value="<c:out value="${capa_id}"/>"/><br/><span class="err"></span></td>
              	   <td valign="top" align="left" class="input_txt"> NC ID :</td>
				  <td valign="top" align="left" class="input_txt">
				   <select name="nc_id" id="nc_id" class="input_txtbx" onchange="doAjaxPost();" style="height:20px;">
               <option value="">--Select--</option>
               <c:forEach items="${nonConformanceForm.nonconformance}" var="nonconformance" varStatus="true">
               <%-- <option value="<c:out value="${nonconformance.id}"/>"><c:out value="${nonconformance.id}"/></option>
                --%><option value="${nonconformance.id}"<c:if test="${nonconformance.id== correctiveAndPreventiveActions.nc_id}"><c:out value="selected"/></c:if>>${nonconformance.id}</option>
               </c:forEach>
               </select>
               <!-- <select name="nc_id" class="input_txtbx" style="height:20px;">
				                  		<option value="1111">11111</option>
							</select>
							 --><span class="err"><form:errors path="CorrectiveAndPreventiveActions.nc_id"></form:errors></span></td>			
              
                </tr>
                
                <tr class="row2">
				  <td valign="top" align="left" class="input_txt" width="30%"> External ID :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  		<input type="text" name="external_id" class="input_txtbx" id="inp_external_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${correctiveAndPreventiveActions.external_id}"></c:out>' /><br/><span class="err"><form:errors path="CorrectiveAndPreventiveActions.external_id"></form:errors></span></td>  
                  
                  <td valign="top" align="left" class="input_txt" width="30%">Source of NC:</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  	<div id="source_of_nonconformance"> <input type="text" name="source_of_nonconformance" id="source_of_nonconformance"  class="input_txtbx" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${correctiveAndPreventiveActions.source_of_nonconformance}"></c:out>' /><br/> 
                  		<%-- <select name="source_of_nonconformance" id="source_of_nonconformance_id"  class="input_txtbx" style="height:20px;">
                  		<option value="">--Select--</option>
                  		<c:forEach items="${nonConformanceForm.nonconformance}" var="nonconformance" varStatus="true">
                  		<option value="<c:out value="${nonconformance.source_of_nonconformance}"/>"><c:out value="${nonconformance.source_of_nonconformance}"/></option>
                  		</c:forEach>
                  		</select>
                  		<span class="err"><form:errors path="CorrectiveAndPreventiveActions.source_of_nonconformance"></form:errors></span></td>
                      	 --%>	
                </div>
                </td>
                </tr>
                  			
                <tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="30%">Date Found :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <%-- <input type="text" name="date_found" class="input_txtbx" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${correctiveAndPreventiveActions.date_found}" /><br/><span class="err"><form:errors path="CorrectiveAndPreventiveActions.date_found"></form:errors></span></td> --%>
                  <select name="date_found" id="datepicker" class="input_txtbx" style="height:20px;">
                  <option valule="">--Select--</option>
                  <c:forEach items="${nonConformanceForm.nonconformance}" var="nonconformance" varStatus="true">
                     <option value="${nonconformance.date_found}"<c:if test="${nonconformance.date_found == correctiveAndPreventiveActions.date_found}"><c:out value="selected"/></c:if>>${nonconformance.date_found}</option>
                  </c:forEach>
                  </select><span class="err"><form:errors path="CorrectiveAndPreventiveActions.date_found"></form:errors></span>
                  </td>
                  

                  <td valign="top" align="left" class="input_txt" width="30%"> Type of NC :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><div id="type_of_nc"><input type="text" name="type_of_nonconformance" class="input_txtbx" id="type_of_nc" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${correctiveAndPreventiveActions.type_of_nonconformance}"></c:out>' /><br/><span class="err"><form:errors path="CorrectiveAndPreventiveActions.type_of_nonconformance"></form:errors></span>
                  </div>
                  </td>
                </tr>
                
			<tr class="row2">
				<td valign="middle" align="left" class="input_txt" width="30%">Temporary Action :</td>               
                <td valign="top" align="left" class="input_txt" width="70%">
                <div id="action"><textarea class="input_txtbx1"  name="temporary_action"  style="width:55%; height: 70px;">${correctiveAndPreventiveActions.temporary_action}</textarea><span class="err"><form:errors path="CorrectiveAndPreventiveActions.temporary_action"></form:errors></span>
                </div>
                </td>
            	
            	<td valign="top" align="left" class="input_txt" width="30%">Nature of NC :</td>      
				<td valign="top" align="left" class="input_txt" width="70%"><div id="nature_of_nc"><textarea class="input_txtbx1"  id="nature_of_nc" name="nature_of_nc" style="width:100%; height: 70px;">${correctiveAndPreventiveActions.nature_of_nc}</textarea><span class="err"><form:errors path="CorrectiveAndPreventiveActions.nature_of_nc"></form:errors></span>
				</div>
				</td>
            </tr>
            <tr class="row2">
              <td valign="top" align="left" class="input_txt"> CAPA Requestor</td>
			  <td valign="top" align="left" class="input_txt">
				           <select name="capa_requestor" class="input_txtbx" style="height:20px;">
						                  <option value="">--Select--</option>
						                  <option <c:if test="${correctiveAndPreventiveActions.capa_requestor eq 'name1'}"><c:out value="Selected"/></c:if> value="name1" >name1</option>
										  <option <c:if test="${correctiveAndPreventiveActions.capa_requestor eq 'name2'}"><c:out value="Selected"/></c:if> value="name1">name2</option>
										  <option  <c:if test="${correctiveAndPreventiveActions.capa_requestor eq 'name3'}"><c:out value="Selected"/></c:if> value="name3">name3</option>
				           </select> <span class="err"><form:errors path="CorrectiveAndPreventiveActions.capa_requestor"></form:errors></span></td>	
			  <td valign="top" align="left" class="input_txt"> Use 5 Whys's in system(Y/N)<span>(*Optional)</span></td>
		      <td><input type="checkbox" name="use_5_why_in_system" value="use_5_why_in_system" id="use_5_why_in_system"/></td>					
			</tr> 
				
            <tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="30%"> Request Date</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="request_date" class="input_txtbx" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${correctiveAndPreventiveActions.request_date}" /><span class="err"><form:errors path="CorrectiveAndPreventiveActions.request_date"></form:errors></span></td>
                  
                  <td valign="top" align="left" class="input_txt" id="why?" width="20" style="display:none;">Why's?'
				   	 <input type="checkbox" name="why1" value="why1" id="0"/></td>
				  <td valign="top" align="left" class="input_txt" width="70% " id="5why" style="display:none;">
					  <textarea class="input_txtbx1"  name="why" id="why" style="width:70%; height: 70px;">${correctiveAndPreventiveActions.why}</textarea><span class="err"><form:errors path="CorrectiveAndPreventiveActions.why"></form:errors></span></td>			
             </tr>	
             
            <tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="30%"> CAPA Due Date</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="capa_due_date" class="input_txtbx" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${correctiveAndPreventiveActions.capa_due_date}" /><span class="err"><form:errors path="CorrectiveAndPreventiveActions.capa_due_date"></form:errors></span></td>
                 
              
                </tr>
            <tr class="row1">
              <td valign="top" align="left" class="input_txt">Assigned Team Leader</td>
						           <td valign="top" align="left" class="input_txt">
				                  		<select name="assigned_team_leader" class="input_txtbx" style="height:20px;">
						                  <option value="">--Select--</option>
						                       <option <c:if test="${correctiveAndPreventiveActions.assigned_team_leader eq 'name1'}"><c:out value="Selected"/></c:if> value="name1" >name1</option>
											<option <c:if test="${correctiveAndPreventiveActions.assigned_team_leader eq 'name2'}"><c:out value="Selected"/></c:if> value="name1">name2</option>
											<option  <c:if test="${correctiveAndPreventiveActions.assigned_team_leader eq 'name3'}"><c:out value="Selected"/></c:if> value="name3">name3</option>
				                 </select>
				                 <span class="err"><form:errors path="CorrectiveAndPreventiveActions.assigned_team_leader"></form:errors></span>
				                 
				                   	</td>	
                 </tr>
                  <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="30%">Team Member(s)</td>      
						         	 <td valign="top" align="left" class="input_txt" width="70%"><textarea class="input_txtbx1"  name="team_members"  style="width:60%; height: 70px;">${correctiveAndPreventiveActions.team_members}</textarea><span class="err"><form:errors path="CorrectiveAndPreventiveActions.team_members"></form:errors></span></td>
                <td valign="middle" align="left" class="input_txt" width="30%">Root-Cause Statement</td>               
                  <td valign="top" align="left" class="input_txt" width="70%"><textarea class="input_txtbx1"  name="root_cause_statement"  style="width:100%; height: 70px;">${correctiveAndPreventiveActions.root_cause_statement}</textarea><span class="err"><form:errors path="CorrectiveAndPreventiveActions.root_cause_statement"></form:errors></span></td>
               
              </tr>
                 <tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="30%">Root-Cause Analysis File</td>
                  
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="root_cause_analysis_file" class="input_txtbx" id="root_cause_analysis_file" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${correctiveAndPreventiveActions.root_cause_analysis_file}"></c:out>' /><br/><span class="err"><form:errors path="CorrectiveAndPreventiveActions.root_cause_analysis_file"></form:errors></span></td>
               <!-- <td valign="top" align="left" class="input_txt" > Upload External Analysis(Y/N)<span>(*Optional)</span></td>
				                   	<td><input type="checkbox" name="upload_external_analysis" id="externalfile" value="upload_external_analysis" id="0"/></td>
						 -->             	  <td valign="middle" align="left" class="input_txt">Upload External Analysis(Y/N)<span>(*Optional)</span> </td>
				  <td> <input type="checkbox" name="upload_external_analysis" value="upload_external_analysis" id="externalfile" 

onclick="Upload();"
				                  <c:if test="${ correctiveAndPreventiveActions.upload_external_analysis == 

'upload_external_analysis'}"><c:out value="Checked=checked"/></c:if>/>
				  <td>
				  
				  	 </tr>
			 <tr class="row1" id="id_file" >
			 <td valign="top" align="left" class="input_txt" width="30%"><input type="hidden"/></td>
			 <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden"/></td>
             <td valign="top" align="left" class="input_txt" width="30%">Upload the files</td>
             <td valign="top" align="left" class="input_txt" width="70%"> <input name="attachments"  type="file" /><div  style="color:red; font-weight:bold;" > <c:out 

 value="${correctiveAndPreventiveActions.attachment_name}"  ></c:out></div></td>
                 
                   </tr>
						<!-- 
							</tr>
				<tr class="row2" id="upload" style="display:none;">
				 <td valign="top" align="left" class="input_txt" width="30%" >Upload</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  
                  <input name="attachments"  id="id_file" type="file" /> 
                  </td>       	
          
           </tr>
           -->       
                 
                  </table>
                <br>
                <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
                 <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Action</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="action" value="<c:out value="${correctiveAndPreventiveActions.action}"/>"/><br/><span class="err"><form:errors path="CorrectiveAndPreventiveActions.action"></form:errors></span></td>
                <td valign="middle" align="left" class="input_txt" width="30%">Due Date</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" id="datepicker6" name="due_date" value="<c:out value="${correctiveAndPreventiveActions.due_date}"/>"/><br/><span class="err"><form:errors path="CorrectiveAndPreventiveActions.due_date"></form:errors></span></td>
                <td valign="middle" align="left" class="input_txt" width="30%">Verified By</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="verified_by" value="<c:out value="${correctiveAndPreventiveActions.verified_by}"/>"/><br/><span class="err"><form:errors path="CorrectiveAndPreventiveActions.verified_by"></form:errors></span></td>
               </tr>
                    <tr class="row2">
                     <td valign="middle" align="left" class="input_txt" width="30%">Responsibity</td>
                     <td valign="top" align="left" class="input_txt"width="30%">
				                  		<select name="responsibility" class="input_txtbx" style="width:72%; height:20px;">
						                  <option value="">--Select--</option>
						                       <option <c:if test="${correctiveAndPreventiveActions.responsibility eq 'name1'}"><c:out value="Selected"/></c:if> value="name1" >name1</option>
											<option <c:if test="${correctiveAndPreventiveActions.responsibility eq 'name2'}"><c:out value="Selected"/></c:if> value="name1">name2</option>
											<option  <c:if test="${correctiveAndPreventiveActions.responsibility eq 'name3'}"><c:out value="Selected"/></c:if> value="name3">name3</option>
				                 </select>
				                 <span class="err"><form:errors path="CorrectiveAndPreventiveActions.responsibility"></form:errors></span>
				                   	</td>	
                     
                     <td valign="middle" align="left" class="input_txt" width="30%">Completion Date</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" id="datepicker4" name="completion_date" value="<c:out value="${correctiveAndPreventiveActions.completion_date}"/>"/><br/><span class="err"><form:errors path="CorrectiveAndPreventiveActions.completion_date"></form:errors></span></td>
                <td valign="middle" align="left" class="input_txt" width="30%">Verification Date</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" id="datepicker5" name="verification_date" value="<c:out value="${correctiveAndPreventiveActions.verification_date}"/>"/><br/><span class="err"><form:errors path="CorrectiveAndPreventiveActions.verification_date"></form:errors></span></td>
                 </tr>
                </table>
               </td>
               </tr>
               </table>
                </div>
                 
                 <br>
                 <table align="center" width="100%">
                  <tr >
                  
                  <td valign="top" align="center"></td>
				  <td valign="top" align="center"><input type="submit" value="Submit" class="submit_btn1">
				 </td>
                  </tr>
                  </table>
                  </table>
                  </div>
                  
                  </td>
                  </tr></table></div>
                 
                  </form>
                  
                  
                  
<!-- <script>
  function doAjaxPost() {
	 alert("hi");
	document.getElementById('nc_id').style.display="block";
	 document.getElementById("source_of_nonconformance").style.display="inline";
	var filer_value = $('#nc_id').val();
	
	$.ajax({
		type : "POST",
		url : "/QMS_App/ajax_getnc",
		data : "nc_id=" + filer_value,
		success : function(response) {
			alert("response"+response);
		document.getElementById("source_of_nonconformance").value=response;
		/* document.getElementById("type_of_nc").value=response;
		document.getElementById("nature_of_nc").value=response;
			 */
			//$('#filter_value').hide();
			 
		var two_drop=response.split("<split>");
    	
		$('#source_of_nonconformance').html(two_drop[0]);
		$('#type_of_nc').html(two_drop[1]);
		$('#nature_of_nc').html(two_drop[2]);
		
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
}
 
</script>     
   -->
   <script>
   function doAjaxPost() {
	 
	document.getElementById('nc_id').style.display="block";
	 document.getElementById("source_of_nonconformance").style.display="inline";
	var filer_value = $('#nc_id').val();
	
	$.ajax({
		type : "POST",
		url : "/QMS_App/ajax_getnc",
		data : "nc_id=" + filer_value,
		success : function(response) {
			alert("response"+response);
		var two_drop=response.split("<split>");
    	
		$('#source_of_nonconformance').html(two_drop[0]).value=response;
		$('#type_of_nc').html(two_drop[1]).value=response;
		$('#nature_of_nc').html(two_drop[2]).value=response;
		$('#action').html(two_drop[3]).value=response;
		
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
}
 
</script>     
      
<script>
$('#externalfile').change(function() {
	 var e1=document.getElementById("upload");
	   
	 if($(this).is(':checked')) {
		 e1.style.display="table-row";
			
     
     } else {
    	 e1.style.display="none";
 	 }
   
});

</script>
 <script>
$('#use_5_why_in_system').change(function() {
	 var e4=document.getElementById("5why");
	 var e5=document.getElementById("why?");
		  
	 if($(this).is(':checked')) {
		 e4.style.display="table-cell";
		 e5.style.display="table-cell";
     
     } else {
    	 e4.style.display="none";
    	 e5.style.display="none";
    	    	 
			 }
   
});

</script>
          
   <script>
 $(function() {
	 $( "#datepicker1" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
<script>
 $(function() {
	 $( "#datepicker3" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
<script>
 $(function() {
	 $( "#datepicker4" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
<script>
 $(function() {
	 $( "#datepicker5" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
<script>
 $(function() {
	 $( "#datepicker6" ).datepicker({dateFormat: 'yy-mm-dd'});
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
