<%--  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
	<script src="/QMS_App/resources/js/jquery.js"></script>
	<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
 <form method="post" enctype="multipart/form-data" action="updateform">
 
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
     <tr>
        <td>
        <div>
  <ul class="horizmenu">
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="adddocument" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Document</span>
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewdocuments" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Document</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="document_report" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Document report</span>
									
								</a>
							</li>
				             <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addform" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Form</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_form" class="<c:choose>
								<c:when test="${menu=='document'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Form</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="form_report" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Form Report</span>
									
								</a>
							</li>
				            </ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>&nbsp;&nbsp;Update Form</h2>
            </div>
            <div class="contentbox">
    <c:set value="${formForm.form[0]}" var="form"/>        
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<td colspan="3">
	
			<!-- 											<tr>
															<td align="left" valign="top" width="50%"
																style="padding-right: 25px;">
																  <div align="left">
           -->
           <tr><td>    <h2>Form Details</h2>
            
          
           <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
    		
              <tr class="row2">
                            <td valign="middle" align="left" class="input_txt"><span class="err">*</span>Form/Rec ID :</td>
			<td valign="top" align="left" class="input_txt" >
			
			<a id="formid">
			
					<input type="hidden" id="formid"class="input_txtbx1"  onmouseover="showTooltip('tooltip_id','inp_id3');" 
					onmouseout="hideTooltip('tooltip_id');"
					name="form_or_rec_id" />${form.form_or_rec_id}</a>
																		
													 
                        
              
              
               <select name="document_type_id" id="document_type_id" class="input_cmbbx1" style="display:none;">
               <option value = "">Select Form Prefix</option>
			                <c:forEach items="${formFormPrefix.formPrefixs}" var="formprefix" varStatus="status">
        				       <option value="${formprefix.form_prefix}">${formprefix.form_prefix}</option>
			                  </c:forEach>
               </select>
              
                <label id="changeafter" style="display:none;" ></label> 
                
                  <input type="text" value="" id="form_or_rec_id"  style="display:none;height:22px;background-color:lightgrey;width:50px;border:none;"  onblur="change_to_label()"/>
                <input type="hidden" name=form_or_rec_id id="generated_id"  value=""/> 
               <label id="change" ><a href="#" style="text-decoration: none;" onclick="show_edit()">&nbsp;&nbsp;Change</a>  </label>
            <span class="err"><form:errors path="Form.form_or_rec_id"></form:errors></span>
            
               
              
																		<td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Responsibility :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="responsibility"
																			value="${form.responsibility}" /><br/><span class="err"><form:errors path="Form.responsibility"></form:errors></span>
																		
																		</td>
																		              
																		<td valign="middle" id="id_location_lbl" align="left" class="input_txt" ><label id="location_label" ><span class="err">*</span> Location:</label><label id="file_upload_label" style="display:none;"><span class="err">*</span> Upload File:</label></td>
               <td valign="top" align="left" id="id_location_txt" class="input_txt" >
               
               <select id="location_text" name="location" class="input_cmbbx1" style="width:200px;">
               <option <c:if test="${form.location eq 'Lab'}"><c:out value="Selected"/></c:if>value="Lab">Lab</option>
               <option value="Shop Floor" <c:if test="${form.location eq 'Shop Floor'}"><c:out value="Selected"/></c:if>>Shop Floor</option>
               <option value="Office" <c:if test="${form.location eq 'Office'}"><c:out value="Selected"/></c:if>>Office</option>
               </select>
               </td>
																		
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		

             </tr>
              
              <tr class="row1">
               <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Form/Rec Title:</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="form_or_rec_title"
																			value="${form.form_or_rec_title}" /><br/><span class="err"><form:errors path="Form.form_or_rec_title"></form:errors></span>
																		
																		</td>
																		<td valign="middle" align="left" class="input_txt" width="20%"><span class="err">*</span>Process:</td>
               <td valign="top" align="left" class="input_txt" >
               
               <select name="process" id="id_inpprocess" class="input_cmbbx1" style="width:200px;">
               <option value="">--Select--</option>
                <c:forEach items="${processForm.processes}" var="processes" varStatus="true">
               <option value="<c:out value="${processes.process_name}"/>"><c:out value="${processes.process_name}"/></option>
               </c:forEach>               
               </select>
               
                <select name="process" id="id_inpprocess" onchange="doAjaxPost_for_process();" class="input_cmbbx1" style="width:200px;">
							 
			                <c:forEach items="${processForm.processes}" var="processes" varStatus="status">
        				       <option value="${processes.process_name}"<c:if test="${processes.process_name == form.process}"><c:out value="selected"/></c:if>>${processes.process_name}</option>
			                  </c:forEach>
			                 </select>
         
               
																		
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td> 
               <td valign="top" align="left" class="input_txt" width="20%"></td>
																		
				             </tr>
              
              <tr class="row2">
                            <td valign="middle" align="left" class="input_txt" ><span class="err">*</span>Media Type:</td>
               <td valign="top" align="left" class="input_txt" width="">
               
                <!-- <input type="radio" name="media_type" onchange="toggle2(this.value);" value="0"   id="id_hardcopy"  checked/>Hard Copy&nbsp;&nbsp;&nbsp;<input type="radio" name="media_type" onchange="toggle2(this.value);" value="1"  id="id_electronic" onchange="toggle2(this.value);" />Electronic&nbsp;&nbsp;&nbsp;<br/><span class="err"></span> -->
                 
                 <c:choose>
               <c:when test="${form.media_type=='hardcopy'}">
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="hardcopy"   id="id_hardcopy"  checked/>Hard Copy&nbsp;&nbsp;&nbsp;
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="electronic"  id="id_electronic" onchange="toggle2(this.value);" />Electronic&nbsp;&nbsp;<br>
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="both"  id="id_both" onchange="toggle2(this.value);"/> Both&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>    
               </c:when>
               <c:when test="${form.media_type=='electronic'}">
               <input type="radio" name="media_type" onchange="toggle2(this.value);" value="hardcopy"   id="id_hardcopy" />Hard Copy&nbsp;&nbsp;&nbsp;
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="electronic"  id="id_electronic" onchange="toggle2(this.value);" checked />Electronic&nbsp;&nbsp;<br>
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="both"  id="id_both" onchange="toggle2(this.value);"/> Both&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>    
            	   </c:when>
               <c:when test="${form.media_type=='both'}">
               <input type="radio" name="media_type" onchange="toggle2(this.value);" value="hardcopy"   id="id_hardcopy" />Hard Copy&nbsp;&nbsp;&nbsp;
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="electronic"  id="id_electronic" onchange="toggle2(this.value);" />Electronic&nbsp;&nbsp;<br>
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="both"  id="id_both" onchange="toggle2(this.value);" checked/> Both&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>    
               </c:when>
               </c:choose>
               </td>
                <c:choose>
                <c:when test="${form.media_type=='hardcopy'}">
               <td valign="middle" id="id_location_lbl" align="left" class="input_txt" width="20%"><label id="location_label" ><span class="err">*</span> Location:</label><br><label id="file_upload_label" style="display:none;"><span class="err">*</span> Upload File:</label></td>
               <td valign="middle" align="left" id="id_location_txt" class="input_txt" width="25%">
               <select id="location_text" name="location" class="input_cmbbx1" style="width:200px;">
              <option value="">--Select--</option>
                <c:forEach items="${formLocationForm.formLocations}" var="formlocation" varStatus="status">
                  
        				       <option value="${formlocation.form_location}"<c:if test="${formlocation.form_location == form.location}"><c:out value="selected"/></c:if>>${formlocation.form_location}</option>
			                  </c:forEach>
			                   </select><br>
              <input name="attachments" style="display:none;" id="id_file" type="file" /> <br/> 
              <span class="err"><form:errors path="form.location"></form:errors></span>
               </td>
              </c:when>
               </c:choose>
               <c:choose>
                <c:when test="${form.media_type=='electronic'}">
               <td valign="middle" id="id_location_lbl" align="left" class="input_txt" width="20%"><label id="location_label" style="display:none"><span class="err">*</span> Location:</label><br><label id="file_upload_label"><span class="err">*</span> Upload File:</label></td>
               <td valign="middle" align="left" id="id_location_txt" class="input_txt" width="25%">
               <select id="location_text" name="location" class="input_cmbbx1" style="display:none;width:200px;">
              
              <option value="">--Select--</option>
                  <c:forEach items="${formLocationForm.formLocations}" var="formlocation" varStatus="status">
                  
        				       <option value="${formlocation.form_location}"<c:if test="${formlocation.form_location == form.location}"><c:out value="selected"/></c:if>>${formlocation.form_location}</option>
			                  </c:forEach>
               </select><br>
              
               <label id="label1" >
              <input name="filename" type="hidden" id="file_name"/>${form.attachment_name}
               <input name="attachments" id="id_file" type="file" style="display:none;" value="${form.attachment_name }"/>
               
              <label id="change_label" ><a href="#" onclick="change_file()">Change</a></label></label>
              <span class="err"><form:errors path="form.location"></form:errors></span>
               </td>
              </c:when>
             
              <c:when test="${form.media_type=='both'}">
              <td valign="middle" id="id_location_lbl" align="left" class="input_txt" width="20%"><label id="location_label"><span class="err">*</span> Location:</label><br><br><label id="file_upload_label"><span class="err">*</span> Upload File:</label></td>
               <td valign="top" align="left" id="id_location_txt" class="input_txt" width="25%">
               <select id="location_text" name="location" class="input_cmbbx1">
              <option value="">--Select--</option>
                <c:forEach items="${formLocationForm.formLocations}" var="formlocation" varStatus="status">
                  
        				       <option value="${formlocation.form_location}"<c:if test="${formlocation.form_location == form.location}"><c:out value="selected"/></c:if>>${formlocation.form_location}</option>
			                  </c:forEach></select><br><br>
               <input name="filename" type="hidden" id="file_name"/>${form.attachment_name}
               <input name="attachments" id="id_file" type="file" style="display:none;" value="${form.attachment_name}"/>
              <label id="change_label" ><a href="#" onclick="change_file()">Change</a></label>
              <span class="err"><form:errors path="form.location"></form:errors></span>
               </td>
              </c:when>
               </c:choose>
               </tr>
               <tr class="row1">
																		              <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Retention Time:</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="retention_time"
																			value="${form.retention_time}" />
																			 <select id="retention" name="retention_time" class="input_cmbbx1" style="width:200px;">
              <option value="">--Select--</option>
               <option value="1Week" <c:if test="${form.retention_time=='1Week'}"><c:out value="Selected"/></c:if>>1Week</option>
               <option value="1Month" <c:if test="${form.retention_time=='1Month'}"><c:out value="Selected"/></c:if>>1Month</option>
               <option value="1Year" <c:if test="${form.retention_time=='1Year'}"><c:out value="Selected"/></c:if>>1Year</option>
               </select>
																		
																		</td>
																		<td valign="middle" align="left" class="input_txt">Form:</td>
														
																		<td valign="top" align="left" class="input_txt">
														<!-- <input
															type="radio" name="form" value="1"
															class="input_txt" onchange="toggle2(this.value)">Yes&nbsp;&nbsp;&nbsp;<input
															type="radio" name="form" value="0"
															class="input_txt" checked onchange="toggle2(this.value)">No -->
															
															<input type="radio" name="form" value="Yes"  class="input_txt"   <c:if test="${form.form=='Yes'}"><c:out value="Checked=checked"/></c:if>>Yes&nbsp;&nbsp;&nbsp;
				  											<input type="radio" name="form" value="No"  class="input_txt"  <c:if test="${form.form=='No'}"><c:out value="Checked=checked"/></c:if>>No&nbsp;&nbsp;&nbsp;
				  
																		
	</table>
            </div>
                            
             
            <!--  <div id="child_table" style="display:none;"> -->
