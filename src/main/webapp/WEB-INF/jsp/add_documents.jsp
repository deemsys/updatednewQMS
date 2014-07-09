<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="header.jsp"></jsp:include>
<script src="/QMS_App/resources/js/jquery.js"></script>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="http://s.codepen.io/assets/reset/normalize.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>  	
<form method="post" enctype="multipart/form-data" action="insert_documents">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
     <tr>
        <td>
        <div>
  						<ul class="horizmenu" style=" float:left;margin-left:190px; margin-top:8px;" >
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="adddocument" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									Add Document
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewdocuments" class="<c:choose>
								<c:when test="${menu=='document'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									View Document
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="document_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Document report
									
								</a>
							</li>
							
				             </ul>
  </div>
        </td>
      </tr>
    
      <tr>
        <td valign="top" align="left"><!-- <!-- 
            <div class="headings altheading">
              <h2>&nbsp;&nbsp;Document Details</h2> 
            </div> -->
            <div class="contentbox">
           <h1 style="color:#7A3A3A;font-size:20px;">Document Details</h1>
                    
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <td colspan="3">
            <!--  <div id="child_table" style="display:none;"> -->
<br>
              
             <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
    		
                <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="15%">Document ID:
               <input type="hidden" name="document_id_hidden" id="generated_id" class="input_txtbx1" style="width:200px;" value=""/>
              <input type="hidden" name="auto_number" value="<c:out value="${id }"/>"/> 
             
               </td>
               <td valign="top" align="left" class="input_txt1" width="15%" id="lable_td" style="display:none;">
               <label id="document_id_full_lbl"></label>
              
               <a href="#" style="text-decoration: none;" onclick="show_edit()">&nbsp;&nbsp;Change</a>            
               <br/>
               </td>          
              
               <td valign="top" align="left" id="edit_td" class="input_txt1" width="15%">
               <select name="document_type_id" id="document_type_id" class="input_cmbbx1" style="width:60px;border:none;background-color:lightgrey;">
               <c:forEach items="${documentPrefixForm.documentPrefixs}" var="prefix" varStatus="status">
        				       <option value="${prefix.doc_prefix}">${prefix.doc_prefix}</option>
			                  </c:forEach>
               </select>
                  <input type="hidden"value="${documentMain.document_id}" id="document_id11" />
               <input type="text" value="" id="document_id" class="input_txtbx145" style="height:22px;background-color:lightgrey;width:50px;border:none;" name="document_id" onblur="change_to_label();"/>
            
              <c:if test="${fail=='fail'}">
              <p class="closestatus">
						<span style="color:red">Required Field Should not be Blank</span>
						</p>
              </c:if>
              </td>
              
              
               <td valign="top" align="left" class="input_txt" width="5%">Media Type:</td>
               <td valign="top" align="left" class="input_txt" width="89px;">
               
             
               
                 <input type="radio" name="media_type" onchange="toggle1(this.value);" value="hardcopy" id="id_hardcopy" <c:if test="${documentMain.media_type=='hardcopy'}"><c:out value="checked" /></c:if>/>Hard Copy&nbsp;&nbsp;&nbsp;
                <input type="radio" name="media_type" value="electronic"  id="id_electronic" onchange="toggle1(this.value);" <c:if test="${documentMain.media_type=='electronic'}"><c:out value="checked" /></c:if>/>Electronic&nbsp;<span class="err"></span>
                <input type="radio" name="media_type"value="both"  id="id_both" onchange="toggle1(this.value);" <c:if test="${documentMain.media_type=='both'}"><c:out value="checked" /></c:if>/>Both&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
               
                    <span class="err" style="color:red"><form:errors path="DocumentMain.media_type"></form:errors></span> 
               </td>
           <td valign="top" align="left" class="input_txt" width="20%"></td>
              
             </tr> 
             
             
            
             
             
              
              <tr class="row2">
              
               <td valign="middle" align="left" class="input_txt" width="25%"><span class="err">Document Title:</td>
               <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="document_title" class="input_txt1" id="documenttitle" style="width:200px;" value="${documentMain.document_title}"/><br/>
                <span id="documenttitle1" style="color:red"></span>
                <span class="err"style="color:red" ><form:errors path="DocumentMain.document_title"></form:errors></span></td>
              
               <td valign="middle" id="id_location_lbl" align="left" class="input_txt" width="20%"><label id="location_label" >Location:</label><br><label id="file_upload_label" style="display:none;"> Upload File:</label></td>
               <td valign="middle" align="left" id="id_location_txt" class="input_txt" width="25%">
               
               <select id="location_text" name="location" class="input_cmbbx1" style="width:200px;">
              <option value = "">--Select Location--</option>
			                <c:forEach items="${formLocationForm.formLocations}" var="formlocation" varStatus="status">
        				       <option value="${formlocation.form_location}"<c:if test="${formlocation.form_location == documentMain.location}"><c:out value="selected"/></c:if>>${formlocation.form_location}</option>
			                  </c:forEach> </select>
			            <span id="hard" style="color:red"></span>
			                  <br>
              <input name="attachments" style="display:none;" id="id_file" type="file" /> <br/>
               <span id="attach" style="color:red"></span>
          <%--   <span class="err"><form:errors path="DocumentMain.attachments"></form:errors></span> --%>
               </td>
          
           <td valign="middle" id="softcopy_file_label" style="display:none;" align="left" class="input_txt" width="20%"></td>
               <td valign="top" id="softcopy_file_upload" style="display:none;" align="left" class="input_txt" width="25%"><div ><br/></div></td>
     
          
           <td valign="top" align="left" class="input_txt" width="20%"></td>
              
             </tr> 
             <tr class="row1">
              
               <td valign="middle" align="left" class="input_txt" width="25%">Document Type:</td>
              <td valign="top" align="left" class="input_txt" width="25%">
              <select name="document_type" id="documenttype" class="input_cmbbx1" style="width:200px;">
              <option value="">--Select--</option>
                <c:forEach items="${documentTypeForm.documentTypes}" var="documenttype" varStatus="status">
        				       <option value="${documenttype.document_type}"<c:if test="${documenttype.document_type == documentMain.document_type}"><c:out value="selected"/></c:if>>${documenttype.document_type}</option>
			                  </c:forEach> </select>
             <br/>
             <span class="err"style="color:red" ><form:errors path="DocumentMain.document_type"></form:errors></span></td>
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
               <td valign="middle" align="left" class="input_txt" width="20%"><span class="err">External Document ?(Y/N):</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               
              <input type="radio" name="external" value="Yes"  id="id_yesforexternal"checked>Yes&nbsp;&nbsp;&nbsp;
              <input type="radio" name="external" value="No" id="id_noforexternal"  >No&nbsp;&nbsp;&nbsp;<br/>
               <span class="err" style="color:red"><form:errors path="DocumentMain.external"></form:errors></span>
               </td>
            <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
              
             </tr>
               
            
            
            </table>
           
            </td>
           
            </table>
          
      </td>
      </tr>
      
     
              <td colspan="1">
            <!--  <div id="child_table" style="display:none;"> -->
