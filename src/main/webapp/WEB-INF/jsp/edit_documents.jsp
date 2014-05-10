<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<script src="/QMS_App/resources/js/jquery.js"></script>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.10.1.js'></script>
 <link href="resources/css/buttonQMS.css" rel="stylesheet"	type="text/css"  />
 
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
 <form method="post" enctype="multipart/form-data" action="update_documents">
 <script type="text/javascript">
$(window).load(function(){
	//alert("yes");
	   $(document).on("click", "label.mytxt", function () {
		   alert("ok");
	        var txt = $(".mytxt").text();
	        $(".mytxt").replaceWith("<input class='mytxt'/>");
	        $(".mytxt").val(txt);
	    });
	    $(document).on("blur", "input.mytxt", function () {
	        var txt = $(this).val();
	        $(this).replaceWith("<label class='mytxt'></label>");
	        $(".mytxt").text(txt);
	    });

	});

    </script>   

  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
     <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="adddocument" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Add Document
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewdocuments" class="<c:choose>
								<c:when test="${menu=='document'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									View Document
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="document_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Document report
									
								</a>
							</li>
							
				           </ul>
  </div>
        </td>
      </tr>
     
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
            <h1 style="color:#7A3A3A;font-size:20px;">Document Details</h1>
            </div>
            <div class="contentbox">
			
            <c:set value="${documentMainForm.documentMains[0]}" var="documentMain"></c:set>
              <table cellpadding="0" cellspacing="0" border="0" width="100%" style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
             
             
             <tr class="row1">
                            <td valign="middle" align="left" class="input_txt">Document ID :</td>
			<td valign="top" align="left" class="input_txt" >
			<input type="hidden" name="auto_number" value="${documentMain.auto_number }"/>
			<a id="documentid1">
			
					<input type="hidden" id="documentid1"class="input_txtbx1"  onmouseover="showTooltip('tooltip_id','inp_id3');" 
					onmouseout="hideTooltip('tooltip_id');"
					name="document_id" />${documentMain.document_id}</a>
																		
													 
                        
              
              
               <select name="document_type_id" id="document_type_id" class="input_cmbbx1" style="display:none;">
               <option value = "">Select Doc Prefix</option>
			                <c:forEach items="${documentPrefixForm.documentPrefixs}" var="prefix" varStatus="status">
        				       <option value="${prefix.doc_prefix}">${prefix.doc_prefix}</option>
			                  </c:forEach>
               </select>
              
                <label id="changeafter" style="display:none;" ></label> 
                
                  <input type="text" value="" id="document_id"  style="display:none;height:22px;background-color:lightgrey;width:50px;border:none;"  onblur="change_to_label()"/>
                <input type="hidden" name=document_id id="generated_id"  value=""/> 
               <label id="change" ><a href="#" style="text-decoration: none;" onclick="show_edit()">&nbsp;&nbsp;Change</a>  </label>
            <span class="err"><form:errors path="DocumentMain.document_id"></form:errors></span>
            
