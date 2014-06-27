<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<script src="/QMS_App/resources/js/jquery.js"></script>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
 
 <form method="post" enctype="multipart/form-data" action="update_documents">
 <!-- 
 <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script> 
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script> -->
<script type="text/javascript">
$(window).load(function(){
	//alert("yes");
	   $(document).on("click", "label.mytxt", function () {
		
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
  <ul class="horizmenu" style=" float:left;margin-left:190px; margin-top:8px;">
						
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
               
			                <c:forEach items="${documentPrefixForm.documentPrefixs}" var="prefix" varStatus="status">
        				       <option value="${prefix.doc_prefix}">${prefix.doc_prefix}</option>
			                  </c:forEach>
               </select>
              
                <label id="changeafter" style="display:none;" ></label> 
                
                  <input type="text" value="" id="document_id"  style="display:none;height:22px;background-color:lightgrey;width:50px;border:none;"  onblur="change_to_label()"/>
                <input type="hidden" name=document_id id="generated_id"  value=""/> 
               <label id="change" ><a href="#" style="text-decoration: none;" onclick="show_edit()">&nbsp;&nbsp;Change</a>  </label>
           
            
<td valign="middle" align="left" class="input_txt" width="10%">Media Type:</td>
               <td valign="top" align="left" class="input_txt" width="70%">
               <!-- <select name="media_type" class="input_cmbbx1" onchange="">
               <option onclick="toggle2(this.value);" value="Hard Copy">Hard Copy</option>
               <option onclick="toggle2(this.value);" value="Electronic">Electronic</option>
               </select> -->
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="hardcopy" id="id_hardcopy" <c:if test="${documentMain.media_type=='hardcopy'}"><c:out value="checked" /></c:if>/>Hard Copy&nbsp;&nbsp;&nbsp;
                <input type="radio" name="media_type" value="electronic"  id="id_electronic" onchange="toggle2(this.value);" <c:if test="${documentMain.media_type=='electronic'}"><c:out value="checked" /></c:if>/>Electronic&nbsp;<span class="err"></span>
                <input type="radio" name="media_type"value="both"  id="id_both" onchange="toggle2(this.value);" <c:if test="${documentMain.media_type=='both'}"><c:out value="checked" /></c:if>/>Both&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
               <span class="err" style="color:red"><form:errors path="DocumentMain.media_type"></form:errors></span> 
               </td>
           <td valign="top" align="left" class="input_txt" width="20%"></td>
              
             </tr>  
              <tr class="row2">
              
               <td valign="middle" align="left" class="input_txt" width="25%">Document Title:</td>
               <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="document_title" class="input_txtbx1" id="documenttitle" style="width:200px;" value="${documentMain.document_title}"/><br/><span class="err"style="color:red"><form:errors path="DocumentMain.document_title"></form:errors></span>
               <span id="documenttitle1" style="color:red"></span>
               </td>
              <c:choose>
                <c:when test="${documentMain.media_type=='hardcopy'}">
               <td valign="middle" id="id_location_lbl" align="left" class="input_txt" width="20%"><label id="location_label" >Location:</label><br><label id="file_upload_label" style="display:none;"><span class="err">*</span> Upload File:</label></td>
               <td valign="middle" align="left" id="id_location_txt" class="input_txt" width="25%">
              <select id="location_text" name="location" class="input_cmbbx1" style="width:200px;">
             <!--  <option value="">--Select--</option>
               -->  <c:forEach items="${formLocationForm.formLocations}" var="formlocation" varStatus="status">
                  
        				       <option value="${formlocation.form_location}"<c:if test="${formlocation.form_location == documentMain.location}"><c:out value="selected"/></c:if>>${formlocation.form_location}</option>
			                  </c:forEach>
			                   </select><br>
			 <span id="hard"style="color:red"></span>
              <input name="attachments" style="display:none;" id="id_file" type="file"  value="${documentMain.attachments}"/> <br/>
              <span id="attach"style="color:red"></span>
              
               </td>
              </c:when>
               </c:choose>
               <c:choose>
                <c:when test="${documentMain.media_type=='electronic'}">
               <td valign="middle" id="id_location_lbl" align="left" class="input_txt" width="20%"><label id="location_label" style="display:none">Location:</label><br><label id="file_upload_label"><span class="err">*</span> Upload File:</label></td>
               <td valign="middle" align="left" id="id_location_txt" class="input_txt" width="25%">
               <select id="location_text" name="location" class="input_cmbbx1" style="display:none;width:200px;">
              
              <!-- <option value="">--Select--</option>
               -->    <c:forEach items="${formLocationForm.formLocations}" var="formlocation" varStatus="status">
                  
        				       <option value="${formlocation.form_location}"<c:if test="${formlocation.form_location == documentMain.location}"><c:out value="selected"/></c:if>>${formlocation.form_location}</option>
			                  </c:forEach>
               </select><br>
			         <span id="hard"style="color:red"></span>        
               <input name="filename" type="hidden" id="file_name"/ value="${documentMain.attachment_name}">${documentMain.attachment_name}
               <span id="attach"style="color:red"></span>
               <%session.setAttribute("attachmentname", request.getParameter("attachment_name")); %>
               <input name="attachments" id="id_file" type="file" style="display:none;" value="${documentMain.attachments}"/>
              <label id="change_label" ><a href="#" onclick="change_file()">Change</a></label>
              <span class="err"style="color:red"><form:errors path="DocumentMain.location"></form:errors></span>
               </td>
              </c:when>
              <c:when test="${documentMain.media_type=='both'}">
              <td valign="middle" id="id_location_lbl" align="right" class="input_txt" width="20%"><label id="location_label">Location:</label><br><br><label id="file_upload_label"><span class="err">*</span> Upload File:</label></td>
               <td valign="top" align="left" id="id_location_txt" class="input_txt" width="25%">
              <select id="location_text" name="location" class="input_cmbbx1" >
              <option value="">--Select --</option>
                <c:forEach items="${formLocationForm.formLocations}" var="formlocation" varStatus="status">
                  
        				       <option value="${formlocation.form_location}"<c:if test="${formlocation.form_location == documentMain.location}"><c:out value="selected"/></c:if>>${formlocation.form_location}</option>
			                  </c:forEach></select><br><br>
			                <span id="hard"style="color:red"></span>
               <input name="filename" type="hidden" id="file_name"/>${documentMain.attachment_name}
               <input name="attachments" id="id_file" type="file" style="display:none;" value="${documentMain.attachment_name}"/>
               <span id="attach"style="color:red"></span>
              <label id="change_label" ><a href="#" onclick="change_file()">Change</a></label>
              <span class="err"style="color:red"><form:errors path="DocumentMain.location"></form:errors></span>
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
               <br/><span class="err"style="color:red"><form:errors path="DocumentMain.process"></form:errors></span></td>
            <td valign="top" align="left" class="input_txt" width="20%"></td>
             </tr> 
             <tr class="row2">
               <td valign="middle" align="left" class="input_txt" width="25%">
               <td valign="top" align="left" class="input_txt" width="20%">
               <td valign="middle" align="left" class="input_txt" width="20%">External Document ?(Y/N):</td>
               <td valign="top" align="left" class="input_txt" width="25%">
<!--               <input type="radio" name="external" value="Yes"  id="id_yesforexternal">Yes&nbsp;&nbsp;&nbsp;
					<input type="radio" name="external" value="No" id="id_noforexternal"  checked>No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
 -->               
 				<input type="radio" name="external" value="Yes" id="id_yesforexternal" <c:if test="${documentMain.external=='Yes'}"><c:out value="checked=checked"/></c:if>>Yes &nbsp;&nbsp;&nbsp;
  				<input type="radio" name="external" value="No" <c:if test="${documentMain.external=='No'}"><c:out value="checked=checked"/></c:if>>No &nbsp;&nbsp;&nbsp;
  				<br>
  				 <span class="err"style="color:red"><form:errors path="DocumentMain.external"></form:errors></span>
  				
  				</td>
               
            <td valign="top" align="left" class="input_txt" width="20%"></td>
             </tr>
         </table>
         </div>
                 
                <div class="contentbox">
			 <h1 style="color:#7A3A3A;font-size:20px;">Revision Details</h1>
             <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
         
         <tr class="row2">
             <td valign="top" align="left" width="15%">
           
             <input type="button" value="Enter New Revision" onClick="reset_form()"/>
             </td>
             </tr>
              <tr class="row1">
      
		
			  
			   <td valign="middle" align="left" class="input_txt">Revision No. (optional):</td>
																		<td valign="top" align="left" class="input_txt">
																		<span id="valueTempe" style="font-weight: bold; width:28px;">${documentMain.revision_id}</span>
																		<button id="plus" href="#" style="height: 18px; width:18px;" value="">+</button>
			  <input type="hidden" name="revision_id" id="revisionid" value="${documentMain.revision_id}" class="input_txtbx1" style="width:200px;" >
			 										
			  </td>
     			  <td valign="middle" align="left" class="input_txt">&nbsp;&nbsp;<input type="hidden" class="input_txtbx1" id="documentid"
			  name="document_id" value="${documentMain.document_id}" style="display:none;" />
			 </td>
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
               
               
               <br/><span class="err"style="color:red"><form:errors path="DocumentMain.issuer"></form:errors></span></td>
            
                <td valign="middle" align="left" class="input_txt" width="30%">Approver 1(Process Owner):</td>
               <td valign="top" align="left" class="input_txt" width="25%" >
              
               
               
               <select name="approver1" class="input_cmbbx1" id="approver" style="width:200px;">
             	
            	
              <c:forEach items="${employeeowner.employees}" var="employeeowner" varStatus="true">
               <option value="<c:out value="${employeeowner.name}"/>" <c:if test="${documentMain.approver1==employeeowner.name}"><c:out value="Selected"/></c:if>><c:out value="${employeeowner.name}"/></option>
               </c:forEach>    
               
               </select>   <br/><span class="err"style="color:red"><form:errors path="DocumentMain.approver1"></form:errors></span></td>
            
              <td valign="top" align="left" class="input_txt" width="20%"></td>
                 </tr>  
              <tr class="row2" style="border:none;">
              
                <td valign="middle" align="left" class="input_txt" width="25%">Revision Level:</td>
               <td valign="top" align="left" class="input_txt" width="20%">
                <input type="text" name="revision_level" class="input_txt1" id="revisionlevel" style="width:200px;" value="${documentMain.revision_level}"/><br/>
              <%--  <select name="revision_level" id="revisionlevel" class="input_cmbbx1" style="width:100%;">
                           <c:forEach items="${documentRevisionLevelForm.documentRevisionLevels}" var="revisionlevel" varStatus="status">
        				       <option value="${revisionlevel.combined_output}"<c:if test="${revisionlevel.combined_output == documentMain.revision_level}"><c:out value="selected"/></c:if>>${revisionlevel.combined_output}</option>
			                  </c:forEach>
			                 </select> --%>
			                  <span id="revisionlevel1" style="color:red"></span>
			                 <span class="err"style="color:red"><form:errors path="DocumentMain.revision_level"></form:errors></span>
			                 
   			    </td>
              
              <td valign="middle" align="left" class="input_txt" width="20%">Approver 2(Doc Control):</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               
 				<select name="approver2" class="input_cmbbx1" id="approver2" style="width:200px;">
             	  <option value="">--Select--</option>
            	
              <c:forEach items="${employeeForm1.employees}" var="employees" varStatus="true">
               <option value="<c:out value="${employees.name}"/>" <c:if test="${documentMain.approver2==employees.name}"><c:out value="Selected"/></c:if>><c:out value="${employees.name}"/></option>
               </c:forEach>    
               
               </select>
               
               <br/><span class="err"style="color:red"><form:errors path="DocumentMain.approver2"></form:errors></span></td>
            <td valign="top" align="left" class="input_txt" width="20%"></td>
             </tr>
             <tr class="row1" style="border:none;">
              
               <td valign="middle" align="left" class="input_txt" width="25%">Date:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" id="datepicker" name="date" class="input_txtbx1" style="width:200px;" value="${documentMain.date}"/><br/>
                 <span id="datepicker1234"style="color:red"></span>
               <span class="err"style="color:red"><form:errors path="DocumentMain.date"></form:errors></span></td>
              
        
               <td valign="middle" align="left" class="input_txt" width="70%">Approver 3(Mgmt Report):</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               
               <select name="approver3" id="approver3" class="input_cmbbx1" style="width:200px;">
               <option value="">--Select--</option>
              <c:forEach items="${employeeForm2.employees}" var="employees" varStatus="true">
              
               <option value="${employees.name}"<c:if test="${employees.name == documentMain.approver3}"><c:out value="selected"/></c:if>>${employees.name}</option>
           
               </c:forEach>
              
              
              
                </select>
               
               <br/><span class="err"style="color:red"><form:errors path="DocumentMain.approver3"></form:errors></span></td>
           <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
             </tr>  
              <tr class="row2" style="border:none;">
                 <td valign="middle" align="left" class="input_txt">Comments:</td>
               <td valign="top" align="left"><textarea class="input_txtbx1" id="comments"  name="comments"  style="width:100%; height: 89px;" >${documentMain.comments}</textarea><br/>
                <span id="comments1" style="color:red"></span>
               <span class="err"style="color:red"><form:errors path="DocumentMain.comments"></form:errors></span></td>
         
               <td valign="top" align="left" class="input_txt" width="20%">Status:</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               <input type="hidden" value="${documentMain.revision_id}"/>
              <select name="status" id="status" class="input_cmbbx1" style="width:200px;">
              <option value="">--Select--</option>
               <option value="Draft" <c:if test="${documentMain.status=='Draft'}"><c:out value="Selected"/></c:if>>Draft</option>
               <option value="Active" <c:if test="${documentMain.status=='Active'}"><c:out value="Selected"/></c:if>>Active</option>
               <option value="Obsolete" <c:if test="${documentMain.status=='Obsolete'}"><c:out value="Selected"/></c:if>>Obsolete</option>
               </select>
                
               <br/><span class="err"style="color:red"><form:errors path="DocumentMain.status"></form:errors></span></td>
            <td valign="top" align="left" class="input_txt" width="20%"></td>
        </tr>
             <tr class="row1" >
             <td colspan="2" align="right">
             <input type="submit" id="submit"  name="submit" value="Submit" onclick="return validation();" class="submit_btn1"></td>
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
function validation()
{
	
	var validate1 =/^[a-zA-Z]|[a-zA-Z0-9][\w\_]+[a-zA-Z0-9]$/ ;
	var date =/^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/]\d{4}$/;
	var dotnumber = /^[a-zA-Z0-9]|[a-zA-Z0-9][\w\.]+[a-zA-Z0-9]$/;
	var datepicker123=document.getElementById('datepicker').value;
	 var e2=document.getElementById('location_text').value;
	 var choose=document.getElementById('id_file').value;
	 var file=document.getElementById('file_name').value;
	 
	 var documenttitle = document.getElementById('documenttitle').value;
	 var revisionlevel = document.getElementById('revisionlevel').value;
	 var comments = document.getElementById('comments').value;
	 if(document.getElementById('id_hardcopy').checked)
	 {

			if(e2=="")
			{
			
			document.getElementById("hard").innerHTML="Required Field Should not be Empty";
			return false;
			}
		else{
			
			document.getElementById("hard").innerHTML="";
		}
		 
		 
	 }
	 if(document.getElementById('id_electronic').checked)
	{
		 
		
		 if(file =="")
		 {
		 document.getElementById("attach").innerHTML="File No Uploaded";
		 return false;
		 }
		 else
			 {
			 document.getElementById("attach").innerHTML="";
			 }
		  if(file =="" && choose=="")
			 {
			 document.getElementById("attach").innerHTML="File No Uploaded";
			 return false;
			 }
		  else
			  {
			  document.getElementById("attach").innerHTML="";
			  }
		  
		 
		 
	}
	if(document.getElementById('id_both').checked)
		{
		
		if(e2=="")
		{
			
		document.getElementById("hard").innerHTML="Required Field Should not be Empty";
		return false;
		}
		else
			{
			document.getElementById("hard").innerHTML="";
			}
		
		 if(file =="")
		 {
		 document.getElementById("attach").innerHTML="File No Uploaded";
		 return false;
		 }
		 else{
			 document.getElementById("attach").innerHTML="";
		 }
		}
	
	
	 if(documenttitle.charAt(0) ==" ")
	 {
		 
		 document.getElementById("documenttitle1").innerHTML="Required Field Should not be space";
		 return false;
	 }
	 else if(documenttitle.match(validate1))
	 {
		 document.getElementById("documenttitle1").innerHTML="";
 	 }
	 else
		 {
		   document.getElementById("documenttitle1").innerHTML="Required Field Should not be Empty";
		   	return false;
		 }
	 
	 
	 
	 
	 
	 
	 if(revisionlevel.charAt(0) ==" ")
	 {
		 document.getElementById("revisionlevel1").innerHTML="Required Field Should not be space";
		 return false;
	 }	 
	 else if(revisionlevel.match(dotnumber))
		 { 
			 document.getElementById("revisionlevel1").innerHTML="";
		 }
	 else{	
		 document.getElementById("revisionlevel1").innerHTML="Required Field Should not be Empty";
		 return false;
		}
	 
	 
	 
	 
	 if(comments.charAt(0) ==" ")
	 {
		 document.getElementById("comments1").innerHTML="Required Field Should not be space";
	 }
		 else if(comments.match(validate1))
		 {
			 if(comments.length < 5 || comments.length > 500 )
				 {
				 document.getElementById("comments1").innerHTML="Should b/w 5 to 500 chars";
				 return false;
				 }
			 else{
			     document.getElementById("comments1").innerHTML="";
			     }
	   	 }
	 	else{
				 document.getElementById("comments1").innerHTML="Required Field Should not be Empty";
				 return false;
			    }
	 
	 if(datepicker123.match(date))
	 {
		 document.getElementById("datepicker1234").innerHTML="";
	 }
 else
	 {
	 document.getElementById("datepicker1234").innerHTML="MM/DD/YYYY";
	 return false;
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
		
		var numbers = /^[0-9]+$/; 
		var type=document.getElementById('document_type_id');	
		
		var doc_id=document.getElementById('document_id');	
		
		
		document.getElementById("changeafter").style.display="block";
		if(doc_id.value.match(numbers))
		{
			document.getElementById("changeafter").innerHTML = type.value+-+doc_id.value;
		}
		else{
			var color = "Please Enter numeric values";
			var result = color.fontcolor("red");
			document.getElementById("changeafter").innerHTML=result;
		}
		
		
		
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
	/* function revision_change(){
		var revisionlevel=document.getElementById("revisionlevel").value;
		
		//if(revisionlevel=="Alphabet")
			//{
			//for(char alphabet = 'A'; alphabet <= 'Z';alphabet++)
			
			//alert("Alphabet");
		if(revisionid.value != null)
			{
				var value = revisionid.value;
				
				var inc = parseFloat('1');
			  revisionid.value = parseInt(value)+parseFloat(inc);
			  
			  var newLetter = String.fromCharCode(revisionlevel.charCodeAt() + 1)
			  var revisionNumber = '2' + newLetter;
		          }
	} */
	
	var valueElement = $('#valueTempe');
	var intgert = /^[0-9].[0-9]$/;
	var intalpha = /^[0-9].[a-z]$/;
	var alphaint =  /^[a-z].[0-9]$/;
	var alphaalpha = /^[a-z].[a-z]$/;
	var intgrt = /^[0-9]$/;
	var alphab = /^[a-z]$/;

	

	function incrementValue(e){
		if(intgert.test(valueElement.text()))
			{
		if(valueElement.text() < 100){
			var value = valueElement.text(Math.max(parseFloat(valueElement.text()) + e.data.increment).toFixed(1)); 
			var id = document.getElementById('revisionid');
			
			id.value = Math.max(parseFloat(valueElement.text()).toFixed(1));
			
		}
			}
		if(intalpha.test(valueElement.text()))
			{
			var alpha =  ["0","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]; 
			var print = ["0"];
			var i,j;

			for(i=0;i<=26;i++)
			{
			  for(j=1;j<=26;j++)
			  {
				print.push(i + "." + alpha[j]);
			  }
			}
			var c=document.getElementById("valueTempe").innerHTML;
			 a=print.indexOf(c);
			
			 b=a+1;
			
			 document.getElementById("valueTempe").innerHTML = print[b];
			 var id = document.getElementById('revisionid');
			 
			 id.value = print[b];
			
			}
		if(alphaint.test(valueElement.text()))
			{
			
			
			var number =  ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]; 
			var display1 =["a"];
			var i,j;

			for(i=0;i<=9;i++)
			{
			  for(j=0;j<=9;j++)
			  {
				display1.push(number[i] + "." + j);
			  }
			}
			var c=document.getElementById("valueTempe").innerHTML;
			
			 a=display1.indexOf(c);
			
			 b=a+1;
			 document.getElementById("valueTempe").innerHTML = display1[b];
			 var id = document.getElementById('revisionid');
			 
			 id.value = display1[b];
			
			}
		if(alphaalpha.test(valueElement.text()))
			{
			var number =  ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]; 
			var display1 =["a"];
			var i,j;

			for(i=0;i<=25;i++)
			{
			  for(j=0;j<=25;j++)
			  {
				display1.push(number[i] + "." + number[j]);
			  }
			}
			var c=document.getElementById("valueTempe").innerHTML;
			
			 a=display1.indexOf(c);
			
			 b=a+1;
			 document.getElementById("valueTempe").innerHTML = display1[b];
			 var id = document.getElementById('revisionid');
			 
			 id.value = display1[b];
			
			
			}
		if(intgrt.test(valueElement.text()))
			{
			
			
			var value=valueElement.text();
			var id = document.getElementById('revisionid');
			var inc = parseFloat('1');
			
			  id.value = parseInt(value)+parseFloat(inc);
					  var value1 = valueElement.text(id.value); 
			
			}
		if(alphab.test(valueElement.text()))
			{
			
			var alpha =  ["0","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]; 
			var print = ["0"];
			var i,j;

			
			  for(j=1;j<=26;j++)
			  {
				print.push(alpha[j]);
			  }
			
			var c=document.getElementById("valueTempe").innerHTML;
			 a=print.indexOf(c);
			
			 b=a+1;
			
			 document.getElementById("valueTempe").innerHTML = print[b];
			 var id = document.getElementById('revisionid');
			 
			 id.value = print[b];
			
			}
		
	    return false;
	}


	$('#plus').bind('click', {increment: 0.1}, incrementValue);	
					
			
				/* var value = revisionid.value;
				
				var inc = parseFloat('1');
			  revisionid.value = parseInt(value)+parseFloat(inc); */
			
	
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

 <!--  <script>

	window.onload = function(){
		if(document.getElementById('id_hardcopy').checked)
			{
			var value1 = document.getElementById('id_hardcopy').value;
			toggle2(value1);
			}
		if(document.getElementById('id_electronic').checked){
			
			
			var value1 = document.getElementById('id_electronic').value;
			toggle2(value1);
		}
		if(document.getElementById('id_both').checked){
			
			
			var value1 = document.getElementById('id_both').value;
			toggle2(value1);
		}
	}
		</script> -->

   <jsp:include page="footer.jsp"></jsp:include>   
             
 