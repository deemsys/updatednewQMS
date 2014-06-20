<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/modal.js"></script>
<script src="resources/js/popover.js"></script>
<script src="resources/js/transition.js"></script>

<script>

$(function() {
	var date = $('#datepicker').datepicker({ dateFormat: 'yy-mm-dd' }).val();   
        });
 

 $(function() {
	 var date = $('#datepicker1').datepicker({ dateFormat: 'yy-mm-dd' }).val(); 
        });
 

 $(function() {
	 var date = $('#datepicker2').datepicker({ dateFormat: 'yy-mm-dd' }).val(); 
         });
 

 $(function() {
	 var date = $('#datepicker3').datepicker({ dateFormat: 'yy-mm-dd' }).val(); 
     
         });
 
</script>

<form method="post" enctype="multipart/form-data" action="updatehr">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addhr" class="<c:choose>
								<c:when test="${menu=='hr'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add HR & Training</span>
									
								</a>
							</li>
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewhr" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View HR & Training</span>
									
								</a>
							</li>
						</ul>
						
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Update HR & Training</h2>
            </div>
            <div class="contentbox">
            <c:set value="${hRandTrainingForm.hRandTrainings[0]}" var="hRandTrainings"/>
                 <table cellpadding="0" cellspacing="0" border="0" width="100%" style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
					<tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%"><label>HR ID:</label></td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="id" value="<c:out value="${hRandTrainings.id }"/>"/><c:out value="${hRandTrainings.id }"/><br/><span class="err"></span></td>
                 </tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="name" class="input_txtbx1" id="inp_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${hRandTrainings.name }" /><br><span class="err"><form:errors path="HRandTraining.name"></form:errors></span></td>
                <td valign="middle" align="left" class="input_txt" width="30%"> Trainer :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="trainer" class="input_txtbx1" id="inp_trainer" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${hRandTrainings.trainer }" /><br><span class="err"><form:errors path="HRandTraining.trainer"></form:errors></span></td>
                
                
                                 </tr>
		<tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">Job Title</td>
               	<td valign="top" align="left" class="input_txt" width="70%">
               	<%-- <select class="student_txtbx_height_right_ddl" name="job_title" id="org_id">
							    <option>-- Select Job title --</option>
        				    <option value="${hRandTrainings.job_title }" selected>${hRandTrainings.job_title }</option>
			                <c:forEach items="${jobForm.jobs}" var="Jobs" varStatus="status">
        				          <option value="${Jobs.job_title}">${Jobs.job_title}</option>
			                  </c:forEach>
			                 </select> --%>
			                 <select	name="job_title" class="input_cmbbx1" style="width:32%">
			                 <option value="">--Select--</option>
			                 <option <c:if test="${hRandTrainings.job_title eq 'Job Title1'}"><c:out value="Selected"/></c:if> value="Job Title1">Job Title1</option>
							<option <c:if test="${hRandTrainings.job_title eq 'Job Title2'}"><c:out value="Selected"/></c:if> value="Job Title2">Job Title2</option>
							<option <c:if test="${hRandTrainings.job_title eq 'Job Title3'}"><c:out value="Selected"/></c:if> value="Job Title3">Job Title3</option>		
							</select><span class="err"><form:errors path="HRandTraining.job_title"></form:errors></span></td>

			                 
            <td valign="middle" align="left" class="input_txt" width="30%">Qualified By:</td>
                  <td valign="top" align="left" class="input_txt"><select	name="qualified_by" class="input_cmbbx1" style="width:100%">
                  					
                  										<option
															<c:if test="${hRandTrainings.qualified_by eq 'Education'}"><c:out value="Selected"/></c:if>
															value="Education">Education</option>
														<option
															<c:if test="${hRandTrainings.qualified_by eq 'Experience'}"><c:out value="Selected"/></c:if>
															value="Experience">Experience</option>
														<option
															<c:if test="${hRandTrainings.qualified_by eq 'Training'}"><c:out value="Selected"/></c:if>
															value="Training">Training</option>
														
															</select><span class="err"><form:errors path="HRandTraining.qualified_by"></form:errors></span></td>
                
            
               	
               	</tr>
               	
               	<tr class="row1">
                <td valign="middle" align="left" class="input_txt" width="30%">Training Effectiveness Notes:</td>
                 <td><textarea class="input_txtbx1" style="width:32%; height: 70px;" id="inp_job_title" name="training_effectiveness_notes" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 177px; height: 89px;" name="note"><c:out value="${hRandTrainings.training_effectiveness_notes  }"/> </textarea><br><span class="err"><form:errors path="HRandTraining.training_effectiveness_notes"></form:errors></span></td>
 <td valign="middle" align="left" class="input_txt" width="30%">Type:</td>
                  <td valign="middle" align="left" class="input_txt"><select name="type_of_training" class="input_cmbbx1" style="width:100%">

				                  									
                  										<option
															<c:if test="${hRandTrainings.type_of_training eq 'Classroom'}"><c:out value="Selected"/></c:if>
															value="Classroom">Classroom</option>
														<option
															<c:if test="${hRandTrainings.type_of_training eq 'Hands on'}"><c:out value="Selected"/></c:if>
															value="Hands on">Hands on</option>
														</select></td>
                </tr>    
               	
                
				<tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Date Hired</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <input type="text" name="date_hired" class="input_txtbx1" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${hRandTrainings.date_hired }" /><br><span class="err"><form:errors path="HRandTraining.date_hired"></form:errors></span></td>
                <td valign="middle" align="left" class="input_txt" width="30%">Due Date</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <input type="text" name="training_due_date" class="input_txtbx1" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${hRandTrainings.training_due_date }" /><br><span class="err"><form:errors path="HRandTraining.training_due_date"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">Attachments</td>
                  
                  <td valign="top" align="left" class="input_txt" width="70%" >
                   <c:out value="${hRandTrainings.attachment_name}"></c:out>
                  <input type="file" name="attachments" class="input_txtbx1" id="id_attachments" style="color:red; font-weight:bold;" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" ><br>
                  </td>
                  

                  
                  
                   <td valign="middle" align="left" class="input_txt" width="30%">Completion Date</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <input type="text" name="training_completion_date" class="input_txtbx1" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${hRandTrainings.training_completion_date }" /><br><span class="err"><form:errors path="HRandTraining.training_completion_date"></form:errors></span>
                  </td>
                </tr>
                
           
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Functions Needs:</td>
                 <td valign="top" align="left" class="input_txt" width="70%">
                 <input type="checkbox" name="calibration" value="yes" id="calibration"<c:if test="${hRandTrainings.calibration=='yes'}"><c:out value="checked=checked"/></c:if>>&nbsp;Calibration<br>                
                   <input type="checkbox" name="responsibility" value="yes" id="responsibility"<c:if test="${hRandTrainings.responsibility=='yes'}"><c:out value="checked=checked"/></c:if>>&nbsp;Responsibility<br/>
                   <input type="checkbox" name="disposition" value="yes" id="disposition"/<c:if test="${hRandTrainings.disposition=='yes'}"><c:out value="checked=checked"/></c:if>>&nbsp;Disposition<br/>
                  </td>
                  </tr>
                  
                  <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">Training Effective Review Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="training_effectiveness_review_due_date" class="input_txtbx1" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${hRandTrainings.training_effectiveness_review_due_date }" /><br><span class="err"><form:errors path="HRandTraining.training_effectiveness_review_due_date"></form:errors></span></td>
                  <td valign="middle" align="left" class="input_txt" width="30%">Documented In:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="documented_in" class="input_txtbx1" id="inp_documented_in" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${hRandTrainings.documented_in}" /><br><span class="err"><form:errors path="HRandTraining.documented_in"></form:errors></span></td>
                  </tr>
                                 <tr class="row1">
                  <td valign="top" align="left">&nbsp;</td>
                  <td valign="middle" align="center"><input type="submit" value="Update" class="submit_btn1"></td>
                </tr>
              </table>
              
            </div>
          </div></td>
      </tr>
      </table>
      </div>
      
</form>

<script type="text/javascript">
function toggle2(value){
  
    var e = document.getElementById('location_label');
    var e1 = document.getElementById('file_upload_label');
    var e2=document.getElementById('location_text');
    var e3=document.getElementById('id_file');
 if(value==0)
    {
	e.style.display="block";
	e1.style.display="none";
	e2.style.display="block";
	e3.style.display="none";
  
    }

    
}
</script>
<script>
function change_file(){
	document.getElementById("id_file").style.display="block";
	document.getElementById("file_name").style.display="none";
	
}
</script>

 <script>
   $(function() {
		 var format="yy-mm-dd";
	           $( "#datepicker" ).datepicker();
	           
	         });
	 
	 $(function() {
		 var format="yy-mm-dd";
	           $( "#datepicker1" ).datepicker();
	         });
	 
	 $(function() {
		 var format="yy-mm-dd";
         $( "#datepicker2" ).datepicker();
       });
	 
	 $(function() {
		 var format="yy-mm-dd";
         $( "#datepicker3" ).datepicker();
       });
    </script> 
    
    
	 <jsp:include page="footer.jsp"></jsp:include>