<td valign="middle" align="left" class="input_txt" width="10%">Media Type:</td>
               <td valign="top" align="left" class="input_txt" width="70%">
               <!-- <select name="media_type" class="input_cmbbx1" onchange="">
               <option onclick="toggle2(this.value);" value="Hard Copy">Hard Copy</option>
               <option onclick="toggle2(this.value);" value="Electronic">Electronic</option>
               </select> -->
              
               <c:choose>
               <c:when test="${documentMain.media_type=='hardcopy'}">
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="hardcopy"   id="id_hardcopy"  checked/>Hard Copy&nbsp;&nbsp;&nbsp;
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="electronic"  id="id_electronic" onchange="toggle2(this.value);" />Electronic&nbsp;&nbsp;&nbsp;
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="both"  id="id_both" onchange="toggle2(this.value);"/> Both&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>    
               </c:when>
               <c:when test="${documentMain.media_type=='electronic'}">
               <input type="radio" name="media_type" onchange="toggle2(this.value);" value="hardcopy"   id="id_hardcopy" />Hard Copy&nbsp;&nbsp;&nbsp;
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="electronic"  id="id_electronic" onchange="toggle2(this.value);" checked />Electronic&nbsp;&nbsp;&nbsp;
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="both"  id="id_both" onchange="toggle2(this.value);"/> Both&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>    
               </c:when>
               <c:when test="${documentMain.media_type=='both'}">
               <input type="radio" name="media_type" onchange="toggle2(this.value);" value="hardcopy"   id="id_hardcopy" />Hard Copy&nbsp;&nbsp;&nbsp;
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="electronic"  id="id_electronic" onchange="toggle2(this.value);" />Electronic&nbsp;&nbsp;&nbsp;
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="both"  id="id_both" onchange="toggle2(this.value);" checked/> Both&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>    
               </c:when>
               </c:choose>
               </td>
           <td valign="top" align="left" class="input_txt" width="20%"></td>
              
             </tr>  
              <tr class="row2">
              
               <td valign="middle" align="left" class="input_txt" width="25%">Document Title:</td>
               <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="document_title" class="input_txtbx1"  style="width:200px;" value="${documentMain.document_title}"/><br/><span class="err"><form:errors path="DocumentMain.document_title"></form:errors></span></td>
              <c:choose>
                <c:when test="${documentMain.media_type=='hardcopy'}">
               <td valign="middle" id="id_location_lbl" align="left" class="input_txt" width="20%"><label id="location_label" ><span class="err">*</span> Location:</label><br><label id="file_upload_label" style="display:none;"><span class="err">*</span> Upload File:</label></td>
               <td valign="middle" align="left" id="id_location_txt" class="input_txt" width="25%">
              <select id="location_text" name="location" class="input_cmbbx1" style="width:200px;">
             <!--  <option value="">--Select--</option>
               -->  <c:forEach items="${formLocationForm.formLocations}" var="formlocation" varStatus="status">
                  
        				       <option value="${formlocation.form_location}"<c:if test="${formlocation.form_location == documentMain.location}"><c:out value="selected"/></c:if>>${formlocation.form_location}</option>
			                  </c:forEach>
			                   </select><br>

              <input name="attachments" style="display:none;" id="id_file" type="file" /> <br/>
              <span class="err"><form:errors path="DocumentMain.location"></form:errors></span>
               </td>
              </c:when>
               </c:choose>
               <c:choose>
                <c:when test="${documentMain.media_type=='electronic'}">
               <td valign="middle" id="id_location_lbl" align="left" class="input_txt" width="20%"><label id="location_label" style="display:none"><span class="err">*</span> Location:</label><br><label id="file_upload_label"><span class="err">*</span> Upload File:</label></td>
               <td valign="middle" align="left" id="id_location_txt" class="input_txt" width="25%">
               <select id="location_text" name="location" class="input_cmbbx1" style="display:none;width:200px;">
              
              <!-- <option value="">--Select--</option>
               -->    <c:forEach items="${formLocationForm.formLocations}" var="formlocation" varStatus="status">
                  
        				       <option value="${formlocation.form_location}"<c:if test="${formlocation.form_location == documentMain.location}"><c:out value="selected"/></c:if>>${formlocation.form_location}</option>
			                  </c:forEach>
               </select><br>
			                
               <input name="filename" type="hidden" id="file_name"/>${documentMain.attachment_name}
               <%session.setAttribute("attachmentname", request.getParameter("attachment_name")); %>
               <input name="attachments" id="id_file" type="file" style="display:none;" value="${documentMain.attachments}"/>
              <label id="change_label" ><a href="#" onclick="change_file()">Change</a></label>
              <span class="err"><form:errors path="DocumentMain.location"></form:errors></span>
               </td>
              </c:when>
              <c:when test="${documentMain.media_type=='both'}">
              <td valign="middle" id="id_location_lbl" align="right" class="input_txt" width="20%"><label id="location_label"><span class="err">*</span> Location:</label><br><br><label id="file_upload_label"><span class="err">*</span> Upload File:</label></td>
               <td valign="top" align="left" id="id_location_txt" class="input_txt" width="25%">
              <select id="location_text" name="location" class="input_cmbbx1" >
              <option value="">--Select --</option>
                <c:forEach items="${formLocationForm.formLocations}" var="formlocation" varStatus="status">
                  
        				       <option value="${formlocation.form_location}"<c:if test="${formlocation.form_location == documentMain.location}"><c:out value="selected"/></c:if>>${formlocation.form_location}</option>
			                  </c:forEach></select><br><br>
			                
               <input name="filename" type="hidden" id="file_name"/>${documentMain.attachment_name}
               <input name="attachments" id="id_file" type="file" style="display:none;" value="${documentMain.attachment_name}"/>
              <label id="change_label" ><a href="#" onclick="change_file()">Change</a></label>
              <span class="err"><form:errors path="DocumentMain.location"></form:errors></span>
               </td>
              </c:when>
               </c:choose>

           <td valign="middle" id="softcopy_file_label" style="display:none;" align="right" class="input_txt" width="20%"></td>
               <td valign="top" id="softcopy_file_upload" style="display:none;" align="left" class="input_txt" width="25%"><div ><br/></div></td>
     
          
           <td valign="top" align="left" class="input_txt" width="20%"></td>
              
             </tr> 
             <tr class="row1">
              
               <td valign="middle" align="left" class="input_txt" width="25%">Document Type:</td>
               <td valign="top" align="left" class="input_txt" width="20%">
           
                <select name="document_type" id="id_document_type"  class="input_cmbbx1" style="width:200px;">
							 
			                <c:forEach items="${documentTypeForm.documentTypes}" var="documenttype" varStatus="status">
        				       <option value="${documenttype.document_type}"<c:if test="${documenttype.document_type == documentMain.document_type}"><c:out value="selected"/></c:if>>${documenttype.document_type}</option>
			                  </c:forEach>
			                 </select><span class="err"><form:errors path="DocumentMain.document_type"></form:errors></span>
               
               
               <td valign="middle" align="left" class="input_txt" width="20%">Process:</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               
               <select name="process" id="id_inpprocess" onchange="doAjaxPost_for_process();" class="input_cmbbx1" style="width:200px;">
               <option value="">--Select--</option>
               <c:forEach items="${processForm.processes}" var="processes" varStatus="true">
               <option value="<c:out value="${processes.process_name}"/>" <c:if test="${documentMain.process==processes.process_name}"><c:out value="Selected"/></c:if>><c:out value="${processes.process_name}"/></option>
               </c:forEach>
               </select>
               <br/><span class="err"><form:errors path="DocumentMain.process"></form:errors></span></td>
            <td valign="top" align="left" class="input_txt" width="20%"></td>
             </tr> 
             <tr class="row2">
               <td valign="middle" align="left" class="input_txt" width="25%">
               <td valign="top" align="left" class="input_txt" width="20%">
               <td valign="middle" align="left" class="input_txt" width="20%">External Document(Y/N):</td>
               <td valign="top" align="left" class="input_txt" width="25%">
