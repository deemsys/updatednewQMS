<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<script src="/QMS_App/resources/js/jquery.js"></script>
	<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">  
        $(document).ready(function(){
            $("#report tr:odd").addClass("odd");
            $("#report tr:not(.odd)").hide();
            $("#report tr:first-child").show();
            
            $("#report tr.odd").click(function(){
                $(this).next("tr").toggle();
                $(this).find(".arrow").toggleClass("up");
            });
            //$("#report").jExpand();
        });
    </script>   
<div id="right_content">

	
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
<tr>
<td>
<div>
  <ul class="horizmenu">
		
				             <li  style=" float:left;margin-right:10px;text-transform:uppercase;">
								<a href="addform" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Add Form
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:10px;text-transform:uppercase;">
								<a href="view_form" class="<c:choose>
								<c:when test="${menu=='document'}">menubuttonsub blueactive</c:when><c:otherwise>menubuttonsub blueactive</c:otherwise></c:choose>">
									View Form
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:10px;text-transform:uppercase;">
								<a href="form_report" class="<c:choose>
								<c:when test="${menu==''}">menubuttonsub blue</c:when><c:otherwise>menubuttonsub blue</c:otherwise></c:choose>">
									Form Report
									
								</a>
							</li>

						
							
							</ul>
  </div>
</td>
</tr>
			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>View Forms</h2>
						</div>
						 <div class="contentbox">
						<form action="search_form" name="dashboard" method="GET">
						<div style="border:#993300 2px solid; padding:15px; margin-bottom:15px;">


							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="20%">Process Area </td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="process" class="input_txtbx2" id="recordtitle"></td>
							    <td align="center" valign="middle" width="38%">
							  <input type="submit" value="Find" class="submit_btn" name="search" id="id_submit" onmouseover="showTooltip('tooltip_id','inp_id3');" /></td>
							  <td align="center" valign="middle" width="38%"><input type="submit" value="Clear" class="submit_btn" ></td>
							  </tr>
							</table>
							
						</div> 