<br><!-- 
 <div class="headings altheading">
              <h2>&nbsp;&nbsp;Revision Details</h2> -->
                <div class="contentbox">
           <h1 style="color:#7A3A3A;font-size:20px;">Revision Details</h1>
             <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
              
              
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
    		
    <tr class="row2">
                            <td valign="middle" align="left" class="input_txt">Document Id</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="documentid"
																			name="document_id"
																			value="" /><br/>
																		
																		<span class="err" style="color:red"><form:errors path="DocumentMain.document_id"></form:errors></span> 
																			</td>
																			
																		  <td valign="middle" align="left" class="input_txt" width="25%">Date:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" id="datepicker123" name="date" class="input_txtbx1" style="width:200px;" value="${documentMain.date}"/><br/>
               <span id="datepicker1234"style="color:red"></span>
               <span class="err"style="color:red"><form:errors path="DocumentMain.date"></form:errors></span> </td>
              	
								
</tr>             
             <tr class="row1" style="border:none;">
           
            <td valign="middle" align="left" class="input_txt" width="25%">Issuer:</td>
               <td valign="top" align="left" id="edit_td_issuer" class="input_txt" width="20%">
                <input type="hidden" value="${documentMain.issuer}" id="issu"/>
               <select name="filter" id="filter_value" class="input_cmbbx1" onchange="doAjaxPost(this.value);" onblur="change_to_label_issuer();" style="width:80px;">
               <option value="-">--Select--</option>
               <option value="A">A</option>
              <option value="B">B</option>
              <option value="C">C</option>
              <option value="D">D</option>
              <option value="E">E</option>
              <option value="F">F</option>
              <option value="G">G</option>
              <option value="H">H</option>
              <option value="I">I</option>
              <option value="J">J</option>
              <option value="K">K</option>
              <option value="L">L</option>
              <option value="M">M</option>
              <option value="N">N</option>
              <option value="O">O</option>
              <option value="P">P</option>
              <option value="Q">Q</option>
              <option value="R">R</option>
              <option value="S">S</option>
              <option value="T">T</option>
              <option value="U">U</option>
              <option value="V">V</option>
              <option value="W">W</option>
              <option value="X">X</option>
              <option value="Y">Y</option>
              <option value="Z">Z</option>
              
               </select>
                <span id="issuer_generate">
               <span class="err"style="color:red"><form:errors path="DocumentMain.issuer"></form:errors></span> 
               </span>
                <label id="issuer_full_lbl"></label><a href="#" style="text-decoration: none;" onclick="show_edit_issuer()">&nbsp;&nbsp;Change</a>            
               <br/>
            
             
               </td> 
                <td valign="middle" align="left" class="input_txt" width="25%">Approver 1(Process Owner):</td>
               <td valign="top" align="left" id="edit_td_issuer1" class="input_txt" width="20%">
               <input type="hidden" value="${documentMain.approver1}" id="appro">
               
               
               </input>
               <select name="filter" id="filter_value1" class="input_cmbbx1" onchange="AjaxProcessOwner(this.value);" onblur="change_to_label_issuer1();" style="width:80px;">
            
               <option value="-">--Select--</option>
               <option value="A">A</option>
              <option value="B">B</option>
              <option value="C">C</option>
              <option value="D">D</option>
              <option value="E">E</option>
              <option value="F">F</option>
              <option value="G">G</option>
              <option value="H">H</option>
              <option value="I">I</option>
              <option value="J">J</option>
              <option value="K">K</option>
              <option value="L">L</option>
              <option value="M">M</option>
              <option value="N">N</option>
              <option value="O">O</option>
              <option value="P">P</option>
              <option value="Q">Q</option>
              <option value="R">R</option>
              <option value="S">S</option>
              <option value="T">T</option>
              <option value="U">U</option>
              <option value="V">V</option>
              <option value="W">W</option>
              <option value="X">X</option>
              <option value="Y">Y</option>
              <option value="Z">Z</option>
              
               </select>
                <span id="issuer_generate1">
                <span class="err"style="color:red"><form:errors path="DocumentMain.approver1"></form:errors></span> 
               </span>
                <label id="issuer_full_lbl1"></label><a href="#" style="text-decoration: none;" onclick="show_edit_issuer1()">&nbsp;&nbsp;Change</a>            
               <br/>
              </td>
              <td valign="top" align="left" class="input_txt" width="20%"></td>
                 </tr>  
              <tr class="row2" style="border:none;">
              
            <%--     <td valign="middle" align="left" class="input_txt" width="25%">Revision Level:</td>
               <td valign="top" align="left" class="input_txt" width="20%">
               <select name="revision_level" id="revisionlevel" class="input_cmbbx1" style="width:200px;">
              
                <c:forEach items="${documentRevisionLevelForm.documentRevisionLevels}" var="revisionlevel" varStatus="status">
        				       <option value="${revisionlevel.revision_level}">${revisionlevel.revision_level}</option>
			                  </c:forEach> </select>
             <br/>
             <span class="err"><form:errors path="DocumentMain.revision_level"></form:errors></span></td>--%>
             
                 <td valign="middle" align="left" class="input_txt" width="25%">Revision Level:</td>
           
               <td valign="top" align="left" class="input_txt1" width="20%">
               <input type="text" name="revision_level" class="input_txt1" id="revisionlevel" style="width:200px;" value="${documentMain.revision_level}"/><br/>
               <span id="revisionlevel1" style="color:red"></span>
        <%--  <select name="revision_level" id="revisionlevel" class="input_cmbbx1" style="width:100%;height:18px;beckground:lightgrey;">
               				<option value="">--select--</option>
                              <c:forEach items="${documentRevisionLevelForm.documentRevisionLevels}" var="revisionlevel" varStatus="status">
        				       <option value="${revisionlevel.combined_output}">${revisionlevel.combined_output}</option>
			                  </c:forEach> </select>  --%>
              <span class="err"style="color:red"><form:errors path="DocumentMain.revision_level"></form:errors></span> 
             
            </td>
              
               <%-- <input type="text" id="revision_level" name="revision_level" class="input_txtbx1" style="width:200px;" value="${documentMain.revision_level }"/><br/>
              <span class="err"style="color:red"><form:errors path="DocumentMain.revision_level"></form:errors></span> --%>
               <td valign="middle" align="left" class="input_txt" width="20%">Approver 2(Doc Control):</td>
               <td valign="top" align="left" class="input_txt" width="25%">
                <select name="approver2" id="id_inpapprover2"  class="input_cmbbx1" style="width:200px;">
               <option value="">--Select--</option>
               <c:forEach items="${employeeForm1.employees}" var="employees" varStatus="true">
               <option value="<c:out value="${employees.name}"/>"<c:if test="${documentMain.approver2==employees.name}"><c:out value="Selected"/></c:if>><c:out value="${employees.name}"/></option>
               </c:forEach>
               
               
               
               </select>
               
               <br/>
                <span class="err"style="color:red"><form:errors path="DocumentMain.approver2"></form:errors></span></td>
            <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
             </tr>
             <tr class="row1" style="border:none;">
               <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
              <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
                <td valign="middle" align="left" class="input_txt" width="20%">Approver 3(Mgmt Report):</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               <select name="approver3" id="id_inpapprover3"  class="input_cmbbx1" style="width:200px;">
               <option value="">--Select--</option>
               <c:forEach items="${employeeForm2.employees}" var="employees" varStatus="true">
               <option value="<c:out value="${employees.name}"/>"<c:if test="${employees.name == documentMain.approver3}"><c:out value="selected"/></c:if>><c:out value="${employees.name}"/></option>
               </c:forEach>
              </select>
               
               <br/><span class="err"style="color:red"><form:errors path="DocumentMain.approver3"></form:errors></span> </td>
          
             </tr>  
              <tr class="row2" style="border:none;">
                 <td valign="middle" align="left" class="input_txt">Comments:</td>
               <td valign="top" align="left"><textarea class="input_txtbx1" id="comments"  name="comments"  style="width:100%; height: 89px;" >${documentMain.comments}</textarea><br/>
              <span id="comments1" style="color:red"></span>
                <span class="err"style="color:red"><form:errors path="DocumentMain.comments"></form:errors></span></td>
         
               <td valign="top" align="left" class="input_txt" width="20%">Status:</td>
               <td valign="top" align="left" class="input_txt" width="25%">
              
               
              <select name="status" id="status" class="input_cmbbx1" style="width:200px;">
              <option value="">--Select--</option>
               <option value="Draft" <c:if test="${documentMain.status=='Draft'}"><c:out value="Selected"/></c:if>>Draft</option>
               <option value="Active" <c:if test="${documentMain.status=='Active'}"><c:out value="Selected"/></c:if>>Active</option>
               <option value="Obsolete" <c:if test="${documentMain.status=='Obsolete'}"><c:out value="Selected"/></c:if>>Obsolete</option>
               </select>
                
               <br/><span class="err"style="color:red"><form:errors path="DocumentMain.status"></form:errors></span> </td>
            <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
             </tr>
             
             </table></div>
             </div>
             <tr class="row1" >
             <td colspan="2" align="right">
             <input align="left" class="submit_btn1" type="submit" id="submit" onclick="return validation();" name="submit" value="Submit" ></td>
             <td colspan="3">
              <input align="middle" class="submit_btn1" type="reset" id="reset_export" name="reset_export" value="Reset" ></td>
            <!-- <td><a href="#" class="button blue">
  
