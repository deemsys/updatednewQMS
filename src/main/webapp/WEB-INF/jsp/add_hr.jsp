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
</a></li>
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

              <table cellpadding="0" cellspacing="0" border="0" width="100%">

                <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="20%">ID:</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="hidden" name="id" id="inp_id" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/><font color="Red" size="+1"></font></td>
                </tr>

                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Name:</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input type="text" name="name" class="input_txtbx"   id="name" onInput="return validatename(id);" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" />
                  <br><span id="nameerror" style="color:red"></span>
                   <td valign="middle" align="left" class="input_txt" width="20%"> Trainer:</td>
                  <td valign="middle" align="left" class="input_txt" width="20%"><input  type="text" name="trainer" class="input_txtbx"  id="trainer" onInput="return validatename(id);" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><br/>
                  <span id="trainererror" style="color:red"></span>
                  <span class="err"><form:errors path="HRandTraining.trainer"></form:errors></span></td>
                </tr>

				<tr class="row1">
                    <td valign="middle" align="left" class="input_txt" width="20%">Job Title:</td>
               	 <td valign="middle" align="left" class="input_txt" width="20%"><select	name="job_title" id="jobtitle"class="input_txtbx"  >

                  										<option value="">--Select--</option>
                 										<option	value="Job Title1">Job Title1</option>
														<option value="Job Title2">Job Title2</option>
														<option value="Job Title3">Job Title3</option>
														</select>
														<br> <span id="jobtitleerror" style="color:red"></span>
														<span class="err"><form:errors path="HRandTraining.job_title"></form:errors></span></td>


               	  <td valign="middle" align="left" class="input_txt" width="20%">Qualified By:</td>
                 <td valign="middle" align="left" class="input_txt"width="20%"><select	name="qualified_by" id="qualifiedby"class="input_txtbx" >
                  											<option value="">--Select--</option>
                  										<option
															<c:if test="${HRandTraining.qualified_by eq 'Education'}"><c:out value="Selected"/></c:if>
															value="Education">Education</option>
														<option
															<c:if test="${HRandTraining.qualified_by eq 'Experience'}"><c:out value="Selected"/></c:if>
															value="Experience">Experience</option>

														<option

															<c:if test="${HRandTraining.qualified_by eq 'Training'}"><c:out value="Selected"/></c:if>value="Training">Training</option>
														</select>
															<br> <span id="qualifiedbyerror" style="color:red"></span>
															<span class="err"><form:errors path="HRandTraining.qualified_by"></form:errors></span></td>

				</tr>											

                <tr class="row2">

                 <td valign="middle" align="left" class="input_txt" width="20%"> Training Effectiveness Notes:</td>

                  <td valign="middle" align="left" class="input_txt" width="20%"><textarea class="input_txtbx" id="effectivenessnotes" name="training_effectiveness_notes" style="height:40px;"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 177px; height: 89px;" name="note"></textarea><br>
                   <span id="effectivenessnoteserror" style="color:red"></span>
                  <span class="err"><form:errors path="HRandTraining.training_effectiveness_notes"></form:errors></span></td>
                 <td valign="middle" align="left" class="input_txt" width="20%">Type:</td>
               <td valign="middle" align="left" class="input_txt"><select	name="type_of_training"id="typeoftraining" class="input_txtbx" >
                	<option value="">--Select--</option>
                  										<option value="Classroom">Classroom</option>
														<option value="Hands on">Hands on</option>
							</select>
							<br> <span id="typeoftrainingerror" style="color:red"></span>
							</td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%"> Date Hired:</td>
                  <td valign="top" align="left" class="input_txt" width="20%">
                  <input type="text" name="date_hired" class="input_txtbx" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><br>
                 <span id="datepicker00" style="color:red"></span>
                  <span class="err"><form:errors path="HRandTraining.date_hired"></form:errors></span></td>
                  <td valign="middle" align="left" class="input_txt" width="20%">Due Date:</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="training_due_date" class="input_txtbx"  id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" />
                  <br> <span id="datepicker11" style="color:red"></span><span class="err"><form:errors path="HRandTraining.training_due_date"></form:errors></span></td>
                </tr>

                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Attachments:</td>
   					<td valign="top" align="left" class="input_txt" width="20%"><input name="attachments" id="image"type="file" />
  					 </br><span id="imageerror" style="color:red"></span><span class="err"></span></td>
                   <td valign="middle" align="left" class="input_txt" width="20%">Completion Date:</td>
                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="training_completion_date" class="input_txtbx" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" />
                  
                  <br> <span id="datepicker22" style="color:red"></span><span class="err"><form:errors path="HRandTraining.training_completion_date"></form:errors></span></td>
                </tr>

                  <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Functions Needs:</td>
                 <td valign="top" align="left" class="input_txt" width="20%">

               <input type="checkbox" name="calibration"  value="yes" id="calibration"/>&nbsp;Calibration<br>

                  <input type="checkbox" name="responsibility" value="yes" id="responsibility"/>&nbsp;Responsibility<br>   

                  <input type="checkbox" name="disposition" value="yes" id="disposition"/>&nbsp;Disposition  
				<br> <span id="functionsneedserror" style="color:red"></span>
                 </tr>

                 <tr class="row1">
                   <td valign="middle" align="left" class="input_txt" width="20%">Review Due Date:</td>

                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="training_effectiveness_review_due_date" class="input_txtbx" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" />
                  <br><span id="datepicker33" style="color:red"></span><span class="err"><form:errors path="HRandTraining.training_effectiveness_review_due_date"></form:errors></span></td>
                  <td valign="middle" align="left" class="input_txt" width="20%">Documented In:</td>

                  <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="documented_in" id="documentedin" onInput="return validatename(id);"class="input_txtbx"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" />
                  
                  <br><span id="documentedinerror" style="color:red"></span><span class="err"><form:errors path="HRandTraining.documented_in"></form:errors></span></td>

                 </tr>      

                

                 <tr class="row1">

                  <td valign="top" align="left">&nbsp;</td>

                  <td valign="top" align="left"><input type="submit" value="Add HR" onclick="return validate();" class="submit_btn1"></td>

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

	$("#name").on("keypress", function(e) {
		
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});
$(function() {

	$("#trainer").on("keypress", function(e) {
		
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});

$(function() {

	$("#effectivenessnotes").on("keypress", function(e) {
		
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});

$(function() {

	$("#documentedin").on("keypress", function(e) {
		
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});
	</script>
  <script type="text/javascript">
function validatename(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[^A-Za-z ]/g, "");
    document.getElementById(id).value = textInput;
}  
function validatename1(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[ ]/g, "");
    document.getElementById(id).value = textInput;
}  
</script>
<script type="text/javascript">
function validate()
{
	
	var error="";
	var date = /^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/]\d{4}$/;
	var name = document.getElementById('name').value;
	var trainer = document.getElementById('trainer').value;
	var jobtitle = document.getElementById('jobtitle').value;
	var qualifiedby = document.getElementById('qualifiedby').value;
	var effectivenessnotes = document.getElementById('effectivenessnotes').value;
	var typeoftraining = document.getElementById('typeoftraining').value;
	var datepicker = document.getElementById('datepicker').value;
	var image = document.getElementById('image').value;
	var calibration = document.getElementById('calibration').checked;
	var disposition = document.getElementById('disposition').checked;
	var responsibility =  document.getElementById('responsibility').checked;
	var datepicker1 = document.getElementById('datepicker1').value;
	var datepicker2= document.getElementById('datepicker2').value;
	var datepicker3 = document.getElementById('datepicker3').value;
	var documentedin = document.getElementById('documentedin').value;
	
	if(name == "")
	{
	 document.getElementById("nameerror").innerHTML="Required Field Should not be Empty";
	 error="true";
	
	}
	else if(name.charAt(0) == " ")
	{
		document.getElementById("nameerror").innerHTML="Initail Spaces not Allowed";
		 error="true";
	}
	else if((name.length < 4) ||(name.length > 32))
	{
	document.getElementById("nameerror").innerHTML="Required Field Should be length of 4 to 32";
	error="true";
	
	}
	else
	{
	document.getElementById("nameerror").innerHTML="";
	}
	
	if(trainer == "")
	{
	 document.getElementById("trainererror").innerHTML="Required Field Should not be Empty";
	 error="true";
	
	}
	else if(trainer.charAt(0) == " ")
	{
		document.getElementById("trainererror").innerHTML="Initail Spaces not Allowed";
		 error="true";
	}
	else if((trainer.length < 4) ||(trainer.length > 32))
	{
	document.getElementById("trainererror").innerHTML="Required Field Should be length of 4 to 32";
	error="true";
	
	}
	else
	{
	document.getElementById("trainererror").innerHTML="";
	}
	
	 if(jobtitle == "")
	  {
	  document.getElementById("jobtitleerror").innerHTML="Required Field Should not be Empty";
		 error="true";
	  }
 	else {
	  document.getElementById("jobtitleerror").innerHTML="";
 	}

	 if(qualifiedby == "")
	  {
	  document.getElementById("qualifiedbyerror").innerHTML="Required Field Should not be Empty";
		 error="true";
	  }
 	else {
	  document.getElementById("qualifiedbyerror").innerHTML="";
 	}
	 if(effectivenessnotes == "")
		{
		 document.getElementById("effectivenessnoteserror").innerHTML="Required Field Should not be Empty";
		 error="true";
		
		}
	 	else if(effectivenessnotes.charAt(0) == " ")
		{
			document.getElementById("effectivenessnoteserror").innerHTML="Initail Spaces not Allowed";
			 error="true";
		}
		else if((effectivenessnotes.length < 4) ||(effectivenessnotes.length > 400))
		{
		document.getElementById("effectivenessnoteserror").innerHTML="Required Field Should be length of 4 to 400";
		error="true";
		
		}
	else
		{
		document.getElementById("effectivenessnoteserror").innerHTML="";
		}
	 
	 
	 
	 if(typeoftraining == "")
	  {
	  document.getElementById("typeoftrainingerror").innerHTML="Required Field Should not be Empty";
		 error="true";
	  }
	else {
		  document.getElementById("typeoftrainingerror").innerHTML="";
		}
	 
	 if(datepicker == "")
	 {
	 document.getElementById("datepicker00").innerHTML="Required Field Should not be Empty";
	 error="true";
	 
	 }
	 else if(datepicker.match(date))
	 {
	 document.getElementById("datepicker00").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker00").innerHTML="Invalid Date";
	 error="true";
	 }
	 
	 if(image == "")
	  {
	  document.getElementById("imageerror").innerHTML="Please Upload a File";
		 error="true";
	  }
	else {
		  document.getElementById("imageerror").innerHTML="";
		}

	 
	 if(datepicker1 == "")
	 {
	 document.getElementById("datepicker11").innerHTML="Required Field Should not be Empty";
	 error="true";
	 
	 }
	 else if(datepicker1.match(date))
	 {
	 document.getElementById("datepicker11").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker11").innerHTML="Invalid Date";
	 error="true";
	 }
	 
	 if(datepicker2 == "")
	 {
	 document.getElementById("datepicker22").innerHTML="Required Field Should not be Empty";
	 error="true";
	 
	 }
	 else if(datepicker2.match(date))
	 {
	 document.getElementById("datepicker22").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker22").innerHTML="Invalid Date";
	 error="true";
	 }
	 
	 if(datepicker3 == "")
	 {
	 document.getElementById("datepicker33").innerHTML="Required Field Should not be Empty";
	 error="true";
	 
	 }
	 else if(datepicker3.match(date))
	 {
	 document.getElementById("datepicker33").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker33").innerHTML="Invalid Date";
	 error="true";
	 }
	 if(!disposition && !calibration && !responsibility)
		 {
		 document.getElementById("functionsneedserror").innerHTML="Please Select Atleast One";
		 error="true";
		 }
	 else
		 {
		 document.getElementById("functionsneedserror").innerHTML="";
		 }
	 
	 
	 
	 if(documentedin == "")
		{
		 document.getElementById("documentedinerror").innerHTML="Required Field Should not be Empty";
		 error="true";
		
		}
	 else if(documentedin.charAt(0) == " ")
		{
			document.getElementById("documentedinerror").innerHTML="Initail Spaces not Allowed";
			 error="true";
		}
	else if((documentedin.length < 4) ||(documentedin.length > 400))
		{
		document.getElementById("documentedinerror").innerHTML="Required Field Should be length of 4 to 400";
		error="true";
		
		}
	else
		{
		document.getElementById("documentedinerror").innerHTML="";
		}
	 
	 if(error == "true")
		 {
		 return false;
		 }
}
    </script>        

      <jsp:include page="footer.jsp"></jsp:include>

  