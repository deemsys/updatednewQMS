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
        
        
       	 <tr class="row1" height="200px;" >
        <td width="25%"></td>
             <td colspan="2" align="right">
             <input type="submit" id="document"  name="DOCUMENT" value="Documents" class="menubuttonsub blue"></td>
            </form>
            <form method="get" enctype="multipart/form-data" action="addform">
             <td colspan="3">
            <input type="submit" id="form" name="FORM" value="Forms/Records" class="menubuttonsub blue"></td>
</tr></table></div>
</form>



<table  width=300 height=300>
			<tr height=30><td></td></tr></table>
			
<jsp:include page="footer.jsp"></jsp:include>		