<br>
              
             <div style="border:#993300 2px solid; padding:15px; margin-bottom:15px;">
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
    
             
             <table cellpadding="0" cellspacing="0" border="0" width="100%" id="displayold">
             <tr class="row2">
             <td valign="top" align="left" width="15%">
            <!--  <a href="#" style="padding-right:10px;" onclick="reset_form()">Enter New Revision</a> -->
             <input type="button" value="Enter New Revision" onClick="reset_form()"/>
             </td>
             </tr>
              <tr class="row1">
            															  <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Revision No. (optional):</td>
																		<td valign="top" align="left" class="input_txt">
																		
																  <input type="text" name="revision_id" id="revisionid" value="${form.revision_id}" onclick="revision_change()" class="input_cmbbx1" >
              																	
             <c:forEach items="${revisionFormForm.revisionForms}" var="revision" varStatus="true">
               
                
               <option value="${revision.revision_id}"<c:if test="${revision.revision_id == form.revision_id}"><c:out value="selected"/></c:if>>${revision.revision_id}</option>
                
               </c:forEach>
               <option value=""/>
               </select>													
																		<br/><span class="err"><form:errors path="Form.revision_id"></form:errors></span>
																		</td>
																		              <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Effective Date :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="datepicker"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="effective_date"
																			value="${form.effective_date}" />
																			<input
																			type="hidden" class="input_txtbx1" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="auto_no"
																			value="${form.auto_number}" />
																			<br/><span class="err"><form:errors path="Form.effective_date"></form:errors></span>
																		</td>  
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td>      
																		  
																		</tr>
              
              <tr class="row2">
              																	 <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Form/Rec ID :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="form_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="document_id"
																			value="${form.form_or_rec_id}" style="display:none;" />
																			<b id="hide_id">${form.form_or_rec_id}</b><br/><span class="err"><form:errors path="Form.document_id"></form:errors></span>
																		</td>
                          
																		              <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Approver1(Process Owner) :</td>
																		<td valign="top" align="left" class="input_txt">
																		
																		<span id="process_owner_id"></span>
				<input type="hidden" class="input_txtbx1" id="inp_external_id" name="approver1" onchange="Approver1();" value="${form.approver1}" /> ${form.approver1}
																			
																			
																			<br/><span class="err"><form:errors path="Form.approver1"></form:errors></span>
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td> </tr>
              
              <tr class="row1">
                            <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Issuer :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="issuer"
																			value="${form.issuer}" />
																			 <select name="issuer" id="issuer" class="input_cmbbx1" style="width:200px;">
               <option value="">--Select--</option> 
               <c:forEach items="${employeeForm.employees}" var="employees" varStatus="true">
               <option value="<c:out value="${employees.name}"/>" <c:if test="${form.issuer==employees.name}"><c:out value="Selected"/></c:if>><c:out value="${employees.name}"/></option>
               </c:forEach>              
               </select>
																			
																			<br/><span class="err"><form:errors path="Form.issuer"></form:errors></span>
																		</td>
																		
																		
																		 <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Comments :</td>
																		<td valign="top" align="left" class="input_txt">
																		<input
																			type="text" class="input_txtbx1" id="comments"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="comments"
																			value="${form.comments}" />
																		
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		
              </tr>
              
              <tr class="row2">
                           
