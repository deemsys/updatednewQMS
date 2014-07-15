<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/modal.js"></script>
<html>
<form method="post" action="add_documentprefix">
  <!-- <div id="right_content" style="background-color:lightgrey;"> -->
  
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <!-- <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr> -->
      <tr>
      <td>
      <div>
  <ul class="horizmenu" style=" float:left;margin-left:210px;">
						
							<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="add_prefixdocument" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Document Prefix</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="add_prefixform" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Form Prefix</span>
									
								</a>
							</li>
								<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="add_process" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Process</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="add_formlocation" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Location</span>
									
								</a>
							</li>
								<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="add_documenttype" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span">Document Type</span>
									
								</a>
							</li>
							<%-- <li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="add_revisionleveldocument" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Revision Level</span>
									
								</a>
							</li> --%>
						<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
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
							<%-- <li  style=" float:left;text-transform:uppercase;">
								<a href="add_referenceMaintenance" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Reference Attachment</span>
									
								</a>
							</li>	 --%>		
							
							<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="addreportnc" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Report NC</span>
									
								</a>
							</li>
				          </ul>
  </div>
      </td>
      </tr>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>Add Document Prefix</h2>
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0">
                <tr class="row2">
                  <td valign="middle" align="left" width="50%" class="input_txt">Prefix :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="doc_prefix" class="input_txtbx3" id="docprefix" maxlength="32" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${documentprefix.id}" onInput="validateAlpha();"/>
                <br>  <span id="docprefix1" style="color:red"></span>
                  <span class="err"><form:errors path="DocumentPrefix.doc_prefix"></form:errors></span></td>
                
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" >Description :</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" name="document_id" class="input_txtbx3" maxlength="32" id="document_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${documentprefix.document_id}" onInput="validateAlpha1();"/>
                 <br>   <span id="document_id1" style="color:red"></span>
                  <span class="err"><form:errors path="DocumentPrefix.document_id"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="top" align="left">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Submit"  onclick="return validation();" class="submit_btn1"></td>
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
		$("#docprefix").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
 $(function() {
		$("#document_id").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
 
 
 function validateAlpha(){
	    var textInput = document.getElementById("docprefix").value;
	    textInput = textInput.replace(/[^A-Z ]/g, "");
	    document.getElementById("docprefix").value = textInput;
	}
 function validateAlpha1(){
	    var textInput = document.getElementById("document_id").value;
	    textInput = textInput.replace(/[^A-Za-z ]/g, "");
	    document.getElementById("document_id").value = textInput;
	}
 function validation()
 {
	
	 
	 var error="";
	 var cap = /[A-Z]+$/;
	 var desc = /[A-Za-z ]+$/;
	 var docprefix = document.getElementById('docprefix').value;
	 var document_id= document.getElementById('document_id').value;
	  document.getElementById("docprefix1").innerHTML="";
	   document.getElementById("document_id1").innerHTML="";
	 if(docprefix =="")
		 {
		 document.getElementById("docprefix1").innerHTML="Required Field Should not be Empty";
		 error="true";
		 }
	 else if(docprefix.charAt(0)==" ")
		 {
		 document.getElementById("docprefix1").innerHTML="Required Field Should not be Spaces";
		 error="true";
		 }
	 else if(docprefix.length<4)
	 {
	 document.getElementById("docprefix1").innerHTML="Required and must be of length 4 to 32.";
	 error="true";
	 }
	 else if(docprefix.match(cap))
		 {
		 	 document.getElementById("docprefix1").innerHTML="";
		 }
	 else if(docprefix.substring(0,1)==' ')
		 {
		 document.getElementById("docprefix1").innerHTML="Invalid Prefix";
		error="true";
		 }
	 else {
		 
		 document.getElementById("docprefix1").innerHTML="Required Field Should be Capital Letters";
		 error="true";
	 }
	 
	 
	 if(document_id =="")
	 {
	 document.getElementById("document_id1").innerHTML="Required Field Should not be Empty";
	 error="true";
	 }
 else if(document_id.charAt(0)==" ")
	 {
	 document.getElementById("document_id1").innerHTML="Required Field Should not be Spaces";
	 error="true";
	 }
 else if(document_id.length<4)
 {
 document.getElementById("document_id1").innerHTML="Required and must be of length 4 to 32";
 error="true";
 }
	  
 else if(document_id.match(desc))
	 {
	 	 document.getElementById("document_id").innerHTML="";
	 }
 else {
	 
	 document.getElementById("document_id1").innerHTML="Required Field Should be only Letters";
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