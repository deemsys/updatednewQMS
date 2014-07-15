<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
<form method="post" enctype="multipart/form-data" action="insertfeedback">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
    <c:if test="${status=='true'}">
    <tr>
    
        <td valign="top" align="left" style="padding:5px 0 10px 0;">
			<div class="status success">
	            <p class="closestatus"><a title="Close" href="">x</a></p>
	            <p><img alt="Success" src="images/icons/icon_success.png"><span>Success!</span>.</p>
	       	</div>                          
		</td>
		
      </tr></c:if>
      <tr>
       
<td>
	 <div>
  <ul class="horizmenu"  style=" float:left;margin-left:190px; margin-top:8px;">
						
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addcustomer" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Customers</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewcustomers" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View Customers</span>
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addfeedback" class="<c:choose>
								<c:when test="${menu=='customer'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Add Feedback</span>
									
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewfeedback" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View feedback</span>
									
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="feedback_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Feedback Report</span>
									
								</a>
							</li>
				            </ul>
  </div>
</td>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>Customer Feedback Details</h2>
            </div>
            <div class="contentbox">
              <div style="border:#993300  2px solid; padding:15px; margin-bottom:15px;">
         
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                 <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="30%"> Date of Feedback :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="date_of_feedback" class="input_txtbx" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br>
                  <span id="datepicker1" style="color:red"></span>
                  <span class="err"><form:errors path="CustomerFeedback.date_of_feedback"></form:errors></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="30%"> Type of Feedback :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <select name="type_of_feedback" class="input_txtbx">
                  <option value="Complaint">Complaint</option>
                  <option value="Suggestion">Suggestion</option>
                  <option value="Product Return">Product Return</option>                  
                  </select>
                  
                  <br/><span class="err"></span></td>
                  </tr>
                  <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%"> Feedback Recorded by :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <select name="feedback_recorded_by" class="input_txtbx">
                  <option value="name1">Associate name1</option>
                  <option value="name2">Associate name2</option>
                  <option value="name3">Associate name3</option>                  
                  </select>                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="top" align="left" class="input_txt" width="30%"> Feedback Details :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <textarea class="input_txtbx" name="feedback_details" id="id_feedback_details" style="height: 89px;"></textarea><br/>
                  <span id="feedbackdetailserror" style="color:red"></span>
                  <span class="err"><form:errors path="CustomerFeedback.feedback_details"></form:errors></span></td>
                  </tr>
                  <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="30%"> Attachments :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input name="attachments" id="image" type="file" /></br>
                  
                  <span id="imageerror" style="color:red"class="err"></span></td>
                  </tr>
                  
                    <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="30%"></td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="submit" class="submit_btn1" name="submit" id="id_submit"onclick="return validate();" onmouseover="showTooltip('tooltip_id','inp_id3');" /><br/></td>
                  </tr>
                  
                  
              </table>
            
              
            </div>
          </div></td>
      </tr>
      </table>
      </div>
      
</form>
 <script>
$(function() {

	$("#id_feedback_details").on("keypress", function(e) {
		
		if (e.which === 32 && !this.value.length)
	        e.preventDefault();
	});
	});
	</script>
<script>
$(function() {
	$("#id_feedback_details").on("keypress", function(e) {
	
	if (e.which === 32 && !this.value.length)
        e.preventDefault();
});
});
function validatename1(id){
	
    var textInput = document.getElementById(id).value;
    textInput = textInput.replace(/[ ]/g, "");
    document.getElementById(id).value = textInput;
}  

</script>
<script type="text/javascript">
function validate()
{

	var error ="";
	var date = /^(0?[1-9]|1[012])[\/](0?[1-9]|[12][0-9]|3[01])[\/]\d{4}$/;	
	var datepicker123 = document.getElementById('datepicker').value;
	var feedbackdetails = document.getElementById('id_feedback_details').value;
	var image = document.getElementById('image').value;
	 if(datepicker123 == "")
	 {
	 document.getElementById("datepicker1").innerHTML="Required Field Should not be Empty";
	error="true";
	 
	 }
	 else if(datepicker123.match(date))
	 {
	 document.getElementById("datepicker1").innerHTML="";
	 }
	 else
	 {
	 document.getElementById("datepicker1").innerHTML="Invalid Date Format";
	 error="true";
	 }
	 
	 
	 if(feedbackdetails == "")
		 {
		 document.getElementById("feedbackdetailserror").innerHTML="Required Field Should not be Empty";
			error="true";
		 }
	 else if(feedbackdetails.charAt(0) == " ")
		 {
		 document.getElementById("feedbackdetailserror").innerHTML="Initial Spaces not Allowed";
			error="true";
		 }
	 
	 else  if((feedbackdetails.length < 4) ||(feedbackdetails.length > 400))
	   {
		   document.getElementById("feedbackdetailserror").innerHTML="Required Field should be Length of 4 to 400";
	    	error="true";
			}
	 else
	 {
		 document.getElementById("feedbackdetailserror").innerHTML="";
	 }
	 
	 if(image == "")
		 {
		 alert("no file");
		 document.getElementById("imageerror").innerHTML="Please Upload a File";
			error="true";
		 }
	 else
		 {
		 alert("file is there");
		 document.getElementById("imageerror").innerHTML="";
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
         });
 
</script>
<jsp:include page="footer.jsp"></jsp:include>