</tr>
</table>
</div>
              </tr>
              
              </table>
                  
              </div>
              </td>

              
              <tr class="row1">
              <td colspan="2" align="right">
             <input type="submit" id="export"  name="export" value="Submit" class="submit_btn1"></td>
             <td colspan="3">
            <input type="reset" id="reset_export" name="reset_export" value="Reset" class="submit_btn1"></td>
             </tr>
</table>
</div>
</td>
</tr>
</table>
</div>
</form>

            <script>
 $(function() {
	 
           $( "#datepicker" ).datepicker();
           $( "#datepicker123" ).datepicker();
         });
 function change_file(){
		document.getElementById("id_file").style.display="block";
		document.getElementById("file_name").style.display="none";
		
	}
</script>
     <script type="text/javascript">
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
function toggle2(value){
  
    var e = document.getElementById('location_label');
    var e1 = document.getElementById('file_upload_label');
    var e2=document.getElementById('location_text');
    var e3=document.getElementById('id_file');
if(value=='electronic')
    {
	e.style.display="none";
	e1.style.display="block";
	e2.style.display="none";
	e3.style.display="block";
	document.getElementById('label1').style.display="block";
	
	
    }
else if(value=='hardcopy')
    {
	e.style.display="block";
	e1.style.display="none";
	e2.style.display="block";
	e3.style.display="none";
	document.getElementById('label1').style.display="none";
  
    }
else if(value=='both')
{
e.style.display="block";
e1.style.display="block";
e2.style.display="block";
e3.style.display="block";
}
    
}
</script>
<script type="text/javascript">
	function show_edit()
	{
		
		var element = document.getElementById('document_type_id');
		var element1 = document.getElementById('formid');
		var element2 = document.getElementById('change');
		var element3 = document.getElementById('form_or_rec_id');
		var element4 = document.getElementById('form_id');
		var element5 = document.getElementById('hide_id');
		
			element.style.display="block";
			element3.style.display="block";
			element1.style.display="none";
			element2.style.display="none";
			element4.style.display="block";
			element5.style.display="none";
			document.getElementById("changeafter").style.display="none";
		
	}

	function change_to_label()
	{
		
	   
		var type=document.getElementById('document_type_id');	
		
		var doc_id=document.getElementById('form_or_rec_id');	
		
		
		document.getElementById("changeafter").style.display="block";
		
		document.getElementById("changeafter").innerHTML = type.value+-+doc_id.value;
		
		
		var gen_id=document.getElementById("generated_id");
		gen_id.value=type.value+-+doc_id.value;
		document.getElementById('document_type_id').style.display="none";
		document.getElementById('form_or_rec_id').style.display="none";
		document.getElementById("change").style.display="block";
		if((gen_id.value)!= null)
		{
       	form_id.value=gen_id.value;
       
		}


		}
	function revision_change(){
		
		if(revisionid.value != null)
			{
				var value = revisionid.value;
				
				var inc = parseFloat('1');
			  revisionid.value = parseInt(value)+parseFloat(inc);
			}
	}