<!--               <input type="radio" name="external" value="Yes"  id="id_yesforexternal">Yes&nbsp;&nbsp;&nbsp;
					<input type="radio" name="external" value="No" id="id_noforexternal"  checked>No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
 -->               
 				<input type="radio" name="external" value="Yes" id="id_yesforexternal" <c:if test="${documentMain.external=='Yes'}"><c:out value="checked=checked"/></c:if>>Yes &nbsp;&nbsp;&nbsp;
  				<input type="radio" name="external" value="No" <c:if test="${documentMain.external=='No'}"><c:out value="checked=checked"/></c:if>>No &nbsp;&nbsp;&nbsp;</td>
               
            <td valign="top" align="left" class="input_txt" width="20%"></td>
             </tr>
         </table>
         </div>
                  
         <!-- 
         <h2><b>&nbsp;&nbsp;Revision Details</b></h2>
              
              
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
             <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
             
          -->
                <div class="contentbox">
			 <h1 style="color:#7A3A3A;font-size:20px;">Revision Details</h1>
             <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
         
         <tr class="row2">
             <td valign="top" align="left" width="15%">
            <!--  <a href="#" style="padding-right:10px;" onclick="reset_form()">Enter New Revision</a> -->
             <input type="button" value="Enter New Revision" onClick="reset_form()"/>
             </td>
             </tr>
              <tr class="row1">
              <td valign="middle" align="left" class="input_txt" width="30%">Revision No. (optional):</td>
			  <td valign="middle" align="left" class="input_txtbx1">&nbsp;&nbsp;
			  <input type="text" name="revision_id" id="revisionid" value="${documentMain.revision_id}" onclick="revision_change()" class="input_txtbx1" ></td>
              
             <!--   <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">&nbsp;&nbsp;*</span>Document Id :</td> -->
			  <td valign="middle" align="left" class="input_txt">&nbsp;&nbsp;<input type="hidden" class="input_txtbx1" id="documentid"
			  name="document_id" value="${documentMain.document_id}" style="display:none;" />
			  <%-- <b id="hide_id">${documentMain.document_id}</b><br/> --%></td>
			  </tr>
		      <tr class="row1" style="border:none;">
            <td valign="middle" align="left" class="input_txt" width="25%">Issuer:</td>
               <td valign="top" align="left" class="input_txt" width="20%">
               
               <select name="issuer" id="issuer" class="input_cmbbx1" style="width:200px;">
               <option value="">--Select--</option> 
               <c:forEach items="${employeeForm.employees}" var="employees" varStatus="true">
               <option value="<c:out value="${employees.name}"/>" <c:if test="${documentMain.issuer==employees.name}"><c:out value="Selected"/></c:if>><c:out value="${employees.name}"/></option>
               </c:forEach>              
               </select>
               
               
               <br/><span class="err"><form:errors path="DocumentMain.issuer"></form:errors></span></td>
            
                <td valign="middle" align="left" class="input_txt" width="30%">Approver 1(Process Owner):</td>
               <td valign="top" align="left" class="input_txt" width="25%" >
               <%-- <span id="process_owner_id"></span>
            
                <c:out value="${documentMain.approver1}" ></c:out> 
              
                <input type="hidden" class="input_txtbx1" id="approver" value="${documentMain.approver1}" name="approver1" />
               
               <br/><span class="err"><form:errors path="DocumentMain.approver1"></form:errors></span>
               
               
               </td> --%>
               
               
               <select name="approver1" class="input_cmbbx1" id="approver" style="width:200px;">
             	
            	
              <c:forEach items="${employeeowner.employees}" var="employeeowner" varStatus="true">
               <option value="<c:out value="${employeeowner.name}"/>" <c:if test="${documentMain.approver1==employeeowner.name}"><c:out value="Selected"/></c:if>><c:out value="${employeeowner.name}"/></option>
               </c:forEach>    
               
               </select>   <br/><span class="err"><form:errors path="DocumentMain.approver1"></form:errors></span></td>
            
              <td valign="top" align="left" class="input_txt" width="20%"></td>
                 </tr>  
              <tr class="row2" style="border:none;">
              
                <td valign="middle" align="left" class="input_txt" width="25%">Revision Level:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" id="revisionlevel" name="revision_level" class="input_txtbx1" style="width:200px;" value="${documentMain.revision_level }"/><br/>
              <span class="err"><form:errors path="DocumentMain.revision_level"></form:errors></span>
               <td valign="middle" align="left" class="input_txt" width="20%">Approver 2(Doc Control):</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               
 				<select name="approver2" class="input_cmbbx1" id="approver2" style="width:200px;">
             	  <option value="">--Select--</option>
            	
              <c:forEach items="${employeeForm1.employees}" var="employees" varStatus="true">
               <option value="<c:out value="${employees.name}"/>" <c:if test="${documentMain.approver2==employees.name}"><c:out value="Selected"/></c:if>><c:out value="${employees.name}"/></option>
               </c:forEach>    
               
               </select>
               
               <br/><span class="err"><form:errors path="DocumentMain.approver2"></form:errors></span></td>
            <td valign="top" align="left" class="input_txt" width="20%"></td>
             </tr>
             <tr class="row1" style="border:none;">
              
               <td valign="middle" align="left" class="input_txt" width="25%">Date:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" id="datepicker" name="date" class="input_txtbx1" style="width:200px;" value="${documentMain.date}"/><br/><span class="err"><form:errors path="DocumentMain.date"></form:errors></span></td>
              
        
               <td valign="middle" align="left" class="input_txt" width="70%">Approver 3(Mgmt Report):</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               
               <select name="approver3" id="approver3" class="input_cmbbx1" style="width:200px;">
               <option value="">--Select--</option>
              <c:forEach items="${employeeForm2.employees}" var="employees" varStatus="true">
              
               <option value="${employees.name}"<c:if test="${employees.name == documentMain.approver3}"><c:out value="selected"/></c:if>>${employees.name}</option>
           
               </c:forEach>
              
              
              
                </select>
               
               <br/><span class="err"><form:errors path="DocumentMain.approver3"></form:errors></span></td>
           <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
             </tr>  
              <tr class="row2" style="border:none;">
                 <td valign="middle" align="left" class="input_txt">Comments:</td>
               <td valign="top" align="left"><textarea class="input_txtbx1" id="comments"  name="comments"  style="width:100%; height: 89px;" >${documentMain.comments}</textarea><br/><span class="err"></span></td>
         
               <td valign="top" align="left" class="input_txt" width="20%">Status:</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               <input type="hidden" value="${documentMain.revision_id}"/>
              <select name="status" id="status" class="input_cmbbx1" style="width:200px;">
              <option value="">--Select--</option>
               <option value="Draft" <c:if test="${documentMain.status=='Draft'}"><c:out value="Selected"/></c:if>>Draft</option>
               <option value="Active" <c:if test="${documentMain.status=='Active'}"><c:out value="Selected"/></c:if>>Active</option>
               <option value="Obsolete" <c:if test="${documentMain.status=='Obsolete'}"><c:out value="Selected"/></c:if>>Obsolete</option>
               </select>
                
               <br/><span class="err"><form:errors path="DocumentMain.status"></form:errors></span></td>
            <td valign="top" align="left" class="input_txt" width="20%"></td>
        </tr>
             <tr class="row1" >
             <td colspan="2" align="right">
             <input type="submit" id="submit"  name="submit" value="Submit" class="submit_btn1"></td>
             <td colspan="3"> 
            <input type="reset" id="reset_export" name="reset_export" value="Reset" class="submit_btn1"></td>
                       
      
        </tr>
        </table>
        </td>
        
        </tr>
        </table>
        </div>
        </form>
        
