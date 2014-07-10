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
<title>Edit Form Prefix</title>
</head>
<body>
<form method="post" action="update_formpref">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_prefixform" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span class="buttonsub blue">Add Prefix</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="formprefix_list" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span class="buttonsub blue">View Prefixes</span>
								</a>
							</li>
				          
							</ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Editing Form Prefix</h2>
            </div>  <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <c:set value="${formFormPrefix.formPrefixs[0]}" var="formprefix"> </c:set>
             
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                
                  <td valign="middle" align="left" class="input_txt" width="30%">Description :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="form_name" class="input_txtbx" id="formname" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${formprefix.form_name}" />
                 <br>  <span id="document_id1" style="color:red"></span>  <span id="formname1" style="color:red"></span>
                  <span class="err"><form:errors path="FormPrefix.form_name"></form:errors></span>
                  <input type="hidden" name="id" id="id" value="${formprefix.id}"/>
                  </td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="30%">Form Prefix :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="form_prefix" class="input_txtbx" id="formprefix" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${formprefix.form_prefix}" />
                 <br>    <span id="formprefix1" style="color:red"></span> <span id="docprefix1" style="color:red"></span>
                  <span class="err"><form:errors path="FormPrefix.form_prefix"></form:errors></span></td>
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
             <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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
</body>

  <jsp:include page="footer.jsp"></jsp:include> 
</html>