</script>	
<script language="JavaScript">
function reset_form()
{
	
	
	document.getElementById('revisionid').value="0";
	document.getElementById('datepicker').value="";
	document.getElementById('issuer').value="";
	document.getElementById('comments').value="";
	
	
	
    
}
</script>
   <jsp:include page="footer.jsp"></jsp:include>   
        
  --%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
	<script src="/QMS_App/resources/js/jquery.js"></script>
	<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
 <form method="post" enctype="multipart/form-data" action="updateform">
 
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
     <tr>
        <td>
        <div>
  <ul class="horizmenu">
						  <li  style=" float:left;margin-right:10px;text-transform:uppercase;">
								<a href="addform" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Add Form
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:10px;text-transform:uppercase;">
								<a href="view_form" class="<c:choose>
								<c:when test="${menu=='document'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactiveactive</c:otherwise></c:choose>">
									View Form
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:10px;text-transform:uppercase;">
								<a href="form_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Form Report
									
								</a>
							</li>
							 
				            </ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>&nbsp;&nbsp;Update Form</h2>
            </div>
            <div class="contentbox">
            <h2><b>Form Details</b></h2>
    <c:set value="${formForm.form[0]}" var="form"/>        
	<table cellpadding="0" cellspacing="0" border="0" width="100%" style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
	
	          <tr class="row2">
                            <td valign="middle" align="left" class="input_txt"><span class="err">*</span>Form/Rec ID :</td>
			<td valign="top" align="left" class="input_txt" >
			
			<a id="formid">
			
					<input type="hidden" id="formid"class="input_txtbx1"  onmouseover="showTooltip('tooltip_id','inp_id3');" 
					onmouseout="hideTooltip('tooltip_id');"
					name="form_or_rec_id" />${form.form_or_rec_id}</a>
																		
													 
                        
              
              
               <select name="document_type_id" id="document_type_id" class="input_cmbbx1" style="display:none;">
               <option value = "">Select Form Prefix</option>
			                <c:forEach items="${formFormPrefix.formPrefixs}" var="formprefix" varStatus="status">
        				       <option value="${formprefix.form_prefix}">${formprefix.form_prefix}</option>
			                  </c:forEach>
               </select>
              
                <label id="changeafter" style="display:none;" ></label> 
                
                  <input type="text" value="" id="form_or_rec_id"  style="display:none;height:22px;background-color:lightgrey;width:50px;border:none;"  onblur="change_to_label()"/>
                <input type="hidden" name=form_or_rec_id id="generated_id"  value=""/> 
               <label id="change" ><a href="#" style="text-decoration: none;" onclick="show_edit()">&nbsp;&nbsp;Change</a>  </label>
            <span class="err"><form:errors path="Form.form_or_rec_id"></form:errors></span>
            
               
              
																		<td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Responsibility :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="responsibility"
																			value="${form.responsibility}" /><br/><span class="err"><form:errors path="Form.responsibility"></form:errors></span>
																		
																		</td>
																		              
																		<%-- <td valign="middle" id="id_location_lbl" align="left" class="input_txt" ><label id="location_label" ><span class="err">*</span> Location:</label><label id="file_upload_label" style="display:none;"><span class="err">*</span> Upload File:</label></td>
               <td valign="top" align="left" id="id_location_txt" class="input_txt" >
               
               <select id="location_text" name="location" class="input_cmbbx1" style="width:200px;">
               <option <c:if test="${form.location eq 'Lab'}"><c:out value="Selected"/></c:if>value="Lab">Lab</option>
               <option value="Shop Floor" <c:if test="${form.location eq 'Shop Floor'}"><c:out value="Selected"/></c:if>>Shop Floor</option>
               <option value="Office" <c:if test="${form.location eq 'Office'}"><c:out value="Selected"/></c:if>>Office</option>
               </select>
               </td> --%>
																		
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		

             </tr>
              
              <tr class="row1">
               <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Form/Rec Title:</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="form_or_rec_title"
																			value="${form.form_or_rec_title}" /><br/><span class="err"><form:errors path="Form.form_or_rec_title"></form:errors></span>
																		
																		</td>
																		<td valign="middle" align="left" class="input_txt" width="20%"><span class="err">*</span>Process:</td>
               <td valign="top" align="left" class="input_txt" >
               
              <%--  <select name="process" id="id_inpprocess" class="input_cmbbx1" style="width:200px;">
               <option value="">--Select--</option>
                <c:forEach items="${processForm.processes}" var="processes" varStatus="true">
               <option value="<c:out value="${processes.process_name}"/>"><c:out value="${processes.process_name}"/></option>
               </c:forEach>               
               </select> --%>
               
                <select name="process" id="id_inpprocess" onchange="doAjaxPost_for_process();" class="input_cmbbx1" style="width:200px;">
							 
			                <c:forEach items="${processForm.processes}" var="processes" varStatus="status">
        				       <option value="${processes.process_name}"<c:if test="${processes.process_name == form.process}"><c:out value="selected"/></c:if>>${processes.process_name}</option>
			                  </c:forEach>
			                 </select>
         
               
																		
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td> 
               <td valign="top" align="left" class="input_txt" width="20%"></td>
																		
				             </tr>
              
              <tr class="row2"><!-- 
                            <td valign="middle" align="left" class="input_txt" width="50%" ><span class="err">*</span>Media Type:</td>
               <td valign="top" align="left" class="input_txt" > -->
               
