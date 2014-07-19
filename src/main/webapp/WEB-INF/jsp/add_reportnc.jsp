<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/modal.js"></script>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inserting Type NC</title>
</head>
<body>
<form method="post" action="addreport_nc">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
      <td>
      <div>
  <ul class="horizmenu" style=" float:left;margin-left:205px;">
						
							<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="add_prefixdocument" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
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
						<%-- 	<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
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
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>"rel="ddsubmenu2">
									<span>Source of NC</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:6px;text-transform:uppercase;">
								<a href="addtypenc" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
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
								<c:when test="${menu=='admin'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Report NC</span>
									
								</a>
							</li>		
				          </ul>
				          
				         
  </div>
      </td>
      </tr>
       <c:if test="${success=='insert'}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 50px 10px 228px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
						<img alt="Success" src="resources/images/icons/inserted.png">
						<a title="Close" href="addreportnc">
						<img alt="Success" src="resources/images/icons/icon_square_close.png"></a>		
						</p>
					</div></td>
			</tr>
		</c:if>  
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2 style="padding-left: 55px">Add Report NC</h2>
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
         
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" >
      <%--           <tr class="row2">
                <!--   <td valign="middle" align="left" class="input_txt" >ID</td> -->
                  <td valign="top" align="left" class="input_txt" ><input type="hidden" name="id" class="input_txtbx1" id="id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${id}" /><span class="err"><form:errors path="ReportedByNC.id"></form:errors></span></td>
                </tr>
                
       --%>          <tr class="row2">
                  <td valign="top" align="left" class="input_txt" width="20%" style="padding-left: 60px">Type of NC :</td>
                  <td valign="top" align="left" class="input_txt" style="width:15%;height:3%;">
                    <c:choose>
               	<c:when test="${empty typenc}">
                  <select name="type_of_nc"  class="input_txtbx" id="typeofNc" >
                               										<option value="">--Select--</option>
						                    							<option <c:if test="${reportedByNCs.type_of_nc eq 'Product Quality'}"><c:out value="Selected"/></c:if> value="Product Quality" >Product Quality</option>
																		<option <c:if test="${reportedByNCs.type_of_nc eq 'Service Quality'}"><c:out value="Selected"/></c:if>value="Service Quality">Service Quality</option>
																		<option <c:if test="${reportedByNCs.type_of_nc eq 'Late Delivery'}"><c:out value="Selected"/></c:if> value="Late Delivery">Late Delivery</option>
																		<option <c:if test="${reportedByNCs.type_of_nc eq 'Early Delivery'}"><c:out value="Selected"/></c:if>value="Early Delivery">Early Delivery</option>
               <c:forEach items="${type_of_NC_Form.type_of_NCs}" var="type_of_NCs" varStatus="true">
        				       <option value="<c:out value="${type_of_NCs.type_of_nc}"/>"><c:out value="${type_of_NCs.type_of_nc}"/></option>
			                  </c:forEach>
               </select>
               </c:when>
               <c:otherwise>
                 <select name="type_of_nc"  class="input_txtbx" id="typeofNc" >
                               										<option value="">--Select--</option>
						                    							<option <c:if test="${typenc eq 'Product Quality'}"><c:out value="Selected"/></c:if> value="Product Quality" >Product Quality</option>
																		<option <c:if test="${typenc eq 'Service Quality'}"><c:out value="Selected"/></c:if>value="Service Quality">Service Quality</option>
																		<option <c:if test="${typenc eq 'Late Delivery'}"><c:out value="Selected"/></c:if> value="Late Delivery">Late Delivery</option>
																		<option <c:if test="${typenc eq 'Early Delivery'}"><c:out value="Selected"/></c:if>value="Early Delivery">Early Delivery</option>
               <c:forEach items="${type_of_NC_Form.type_of_NCs}" var="type_of_NCs" varStatus="true">
        				       <option <c:if test="${reportedByNCs.type_of_nc eq typenc}"><c:out value="selected"/></c:if>value="<c:out value="${type_of_NCs.type_of_nc}"/>"><c:out value="${type_of_NCs.type_of_nc}"/></option>
			                  </c:forEach>
               </select>
               
               
               </c:otherwise>
               </c:choose>
             <br>  <span id="typeofNc1" style="color:red"></span>
               <span class="err"><form:errors path="ReportedByNC.type_of_nc"></form:errors></span></td>
               
                  <td valign="top" align="left" class="input_txt" width="20%" style="padding-left: 55px">Group Person :</td>
                  <td valign="top" align="left" class="input_txt" width ="40%"><input type="text"  maxlength="32"  name="group_person" class="input_txtbx" id="groupperson" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${person}" onkeypress="return onlyAlphabets(event,this);"	/>
                 <br>  <span id="groupperson1" style="color:red">
 				 <c:if test="${success=='exist'}">Group person already exist</c:if></span>
                  <td valign="top" align="left" class="input_txt" style="width:25%;height:3%;"><input type="text"  maxlength="32"  name="group_person" class="input_txtbx" id="groupperson" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" onkeypress="return onlyAlphabets(event,this);"	/>
                 <br>  <span id="groupperson1" style="color:red"></span>
                  <span class="err"><form:errors path="ReportedByNC.group_person"></form:errors></span></td>
                </tr>
                <tr height="10"></tr>
                 <tr class="row1">
                 
                  <td valign="top" colspan="3"align="center"><input type="submit" value="Submit" onclick="return validation();" class="submit_btn1"></td>
             
                </tr>
               <tr style="height: 250%"><td ></td></tr>
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
           		$("#groupperson").on("keypress", function(e) {
           			if (e.which === 32 && !this.value.length)
           		        e.preventDefault();
           		});
           		});
               function validateAlpha4(){
            	    var textInput = document.getElementById("groupperson").value;
            	    textInput = textInput.replace(/[^A-Za-z ]/g, "");
            	    document.getElementById("groupperson").value = textInput;
            	}
               function onlyAlphabets(e, t) {
            	    try {
            	        if (window.event) {
            	            var charCode = window.event.keyCode;
            	        }
            	        else if (e) {
            	            var charCode = e.which;
            	        }
            	        else { return true; }
            	        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode==32))
            	            return true;
            	        else
            	            return false;
            	    }
            	    catch (err) {
            	        alert(err.Description);
            	    }
            	}
               function onlyAlphabets(e, t) {
            	    try {
            	        if (window.event) {
            	            var charCode = window.event.keyCode;
            	        }
            	        else if (e) {
            	            var charCode = e.which;
            	        }
            	        else { return true; }
            	        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode==32))
            	            return true;
            	        else
            	            return false;
            	    }
            	    catch (err) {
            	        alert(err.Description);
            	    }
            	}
               function validation()
               {
            	   document.getElementById("typeofNc1").innerHTML="";
            	   document.getElementById("groupperson1").innerHTML="";
            	   var error="";
            	   var chars = /[A-Za-z ]+$/;
            	   var typeofNc = document.getElementById('typeofNc').value;
            	   var groupperson = document.getElementById('groupperson').value;
            	   if(typeofNc == "")
            		   {
            		   document.getElementById("typeofNc1").innerHTML="Required field should not be empty";
          			 	error="true";
            		   }           	 
            	   
            	 if(groupperson == "")
            		   {
            		   document.getElementById("groupperson1").innerHTML="Required field should not be empty";
            		   error="true";
            		   }
            	 else if(groupperson.length<4)
      		   {
      		   document.getElementById("groupperson1").innerHTML="Required field should be of length 4 to 32";
      		 error="true";
      		   }
            	   else if(groupperson.charAt(0)==" ")
            		   {
            		   document.getElementById("groupperson1").innerHTML="Should not accept initial space";
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
