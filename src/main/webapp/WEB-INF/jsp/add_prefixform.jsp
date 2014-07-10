<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<html>
<form method="post" action="add_formprefix">
  <!-- <div id="right_content" style="background-color:lightgrey;"> -->
  
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <!-- <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr> -->
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
								<c:when test="${menu=='admin'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Form Prefix</span>
									
								</a>
							</li>
							
								<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_process" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
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
				       	  <li  style=" float:left;margin-right:0px;text-transform:uppercase;">
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
							</li>	
						<%-- 	<li  style=" float:left;text-transform:uppercase;">
								<a href="add_referenceMaintenance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Reference Attachment</span>
									
								</a>
							</li>		 --%>

				          </ul>
  </div>
      </td>
      </tr>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>Add Form Prefix</h2>
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0">
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="50%">Description :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" name="form_name" maxlength="32" class="input_txtbx" id="formname" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${formprefix.form_name}" />
                  <br> <span id="document_id1" style="color:red"></span>
                  <span class="err"><form:errors path="FormPrefix.form_name"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" >Form Prefix :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="form_prefix" class="input_txtbx" maxlength="32" id="formprefix" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${formprefix.form_prefix}" />
                   <br> <span id="docprefix1" style="color:red"></span>
                  <span class="err"><form:errors path="FormPrefix.form_prefix"></form:errors></span></td>
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
		$("#formprefix").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
$(function() {
		$("#formname").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
 function validation()
 {
	
	var error="";
	 var cap = /[A-Z]+$/;
	 var desc = /[A-Za-z ]+$/;
	 var formprefix = document.getElementById('formprefix').value;
	 var formname= document.getElementById('formname').value;
	 
	
	 
	 if(formname =="")
	 {
	 document.getElementById("document_id1").innerHTML="Required Field Should not be Empty";
	 error="true";
	 }
 else if(formname.charAt(0)==" ")
	 {
	 document.getElementById("document_id1").innerHTML="Required Field Should not be Spaces";
	 error="true";
	 }
	
 else if(formname.length<4)
	 {
	 document.getElementById("document_id1").innerHTML="Required & must be of length 4 to 32.";
	 error="true";
	 }
	 
 else if(formname.match(desc))
	 {
	 	 document.getElementById("document_id1").innerHTML="";
	 }
 else {
	 
	 document.getElementById("document_id1").innerHTML="Required Field Should be only Letters";
	 error="true";
    }
	 
	 
	 
	 
	 if(formprefix =="")
	 {
	 document.getElementById("docprefix1").innerHTML="Required Field Should not be Empty";
	 error="true";
	 }
 else if(formprefix.charAt(0)==" ")
	 {
	 document.getElementById("docprefix1").innerHTML="Required Field Should not be Spaces";
	 error="true";
	 }
 else if(formprefix.length<4)
	 {
	 document.getElementById("docprefix1").innerHTML="Required & must be of length 4 to 32.";
	 error="true";
	 }
 else if(formprefix.match(cap))
	 {
	 	 document.getElementById("docprefix1").innerHTML="";
	 }
	 
 else {
	 
	 document.getElementById("docprefix1").innerHTML="Required Field Should be Capital Letters";
	 error="true";
 }
	 if(error=="true")
		 {
		 return false;
		 }
 
 }
 
 </script>
 
 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
      <jsp:include page="footer.jsp"></jsp:include> 
 </html>