<td valign="middle" align="left" class="input_txt" width="40%"><span class="err">*</span>Media Type:</td>
               <td valign="top" align="left" class="input_txt">
               
                <!-- <input type="radio" name="media_type" onchange="toggle2(this.value);" value="0"   id="id_hardcopy"  checked/>Hard Copy&nbsp;&nbsp;&nbsp;<input type="radio" name="media_type" onchange="toggle2(this.value);" value="1"  id="id_electronic" onchange="toggle2(this.value);" />Electronic&nbsp;&nbsp;&nbsp;<br/><span class="err"></span> -->
                 
                 <c:choose>
               <c:when test="${form.media_type=='hardcopy'}">
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="hardcopy"   id="id_hardcopy"  checked/>Hard Copy&nbsp;&nbsp;&nbsp;
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="electronic"  id="id_electronic" onchange="toggle2(this.value);" />Electronic&nbsp;&nbsp;<br>
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="both"  id="id_both" onchange="toggle2(this.value);"/> Both&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>    
               </c:when>
               <c:when test="${form.media_type=='electronic'}">
               <input type="radio" name="media_type" onchange="toggle2(this.value);" value="hardcopy"   id="id_hardcopy" />Hard Copy&nbsp;&nbsp;&nbsp;
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="electronic"  id="id_electronic" onchange="toggle2(this.value);" checked />Electronic&nbsp;&nbsp;<br>
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="both"  id="id_both" onchange="toggle2(this.value);"/> Both&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>    
            	   </c:when>
               <c:when test="${form.media_type=='both'}">
               <input type="radio" name="media_type" onchange="toggle2(this.value);" value="hardcopy"   id="id_hardcopy" />Hard Copy&nbsp;&nbsp;&nbsp;
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="electronic"  id="id_electronic" onchange="toggle2(this.value);" />Electronic&nbsp;&nbsp;<br>
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="both"  id="id_both" onchange="toggle2(this.value);" checked/> Both&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>    
               </c:when>
               </c:choose>
               </td>
                <c:choose>
                <c:when test="${form.media_type=='hardcopy'}">
               <td valign="middle" id="id_location_lbl" align="left" class="input_txt" width="20%"><label id="location_label" ><span class="err">*</span> Location:</label><br><label id="file_upload_label" style="display:none;"><span class="err">*</span> Upload File:</label></td>
               <td valign="middle" align="left" id="id_location_txt" class="input_txt" width="25%">
               <select id="location_text" name="location" class="input_cmbbx1" style="width:200px;">
              <option value="">--Select--</option>
                <c:forEach items="${formLocationForm.formLocations}" var="formlocation" varStatus="status">
                  
        				       <option value="${formlocation.form_location}"<c:if test="${formlocation.form_location == form.location}"><c:out value="selected"/></c:if>>${formlocation.form_location}</option>
			                  </c:forEach>
			                   </select><br>
              <input name="attachments" style="display:none;" id="id_file" type="file" /> <br/> 
              <span class="err"><form:errors path="form.location"></form:errors></span>
               </td>
              </c:when>
               </c:choose>
               <c:choose>
                <c:when test="${form.media_type=='electronic'}">
               <td valign="middle" id="id_location_lbl" align="left" class="input_txt" width="20%"><label id="location_label" style="display:none"><span class="err">*</span> Location:</label><br><label id="file_upload_label"><span class="err">*</span> Upload File:</label></td>
               <td valign="middle" align="left" id="id_location_txt" class="input_txt" width="25%">
               <select id="location_text" name="location" class="input_cmbbx1" style="display:none;width:200px;">
              
              <option value="">--Select--</option>
                  <c:forEach items="${formLocationForm.formLocations}" var="formlocation" varStatus="status">
                  
        				       <option value="${formlocation.form_location}"<c:if test="${formlocation.form_location == form.location}"><c:out value="selected"/></c:if>>${formlocation.form_location}</option>
			                  </c:forEach>
               </select><br>
              
               <label id="label1" >
              <input name="filename" type="hidden" id="file_name"/>${form.attachment_name}
               <input name="attachments" id="id_file" type="file" style="display:none;" value="${form.attachment_name }"/>
               
              <label id="change_label" ><a href="#" onclick="change_file()">Change</a></label></label>
              <span class="err"><form:errors path="form.location"></form:errors></span>
               </td>
              </c:when>
             
              <c:when test="${form.media_type=='both'}">
              <td valign="middle" id="id_location_lbl" align="left" class="input_txt" width="20%"><label id="location_label"><span class="err">*</span> Location:</label><br><br><label id="file_upload_label"><span class="err">*</span> Upload File:</label></td>
               <td valign="top" align="left" id="id_location_txt" class="input_txt" width="25%">
               <select id="location_text" name="location" class="input_cmbbx1">
              <option value="">--Select--</option>
                <c:forEach items="${formLocationForm.formLocations}" var="formlocation" varStatus="status">
                  
        				       <option value="${formlocation.form_location}"<c:if test="${formlocation.form_location == form.location}"><c:out value="selected"/></c:if>>${formlocation.form_location}</option>
			                  </c:forEach></select><br><br>
               <input name="filename" type="hidden" id="file_name"/>${form.attachment_name}
               <input name="attachments" id="id_file" type="file" style="display:none;" value="${form.attachment_name}"/>
              <label id="change_label" ><a href="#" onclick="change_file()">Change</a></label>
              <span class="err"><form:errors path="form.location"></form:errors></span>
               </td>
              </c:when>
               </c:choose>
               </tr>
               <tr class="row1">
																		              <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Retention Time:</td>
																		<td valign="top" align="left" class="input_txt"><%-- <input
																			type="text" class="input_txtbx1" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="retention_time"
																			value="${form.retention_time}" /> --%>
																			 <select id="retention" name="retention_time" class="input_cmbbx1" style="width:200px;">
              <option value="">--Select--</option>
               <option value="1Week" <c:if test="${form.retention_time=='1Week'}"><c:out value="Selected"/></c:if>>1Week</option>
               <option value="1Month" <c:if test="${form.retention_time=='1Month'}"><c:out value="Selected"/></c:if>>1Month</option>
               <option value="1Year" <c:if test="${form.retention_time=='1Year'}"><c:out value="Selected"/></c:if>>1Year</option>
               </select>
																		
																		</td>
																		<td valign="middle" align="left" class="input_txt"><span class="err">&nbsp;*</span>Form:</td>
														
																		<td valign="top" align="left" class="input_txt">
														<!-- <input
															type="radio" name="form" value="1"
															class="input_txt" onchange="toggle2(this.value)">Yes&nbsp;&nbsp;&nbsp;<input
															type="radio" name="form" value="0"
															class="input_txt" checked onchange="toggle2(this.value)">No -->
															
															<input type="radio" name="form" value="Yes"  class="input_txt"   <c:if test="${form.form=='Yes'}"><c:out value="Checked=checked"/></c:if>>Yes&nbsp;&nbsp;&nbsp;
				  											<input type="radio" name="form" value="No"  class="input_txt"  <c:if test="${form.form=='No'}"><c:out value="Checked=checked"/></c:if>>No&nbsp;&nbsp;&nbsp;
				  </td>
			     </tr>
         </table>
         </div>
                  
         <!-- 
         <h2><b>&nbsp;&nbsp;Revision Details</b></h2>
              
              
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
             <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
             
          -->
                <div class="contentbox">
           <h2><b>&nbsp;&nbsp;Revision Details</b></h2>
             <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
         <tr>
             								  <td valign="middle" align="left" class="input_txt"><span
																			class="err">&nbsp;&nbsp;*</span>Revision No. (optional):</td>
																		<td valign="top" align="left" class="input_txt">&nbsp;&nbsp;
																		
																  <input type="text" name="revision_id" id="revisionid" value="${form.revision_id}" onclick="revision_change()" class="input_cmbbx1" >
              																	
            <br/><span class="err"><form:errors path="Form.revision_id"></form:errors></span>
																		</td>
																		              <td valign="middle" align="left" class="input_txt"><span
																			class="err">&nbsp;&nbsp;*</span>Effective Date :</td>
																		<td valign="top" align="left" class="input_txt">&nbsp;&nbsp;<input
																			type="text" class="input_txtbx1" id="datepicker"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="effective_date"
																			value="${form.effective_date}" />
																			<input
																			type="hidden" class="input_txtbx1" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="auto_no"
																			value="${form.auto_number}" />
																			<br/><span class="err"><form:errors path="Form.effective_date"></form:errors></span>
																		</td>  
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td>      
																		  
																		</tr>
              
              <tr class="row2">
              																	 <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Form/Rec ID :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="form_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="document_id"
																			value="${form.form_or_rec_id}" style="display:none;" />
																			<b id="hide_id">${form.form_or_rec_id}</b><br/><span class="err"><%-- <form:errors path="Form.document_id"></form:errors> --%></span>
																		</td>
                          
																		              <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Approver1(Process Owner) :</td>
																		<td valign="top" align="left" class="input_txt">
																		
																		<span id="process_owner_id"></span>
				<input type="hidden" class="input_txtbx1" id="inp_external_id" name="approver1" onchange="Approver1();" value="${form.approver1}" /> ${form.approver1}
																			
																			
																			<br/><span class="err"><form:errors path="Form.approver1"></form:errors></span>
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td> </tr>
              
              <tr class="row1">
                            <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Issuer :</td>
																		<td valign="top" align="left" class="input_txt"><%-- <input
																			type="text" class="input_txtbx1" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="issuer"
																			value="${form.issuer}" /> --%>
																			 <select name="issuer" id="issuer" class="input_cmbbx1" style="width:200px;">
               <option value="">--Select--</option> 
               <c:forEach items="${employeeForm.employees}" var="employees" varStatus="true">
               <option value="<c:out value="${employees.name}"/>" <c:if test="${form.issuer==employees.name}"><c:out value="Selected"/></c:if>><c:out value="${employees.name}"/></option>
               </c:forEach>              
               </select>
																			
																			<br/><span class="err"><form:errors path="Form.issuer"></form:errors></span>
																		</td>
																		
																		
																		 <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Comments :</td>
																		<td valign="top" align="left" class="input_txt">
																		<input
																			type="text" class="input_txtbx1" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="comments"
																			value="${form.comments}" />
																		
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		
              </tr>
                       
              <tr class="row1">
              <td colspan="2" align="right">
             <input type="submit" id="export"  name="export" value="Submit" class="submit_btn1"></td>
             <td colspan="3">
            <input type="reset" id="reset_export" name="reset_export" value="Reset" class="submit_btn1"></td>
