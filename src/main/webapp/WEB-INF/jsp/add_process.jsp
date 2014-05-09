<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<html>
<form method="post" action="add_process">
  <!-- <div id="right_content" style="background-color:lightgrey;"> -->
  
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <!-- <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr> -->
      <tr>
      <td>
      <div>
  <ul class="horizmenu" style=" float:left;margin-left:210px;">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_prefixdocument" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Document Prefix</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_prefixform" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Form Prefix</span>
									
								</a>
							</li>
							
								<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_process" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Add process</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_formlocation" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add Location</span>
									
								</a>
							</li>
								<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_documenttype" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span">Add Document Type</span>
									
								</a>
							</li>
						
				           </ul>
  </div>
      </td>
      </tr>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>Form Process</h2>
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0">
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="70%"><span class="err">*</span>Process Id:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="process_id" class="input_txtbx1" id="processid" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="FormLocation.form_location"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="70%"><span class="err">*</span>Process Name:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="process_name" class="input_txtbx1" id="processname" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="FormLocation.form_location"></form:errors></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="70%"><span class="err">*</span>Process Owner:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="process_owner" class="input_txtbx1" id="processowner" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="FormLocation.form_location"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="top" align="left">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Submit" class="submit_btn1"></td>
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
  <br><br><br><br><br><br><br><br><br><br><br><br>     


 <jsp:include page="footer.jsp"></jsp:include> 
 </html>