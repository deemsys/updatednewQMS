<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp"></jsp:include>
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
 <link rel="stylesheet" href="resources/css/jquery-ui.css"
	type="text/css" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Document Prefix</title>
</head>
<body>
<form method="post" action="update_documentprefix">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_prefixdocument" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Add Prefix</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="documentprefix_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
								View Prefixes</span>
								</a>
							</li>
				          
							</ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Editing Document Prefix</h2>
            </div>  <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <c:set value="${documentPrefixForm.documentPrefixs[0]}" var="documentprefix"> </c:set>
             
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                
                  <td valign="middle" align="left"  >Prefix:</td>
                  <td valign="top" align="left" width="70%"><input type="text" name="doc_prefix" class="input_txtbx" maxlength="32" id="docprefix" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${documentprefix.doc_prefix}" />
                  <input type="hidden" name="id" id="id" value="${documentprefix.id}"/>
                 <br>   <span id="docprefix1" style="color:red"></span>
                  <span class="err"><form:errors path="DocumentPrefix.doc_prefix"></form:errors></span>
                  
                  </td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" >Document ID :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="document_id" class="input_txtbx" maxlength="32" id="document_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${documentprefix.document_id}" />
                  <br>  <span id="document_id1" style="color:red"></span>
                  <span class="err"><form:errors path="DocumentPrefix.document_id"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="top" >&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Submit" onclick="return validation();" class="submit_btn1"></td>
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
  function validation()
 {
	
	var error="";
	  var cap = /[A-Z]+$/;
	 var desc = /[A-Za-z ]+$/;
	 var docprefix = document.getElementById('docprefix').value;
	 var document_id= document.getElementById('document_id').value;
	 
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
</body>
</html>