</form>

					<form action="?do=viewparticipants" name="dashboard" method="POST">
					
							<table cellpadding="0" cellspacing="0" border="0" width="100%" id="report">
								<tr class="title">
								
									<td valign="top" align="left" width="10%">Form/Rec ID</td>
									<td valign="top" align="left" width="10%">Process</td>
									<td valign="top" align="left" width="10%">Effective Date</td>
									<td valign="top" align="left" width="10%">Approver1</td>
									<td valign="top" align="left" width="10%">Issuer</td>
									<td valign="top" align="left" width="10%">Actions</td>
									</tr>

								
								<% int i=1; %>
							       		
									<c:forEach items="${formForm.form}" var="form" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       			<table cellpadding="0" cellspacing="0" border="0" width="100%">
							       		<tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
								           	<td valign="top" align="left" width="10%"style="display:none"><input type="hidden" name="auto_number" id="autonumber" value="${form.auto_number}"/>
									        ${form.auto_number}</td>
									        <td valign="top" align="left" width="10%"><a href="list_form?id=${form.auto_number}">
									        ${form.document_id}</a></td>
											<td valign="top" align="left" width="10%">${form.process}</td>
											<td valign="top" align="left" width="10%">${form.effective_date}</td>
											<td valign="top" align="left" width="10%">${form.approver1}</td>
											<td valign="top" align="left" width="10%">${form.issuer}</td>
											
											
									
											
											<td valign="top" align="left" width="15%">
											
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_form?auto_no=${form.auto_no}"/>" style="padding-right:10px;">Edit</a>
											<!-- <a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a id="show_more_views" href="#" data-bind-action="toggle-content">View Revision History</a>
											 -->
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="review_history_form?auto_no=${form.auto_no}"/>#current">View Revision History</a>
											</td>
										</tr>
									
						    	
										<c:forEach items="${revisionForms.revisionForms}" var="revision" varStatus="status">
										<c:if test="${revision.auto_no == form.auto_number}">
									<%-- 	<c:if test="${display == 'show'}">	
									<script>
									
									document.getElementById('tabledisplay').style.display="block";
									
									
									</script>
									</c:if>
									<tr class="header11" id="tabledisplay" style="display:none;">
								
									<td valign="top" align="center" width="10%">Form/Rec ID</td>
									<td valign="top" align="center" width="10%">Effective Date</td>
									<td valign="top" align="center" width="10%">Approver1</td>
									<td valign="top" align="center" width="10%">Issuer</td>
									<td valign="top" align="center" width="10%">Comments</td>
									<td valign="top" align="center" width="10%">Revision No</td>
									</tr>  --%>
									
										<tr class="row2" style="color:#0000A0; font-style: inherit;">
										<a name="current">
										 	 <td valign="top" align="left" width="10%"> ${revision.document_id}</td>
											<td valign="top" align="left" width="10%">${revision.effective_date}</td>
											<td valign="top" align="left" width="10%">${revision.approver1}</td>
											<td valign="top" align="left" width="10%">${revision.issuer}</td>
											<td valign="top" align="left" width="10%">${revision.comments}</td>
											<td valign="top" align="left" width="10%">${revision.revision_id}</td>
												</a>
										</tr>
									
									</c:if>
										</c:forEach>
										
										</table>
										
									
						    	
						    								    	</c:forEach>
							    	
						    	<%-- <table width="60%" align="right">
						    	<tr class="header11">
								
									<td valign="top" align="center" width="10%">Form/Rec ID</td>
									<td valign="top" align="center" width="10%">Effective Date</td>
									<td valign="top" align="center" width="10%">Approver1</td>
									<td valign="top" align="center" width="10%">Issuer</td>
									<td valign="top" align="center" width="10%">Comments</td>
									<td valign="top" align="center" width="10%">Revision No</td>
									</tr>
											<c:forEach items="${revisionForms.revisionForms}" var="revision" varStatus="status">
										<tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
								           	
									        <td valign="top" align="center" width="10%"> ${revision.document_id}</td>
											<td valign="top" align="center" width="10%">${revision.effective_date}</td>
											<td valign="top" align="center" width="10%">${revision.approver1}</td>
											<td valign="top" align="center" width="10%">${revision.issuer}</td>
											<td valign="top" align="center" width="10%">${revision.comments}</td>
											<td valign="top" align="center" width="10%">${revision.revision_id}</td>
									
											
											
											
										</tr>
										</c:forEach>
										</table>

						 --%>
								</table>
							
								<!-- <div style="clear: both;"></div>
								</div>
								</div>
								</td>
								</tr>
								<tr>
									<td valign="top" align="left">&nbsp;</td>
								</tr><tr> -->
		<td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
        
             <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewformreport_page?page=${currentpage - 1}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}"> --%> 
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewformreport_page?page=${i}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewformreport_page?page=${currentpage+1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallformreport" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="view_form" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>					
		 
		  </ul>
		  </div>
		  </td>
		  </tr>				</table></div>
	 
	<!--  <script type="text/javascript">
	    
	  $(function() {
		
		  var list = $('#process_owner_id').val();
		  alert(list);
		  
		  
		  
	});
	  </script> -->
	  <script type="text/javascript">
	          
	          $(function () {
						//alert("good");
						$("a[data-bind-action='toggle-content']").click(toggleContent);
						function toggleContent(){
	        	  	    	
	        	  	   var proceee_name = '';

	        	 // $('#autonumber1 tr').each(function() {
	        		
	        		 
	        	   //   $.each(this.cells, function(){
	        	/*   alert($(this).html()); */
	        	    	  if (proceee_name == '') {
	        			   var $td= $(this).closest('tr').children('td');  
	        			     
	        			     
	        			      proceee_name= $td.eq(0).text();  
	        			     
	        			  
	        			     }
	        			     else{
	        			    	
	        			      proceee_name = proceee_name + ',' + $(this).find("td").html();
	        			     }
	        			     
	        			   
	    		$.ajax({
	    			
	    			type : "POST",
	    			url : "/QMS_App/ajax_getrevisions",
	    			data : "auto_number=" + proceee_name,
	    			success : function(response) {
	    	              
	    	             // alert("response= "+response);
	    	              
	    		       $('#process_owner_id').html(response);
                  	    			},
	    			error : function(e) {
	    				alert('Error: ' + e);
	    			}
	    		});
	    		
	    		
	    		
						}
	    	});
	 
	   
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 /* 
	 
     function show_more_views() {
    	 alert("hi");
    		var proceee_name = $('#autonumber').val();
    		alert(proceee_name);
    		   var education = $('#education').val();		
    		$.ajax({
    			
    			type : "POST",
    			url : "/QMS_App/ajax_getrevisions",
    			data : "auto_number=" + proceee_name,
    			success : function(response) {
    	              
    	              alert("response= "+response);
    	              
    		       $('#process_owner_id').html(response);
    				
    			},
    			error : function(e) {
    				alert('Error: ' + e);
    			}
    		});
    	} */
     </script>
						
<script>
function confirmation(val) {
	var answer = confirm("Are you Sure You Want to Form ?");
	if (answer){
		window.location = "?do=deleteparticipant&id="+val;
	}
	else{
		
	}
}
function subhide()

{
	document.getElementById('subrow').style.display="block";
}

</script>
<table  width=300 height=70>
			<tr height=30><td></td></tr></table>
 <jsp:include page="footer.jsp"></jsp:include> 