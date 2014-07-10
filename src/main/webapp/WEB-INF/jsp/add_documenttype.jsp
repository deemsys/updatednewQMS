 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<html>
<form method="post" action="add_documenttype">
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
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
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
								<c:when test="${menu=='documenttype'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span">Document Type</span>
									
								</a>
							</li>
								<%-- <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_revisionleveldocument" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Revision Level</span>
									
								</a>
							</li>	 --%>				
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="setrevision" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Set Revision Format</span>
									
								</a>
							</li>	
				          	<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
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
              <h2>Add Document Type</h2>
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0">
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="50%">Add Document Type :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="document_type" maxlength="32"  class="input_txtbx" id="documenttype" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${documenttype.document_type}" />
                <br>  <span id="documenttype1" style="color:red"></span>
                  <span class="err"><form:errors path="DocumentType.document_type"></form:errors></span></td>
                </tr>
                
                 <tr class="row1">
                  <td valign="top" align="left">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Submit"onclick="return validation();" class="submit_btn1"></td>
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
		$("#documenttype").on("keypress", function(e) {
			if (e.which === 32 && !this.value.length)
		        e.preventDefault();
		});
		});
 function validation()
 {
	 var  chars = /[A-Za-z ]+$/;
	 var documenttype = document.getElementById('documenttype').value;
	 if(documenttype == "")
		 {
		 document.getElementById("documenttype1").innerHTML="Required Field Should not be Empty";
		 return false;
		 }
	 else if(documenttype.charAt(0) == " ")
		 {
		 document.getElementById("documenttype1").innerHTML="Required Field Should not be Spaces";
		 return false;
		 }
	 else if(documenttype.length<4)
	 {
	 document.getElementById("documenttype1").innerHTML="Required and must be of length 4 to 32.";
	 return false;
	 }
	 else if(documenttype.match(chars))
		 {
		 document.getElementById("documenttype1").innerHTML="";
		 }
	 else
		 {
		 document.getElementById("documenttype1").innerHTML="Required Field Should be Alphabates";
		 return false;
		 }
 }
 
 </script>
 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 <jsp:include page="footer.jsp"></jsp:include>
 </html>