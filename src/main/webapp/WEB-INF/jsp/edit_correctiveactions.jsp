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
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="hidden" name="capa_id" class="input_txtbx" value="<c:out value="${correctiveAndPreventiveActions.capa_id}"/>"/>${correctiveAndPreventiveActions.capa_id}<br/><span style="color: red;font-style:italic;"></span></td>
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
							 --><span style="color: red;font-style:italic;" id="iderror"></span><form:errors path="CorrectiveAndPreventiveActions.nc_id"></form:errors></td>			
              
                </tr>
                
                <tr class="row2">
				  <td valign="top" align="left" class="input_txt" width="30%"> External ID :</td>
                  <td valign="top" align="left" class="input_txt" width="30%">
                  		<input type="text" name="external_id" class="input_txtbx" id="inp_external_id" onInput="return validatealphanumeric();" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${correctiveAndPreventiveActions.external_id}"></c:out>' /><br/><span style="color: red;font-style:italic;" id="externalerror"></span><form:errors path="CorrectiveAndPreventiveActions.external_id"></form:errors></td>  
                  
                  <td valign="top" align="left" class="input_txt" width="30%">Source of NC :</td>
                  <td valign="top" align="left" class="input_txt" width="30%">
                  	<div id="source_of_nonconformance"> 
                  	<%-- <input type="text" name="source_of_nonconformance" id="source_of_nonconformance"  class="input_txtbx" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${correctiveAndPreventiveActions.source_of_nonconformance}"></c:out>' /><br/> --%> 
                  		
                </div>
                </td>
                </tr>
                  			
                <tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="30%">Date Found :</td>
                  <td valign="top" align="left" class="input_txt" width="30%">
                  <%-- <input type="text" name="date_found" class="input_txtbx" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${correctiveAndPreventiveActions.date_found}" /><br/><span style="color: red;font-style:italic;"><form:errors path="CorrectiveAndPreventiveActions.date_found"></form:errors></span></td> --%>
                  <select name="date_found" id="datepicker" class="input_txtbx" style="height:20px;">
                  <option valule="">--Select--</option>
                  <c:forEach items="${nonConformanceForm.nonconformance}" var="nonconformance" varStatus="true">
                     <option value="${nonconformance.date_found}"<c:if test="${nonconformance.date_found == correctiveAndPreventiveActions.date_found}"><c:out value="selected"/></c:if>>${nonconformance.date_found}</option>
                  </c:forEach>
                  </select><span style="color: red;font-style:italic;" id="datepickererr"><form:errors path="CorrectiveAndPreventiveActions.date_found"></form:errors></span>
                  </td>
                  

                  <td valign="top" align="left" class="input_txt" width="30%"> Type of NC :</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><div id="type_of_nc">
                  <%-- <input type="text" name="type_of_nonconformance" class="input_txtbx" id="type_of_nc" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${correctiveAndPreventiveActions.type_of_nonconformance}"></c:out>' /><br/><span style="color: red;font-style:italic;"><form:errors path="CorrectiveAndPreventiveActions.type_of_nonconformance"></form:errors></span>
                   --%></div>
                  </td>
                </tr>
                
			<tr class="row2">
				<td valign="top" align="left" class="input_txt" width="30%">Temporary Action :</td>               
                <td valign="top" align="left" class="input_txt" width="30%">
                <div id="temporary_action">
                <%-- <textarea class="input_txtbx1"  name="temporary_action"  style="width:55%; height: 70px;">${correctiveAndPreventiveActions.temporary_action}</textarea><span style="color: red;font-style:italic;"><form:errors path="CorrectiveAndPreventiveActions.temporary_action"></form:errors></span>
                 --%></div>
                </td>
            	
            	<td valign="top" align="left" class="input_txt" width="30%">Nature of NC :</td>      
				<td valign="top" align="left" class="input_txt" width="30%"><div id="nature_of_nc">
				<textarea class="input_txtbx1"  id="nature_of_nc" name="nature_of_nc" style="width:100%; height: 70px;">${correctiveAndPreventiveActions.nature_of_nc}</textarea><span style="color: red;font-style:italic;"><form:errors path="CorrectiveAndPreventiveActions.nature_of_nc"></form:errors></span>
				 </div>
				</td>
            </tr>
            <tr class="row2">
              <td valign="top" align="left" class="input_txt"> CAPA Requestor :</td>
			  <td valign="top" align="left" class="input_txt">
				           <select name="capa_requestor" class="input_txtbx" style="height:20px;" id="capa_requestor">
						                  <option value="">--Select--</option>
						                  <option <c:if test="${correctiveAndPreventiveActions.capa_requestor eq 'name1'}"><c:out value="Selected"/></c:if> value="name1" >name1</option>
										  <option <c:if test="${correctiveAndPreventiveActions.capa_requestor eq 'name2'}"><c:out value="Selected"/></c:if> value="name1">name2</option>
										  <option  <c:if test="${correctiveAndPreventiveActions.capa_requestor eq 'name3'}"><c:out value="Selected"/></c:if> value="name3">name3</option>
				           </select> <span style="color: red;font-style:italic;" id="capaerror"></span><form:errors path="CorrectiveAndPreventiveActions.capa_requestor"></form:errors></td>	
			  <td valign="top" align="left" class="input_txt"> Use 5 Whys's in system(Y/N)<span>(*Optional)</span> :</td>
		      <td><input type="checkbox" name="use_5_why_in_system" value="use_5_why_in_system" id="use_5_why_in_system"/></td>					
			</tr> 
				
            <tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="30%"> Request Date :</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="request_date" class="input_txtbx" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${correctiveAndPreventiveActions.request_date}" /><span style="color: red;font-style:italic;" id="datepicker2err"></span><form:errors path="CorrectiveAndPreventiveActions.request_date"></form:errors></td>
                  
                  <td valign="top" align="left" class="input_txt" id="why?" width="20" style="display:none;">Why's?'
				   	 <input type="checkbox" name="why1" value="why1" id="0"/></td>
				  <td valign="top" align="left" class="input_txt" width="70% " id="5why" style="display:none;">
					  <textarea class="input_txtbx"  name="why" id="why" style="width:98%; height: 70px;">${correctiveAndPreventiveActions.why}</textarea><br/><span style="color: red;font-style:italic;" id="whyerr"></span><form:errors path="CorrectiveAndPreventiveActions.why"></form:errors></td>			
             </tr>	
             
            <tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="30%"> CAPA Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="capa_due_date" class="input_txtbx" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${correctiveAndPreventiveActions.capa_due_date}" /><span style="color: red;font-style:italic;" id="datepicker3err"></span><form:errors path="CorrectiveAndPreventiveActions.capa_due_date"></form:errors></td>
                 
              
                </tr>
            <tr class="row1">
              <td valign="top" align="left" class="input_txt">Assigned Team Leader :</td>
						           <td valign="top" align="left" class="input_txt">
				                  		<select name="assigned_team_leader" id="team_leader" class="input_txtbx" style="height:20px;">
						                  <option value="">--Select--</option>
						                       <option <c:if test="${correctiveAndPreventiveActions.assigned_team_leader eq 'name1'}"><c:out value="Selected"/></c:if> value="name1" >name1</option>
											<option <c:if test="${correctiveAndPreventiveActions.assigned_team_leader eq 'name2'}"><c:out value="Selected"/></c:if> value="name1">name2</option>
											<option  <c:if test="${correctiveAndPreventiveActions.assigned_team_leader eq 'name3'}"><c:out value="Selected"/></c:if> value="name3">name3</option>
				                 </select>
				                 <span style="color: red;font-style:italic;" id="leadererror"></span><form:errors path="CorrectiveAndPreventiveActions.assigned_team_leader"></form:errors>
				                 
				                   	</td>	
                 </tr>
                  <tr class="row2">
                 <td valign="top" align="left" class="input_txt" width="30%">Team Member(s) :</td>      
						         	 <td valign="top" align="left" class="input_txt" width="30%"><textarea class="input_txtbx" onInput="return validatename(id);"  name="team_members"  id="team_member" style="width:78%; height: 70px;">${correctiveAndPreventiveActions.team_members}</textarea><span style="color: red;font-style:italic;" id="membererror"></span><form:errors path="CorrectiveAndPreventiveActions.team_members"></form:errors></td>
                <td valign="top" align="left" class="input_txt" width="30%">Root-Cause Statement :</td>               
                  <td valign="top" align="left" class="input_txt" width="30%"><textarea class="input_txtbx"  name="root_cause_statement"  id="root_cause_statement" onInput="return validatename(id);" style="width:100%; height: 70px;">${correctiveAndPreventiveActions.root_cause_statement}</textarea><span style="color: red;font-style:italic;" id="rooterror"><form:errors path="CorrectiveAndPreventiveActions.root_cause_statement"></form:errors></td>
               
              </tr>
                 <tr class="row1">
                  <td valign="top" align="left" class="input_txt" width="30%">Root-Cause Analysis File :</td>
                  
                  <td valign="top" align="left" class="input_txt" width="30%"><input type="text" name="root_cause_analysis_file" class="input_txtbx" id="root_cause_analysis_file" onInput="return validatename(id);" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${correctiveAndPreventiveActions.root_cause_analysis_file}"></c:out>' /><br/><span id="root1error" style="color: red;font-style:italic;"></span><form:errors path="CorrectiveAndPreventiveActions.root_cause_analysis_file"></form:errors></td>
               <!-- <td valign="top" align="left" class="input_txt" > Upload External Analysis(Y/N)<span>(*Optional)</span></td>
				                   	<td><input type="checkbox" name="upload_external_analysis" id="externalfile" value="upload_external_analysis" id="0"/></td>
						 -->             	  <td valign="top" align="left" class="input_txt">Upload External Analysis(Y/N)<span>(*Optional)</span> :</td>
				  <td> <input type="checkbox" name="upload_external_analysis" value="upload_external_analysis" id="externalfile" 

