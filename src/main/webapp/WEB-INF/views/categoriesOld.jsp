<%@ include file="header.jsp" %>

<link href="<%=pathGreenBall%>/resources/css/vendor.css" rel="stylesheet" type="text/css" />
<link href="<%=pathGreenBall%>/resources/css/application.css" rel="stylesheet" type="text/css" />
<script src="<%=pathGreenBall%>/resources/js/application.js" type="text/javascript"></script>

<script type="text/javascript">

function addToList(){
	var bla = $('#newCategory').val();
	$("#header ol").append("<li class='highlight'>" + bla +"</li>");
	$('#newCategory').val('')
}
function addToList2(){
	var bla = $('#newCategory2').val();
	$("#header2 ol").append("<li class='highlight'>" + bla +"</li>");
	$('#newCategory2').val('')
}
function addToList3(){
	var bla = $('#newCategory3').val();
	$("#header3 ol").append("<li class='highlight'>" + bla +"</li>");
	$('#newCategory3').val('')
}
function addToList4(){
	var bla = $('#newCategory4').val();
	$("#header4 ol").append("<li class='highlight'>" + bla +"</li>");
	$('#newCategory4').val('')
}
function addToList5(){
	var bla = $('#newCategory5').val();
	$("#header5 ol").append("<li class='highlight'>" + bla +"</li>");
	$('#newCategory5').val('')
}
function addToList6(){
	var bla = $('#newCategory6').val();
	$("#header6 ol").append("<li class='highlight'>" + bla +"</li>");
	$('#newCategory6').val('')
}

function toSubmit(){
	$("#selectedMensCategory li").each(function(index){
		$("#category").append('<li><input type="hidden" id="mensCategory" name="mensCategory" value="'+ $(this).text() + '"> /> </li>');
	});
	$("#selectedWomansCategory li").each(function(index){
		$("#category").append('<li><input type="hidden" id="womansCategory" name="womansCategory" value="'+ $(this).text() + '"> /> </li>');
		
	});
	$("#selectedMixtosCategory li").each(function(index){
		$("#category").append('<li><input type="hidden" id="mixtosCategory" name="mixtosCategory" value="'+ $(this).text() + '"> /> </li>');
		
	});
	$("#selectedNVMensCategory li").each(function(index){
		$("#category").append('<li><input type="hidden" id="nvMensCategory" name="nvMensCategory" value="'+ $(this).text() + '"> /> </li>');
		
	});
	$("#selectedNVWomansCategory li").each(function(index){
		$("#category").append('<li><input type="hidden" id="nvWomansCategory" name="nvWomansCategory" value="'+ $(this).text() + '"> /> </li>');
		
	});
	$("#selectedNVMixtosCategory li").each(function(index){
		$("#category").append('<li><input type="hidden" id="nvMixtosCategory" name="nvMixtosCategory" value="'+ $(this).text() + '"> /> </li>');
		
	});
	
	$("#category").submit();
}



</script>
<style>
	.tab-links li { width: 16.6666%; }
	#category {border: 0px; width:100%;}
	.tab-links a{font-size:12px;}
	.select, input[type="text"] {height:36px;} 
</style>


<div id="atp-match">
          <div class="container">
          
       

<h3><spring:message code="category.title1" /> <span><spring:message code="category.title2" /></span><span class="point-little">.</span></h3>