</a>

<a href="#" class="button yellow">
  Reset
</a>        
</td> -->
</tr></table></div></form>
<script type="text/javascript">

function toggle1(value){
	
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
	var date = /^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/]\d{4}$/;
	var dotnumber = /^[a-zA-Z0-9]*$|[a-zA-Z0-9][\w\.]+[a-zA-Z0-9]$/;
	 var number = /^[A-Za-z0-9]*$/;
	 var error ="";
	 var datepicker123=document.getElementById('datepicker123').value;
	 var e2=document.getElementById('location_text').value;
	 var e3=document.getElementById('id_file').value;
	 var documenttitle = document.getElementById('documenttitle').value;
	 var revisionlevel = document.getElementById('revisionlevel').value;
	 var comments = document.getElementById('comments').value;
	 
	 if(document.getElementById('id_hardcopy').checked)
	 {
		if(e2=="")
			{
			
			document.getElementById("hard").innerHTML="Required Field Should not be Empty";
			error ="true";
			}
	 }
	 
	 
	 
	 
	 
	 if(document.getElementById('id_electronic').checked)
	{
		 if(e3=="")
			 {
			
			 document.getElementById("attach").innerHTML="File No Uploaded";
			 error ="true";
			 }
		
	}
	 
	 
	 
	 
	if(document.getElementById('id_both').checked)
		{
		if(e2=="")
		{
		
		document.getElementById("hard").innerHTML="Required Field Should not be Empty";
		error ="true";
		}
	
		 if(e3=="")
		 {
			
		 document.getElementById("attach").innerHTML="File No Uploaded";
		 error ="true";
		 }
	
		}
	
	
	
	
	
	 if(documenttitle =="")
	 {
		 document.getElementById("documenttitle1").innerHTML="Required Field Should not be Empty";
		 error ="true";
	 }
	 else if(documenttitle.match(number))
	 {
			 document.getElementById("documenttitle1").innerHTML="";
 	 }
	 else
		 {
		   document.getElementById("documenttitle1").innerHTML="Required Field Should be Alpha-Numeric";
		   	error ="true";
		 }
	 
	 
	 
	 if(revisionlevel == "")
		 {
		 document.getElementById("revisionlevel1").innerHTML="Required Field Should not be Empty";
		 error ="true";
		 }
	 else if(revisionlevel.charAt(0) ==" ")
	 {
		 document.getElementById("revisionlevel1").innerHTML="Required Field Should not be spaces";
		 error ="true";
	 }	 
	 else if(revisionlevel.match(dotnumber))
		 {
		 if(revisionlevel.charAt(0) ==("@" ) || revisionlevel.charAt(0) ==("!")||  revisionlevel.charAt(0) ==("#")
				 ||revisionlevel.charAt(0) ==("$")||revisionlevel.charAt(0) ==("%")||revisionlevel.charAt(0) ==("^")||revisionlevel.charAt(0) ==("&")
				 ||revisionlevel.charAt(0) ==("*")||revisionlevel.charAt(0) ==(")")||revisionlevel.charAt(0) ==("(")||revisionlevel.charAt(0) ==("'")||revisionlevel.charAt(0) ==(":")
						 ||revisionlevel.charAt(0) ==(";") || revisionlevel.charAt(0) ==('"'))
			 {
			 document.getElementById("revisionlevel1").innerHTML="Required Field Should be Alpha-Numeric";
			 error ="true";
			 }
		 else{
			 document.getElementById("revisionlevel1").innerHTML="";
			 }
		 }
	 
		 
	 else{
		 document.getElementById("revisionlevel1").innerHTML="Required Field Should be Alpha-Numeric";
		 error ="true";
	 }

		
	 
	
	 
	 
	 
	 if(comments.charAt(0) ==" ")
	 {
		 document.getElementById("comments1").innerHTML="Required Field Should not be space";
		 error ="true";
	 }
		 else if(comments.match(validate1))
		 {
			 document.getElementById("comments1").innerHTML="";
		 }
	 	else{
				 document.getElementById("comments1").innerHTML="Required Field Should not be Empty";
				 error ="true";
		    }
		
	
	 
		 if(datepicker123 == "")
		 {
		 document.getElementById("datepicker1234").innerHTML="Required Field Should not be Empty";
		 error ="true";
		 
		 }
		 else if(datepicker123.match(date))
		 {
		 document.getElementById("datepicker1234").innerHTML="";
		 }
		 else
		 {
		 document.getElementById("datepicker1234").innerHTML="Invalid Date";
		 error ="true";
		 }
		 if(error == "true")
			 {
		 return false;
			 }
	}
	
	
	
