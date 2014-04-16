<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

 <form method="get" enctype="multipart/form-data" action="adddocument">
 
  <div id="right_content">
  
        
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
     <tr>
        <td>
        </td>
        </tr>
        
       	 <tr class="row1" >
             <td colspan="2" align="right">
             <input type="submit" id="document"  name="DOCUMENT" value="document" class="submit_btn1"></td>
            </form>
            <form method="get" enctype="multipart/form-data" action="addform">
             <td colspan="3">
            <input type="submit" id="form"  name="FORM" value="form" class="submit_btn1"></td>
</tr></table></div>
</form>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="footer.jsp"></jsp:include>

<table  width=300 height=400>
			<tr height=30><td></td></tr></table>
			
<jsp:include page="footer.jsp"></jsp:include>		