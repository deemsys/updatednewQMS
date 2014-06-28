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
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span class="buttonsub blue">Add Process</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="process_list" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span class="buttonsub blue">View Process</span>
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
                
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Process Id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="process_id" class="input_txtbx" id="processid" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${process.process_id}" />${process.process_id}<span class="err"><form:errors path="Process.process_id"></form:errors></span>
                  
                  </td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Process Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="process_name" class="input_txtbx" id="processname" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${process.process_name}" />
                    <span id="processname1"></span>
                  <span class="err"><form:errors path="Process.process_name"></form:errors></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Process Owner :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="process_owner" class="input_txtbx" id="processowner" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${process.process_owner}" />
                     <span id="processowner1"></span>
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
	var msg = errord.fontcolor("red");
	var spmsg = space.fontcolor("red");
//	var nummsg = num.fontcolor("red");
	var wdmsg  = wds.fontcolor("red");
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
	 
	/*  if(processid.match(number))
		 {
		 document.getElementById("processid1").innerHTML="";
		 }
	 else {
		 document.getElementById("processid1").innerHTML=nummsg;
		 return false;
	 } */
	 
	 if(processname.match(chars))
	 {
	 document.getElementById("processname1").innerHTML="";
	 }
 	else {
	 document.getElementById("processname1").innerHTML=wdmsg;
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
 }
 
 
 </script>     
</body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include> 
</html>