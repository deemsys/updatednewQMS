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
  <ul class="horizmenu" style=" float:left;margin-left:205px;">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_prefixdocument" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
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
							  <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addsourcenc" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Source of NC</span>
									
								</a>
							</li>	
								<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addtypenc" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Type of NC</span>
									
								</a>
							</li>
				           </ul>
				           <ul class="horizmenu" style=" float:left;margin-left:205px;margin-bottom:5px;">
				           
				        
						
								<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
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
      </tr>
			<c:if test="${success=='insert'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 50px 10px 220px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/inserted.png">
						<a title="Close" href="add_prefixdocument">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>		
						</p>
					</div></td>
			</tr>
		</c:if>	
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2 style="padding-left: 50px">Add Document Prefix</h2>
           
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
         
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0">
                <tr class="row2">
                  <td valign="middle" align="left" width="50%" class="input_txt" style="padding-left: 55px" >Prefix :</td>
                  <td valign="top" align="left" class="input_txt"><input type="text" name="doc_prefix" class="input_txtbx3" id="docprefix" maxlength="15"   value="${documentPrefix.doc_prefix}" onblur="ChangeCase(this)"  onkeypress="return onlyAlphabets(event,this);"/>
                <br>  <span id="docprefix1" style="color:red">
                <c:if test="${success=='exist'}">Document Prefix already exists</c:if>
                 <form:errors path="DocumentPrefix.doc_prefix"></form:errors></span></td>
                
                </tr>
                <tr height="10"></tr>
                 <tr class="row1">
                  <td valign="top" align="left" class="input_txt" style="padding-left: 55px">Description :</td>
                  <td valign="top" align="left" class="input_txt" >
                  <textarea   cols="27" rows="5" class="input_txtarea"  maxlength="400" name="document_id" id="document_id" >${documentPrefix.document_id}</textarea>
             
                 <br>   <span id="document_id1" style="color:red"></span>
                  <span class="err"><form:errors path="DocumentPrefix.document_id"></form:errors></span></td>
                </tr>
                  <tr height="10"></tr>
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
 function onlyAlphabets(e, t) {
     try {
         if (window.event) {
             var charCode = window.event.keyCode;
         }
         else if (e) {
             var charCode = e.which;
         }
         else { return true; }
         if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123))
             return true;
         else
             return false;
     }
     catch (err) {
         alert(err.Description);
     }
 }

 function onlyNumbersandSpecialChar(evt) {
	    var e = window.event || evt;
	    var charCode = e.which || e.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57 || charCode > 107 || charCode > 219 ||charCode > 221) && charCode != 40 && charCode != 32 && charCode != 41 && (charCode < 43 || charCode > 46)) {
	        if (window.event) //IE
	            window.event.returnValue = false;
	        else //Firefox
	            e.preventDefault();
	    }
	    return true;

	   }
 function ChangeCase(elem)
 {
     elem.value = elem.value.toUpperCase();
 }
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
 /* $('docprefix').bind('keypress', function (event) {
	    var regex = new RegExp("^[a-zA-Z]+$");
	    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
	    if (!regex.test(key)) {
	       event.preventDefault();
	       return false;
	    }
	   	    
	});  */
  $(document).ready(function () {
	    $("#docprefix").keyup(function (event) {
	 
	    	if (event.keyCode == 13) {
	          alert("asdas");
	        }
	    });

	   
	});
  
  function validateAlpha(){
	    var textInput = document.getElementById("docprefix").value;
	    textInput = textInput.replace(/[^A-Za-z]/g, "");
	    document.getElementById("docprefix").value = textInput;
	} 
 /* function validateAlpha1(){
	    var textInput = document.getElementById("document_id").value;
	    textInput = textInput.replace(/[^A-Za-z ]/g, "");
	    document.getElementById("document_id").value = textInput;
	} */
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
		 document.getElementById("docprefix1").innerHTML="Required field should not be empty";
		 error="true";
		 }
	 else if(docprefix.charAt(0)==" ")
		 {
		 document.getElementById("docprefix1").innerHTML="Should not accept initial space";
		 error="true";
		 }
	 else if(docprefix.length<4)
	 {
	 document.getElementById("docprefix1").innerHTML="Required field should be of length 4 to 15.";
	 error="true";
	 }
	 else if(docprefix.match(cap))
		 {
		 	 document.getElementById("docprefix1").innerHTML="";
		 }
	 else if(docprefix.substring(0,1)==' ')
		 {
		 document.getElementById("docprefix1").innerHTML="Invalid prefix";
		error="true";
		 }
	 else {
		 
		 document.getElementById("docprefix1").innerHTML="Required field should be capital letters";
		 error="true";
	 }
	 
	 
	 if(document_id =="")
	 {
	 document.getElementById("document_id1").innerHTML="Required field should not be empty";
	 error="true";
	 }
 else if(document_id.charAt(0)==" ")
	 {
	 document.getElementById("document_id1").innerHTML="Should not accept initial space";
	 error="true";
	 }
 else if(document_id.length<4)
 {
 document.getElementById("document_id1").innerHTML="Required field should be of length 4 to 400";
 error="true";
 }
	  
 else if(document_id.match(desc))
	 {
	 	 document.getElementById("document_id").innerHTML="";
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