<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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

<form method="post" enctype="multipart/form-data" action="addhr">

<!-- Modal Ends -->


<!-- Ajax -->

<script type="text/javascript">

$(window).load

(

		function()

		{

		$.ajax

		(

		{

			type : "POST", url: "/QMS_App/ajax_getjob",

        success: function(response)

  	      {

    		   $('#job_titles').html(response);

   		  }

		}

		);

}

		);

</script>



<script type="text/javascript">


function doAjaxPost() {

		// get the form values  

		alert("hit");

		var job_id = $('#add_job_id').val();

		var job_title=$('#add_job_title').val();

		var job_desc=$('#add_job_desc').val();

		/*   var education = $('#education').val();	 */		

		$.ajax({

			type : "POST",

			url : "/QMS_App/ajax_addjob",

			data : "job_id=" + job_id +"&job_title="+job_title+"&job_desc="+job_desc,

			success : function(response) {

				// we have the response  

				$('#job_titles').html(response);

			//document.getElementById("newjob").style.display="none";

				//  $('#education').val(''); */

			},

			error : function(e) {

				alert('Error: ' + e);

			}

		});

	}

</script>

	<!-- End Ajax -->



<script>

 $(function() {

	 $( "#datepicker" ).datepicker();

        });

 

</script>

  <script>

 $(function() {

	 $( "#datepicker1" ).datepicker();

        });

 

</script>

   <script>

 $(function() {

           $( "#datepicker2" ).datepicker();

         });

 

</script>


   <script>

 $(function() {

	 $( "#datepicker3" ).datepicker();

     

         });

 

</script>


