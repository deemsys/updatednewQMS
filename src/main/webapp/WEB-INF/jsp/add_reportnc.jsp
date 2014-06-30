<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>Add Type NC</h2>
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0">
      <%--           <tr class="row2">
                <!--   <td valign="middle" align="left" class="input_txt" >ID</td> -->
                  <td valign="top" align="left" class="input_txt" ><input type="hidden" name="id" class="input_txtbx1" id="id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${id}" /><span class="err"><form:errors path="ReportedByNC.id"></form:errors></span></td>
                </tr>
                
       --%>          <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" >Type of NC</td>
                  <td valign="middle" align="left" class="input_txt" >
                  <select name="type_of_nc"  class="input_cmbbx1" id="typeofNc"style="width:100%;border:none;background-color:lightgrey;">
                               										<option value="">--Select--</option>
						                    							<option <c:if test="${reportedByNCs.type_of_nc eq 'Product Quality'}"><c:out value="Selected"/></c:if> value="Product Quality" >Product Quality</option>
																		<option <c:if test="${reportedByNCs.type_of_nc eq 'Service Quality'}"><c:out value="Selected"/></c:if>value="Service Quality">Service Quality</option>
																		<option <c:if test="${reportedByNCs.type_of_nc eq 'Late Delivery'}"><c:out value="Selected"/></c:if> value="Late Delivery">Late Delivery</option>
																		<option <c:if test="${reportedByNCs.type_of_nc eq 'Early Delivery'}"><c:out value="Selected"/></c:if>value="Early Delivery">Early Delivery</option>
               <c:forEach items="${type_of_NC_Form.type_of_NCs}" var="type_of_NCs" varStatus="true">
        				       <option value="<c:out value="${type_of_NCs.type_of_nc}"/>"><c:out value="${type_of_NCs.type_of_nc}"/></option>
			                  </c:forEach>
               </select>
               <span id="typeofNc1" style="color:red"></span>
               <span class="err"><form:errors path="ReportedByNC.type_of_nc"></form:errors></span></td>
               
                  <td valign="middle" align="left" class="input_txt" >Group Person</td>
                  <td valign="top" align="left" class="input_txt" ><input type="text" name="group_person" class="input_txtbx1" id="groupperson" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" />
                   <span id="groupperson1" style="color:red"></span>
                  <span class="err"><form:errors path="ReportedByNC.group_person"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="top" align="left">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Submit" onclick="return validation();" class="submit_btn1"></td>
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
               function validation()
               {
            	   var chars = /[A-Za-z ]+$/;
            	   var typeofNc = document.getElementById('typeofNc').value;
            	   var groupperson = document.getElementById('groupperson').value;
            	   if(typeofNc == "")
            		   {
            		   document.getElementById("typeofNc1").innerHTML="Please Select one";
          			 	return false;
            		   }
            	   else{
            		   document.getElementById("typeofNc1").innerHTML="";
            	   }
            	   
            	 if(groupperson == "")
            		   {
            		   document.getElementById("groupperson1").innerHTML="Requried field should not be Empty";
         			 	return false;
            		   }
            	   else if(groupperson.charAt(0)==" ")
            		   {
            		   document.getElementById("groupperson1").innerHTML="Requried field should not be Spaces";
        			 	return false;
            		   }
            	   else if(groupperson.match(chars))
            		   {
            		   document.getElementById("groupperson1").innerHTML="";
            		  
            		   }
            	   else
            		   {
            		   document.getElementById("groupperson1").innerHTML="Requried field should be letters";
       			 		return false;
            		   }
            	   
               }
               </script>
   
</body>
</html>
<jsp:include page="footer.jsp"></jsp:include>