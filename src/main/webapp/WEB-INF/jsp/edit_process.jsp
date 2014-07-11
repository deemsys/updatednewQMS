<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
 <link rel="stylesheet" href="resources/css/jquery-ui.css"
	type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Form Process</title>
</head>
<body>
<form method="post" action="update_process">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_process" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span >Add Process</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="process_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span >View Process</span>
								</a>
							</li>
				          
							</ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Editing Process</h2>
            </div>  <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <c:set value="${processForm.processes[0]}" var="process"> </c:set>
             
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                
                  <td valign="middle" align="left" class="input_txt" width="30%">Process Id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="process_id" class="input_txtbx" id="processid" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${process.process_id}" />${process.process_id}<span class="err"><form:errors path="Process.process_id"></form:errors></span>
                  
                  </td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Process Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="process_name" maxlength="32" class="input_txtbx" id="processname" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${process.process_name}" onInput="validateAlpha1()" />
                  <br>  <span id="processname1"></span>
                  <span class="err"><form:errors path="Process.process_name"></form:errors></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%">Process Owner :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="process_owner" maxlength="32"  class="input_txtbx" id="processowner" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${process.process_owner}" onInput="validateAlpha2()" />
               <br>      <span id="processowner1"></span>
                  <span class="err"><form:errors path="Process.process_owner"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Submit" onclick="return validation();"class="submit_btn1"></td>
                </tr>
             </table>
             </td>
             </tr>
             </table>
             </div>
             </div>
             </td>
             </tr>
             </table>
             </div>
             </form>
           <script type="text/javascript">
           $(function() {
       		$("#processname").on("keypress", function(e) {
       			if (e.which === 32 && !this.value.length)
       		        e.preventDefault();
       		});
       		});
        $(function() {
       		$("#processowner").on("keypress", function(e) {
       			if (e.which === 32 && !this.value.length)
       		        e.preventDefault();
       		});
       		});
       		function validateAlpha(){
	    var textInput = document.getElementById("processid").value;
	    textInput = textInput.replace(/[^A-Z0-9]/g, "");
	    document.getElementById("processid").value = textInput;
	}
 function validateAlpha1(){
	    var textInput = document.getElementById("processname").value;
	    textInput = textInput.replace(/[^A-Za-z ]/g, "");
	    document.getElementById("processname").value = textInput;
	}
 function validateAlpha2(){
	    var textInput = document.getElementById("processowner").value;
	    textInput = textInput.replace(/[^A-Za-z ]/g, "");
	    document.getElementById("processowner").value = textInput;
	}
 
 function validation()
 {
	 var number =  /^[A-Za-z0-9]+$/;
	 var chars = /[A-Za-z ]+$/;
	// var processid = document.getElementById('processid').value;
	 var processname = document.getElementById('processname').value;
	 var processowner = document.getElementById('processowner').value;
	 var errord = "Required Field Should not be Empty";
	 var space = "Required Field Should not be Spaces";
	// var num = "Required Field Should be AlphaNumeric";
	 var wds = "Required Field Should be Alphabate";
	 var ermsg="Required and must be of length 4 to 32";
	var msg = errord.fontcolor("red");
	var spmsg = space.fontcolor("red");
//	var nummsg = num.fontcolor("red");
	var wdmsg  = wds.fontcolor("red");
	ermsg=ermsg.fontcolor("red");
	 if(processname==""&&processowner=="")
		 {
		// document.getElementById("processid1").innerHTML=msg;
		 document.getElementById("processname1").innerHTML=msg;
		 document.getElementById("processowner1").innerHTML=msg;
		 return false;
		 }
	
	 else
		 {
		// document.getElementById("processid1").innerHTML="";
		 document.getElementById("processname1").innerHTML="";
		 document.getElementById("processowner1").innerHTML="";
		 
		 }
	/*  if(processid=="")
		 {
		 document.getElementById("processid1").innerHTML=msg;
		 return false;
		 }
	 else */ if(processname=="")
		 {
		 document.getElementById("processname1").innerHTML=msg;
		 return false;
		 }
	 else if(processowner=="")
		 {
		 document.getElementById("processowner1").innerHTML=msg;
		 return false;
		 }
	 else
	 {
	 //document.getElementById("processid1").innerHTML="";
	 document.getElementById("processname1").innerHTML="";
	 document.getElementById("processowner1").innerHTML="";
	
	 }
	/*  
	 if(processid.charAt(0)==" ")
		 {
		 document.getElementById("processid1").innerHTML=spmsg;
		 return false;
		 }
	 else */ if(processname.charAt(0)==" ")
		 {
		 document.getElementById("processname1").innerHTML=spmsg;
		 return false;
		 }
	 else if(processowner.charAt(0)==" ")
		 {
		 document.getElementById("processowner1").innerHTML=spmsg;
		 return false;
		 }
	 else
	 {
	// document.getElementById("processid1").innerHTML="";
	 document.getElementById("processname1").innerHTML="";
	 document.getElementById("processowner1").innerHTML="";
	
	 }
	 
	 if(processname.match(chars))
	 {
	 document.getElementById("processname1").innerHTML="";
	 }
 	else {
	 document.getElementById("processname1").innerHTML=wdmsg;
	 return false;
     } 
	 if(processname.length<4)
	 {
		 document.getElementById("processname1").innerHTML=ermsg;
		 return false;
	 } 
	 
	 if(processowner.match(chars))
 	{
	 document.getElementById("processowner1").innerHTML="";
	 }
 	else {
	 document.getElementById("processowner1").innerHTML=wdmsg;
	 return false;
 	}
	 if(processowner.length<4)
	 {
		 document.getElementById("processowner1").innerHTML=ermsg;
		 return false;
	 }
 }
 
 
 </script>     
</body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include> 
</html>