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
								<a href="add_documenttype" class="<c:choose>
								<c:when test="${menu=='documenttype'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span">Add DocumentType</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="documenttype_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>View DocumentType</span>
								</a>
							</li>
				          
				           </ul>
  </div>
      </td>
      </tr>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>Document Type</h2>
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0">
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="70%"><span class="err">*</span>Add Document Type :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="document_type" class="input_txtbx1" id="documenttype" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="DocumentType.document_type"></form:errors></span></td>
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
 </html>