</tr>
     </table>
     </div>
     </div>
     </td>
     </tr>
     </table>
     </div>
     </form>
     <script>
 $(function() {
	 
           $( "#datepicker" ).datepicker();
         });
 function change_file(){
		document.getElementById("id_file").style.display="block";
		document.getElementById("file_name").style.display="none";
		
	}
</script>
     <script type="text/javascript">
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
function toggle2(value){
  
    var e = document.getElementById('location_label');
    var e1 = document.getElementById('file_upload_label');
    var e2=document.getElementById('location_text');
    var e3=document.getElementById('id_file');
if(value=='electronic')
    {
	e.style.display="none";
	e1.style.display="block";
	e2.style.display="none";
	e3.style.display="block";
	document.getElementById('label1').style.display="block";
	
	
    }
else if(value=='hardcopy')
    {
	e.style.display="block";
	e1.style.display="none";
	e2.style.display="block";
	e3.style.display="none";
	document.getElementById('label1').style.display="none";
  
    }
else if(value=='both')
{
e.style.display="block";
e1.style.display="block";
e2.style.display="block";
e3.style.display="block";
}
    
}
</script>
<script type="text/javascript">
	function show_edit()
	{
		
		var element = document.getElementById('document_type_id');
		var element1 = document.getElementById('formid');
		var element2 = document.getElementById('change');
		var element3 = document.getElementById('form_or_rec_id');
		var element4 = document.getElementById('form_id');
		var element5 = document.getElementById('hide_id');
		
			element.style.display="block";
			element3.style.display="block";
			element1.style.display="none";
			element2.style.display="none";
			element4.style.display="block";
			element5.style.display="none";
			document.getElementById("changeafter").style.display="none";
		
	}

	function change_to_label()
	{
		
	   
		var type=document.getElementById('document_type_id');	
		
		var doc_id=document.getElementById('form_or_rec_id');	
		
		
		document.getElementById("changeafter").style.display="block";
		
		document.getElementById("changeafter").innerHTML = type.value+-+doc_id.value;
		
		
		var gen_id=document.getElementById("generated_id");
		gen_id.value=type.value+-+doc_id.value;
		document.getElementById('document_type_id').style.display="none";
		document.getElementById('form_or_rec_id').style.display="none";
		document.getElementById("change").style.display="block";
		if((gen_id.value)!= null)
		{
       	form_id.value=gen_id.value;
       
		}


		}
	function revision_change(){
		
		if(revisionid.value != null)
			{
				var value = revisionid.value;
				
				var inc = parseFloat('1');
			  revisionid.value = parseInt(value)+parseFloat(inc);
			}
	}
</script>	
   <jsp:include page="footer.jsp"></jsp:include>   
        
 