onclick="Upload();"
				                  <c:if test="${ correctiveAndPreventiveActions.upload_external_analysis == 

'upload_external_analysis'}"><c:out value="Checked=checked"/></c:if>/>
				  <td>
				  
				  	 </tr>
			 <tr class="row1" id="id_file" >
			 <td valign="top" align="left" class="input_txt" width="30%"><input type="hidden"/></td>
			 <td valign="top" align="left" class="input_txt" width="30%"><input type="hidden"/></td>
             <td valign="top" align="left" class="input_txt" width="30%">Upload the File :</td>
             <td valign="top" align="left" class="input_txt" width="30%"> <input name="attachments"  type="file" /><span style="color: red;font-style:italic;" id="fileerror"></span><div  style="color:red; font-weight:bold;" > <c:out 

 value="${correctiveAndPreventiveActions.attachment_name}"  ></c:out></div></td>
                 
                   </tr>
						<!-- 
							</tr>
				<tr class="row2" id="upload" style="display:none;">
				 <td valign="top" align="left" class="input_txt" width="30%" >Upload</td>
                  <td valign="top" align="left" class="input_txt" width="30%">
                  
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
                  <td valign="top" align="left" class="input_txt" width="20%">Action :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="action" id="action" class="input_txtbx" onInput="return validatename(id);" value="<c:out value="${correctiveAndPreventiveActions.action}"/>"/><br/><span style="color: red;font-style:italic;" id="actionerror"></span><form:errors path="CorrectiveAndPreventiveActions.action"></form:errors></td>
                <td valign="top" align="left" class="input_txt" width="20%">Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" class="input_txtbx" id="datepicker6" name="due_date" value="<c:out value="${correctiveAndPreventiveActions.due_date}"/>"/><br/><span style="color: red;font-style:italic;" id="datepicker6err"></span><form:errors path="CorrectiveAndPreventiveActions.due_date"></form:errors></td>
                <td valign="top" align="left" class="input_txt" width="20%">Verified By :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" class="input_txtbx" name="verified_by" id="verified_by" onInput="return validatename(id);" value="<c:out value="${correctiveAndPreventiveActions.verified_by}"/>"/><br/><span style="color: red;font-style:italic;" id="verifiedbyerror"></span><form:errors path="CorrectiveAndPreventiveActions.verified_by"></form:errors></td>
               </tr>
                    <tr class="row2">
                     <td valign="top" align="left" class="input_txt" width="20%">Responsibity :</td>
                     <td valign="top" align="left" class="input_txt"width="20%">
				                  		<select name="responsibility" class="input_txtbx" style="width:99%; height:19.5px;" id="responsibility">
						                 <option value="">-select-</option>
						                  <c:forEach items="${hRandTrainingForm.hRandTrainings}" var="hrandtrainings" varStatus="true">
               <option value="<c:out value="${hrandtrainings.name}"/>"><c:out value="${hrandtrainings.name}"/></option>
               </c:forEach>
				                 </select>
				           				                 <span style="color: red;font-style:italic;" id="responsibilityerror"></span><form:errors path="CorrectiveAndPreventiveActions.responsibility"></form:errors>
				                   	</td>	
                     
                     <td valign="top" align="left" class="input_txt" width="20%">Completion Date :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" id="datepicker4" class="input_txtbx" name="completion_date" value="<c:out value="${correctiveAndPreventiveActions.completion_date}"/>"/><br/><span style="color: red;font-style:italic;" id="datepicker4err"></span><form:errors path="CorrectiveAndPreventiveActions.completion_date"></form:errors></td>
                <td valign="top" align="left" class="input_txt" width="20%">Verification Date :</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" id="datepicker5" class="input_txtbx" name="verification_date" value="<c:out value="${correctiveAndPreventiveActions.verification_date}"/>"/><br/><span style="color: red;font-style:italic;" id="datepicker5err"></span><form:errors path="CorrectiveAndPreventiveActions.verification_date"></form:errors></td>
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
				  <td valign="top" align="center"><input type="submit" value="Submit" class="submit_btn1" onclick="return validation();">
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
			
		var two_drop=response.split("<split>");
    	
		$('#source_of_nonconformance').html(two_drop[0]).value=response;
		$('#type_of_nc').html(two_drop[1]).value=response;
		$('#nature_of_nc').html(two_drop[2]).value=response;
		$('#temporary_action').html(two_drop[3]).value=response;
		
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
<script>