<c:url var="addAction" value="/addCategory" ></c:url>
<form:form action="${addAction}" commandName="category" name="category" id="category">

						
						 
	 						<div class="tabs animated-slide-2">
                            <ul class="tab-links">
                                <li class="active"><a href="#tab1111"><spring:message code="category.mens" /></a></li>
                                <li><a href="#tab2222"><spring:message code="category.woman" /></a></li>
                                <li><a href="#tab3333"><spring:message code="category.mixtos" /></a></li>
                                <li><a href="#tab4444"><spring:message code="category.nv.mens" /></a></li>
                                <li><a href="#tab5555"><spring:message code="category.nv.woman" /></a></li>
                                <li><a href="#tab6666"><spring:message code="category.nv.mixtos" /></a></li>
                            </ul>
                            <div class="tab-content">
                         <div id="tab1111" class="tab active">
							<div class="captura-right-content">
								<div class="form-group">
									<label class="col-sm-2 control-label">* <spring:message code="category.newcategory" /></label>
									<div class="col-sm-5">
										<input type="text" class="form-control" name="newCategory" id="newCategory"/>
									</div>	
										<input class="pl-point-button" type="button" name="newCategory" onclick="addToList();"
													value="<spring:message code="category.add"/>"/>			
								</div>
							</div>
											
							<label class="col-sm-1 control-label"> </label>
							<label class="col-sm-4 control-label"><spring:message code="category.available" /></label>
							<label class="col-sm-5 control-label"><spring:message code="category.selected" /></label>
											
												
							<div class='span4' id="header">
								  <ol class='simple_with_animation vertical' name="summaryOL" id="summaryOL">
								  	  <c:forEach items="${mensNoActive}" var="noActive">
								  	  	<li class='highlight'>${noActive}</li>
								  	  </c:forEach>
								      
								      <!--  li class='highlight'><spring:message code="category.b" /></li>
								      <li class='highlight'><spring:message code="category.c" /></li>
								      <li class='highlight'><spring:message code="category.d" /></li>-->
								  </ol>
							</div>
							<div class='span4'>
								  <ol class='simple_with_animation vertical' id="selectedMensCategory">
								  	<c:forEach items="${mensActive}" var="active">
								  	  	<li class='highlight'>${active}</li>
								  	  </c:forEach>
								  </ol>
							</div>
							
							<div class='span4'>
								<input class="pl-point-button" type="button" onclick="toSubmit();"
								value="<spring:message code="category.save" />" /> 
							</div>
                          </div>
                           <div id="tab2222" class="tab">
                           	<div class="captura-right-content">
								<div class="form-group">
									<label class="col-sm-2 control-label">* <spring:message code="category.newcategory" /></label>
									<div class="col-sm-5">
										<input type="text" class="form-control" name="newCategory2" id="newCategory2"/>
									</div>	
										<input class="pl-point-button" type="button" name="newCategory2" onclick="addToList2();"
													value="<spring:message code="category.add"/>"/>			
								</div>
							</div>
											
							<label class="col-sm-1 control-label"> </label>
							<label class="col-sm-4 control-label"><spring:message code="category.available" /></label>
							<label class="col-sm-5 control-label"><spring:message code="category.selected" /></label>
											
												
							<div class='span4' id="header2">
								  <ol class='simple_with_animation vertical' name="summaryOL2" id="summaryOL2">
								      <c:forEach items="${womansNoActive}" var="wnoActive">
								  	  	<li class='highlight'>${wnoActive}</li>
								  	  </c:forEach>
								  </ol>
							</div>
							<div class='span4'>
								  <ol class='simple_with_animation vertical' id="selectedWomansCategory">
								  	  <c:forEach items="${womansActive}" var="wActive">
								  	  	<li class='highlight'>${wActive}</li>
								  	  </c:forEach>
								  </ol>
							</div>
                           <div class='span4'>
								<input class="pl-point-button" type="button" onclick="toSubmit();"
								value="<spring:message code="category.save" />" /> 
							</div>
                           </div>
                           <div id="tab3333" class="tab">
                           		<div class="captura-right-content">
								<div class="form-group">
									<label class="col-sm-2 control-label">* <spring:message code="category.newcategory" /></label>
									<div class="col-sm-5">
										<input type="text" class="form-control" name="newCategory3" id="newCategory3"/>
									</div>	
										<input class="pl-point-button" type="button" name="newCategory3" onclick="addToList3();"
													value="<spring:message code="category.add"/>"/>			
								</div>
							</div>
											
							<label class="col-sm-1 control-label"> </label>
							<label class="col-sm-4 control-label"><spring:message code="category.available" /></label>
							<label class="col-sm-5 control-label"><spring:message code="category.selected" /></label>
											
												
							<div class='span4' id="header3">
								  <ol class='simple_with_animation vertical' name="summaryOL3" id="summaryOL3">
								      <c:forEach items="${mixtosNoActive}" var="mixNoActive">
								  	  	<li class='highlight'>${mixNoActive}</li>
								  	  </c:forEach>
								  </ol>
							</div>
							<div class='span4'>
								  <ol class='simple_with_animation vertical' id="selectedMixtosCategory">
								  	<c:forEach items="${mixtosActive}" var="mixActive">
								  	  	<li class='highlight'>${mixActive}</li>
								  	  </c:forEach>
								  </ol>
							</div>
							<div class='span4'>
								<input class="pl-point-button" type="button" onclick="toSubmit();"
								value="<spring:message code="category.save" />" /> 
							</div>
                           </div>
                           <div id="tab4444" class="tab">
                           		<div class="captura-right-content">
								<div class="form-group">
									<label class="col-sm-2 control-label">* <spring:message code="category.newcategory" /></label>
									<div class="col-sm-5">
										<input type="text" class="form-control" name="newCategory4" id="newCategory4"/>
									</div>	
										<input class="pl-point-button" type="button" name="newCategory4" onclick="addToList4();"
													value="<spring:message code="category.add"/>"/>			
								</div>
							</div>
											
							<label class="col-sm-1 control-label"> </label>
							<label class="col-sm-4 control-label"><spring:message code="category.available" /></label>
							<label class="col-sm-5 control-label"><spring:message code="category.selected" /></label>
											
												
							<div class='span5' id="header4">
								  <ol class='simple_with_animation vertical' name="summaryOL4" id="summaryOL4">
								      <c:forEach items="${nvmensNoActive}" var="nvMNActive">
								  	  	<li class='highlight'>${nvMNActive}</li>
								  	  </c:forEach>
								  </ol>
							</div>
							<div class='span4'>
								  <ol class='simple_with_animation vertical' id="selectedNVMensCategory">
								  	<c:forEach items="${nvmensActive}" var="nvMActive">
								  	  	<li class='highlight'>${nvMActive}</li>
								  	  </c:forEach>
								  </ol>
							</div>
							<div class='span4'>
								<input class="pl-point-button" type="button" onclick="toSubmit();"
								value="<spring:message code="category.save" />" /> 
							</div>
                           </div>
                           <div id="tab5555" class="tab">
                           		<div class="captura-right-content">
								<div class="form-group">
									<label class="col-sm-2 control-label">* <spring:message code="category.newcategory" /></label>
									<div class="col-sm-5">
										<input type="text" class="form-control" name="newCategory5" id="newCategory5"/>
									</div>	
										<input class="pl-point-button" type="button" name="newCategory5" onclick="addToList5();"
													value="<spring:message code="category.add"/>"/>			
								</div>
							</div>
											
							<label class="col-sm-1 control-label"> </label>
							<label class="col-sm-4 control-label"><spring:message code="category.available" /></label>
							<label class="col-sm-5 control-label"><spring:message code="category.selected" /></label>
											
												
							<div class='span4' id="header5">
								  <ol class='simple_with_animation vertical' name="summaryOL5" id="summaryOL5">
								      <c:forEach items="${nvwomansNoActive}" var="nvWNActive">
								  	  	<li class='highlight'>${nvWNActive}</li>
								  	  </c:forEach>
								  </ol>
							</div>
							<div class='span4'>
								  <ol class='simple_with_animation vertical' id="selectedNVWomansCategory">
								  		<c:forEach items="${nvwomansActive}" var="nvWActive">
								  	  	<li class='highlight'>${nvWActive}</li>
								  	  </c:forEach>
								  </ol>
							</div>
							<div class='span4'>
								<input class="pl-point-button" type="button" onclick="toSubmit();"
								value="<spring:message code="category.save" />" /> 
							</div>
                           </div>
                           <div id="tab6666" class="tab">
                           		<div class="captura-right-content">
								<div class="form-group">
									<label class="col-sm-2 control-label">* <spring:message code="category.newcategory" /></label>
									<div class="col-sm-5">
										<input type="text" class="form-control" name="newCategory6" id="newCategory6"/>
									</div>	
										<input class="pl-point-button" type="button" name="newCategory6" onclick="addToList6();"
													value="<spring:message code="category.add"/>"/>			
								</div>
							</div>
											
							<label class="col-sm-1 control-label"> </label>
							<label class="col-sm-4 control-label"><spring:message code="category.available" /></label>
							<label class="col-sm-5 control-label"><spring:message code="category.selected" /></label>
											
												
							<div class='span4' id="header6">
								  <ol class='simple_with_animation vertical' name="summaryOL6" id="summaryOL6">
								      <c:forEach items="${nvmixNoActive}" var="nvMiNActive">
								  	  	<li class='highlight'>${nvMiNActive}</li>
								  	  </c:forEach>
								  </ol>
							</div>
							<div class='span4'>
								  <ol class='simple_with_animation vertical' id="selectedNVMixtosCategory">
								  		<c:forEach items="${nvmixActive}" var="nvMiActive">
								  	  		<li class='highlight'>${nvMiActive}</li>
								  	  	</c:forEach>
								  </ol>
							</div>
							<div class='span4'>
								<input class="pl-point-button" type="button" onclick="toSubmit();"
								value="<spring:message code="category.save" />" /> 
							</div>
                           </div>
                           
                           
                           
                           
                            </div>
                        
					</div>
		
		
				
		


  

<div class="content-banner">
	<ul class="sponsor second"></ul>
</div>

</div>

</form:form>



<%@include file="footer.jsp" %>>


