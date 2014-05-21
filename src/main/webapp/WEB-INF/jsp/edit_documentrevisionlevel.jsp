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
<title>Edit Document RevisionLevel</title>
</head>
<body>
<form method="post" action="update_documentrevisionlevel">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_revisionleveldocument" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									<span>Add RevisionLevel</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="documentrevisionlevel_list" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>View RevisionLevels</span>
								</a>
							</li>
				          
							</ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Editing Document RevisionLevel</h2>
            </div>  <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <c:set value="${documentRevisionLevelForm.documentRevisionLevels[0]}" var="documentrevisionlevel"> </c:set>
             
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
               
                <tr class="row1">
                <td valign="middle" align="left" class="input_txt">Revision Prefix :</td>
                  <td valign="top" align="left" class="input_txt">                
              	 <select name="revision_prefix" id="prefix1" class="input_cmbbx1" style="width:90px;">
              		<option value="">--Select--</option>
               	<%-- 	<option <c:if test="${documentrevisionlevel.revision_prefix eq 'Roman'}"><c:out value="Selected"/></c:if> value="Roman">Roman</option> --%>
               	<option <c:if test="${documentrevisionlevel.revision_prefix eq 'Integer'}"><c:out value="Selected"/></c:if> value="Integer">Integer</option>
				<option <c:if test="${documentrevisionlevel.revision_prefix eq 'Alphabet'}"><c:out value="Selected"/></c:if> value="Alphabet">Alphabet</option>
               	                   	
               	</select>
                	 <span class="err"><form:errors path="DocumentRevisionLevel.revision_prefix"></form:errors></span>
        
         		<input type='text' id="js-in-1" name="input1" style="height:22px;width:50px; margin:0 0 0 0;"  value="${documentrevisionlevel.input1}"/> <span class="err"><form:errors path="DocumentRevisionLevel.input1"></form:errors></span>
         </td>
            </tr>
                <tr class="row2">
                
                  <td valign="middle" align="left" class="input_txt" width="30%">Revision Level:</td>
                  <td valign="top" align="left" class="input_txt">                
                	 <select name="revision_level" id="suffix1" class="input_cmbbx1" style="width:90px;">
              		<option value="">--Select--</option>
              		<%-- <option <c:if test="${documentrevisionlevel.revision_level eq 'Roman'}"><c:out value="Selected"/></c:if> value="Roman">Roman</option> --%>
              		<option <c:if test="${documentrevisionlevel.revision_level eq 'Integer'}"><c:out value="Selected"/></c:if> value="Integer">Integer</option>
              		<option <c:if test="${documentrevisionlevel.revision_level eq 'Alphabet'}"><c:out value="Selected"/></c:if> value="Alphabet">Alphabet</option>
              		
              </select>
               	<span class="err"><form:errors path="DocumentRevisionLevel.revision_level"></form:errors></span>
         		<input type='text' id="js-in-2" name="input2" style="height:22px;width:50px; margin:0 0 0 0; "  value="${documentrevisionlevel.input2}"/> <span class="err"><form:errors path="DocumentRevisionLevel.input2"></form:errors></span></td>
    </td>
             </tr>
     	 <tr class="row1">
     	  <td valign="middle" align="left" class="input_txt" width="30%">Combined output</td>
                  <td valign="top" align="left" class="input_txt">
                  <input type="text" name="combined_output" id="js-out">
    		</td>
    	</tr>
                  </td>
                  
                </tr>
                 <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Submit" class="submit_btn1"></td>
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
                
</body>

<script>
$('input').change(function(){
   $('#js-out').val($('#js-in-1').val() + '.' + $('#js-in-2').val());
});
</script>
<!-- 
<script type='text/javascript'>//<![CDATA[ 

        $(document).ready(function () {
           
            $('#js-in-1').hide();
        });

        function showDiv() {

        	
        	var element1 = document.getElementById('prefix1').value;
        	var element2 = document.getElementById('suffix1').value;
        	
            if (element1 == '') {
            	document.getElementById('js-in-1').style.display="none";
                
            }
            else {
            	document.getElementById('js-in-1').style.display="block";
              
            }
            if(element2 == '')
            	{
            	document.getElementById('js-in-2').style.display="none";
            	}
            else
            	{
            	document.getElementById('js-in-2').style.display="block";
            	}
        }


//]]>  

</script>
 --><jsp:include page="footer.jsp"></jsp:include>
</html>