<script>
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
	
    }
else if(value=='hardcopy')
    {
	e.style.display="block";
	e1.style.display="none";
	e2.style.display="block";
	e3.style.display="none";
  
    }
else if(value=='both')
{
e.style.display="block";
e1.style.display="block";
e2.style.display="block";
e3.style.display="block";
}
    
}
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
function change_file(){
	document.getElementById("id_file").style.display="block";
	document.getElementById("file_name").style.display="none";
	
}

function Approver1(){
	var element = document.getElementById("approver").value();
	alert(element);
	
}

function show_edit()
	{
		
		var element = document.getElementById('document_type_id');
		var element1 = document.getElementById('documentid1');
		var element2 = document.getElementById('change');
		var element3 = document.getElementById('document_id');
		var element4 = document.getElementById('documentid');
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
		
		var doc_id=document.getElementById('document_id');	
		
		
		document.getElementById("changeafter").style.display="block";
		
		document.getElementById("changeafter").innerHTML = type.value+-+doc_id.value;
		
		
		var gen_id=document.getElementById("generated_id");
		gen_id.value=type.value+-+doc_id.value;
		document.getElementById('document_type_id').style.display="none";
		document.getElementById('document_id').style.display="none";
		document.getElementById("change").style.display="block";
		if((gen_id.value)!= null)
		{
       	documentid.value=gen_id.value;
       
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
	
	
	function reset_form()
	{
		
		
		document.getElementById('revisionid').value="0";
		document.getElementById('datepicker').value="";
		document.getElementById('issuer').value="";
		document.getElementById('comments').value="";
		document.getElementById('revisionlevel').value="";
		document.getElementById('approver').value="";
		document.getElementById('approver2').value="";
		document.getElementById('approver3').value="";
		document.getElementById('status').value="";
	 
	}
	
 $(function() {
    	 
         $( "#datepicker" ).datepicker();
         $( "#datepicker123" ).datepicker();
       });
</script>	



   <jsp:include page="footer.jsp"></jsp:include>   
             