<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
  
 <form  enctype="multipart/form-data">
 
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
     <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
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
							
				             </ul>
  </div>
        </td>
      </tr>
     
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>&nbsp;&nbsp;Form Details</h2>
            </div>
            <div class="contentbox">
                    
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <td colspan="3">
            <!--  <div id="child_table" style="display:none;"> -->
<br>
              
             <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
             <c:set value="${formForm.form[0]}" var="forms"> </c:set>
    		<label> Form Details </label>
    
    
             <tr class="row1">
             
              <td valign="middle" align="right" class="input_txt" width="15%"><span class="err">*</span>Form/Rec Id:</td>
               <td valign="top" align="left" class="input_txt1" width="15%">${forms.form_or_rec_id}</td>
               
               <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>Responsibility :</td>
               <td valign="top" align="left" class="input_txt" width="20%">${forms.responsibility}
             
               
           <td valign="top" align="left" class="input_txt" width="20%"></td>
              
             </tr>  
              <tr class="row2">
              
               <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Form/Rec Title:</td>
               <td valign="top" align="left" class="input_txt" width="20%">${forms.form_or_rec_title}</td>
               
               <td valign="middle" id="id_location_lbl" align="right" class="input_txt" width="20%">Process:</td>
               <td valign="top" align="left" id="id_location_txt" class="input_txt" width="25%">${forms.process}
            </td>
            </tr>
            <tr class="row1">
              
               <td valign="middle" id="id_location_lbl" align="right" class="input_txt" width="20%">Media Type:</td>
               <td valign="top" align="left" id="id_location_txt" class="input_txt" width="25%">${forms.media_type}
                <c:choose>
                <c:when test="${forms.media_type=='hardcopy'}">
               <td valign="middle" id="id_location_lbl" align="right" class="input_txt" width="20%">Location:</td>
               <td valign="top" align="left" id="id_location_txt" class="input_txt" width="25%">${forms.location}
               </td></c:when>
               <c:when test="${forms.media_type=='electronic'}">
               <td valign="middle" id="id_location_lbl" align="right" class="input_txt" width="20%">Upload File:</td>
               <td valign="top" align="left" id="id_location_txt" class="input_txt" width="25%">${forms.attachment_name}
              </c:when>
               <c:when test="${forms.media_type=='both'}">
               <td valign="middle" id="id_location_lbl" align="right" class="input_txt" width="20%">Upload File:</td>
               <td valign="top" align="left" id="id_location_txt" class="input_txt" width="25%">${forms.location}
               <td valign="top" align="left" id="id_location_txt" class="input_txt" width="25%">${forms.attachment_name}
              </c:when>
               </c:choose>
           <td valign="middle" id="softcopy_file_label" style="display:none;" align="right" class="input_txt" width="20%"><span class="err">*</span></td>
               <td valign="top" id="softcopy_file_upload" style="display:none;" align="left" class="input_txt" width="25%"><div ><br/><span class="err"></span></div></td>
     
          
           <td valign="top" align="left" class="input_txt" width="20%"></td>
              
             </tr> 
             <tr class="row1">
              
               <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Retention Time:</td>
               <td valign="top" align="left" class="input_txt" width="20%">${forms.retention_time}
               
               </td>
               <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>Form :</td>
               <td valign="top" align="left" class="input_txt" width="25%">${forms.form}
              </td>
            <td valign="top" align="left" class="input_txt" width="20%"></td>
              
             </tr> 
             <tr class="row2">
              
               <td valign="middle" align="right" class="input_txt" width="25%">
               <td valign="top" align="left" class="input_txt" width="20%">
              
            <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
              
             </tr>  
             
		      <tr class="row1" style="border:none;">
           
            
            <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
             </tr>
             
             
               
             <li>
             </li>
             <li>
             </li>
            </table>
           
            </td>
           
            </table>
          
      </td>
      </tr>
              <td colspan="1">
            <!--  <div id="child_table" style="display:none;"> -->
<br>
                <div class="contentbox">
             <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
    		<label> Revision details </label>
             <tr class="row1">
            <td valign="top" align="right" class="input_txt" width="20%"><span class="err">*</span>Document ID :</td>
               <td valign="top" align="left" class="input_txt" width="25%">${forms.document_id}
               </td>
           <td valign="top" align="right" class="input_txt" width="25%"><span class="err">*</span>Date :</td>
               <td valign="top" align="left" class="input_txt" width="20%">${forms.effective_date}
               
               
               </td>
            
               
              <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
                 </tr>  
              <tr class="row2" style="border:none;">
               <td valign="top" align="right" class="input_txt" width="20%"><span class="err">*</span>Approver 1(Process Owner):</td>
               <td valign="top" align="left" class="input_txt" width="25%">${forms.approver1}
               </td>
                <td valign="top" align="right" class="input_txt" width="25%"><span class="err">*</span>Issuer :</td>
               <td valign="top" align="left" class="input_txt" width="20%">${forms.issuer}</td>
               
            <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
             </tr>
            <tr class="row1">
            <td valign="top" align="right" class="input_txt" width="20%"><span class="err">*</span>Comments :</td>
               <td valign="top" align="left" class="input_txt" width="25%">${forms.comments}
               
 				</td>
 				</tr>
             </table></div>
             </div>
             <tr class="row1" >
             <td colspan="2" align="right">
             <input type="button" id="submit"  name="submit" value="Back" class="submit_btn1" onclick="window.location.href='view_form'"></td>
            
</tr></table></div></form>


      <jsp:include page="footer.jsp"></jsp:include>