<form method="post" action="addhr">

  <div id="right_content">

    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">

      <tr>

        <td>

        <div>

  <ul class="horizmenu" style=" float:left;margin-left:190px; margin-top:8px;">

  <li  style=" float:left;margin-right:8px;text-transform:uppercase;">

								<a href="addhr" class="<c:choose>

								<c:when test="${menu=='hr'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">

									<span>Add HR & Training</span>

									

								</a>

							</li>

						

							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">

								<a href="viewhr" class="<c:choose>

								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">

									<span>View HR & Training</span>

									

								</a>

							</li>

							

						

				           </ul>

				          

  </div>

        </td>

      </tr>

      <tr>

        <td valign="top" align="left">

            <div class="headings altheading">

              <h2>HR & Training Details</h2><div id="info"></div>

            </div>

            <div class="contentbox">

             <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">

              <table cellpadding="0" cellspacing="0" border="0" width="80%">

                <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="30%">ID:</td>
                  <td valign="top" align="left" class="input_txt" width="50%"><input type="hidden" name="id" id="inp_id" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/><font color="Red" size="+1"></font></td>
            
                </tr>

                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Name :</td>
                  <td valign="middle" align="left" class="input_txt" width="30%"><input type="text" name="name" class="input_txtbx1" style="width:80%" id="inp_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" />
                   <td valign="middle" align="left" class="input_txt" width="30%"> Trainer :</td>
                  <td valign="middle" align="right" class="input_txt" width="30%"><input  type="text" name="trainer" class="input_txtbx1" style="width:80%" id="inp_title_of_contact" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><br/><span class="err"><form:errors path="HRandTraining.trainer"></form:errors></span></td>
                </tr>

				<tr class="row1">
                   <td valign="middle" align="left" class="input_txt" width="30%">Job Title:</td>
               	<%-- <td valign="middle" align="left" class="input_txt" width="70%"><span id="job_titles"></span>&nbsp;&nbsp;

               	<a href="newjob" data-toggle="modal">Add New Job</a><br/><span class="err"><form:errors path="HRandTraining.job_title"></form:errors></span></td>

               	 --%>

               	 <td valign="middle" align="left" class="input_txt"><select	name="job_title" class="input_cmbbx1" style="width:80%" >

                  										<option value="">--Select--</option>
                 										<option	value="Job Title1">Job Title1</option>
														<option value="Job Title2">Job Title2</option>
														<option value="Job Title3">Job Title3</option>
														</select><span class="err"><form:errors path="HRandTraining.job_title"></form:errors></span></td>


               	  <td valign="middle" align="left" class="input_txt" width="30%">Qualified By:</td>
                 <td valign="middle" align="right" class="input_txt"><select	name="qualified_by" class="input_cmbbx1" style="width:80%">
                  											<option value="">--Select--</option>
                  										<option
															<c:if test="${HRandTraining.qualified_by eq 'Education'}"><c:out value="Selected"/></c:if>
															value="Education">Education</option>
														<option
															<c:if test="${HRandTraining.qualified_by eq 'Experience'}"><c:out value="Selected"/></c:if>
															value="Experience">Experience</option>

														<option

															<c:if test="${HRandTraining.qualified_by eq 'Training'}"><c:out value="Selected"/></c:if>

															value="Training">Training</option>

														

															</select><span class="err"><form:errors path="HRandTraining.qualified_by"></form:errors></span></td>

				</tr>											

                <tr class="row2">

                 <td valign="middle" align="left" class="input_txt" width="70%"> Training Effectiveness Notes :</td>

                  <td><textarea class="input_txtbx1" id="inp_job_title" name="training_effectiveness_notes" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 177px; height: 89px;" name="note"></textarea><br><span class="err"><form:errors path="HRandTraining.training_effectiveness_notes"></form:errors></span></td>
                 <td valign="middle" align="left" class="input_txt" width="30%">Type :</td>
               <td valign="middle" align="right" class="input_txt"><select	name="type_of_training" class="input_cmbbx1" style="width:80%">
                	<option value="">--Select--</option>
                  										<option value="Classroom">Classroom</option>
														<option value="Hands on">Hands on</option>
							</select></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%"> Date Hired:</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <input type="text" name="date_hired" class="input_txtbx1" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><br><span class="err"><form:errors path="HRandTraining.date_hired"></form:errors></span></td>
                  <td valign="middle" align="left" class="input_txt" width="30%">Due Date :</td>
                  <td valign="top" align="right" class="input_txt" width="70%"><input type="text" name="training_due_date" class="input_txtbx1" style="width:80%" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><br><span class="err"><form:errors path="HRandTraining.training_due_date"></form:errors></span></td>
                </tr>

                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">Attachments:</td>
   <td valign="top" align="left" class="input_txt" width="70%"><input name="attachments" id="image" type="file" /></br><span class="err"></span></td>
                   <td valign="middle" align="left" class="input_txt" width="30%">Completion Date</td>
                  <td valign="top" align="right" class="input_txt" width="70%"><input type="text" name="training_completion_date" class="input_txtbx1" id="datepicker2" style="width:80%" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><br><span class="err"><form:errors path="HRandTraining.training_completion_date"></form:errors></span></td>
                </tr>

                  <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Functions Needs:</td>
                 <td valign="top" align="left" class="input_txt" width="30%">

               <input type="checkbox" name="calibration"  value="yes" id="calibration"/>&nbsp;Calibration  <br>

                  <input type="checkbox" name="responsibility" value="yes" id="responsibility"/>&nbsp;Responsibility<br>   

                  <input type="checkbox" name="disposition" value="yes" id="disposition"/>&nbsp;Disposition  

                 </tr>

                 <tr class="row1">
                   <td valign="middle" align="left" class="input_txt" width="30%">Review Due Date:</td>

                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="training_effectiveness_review_due_date" class="input_txtbx1" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><br><span class="err"><form:errors path="HRandTraining.training_effectiveness_review_due_date"></form:errors></span></td>
                  <td valign="middle" align="left" class="input_txt" width="30%">Documented In</td>

                  <td valign="top" align="right" class="input_txt" width="70%"><input type="text" name="documented_in" class="input_txtbx1" style="width:150px;" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><br><span class="err"><form:errors path="HRandTraining.documented_in"></form:errors></span></td>

                 </tr>      

                

                 <tr class="row1">

                  <td valign="top" align="right">&nbsp;</td>

                  <td valign="top" align="left"><input type="submit" value="Add HR" class="submit_btn1"></td>

                </tr>

              </table>
              </div>

           

   				</div>


   				</td>

   				</tr>

   				</table>

   				</div>

   				   

</form>


            

      <jsp:include page="footer.jsp"></jsp:include>

  