$(function() {
	$("#inp_external_id").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	
$(function() {
	$("#root_cause_analysis_file").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	
$(function() {
	$("#action").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	
	
$(function() {
	$("#verified_by").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	
$(function() {
	$("#team_member").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	

$(function() {
	$("#root_cause_statement").on("keypress", function(e) {
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});	
</script>
<script>
function validatename(id)
{
	var textInput = document.getElementById(id).value;
	textInput = textInput.replace(/[^A-Za-z ]/g, "");
	document.getElementById(id).value = textInput;
}
function validatealphanumeric(){

	var textInput = document.getElementById("inp_external_id").value;
    textInput = textInput.replace(/[^A-Z0-9]/g, "");
    document.getElementById("inp_external_id").value = textInput;
}

</script>
<script>
function validation()
{
	
	var error="";
	var date = /^\d{4}-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])$/;
	var datepicker = document.getElementById('datepicker').value;
	var datepicker2 = document.getElementById('datepicker2').value;
	var datepicker3 = document.getElementById('datepicker3').value;
	var datepicker4 = document.getElementById('datepicker4').value;
	var datepicker5 = document.getElementById('datepicker5').value;
	var datepicker6 = document.getElementById('datepicker6').value;
	 var responsibility = document.getElementById('responsibility').value;
	var nc_id = document.getElementById('nc_id').value;
	var external = document.getElementById('inp_external_id').value;
	var capa = document.getElementById('capa_requestor').value;
	var team_leader = document.getElementById('team_leader').value;
	var team_member = document.getElementById('team_member').value;
	var root_cause_statement = document.getElementById('root_cause_statement').value;
	var root_cause_analysis_file = document.getElementById('root_cause_analysis_file').value;
	var action = document.getElementById('action').value;
	var verified_by = document.getElementById('verified_by').value;
	 var usewhy = document.getElementById('use_5_why_in_system').checked;
	var why = document.getElementById('why').value;
	var upload = document.getElementById('externalfile').checked;
	var file = document.getElementById('id_file').value;
	
 	if(!usewhy=="" && why=="")
 		{
 		
 		document.getElementById('whyerr').innerHTML="Required Field Should Not be Empty";
 		error="true";
 		}
 	else if((why.length < 4) || (why.length > 45))
	{
	
	document.getElementById("whyerr").innerHTML="Should be of length 4 to 32";	
	error="true";
	}
 	else
 		{
 		document.getElementById('whyerr').innerHTML="";
 		}
 	if(!upload=="" )
 		{
 		
 		document.getElementById('fileerror').innerHTML="Please Upload a File";
 		error="true";
 		}
 	else
 		{
 		document.getElementById('fileerror').innerHTML="";
 		}
 
	if(datepicker == "")
	 {
		
	 document.getElementById("datepickererr").innerHTML="Required Field Should not be Empty";
	 error="true";
	 
	 }
	 
	 else
	 {
	 document.getElementById("datepickererr").innerHTML="";
	 }

	if(datepicker2 == "")
	 {
		
	 document.getElementById("datepicker2err").innerHTML="Required Field Should not be Empty";
	 error="true";
	 
	 }
	 else if(datepicker2.match(date))
	 {
		 
	 document.getElementById("datepicker2err").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker2err").innerHTML="Invalid Date";
	 error="true";
	 }

	if(datepicker3 == "")
	 {
	 document.getElementById("datepicker3err").innerHTML="Required Field Should not be Empty";
	 error="true";
	 
	 }
	 else if(datepicker3.match(date))
	 {
	 document.getElementById("datepicker3err").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker3err").innerHTML="Invalid Date";
	 error="true";
	 }
	if(datepicker4 == "")
	 {
	 document.getElementById("datepicker4err").innerHTML="Required Field Should not be Empty";
	 error="true";
	 
	 }
	 else if(datepicker4.match(date))
	 {
	 document.getElementById("datepicker4err").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker4err").innerHTML="Invalid Date";
	 error="true";
	 }

	if(datepicker5 == "")
	 {
	 document.getElementById("datepicker5err").innerHTML="Required Field Should not be Empty";
	 error="true";
	 
	 }
	 else if(datepicker5.match(date))
	 {
	 document.getElementById("datepicker5err").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker5err").innerHTML="Invalid Date";
	 error="true";
	 }

	if(datepicker6 == "")
	 {
	 document.getElementById("datepicker6err").innerHTML="Required Field Should not be Empty";
	 error="true";
	 
	 }
	 else if(datepicker6.match(date))
	 {
	 document.getElementById("datepicker6err").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker6err").innerHTML="Invalid Date";
	 error="true";
	 }

 	if(nc_id=="")
	{
 		
		
		document.getElementById("iderror").innerHTML="Required Field Should Not Empty";	
		error="true";
		
	}
	else{
		
		document.getElementById('iderror').innerHTML="";
	}
	if(capa=="")
	{
		
		document.getElementById("capaerror").innerHTML="Required Field Should Not Empty";	
		error="true";
		
	}
	else{
		document.getElementById('capaerror').innerHTML="";
	}
	if(external=="")
	{
		
		document.getElementById("externalerror").innerHTML="Required Field Should Not Empty";	
		error="true";
		
	}
	else{
		document.getElementById('externalerror').innerHTML="";
	}
		if(team_leader=="")
	{
	
		document.getElementById("leadererror").innerHTML="Required Field Should Not Empty";	
		error="true";
		
	}
	else if((team_leader.length < 4) || (team_leader.length > 45))
		{
		
		document.getElementById("leadererror").innerHTML="Should be of length 4 to 32";	
		error="true";
		}
	else{
		document.getElementById('leadererror').innerHTML="";
	}
	if(team_member=="")
	{
		document.getElementById("membererror").innerHTML="Required Field Should Not Empty";	
		error="true";
		
	}
	else if((team_member.length < 4) || (team_member.length > 45))
		{
		
		document.getElementById("membererror").innerHTML="Should be of length 4 to 32";	
		error="true";
		}
	else{
		document.getElementById('membererror').innerHTML="";
	}
	
	if(root_cause_statement=="")
	{
		document.getElementById("rooterror").innerHTML="Required Field Should Not Empty";	
		error="true";
		
	}
	else if((root_cause_statement.length < 4) || (root_cause_statement.length > 45))
		{
		
		document.getElementById("rooterror").innerHTML="Should be of length 4 to 32";	
		error="true";
		}
	else{
		document.getElementById('rooterror').innerHTML="";
	}
	if(root_cause_analysis_file=="")
	{
		document.getElementById("root1error").innerHTML="Required Field Should Not Empty";	
		error="true";
		
	}
	else if((root_cause_analysis_file.length < 4) || (root_cause_analysis_file.length > 45))
		{
		
		document.getElementById("root1error").innerHTML="Should be of length 4 to 32";	
		error="true";
		}
	else{
		document.getElementById('root1error').innerHTML="";
	}
	if(action=="")
	{
		document.getElementById("actionerror").innerHTML="Required Field Should Not Empty";	
		error="true";
		
	}
	else if((action.length < 4) || (action.length > 45))
		{
		document.getElementById("actionerror").innerHTML="Should be of length 4 to 32";	
		error="true";
		}
	else{
		document.getElementById("actionerror").innerHTML="";
	}
	   if(verified_by=="")
	{
		document.getElementById("verifiedbyerror").innerHTML="Required Field Should Not Empty";	
		error="true";
		
	}
	else if((verified_by.length < 4) || (verified_by.length > 45))
		{
		
		document.getElementById("verifiedbyerror").innerHTML="Should be of length 4 to 32";	
		error="true";
		}
	else{
		document.getElementById('verifiedbyerror').innerHTML="";
	} 
	 if(responsibility=="")
	{
		document.getElementById("responsibilityerror").innerHTML="Required Field Should Not Empty";	
		error="true";
		
	}
	else{
		document.getElementById('responsibilityerror').innerHTML="";
 	}
	
 
	  if(error == "true")
		{
		return false;
		}
}
	
</script>
<script>
window.onload = function() {
	doAjaxPost();
	};
</script>
<jsp:include page="footer.jsp"></jsp:include>