</script>
         <script>
         $(function() {
        	 
             $( "#datepicker" ).datepicker();
             $( "#datepicker123" ).datepicker();
           });
</script>

<script type="text/javascript">
function doAjaxPost(value) {

	document.getElementById('filter_value').style.display="none";
	 document.getElementById("issuer_generate").style.display="inline";
	var filer_value = value;
	
	$.ajax({
		type : "POST",
		url : "/QMS_App/ajax_getissuer",
		data : "filter_val=" + filer_value,
		success : function(response) {
			
			$('#issuer_generate').html(response);
			//$('#filter_value').hide();
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
}
function AjaxProcessOwner(value) {
	
	document.getElementById('filter_value1').style.display="none";
	 document.getElementById("issuer_generate1").style.display="inline";
	var filer_value1 = value;
	
	$.ajax({
		type : "POST",
		url : "/QMS_App/ajax_getprocessowner",
		data : "filter_val=" + filer_value1,
		success : function(response) {
			
			$('#issuer_generate1').html(response);
			//$('#filter_value').hide();
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
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

function change_to_label()
{
	
	var numbers = /^[0-9]+$/; 
	var type=document.getElementById("document_type_id");	
	var doc_id=document.getElementById("document_id");	
	document.getElementById("lable_td").style.display="block";
	document.getElementById("edit_td").style.display="none";
	if(doc_id.value.match(numbers))
	{
		if((doc_id.value.length < 4) || (doc_id.value.length > 32))
			{
			var color = "Required field should be a length of 4 to 32";
			var result = color.fontcolor("red");
			document.getElementById("document_id_full_lbl").innerHTML=result;
			}
		else{
	document.getElementById("document_id_full_lbl").innerHTML=type.value+-+doc_id.value;
			}
	}
	else{
		var color = "Please Enter numeric values";
		var result = color.fontcolor("red");
		document.getElementById("document_id_full_lbl").innerHTML=result;
	}
	var gen_id=document.getElementById("generated_id");
	gen_id.value=type.value+-+doc_id.value;
	
	if((gen_id.value)!= null)
	{
   	documentid.value=gen_id.value;
   
	}

}

    function toggle(value){
    	
    if(value!=null)
    	documentid.value=value;
    
    }
   
function show_edit()
{
	
document.getElementById("lable_td").style.display="none";
	document.getElementById("edit_td").style.display="block";
	
	}
function show_lable()
{
	
	var doc_id3=document.getElementById("user_def_document_id1");	
	var doc_id4=document.getElementById("user_def_document_id2");
	var gen_id1=document.getElementById("generated_id");
	gen_id1.value=doc_id3.value+-+doc_id4.value;
	document.getElementById("lable_td").style.display="block";
	document.getElementById("edit_td").style.display="none";
	document.getElementById("user_defined_td").style.display="none";
	document.getElementById("document_id_full_lbl").innerHTML=doc_id3.value+-+doc_id4.value;	
	
	} 
  function show_userdefined()
{
	
document.getElementById("lable_td").style.display="none";
	document.getElementById("edit_td").style.display="none";
	document.getElementById("user_defined_td").style.display="block";
	} 
  function hide_userdefined()
  {
  	
  document.getElementById("lable_td").style.display="none";
  	document.getElementById("edit_td").style.display="block";
  	document.getElementById("user_defined_td").style.display="none";
  	} 
  function show_filter()
  {
  	
  document.getElementById("filter_value").style.display="inline";
  document.getElementById("issuer_generate").style.display="none";
  	} 
  
  function change_to_label_issuer()
  {
  	
      
  	var type=document.getElementById("filter_value");	
  	
  	document.getElementById("lable_td_issuer").style.display="block";
  	document.getElementById("edit_td_issuer").style.display="none";
  	
  	document.getElementById("issuer_full_lbl").innerHTML=type.value;
  	
  	}
  function change_to_label_issuer1()
  {
  	
      
  	var type=document.getElementById("filter_value1");	
  	
  	document.getElementById("lable_td_issuer").style.display="block";
  	document.getElementById("edit_td_issuer1").style.display="none";
  	
  	document.getElementById("issuer_full_lbl1").innerHTML=type.value;
  	
  	}
  function show_edit_issuer()
  {
	  document.getElementById("issuer_generate").style.display="none";
	  document.getElementById("issuer_full_lbl").style.display="none";
  document.getElementById("filter_value").style.display="block";
  
  	
  	}
  function show_edit_issuer1()
  {
	  document.getElementById("issuer_generate1").style.display="none";
	  document.getElementById("issuer_full_lbl1").style.display="none";
  document.getElementById("filter_value1").style.display="block";
  
  	
  	}
  </script>
       <script>

	window.onload = function(){
		var name = document.getElementById('appro').value;
		var issu = document.getElementById('issu').value;
		if(name=="")
			{
			
			}
		else{
		AjaxProcessOwner(name.charAt(0));
		}
		if(issu == "")
			{
			
			}
		else{
			
			doAjaxPost(issu.charAt(0));
		}
		if(document.getElementById('id_hardcopy').checked)
			{
			var value1 = document.getElementById('id_hardcopy').value;
			toggle1(value1);
			}
		if(document.getElementById('id_electronic').checked){
			
			
			var value1 = document.getElementById('id_electronic').value;
			toggle1(value1);
		}
		if(document.getElementById('id_both').checked){
			
			
			var value1 = document.getElementById('id_both').value;
			toggle1(value1);
		}
		var docid= document.getElementById('document_id11').value;
		if(docid=="")
			{
			
			}
		else{
		var res = docid.split("-");
		document.getElementById("document_id").focus();
	    document.getElementById("document_id").value = res[1];
		}
	}
		</script>
 		
      <jsp:include page="footer.jsp"></jsp:include>
 