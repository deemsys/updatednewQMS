<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/modal.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<html>
<form method="post" action="add_process">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
      <td>
      <div>
  <ul class="horizmenu" style=" float:left;margin-left:205px;">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_prefixdocument" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Document Prefix</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_prefixform" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Form Prefix</span>
									
								</a>
							</li>
							
								<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_process" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Process</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_formlocation" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Location</span>
									
								</a>
							</li>
								<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_documenttype" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span">Document Type</span>
									
								</a>
							</li>
							<%-- <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_revisionleveldocument" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Revision Level</span>
									
								</a>
							</li> --%>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="setrevision" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Set Revision Format</span>
									
								</a>
							</li>	
									<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="addsourcenc" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Source of NC</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="addtypenc" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Type of NC</span>
									
								</a>
							</li>	
				           </ul>
				           <ul class="horizmenu" style=" float:left;margin-left:205px;margin-bottom:5px;">
							
						
							<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="addproductidnc" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Product ID</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="addreportnc" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Report NC</span>
									
								</a>
							</li>		
							
							<%-- <li  style=" float:left;text-transform:uppercase;">
								<a href="add_referenceMaintenance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Reference Attachment</span>
									
								</a>
							</li>	 --%>	
				          </ul>
  </div>
      </td>
      </tr>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>Add Process</h2>
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0">
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="50%" >Process Id :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" maxlength="32" name="process_id" class="input_txtbx" id="processid" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${process.process_id}" onInput="validateAlpha()"/>
                <br>  <span id="processid1"></span>
                  <span class="err"><form:errors path="Process.process_id"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" >Process Name :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" maxlength="32" name="process_name" class="input_txtbx" id="processname" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${process.process_name}" onInput="validateAlpha1()" />
                <br>   <span id="processname1"></span>
                  <span class="err"><form:errors path="Process.process_name"></form:errors></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" >Process Owner :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" name="process_owner" maxlength="32" class="input_txtbx" id="processowner" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${process.process_owner}" onInput="validateAlpha2()" />
                 <br>  <span id="processowner1"></span>
                  <span class="err"><form:errors path="Process.process_owner"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="top" align="left">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Submit" onclick="return validation();"class="submit_btn1"></td>
                </tr>
          
                
 </table>
 </td>
 </tr>
 </table>
 </div>
 </td>
 </tr>
 </table>
 </form>
 <script type="text/javascript">
 $(function() {
		$("#processid").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
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
	 var number = /^[A-Za-z0-9]*$/;
	 var chars = /[A-Za-z ]+$/;
	 var processid = document.getElementById('processid').value;
	 var processname = document.getElementById('processname').value;
	 var processowner = document.getElementById('processowner').value;
	 var errord = "Required Field Should not be Empty";
	 var space = "Required Field Should not be Spaces";
	 var num = "Required Field Should be AlphaNumeric";
	 var wds = "Required Field Should be Alphabate";
	 var ermsg="Required and must be of length 4 to 32";
	var msg = errord.fontcolor("red");
	var spmsg = space.fontcolor("red");
	var nummsg = num.fontcolor("red");
	var wdmsg  = wds.fontcolor("red");
	ermsg=ermsg.fontcolor("red");
	 if(processid==""&&processname==""&&processowner=="")
		 {
		 document.getElementById("processid1").innerHTML=msg;
		 document.getElementById("processname1").innerHTML=msg;
		 document.getElementById("processowner1").innerHTML=msg;
		 return false;
		 }
	
	 else
		 {
		 document.getElementById("processid1").innerHTML="";
		 document.getElementById("processname1").innerHTML="";
		 document.getElementById("processowner1").innerHTML="";
		 
		 }
	 if(processid=="")
		 {
		 document.getElementById("processid1").innerHTML=msg;
		 return false;
		 }
	 else if(processname=="")
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
	 document.getElementById("processid1").innerHTML="";
	 document.getElementById("processname1").innerHTML="";
	 document.getElementById("processowner1").innerHTML="";
	
	 }
	 
	 if(processid.charAt(0)==" ")
		 {
		 document.getElementById("processid1").innerHTML=spmsg;
		 return false;
		 }
	 else if(processname.charAt(0)==" ")
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
	 document.getElementById("processid1").innerHTML="";
	 document.getElementById("processname1").innerHTML="";
	 document.getElementById("processowner1").innerHTML="";
	
	 }
	 
	
	 if(processid.match(number))
		 {
		 document.getElementById("processid1").innerHTML="";
		 }
	 else {
		 document.getElementById("processid1").innerHTML=nummsg;
		 return false;
	 }
	 
	 if(processid.length<4)
	 {
		 document.getElementById("processid1").innerHTML=ermsg;
		 return false;
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
  <br><br><br><br><br><br><br><br><br><br><br><br> <br><br><br><br><br><br>    


 <jsp:include page="footer.jsp"></jsp:include> 
 </html>