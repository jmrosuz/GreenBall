<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<%String pathGreenBall = request.getContextPath(); %>

<html xmlns="../../../../../../www.w3.org/1999/xhtml/index.html">
<head>

    <title>TENNIS CLUB</title>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />

<meta name="author" content="corsini" />
<meta name="keywords" content="Tennis, club, events, football, golf, non-profit, betting assistant, football,fitness, tennis, sport, soccer, goal, sports, volleyball, basketball,	charity, club, cricket, football, hockey, magazine, non profit, rugby, soccer, sport, sports, tennis" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<c:set value="$(pageContext.request.contextPath)" var="myURL"></c:set>
    
    <link href="<%=pathGreenBall%>/resources/css/bootstrap.css" rel="stylesheet" type="text/css" />
	

    <!--Video Porfolio-->
    <link href="<%=pathGreenBall%>/resources/css/stapel.css" rel="stylesheet" type="text/css" />
    <link href="<%=pathGreenBall%>/resources/css/jquery.bxslider.css" rel="stylesheet" type="text/css" />
    <link href="<%=pathGreenBall%>/resources/css/jquery.jscrollpane.css" rel="stylesheet" type="text/css" />
    

    <link href="<%=pathGreenBall%>/resources/css/component.css" rel="stylesheet" type="text/css" />
    <link href="<%=pathGreenBall%>/resources/css/prettyPhoto.css" rel="stylesheet" type="text/css" />
    <link href="<%=pathGreenBall%>/resources/css/style_dir.css" rel="stylesheet" type="text/css" />
    <link href="<%=pathGreenBall%>/resources/css/greenBall.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" type="image/png" href="<%=pathGreenBall%>/resources/img/favicon.ico" />
    <link href="<%=pathGreenBall%>/resources/css/responsive.css" rel="stylesheet" type="text/css" />

    <link href="<%=pathGreenBall%>/resources/css/animate.css" rel="stylesheet" type="text/css" />
    <link href="<%=pathGreenBall%>/resources/css/bootstrapHelper.css" rel="stylesheet" type="text/css" />
    <link href="<%=pathGreenBall%>/resources/css/tether.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=pathGreenBall%>/resources/css/bootstrap-dialog.css" rel="stylesheet" type="text/css" />
    <script src="<%=pathGreenBall%>/resources/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="<%=pathGreenBall%>/resources/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	<script src="<%=pathGreenBall%>/resources/js/jquery.transit.min.js" type="text/javascript"></script>
	
	<script src="<%=pathGreenBall%>/resources/js/tether.min.js" type="text/javascript"></script>
	 <script src="<%=pathGreenBall%>/resources/js/bootstrap.js" type="text/javascript"></script>
	
	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link href="<%=pathGreenBall%>/resources/css/bootstrap-datepicker.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=pathGreenBall%>/resources/js/bootstrap-datepicker.js"></script>



	
	
	



<style>
	.tab-links-match {background-color: transparent;}
	.player-vs .tab-links-match {background-color: transparent;}
	.player-vs .tab-content.single-match {background: transparent;}
	.player-vs .tab-content .tab-content {background: transparent;}
	.captura-right-content {margin-top: 20px; padding-bottom:10px;}
</style>

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
function addToList7(){
	var bla = $('#newCategory7').val();
	$("#header7 ol").append("<li class='highlight'>" + bla +"</li>");
	$('#newCategory7').val('')
}
function addToList8(){
	var bla = $('#newCategory8').val();
	$("#header8 ol").append("<li class='highlight'>" + bla +"</li>");
	$('#newCategory8').val('')
}
function addToList9(){
	var bla = $('#newCategory9').val();
	$("#header9 ol").append("<li class='highlight'>" + bla +"</li>");
	$('#newCategory9').val('')
}
function addToList10(){
	var bla = $('#newCategory10').val();
	$("#header10 ol").append("<li class='highlight'>" + bla +"</li>");
	$('#newCategory10').val('')
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
	$("#selectedMensCategoryDoubles li").each(function(index){
		$("#category").append('<li><input type="hidden" id="mensCategoryDoubles" name="mensCategoryDoubles" value="'+ $(this).text() + '"> /> </li>');
	});
	$("#selectedWomansCategoryDoubles li").each(function(index){
		$("#category").append('<li><input type="hidden" id="womansCategoryDoubles" name="womansCategoryDoubles" value="'+ $(this).text() + '"> /> </li>');
		
	});
	$("#selectedNVMensCategoryDoubles li").each(function(index){
		$("#category").append('<li><input type="hidden" id="nvMensCategoryDoubles" name="nvMensCategoryDoubles" value="'+ $(this).text() + '"> /> </li>');
		
	});
	$("#selectedNVWomansCategoryDoubles li").each(function(index){
		$("#category").append('<li><input type="hidden" id="nvWomansCategoryDoubles" name="nvWomansCategoryDoubles" value="'+ $(this).text() + '"> /> </li>');
		
	});
	
	$("#category").submit();
}



</script>

<link href="<%=pathGreenBall%>/resources/css/vendor.css" rel="stylesheet" type="text/css" />
<link href="<%=pathGreenBall%>/resources/css/application.css" rel="stylesheet" type="text/css" />
<script src="<%=pathGreenBall%>/resources/js/application.js" type="text/javascript"></script>


</head>
<body>
<%@ include file="head.jsp" %>
<%@ include file="menu.jsp" %>



<c:url var="addAction" value="/${shortName}/addCategory" ></c:url>
<form:form action="${addAction}" commandName="category" name="category" id="category">

<input type="hidden" value="${shortName}" name="shortName"></input>

<section class="drawer">
     <section id="single-match-pl" class="container secondary-page">
      <div class="general general-results players">
           <div class="top-score-title right-score col-md-16">
           	  <div id ="atp-match"class="top-score-title player-vs">
                <h3>Total <span>Scores</span><span class="point-little">.</span></h3>
                <div class="main">
                       <div class="tabs standard single-pl">
                                <ul class="tab-links-match tb-set">
                                    <li class="active"><a class="first-tabs" href="#tab1"><spring:message code="category.singles" /></a></li>
                                    <li><a class="first-tabs" href="#tab2"><spring:message code="category.doubles" /></a></li>
                                    <li><a class="first-tabs" href="#tab3"><spring:message code="category.mixes" /></a></li>
                                </ul>
                                <div class="tab-content single-match">
                                    <div id="tab1" class="tab active">
                                       <h3 class="tab-match-title"><spring:message code="category.singles" /></h3>
                                        <div class="tabs standard">
                                            <ul class="tab-links-match">
                                                <li class="active"><a class="first-tabs" href="#tab1a"><spring:message code="category.mens" /></a></li>
                                                <li><a href="#tab2a"><spring:message code="category.woman" /></a></li>
                                                <li><a href="#tab3a"><spring:message code="category.nv.mens" /></a></li>
                                                <li><a href="#tab4a"><spring:message code="category.nv.woman" /></a></li>
                                            </ul>
                                            <div class="tab-content">
                                                <div id="tab1a" class="tab active">
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
																		
																			
														<div class="span4" id="header">
															  <ol class='simple_with_animation vertical' name="summaryOL" id="summaryOL">
															  	  <c:forEach items="${mensNoActive}" var="noActive">
															  	  	<li class='highlight'>${noActive}</li>
															  	  </c:forEach>
															  </ol>
														</div>
														<div class="span4">
															  <ol class='simple_with_animation vertical' id="selectedMensCategory">
															  	<c:forEach items="${mensActive}" var="active">
															  	  	<li class='highlight'>${active}</li>
															  	  </c:forEach>
															  </ol>
														</div>
														<div class='span'>
															<input class="pl-point-button" type="button" onclick="toSubmit();"
															value="<spring:message code="category.save" />" /> 
														</div>
														
                                                </div>
                                                <div id="tab2a" class="tab">  
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
																		
																		
														<div class="span4" id="header2">
															  <ol class='simple_with_animation vertical' name="summaryOL2" id="summaryOL2">
															      <c:forEach items="${womansNoActive}" var="wnoActive">
															  	  	<li class='highlight'>${wnoActive}</li>
															  	  </c:forEach>
															  </ol>
														</div>
														<div class="span4" >
															  <ol class='simple_with_animation vertical' id="selectedWomansCategory">
															  	  <c:forEach items="${womansActive}" var="wActive">
															  	  	<li class='highlight'>${wActive}</li>
															  	  </c:forEach>
															  </ol>
														</div>
														
							                           <div class="span">
															<input class="pl-point-button" type="button" onclick="toSubmit();"
															value="<spring:message code="category.save" />" /> 
														</div>
														
                                                </div>
                                                <div id="tab3a" class="tab">
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
													<div class="span4">
														  <ol class='simple_with_animation vertical' id="selectedNVMensCategory">
														  	<c:forEach items="${nvmensActive}" var="nvMActive">
														  	  	<li class='highlight'>${nvMActive}</li>
														  	  </c:forEach>
														  </ol>
													</div>
													<div class="span">
														<input class="pl-point-button" type="button" onclick="toSubmit();"
														value="<spring:message code="category.save" />" /> 
													</div>
                                                </div>
                                                <div id="tab4a" class="tab">
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
																
																	
												<div class="span4" id="header5">
													  <ol class='simple_with_animation vertical' name="summaryOL5" id="summaryOL5">
													      <c:forEach items="${nvwomansNoActive}" var="nvWNActive">
													  	  	<li class='highlight'>${nvWNActive}</li>
													  	  </c:forEach>
													  </ol>
												</div>
												<div class="span4">
													  <ol class='simple_with_animation vertical' id="selectedNVWomansCategory">
													  		<c:forEach items="${nvwomansActive}" var="nvWActive">
													  	  	<li class='highlight'>${nvWActive}</li>
													  	  </c:forEach>
													  </ol>
												</div>
												<div class="span">
													<input class="pl-point-button" type="button" onclick="toSubmit();"
													value="<spring:message code="category.save" />" /> 
												</div>
                                                </div>
                                            </div>
                                        </div>     
                                    </div>
                                    <div id="tab2" class="tab">
                                          <h3 class="tab-match-title"><spring:message code="category.doubles" /></h3>
                                           <div class="tabs standard">
                                            <ul class="tab-links-match">
                                                <li class="active"><a class="first-tabs" href="#tab1d"><spring:message code="category.mens" /></a></li>
                                                <li><a href="#tab2d"><spring:message code="category.woman" /></a></li>
                                                <li><a href="#tab3d"><spring:message code="category.nv.mens" /></a></li>
                                                <li><a href="#tab4d"><spring:message code="category.nv.woman" /></a></li>
                                                
                                            </ul>
                                            <div class="tab-content">
                                                <div id="tab1d" class="tab active">
                                                	  <div class="captura-right-content">
															<div class="form-group">
																<label class="col-sm-2 control-label">* <spring:message code="category.newcategory" /></label>
																<div class="col-sm-5">
																	<input type="text" class="form-control" name="newCategory7" id="newCategory7"/>
																</div>	
																	<input class="pl-point-button" type="button" name="newCategory7" onclick="addToList7();"
																				value="<spring:message code="category.add"/>"/>			
															</div>
													  </div>
													  <label class="col-sm-1 control-label"> </label>
														<label class="col-sm-4 control-label"><spring:message code="category.available" /></label>
														<label class="col-sm-5 control-label"><spring:message code="category.selected" /></label>
																		
																			
														<div class="span4" id="header7">
															  <ol class='simple_with_animation vertical' name="summaryOL7" id="summaryOL7">
															  	  <c:forEach items="${mensNoActiveDoubles}" var="noActiveDoubles">
															  	  	<li class='highlight'>${noActiveDoubles}</li>
															  	  </c:forEach>
															  </ol>
														</div>
														<div class="span4">
															  <ol class='simple_with_animation vertical' id="selectedMensCategoryDoubles">
															  	<c:forEach items="${mensActiveDoubles}" var="activeDoubles">
															  	  	<li class='highlight'>${activeDoubles}</li>
															  	  </c:forEach>
															  </ol>
														</div>
														<div class='span'>
															<input class="pl-point-button" type="button" onclick="toSubmit();"
															value="<spring:message code="category.save" />" /> 
														</div>
														
                                                </div>
                                                <div id="tab2d" class="tab">  
                                                	<div class="captura-right-content">
															<div class="form-group">
																<label class="col-sm-2 control-label">* <spring:message code="category.newcategory" /></label>
																<div class="col-sm-5">
																	<input type="text" class="form-control" name="newCategory8" id="newCategory8"/>
																</div>	
																	<input class="pl-point-button" type="button" name="newCategory8" onclick="addToList8();"
																				value="<spring:message code="category.add"/>"/>			
															</div>
														</div>
																		
														<label class="col-sm-1 control-label"> </label>
														<label class="col-sm-4 control-label"><spring:message code="category.available" /></label>
														<label class="col-sm-5 control-label"><spring:message code="category.selected" /></label>
																		
																		
														<div class="span4" id="header8">
															  <ol class='simple_with_animation vertical' name="summaryOL8" id="summaryOL8">
															      <c:forEach items="${womansNoActiveDoubles}" var="wnoActiveDoubles">
															  	  	<li class='highlight'>${wnoActiveDoubles}</li>
															  	  </c:forEach>
															  </ol>
														</div>
														<div class="span4" >
															  <ol class='simple_with_animation vertical' id="selectedWomansCategoryDoubles">
															  	  <c:forEach items="${womansActiveDoubles}" var="wActiveDoubles">
															  	  	<li class='highlight'>${wActiveDoubles}</li>
															  	  </c:forEach>
															  </ol>
														</div>
														
							                           <div class="span">
															<input class="pl-point-button" type="button" onclick="toSubmit();"
															value="<spring:message code="category.save" />" /> 
														</div>
														
                                                </div>
                                                <div id="tab3d" class="tab">
                                                	<div class="captura-right-content">
														<div class="form-group">
															<label class="col-sm-2 control-label">* <spring:message code="category.newcategory" /></label>
															<div class="col-sm-5">
																<input type="text" class="form-control" name="newCategory9" id="newCategory9"/>
															</div>	
																<input class="pl-point-button" type="button" name="newCategory9" onclick="addToList9();"
																			value="<spring:message code="category.add"/>"/>			
														</div>
													</div>
																	
													<label class="col-sm-1 control-label"> </label>
													<label class="col-sm-4 control-label"><spring:message code="category.available" /></label>
													<label class="col-sm-5 control-label"><spring:message code="category.selected" /></label>
																	
																		
													<div class='span5' id="header9">
														  <ol class='simple_with_animation vertical' name="summaryOL9" id="summaryOL9">
														      <c:forEach items="${nvmensNoActiveDoubles}" var="nvMNActiveDoubles">
														  	  	<li class='highlight'>${nvMNActiveDoubles}</li>
														  	  </c:forEach>
														  </ol>
													</div>
													<div class="span4">
														  <ol class='simple_with_animation vertical' id="selectedNVMensCategoryDoubles">
														  	<c:forEach items="${nvmensActiveDoubles}" var="nvMActiveDoubles">
														  	  	<li class='highlight'>${nvMActiveDoubles}</li>
														  	  </c:forEach>
														  </ol>
													</div>
													<div class="span">
														<input class="pl-point-button" type="button" onclick="toSubmit();"
														value="<spring:message code="category.save" />" /> 
													</div>
                                                </div>
                                                <div id="tab4d" class="tab">
                                                	<div class="captura-right-content">
													<div class="form-group">
														<label class="col-sm-2 control-label">* <spring:message code="category.newcategory" /></label>
														<div class="col-sm-5">
															<input type="text" class="form-control" name="newCategory10" id="newCategory10"/>
														</div>	
															<input class="pl-point-button" type="button" name="newCategory10" onclick="addToList10();"
																		value="<spring:message code="category.add"/>"/>			
													</div>
												</div>
																
												<label class="col-sm-1 control-label"> </label>
												<label class="col-sm-4 control-label"><spring:message code="category.available" /></label>
												<label class="col-sm-5 control-label"><spring:message code="category.selected" /></label>
																
																	
												<div class="span4" id="header10">
													  <ol class='simple_with_animation vertical' name="summaryOL10" id="summaryOL10">
													      <c:forEach items="${nvwomansNoActiveDoubles}" var="nvWNActiveDoubles">
													  	  	<li class='highlight'>${nvWNActiveDoubles}</li>
													  	  </c:forEach>
													  </ol>
												</div>
												<div class="span4">
													  <ol class='simple_with_animation vertical' id="selectedNVWomansCategoryDoubles">
													  		<c:forEach items="${nvwomansActiveDoubles}" var="nvWActiveDoubles">
													  	  	<li class='highlight'>${nvWActiveDoubles}</li>
													  	  </c:forEach>
													  </ol>
												</div>
												<div class="span">
													<input class="pl-point-button" type="button" onclick="toSubmit();"
													value="<spring:message code="category.save" />" /> 
												</div>
                                                </div>
                                            </div>
                                   		   </div>
                                     </div>
                                     <div id="tab3" class="tab">
                                          <h3 class="tab-match-title"><spring:message code="category.mixes" /></h3>
                                           <div class="tabs standard">
                                            <ul class="tab-links-match">
                                                <li class="active"><a class="first-tabs" href="#tab3a"><spring:message code="category.adults" /></a></li>
                                                <li><a href="#tab3b"><spring:message code="category.nv" /></a></li>
                                            </ul>
                                            <div class="tab-content">
                                              
                                                <div id="tab3a" class="tab active">
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
																
																	
												<div class="span4" id="header3">
													  <ol class='simple_with_animation vertical' name="summaryOL3" id="summaryOL3">
													      <c:forEach items="${mixtosNoActive}" var="mixNoActive">
													  	  	<li class='highlight'>${mixNoActive}</li>
													  	  </c:forEach>
													  </ol>
												</div>
												<div class="span4">
													  <ol class='simple_with_animation vertical' id="selectedMixtosCategory">
													  	<c:forEach items="${mixtosActive}" var="mixActive">
													  	  	<li class='highlight'>${mixActive}</li>
													  	  </c:forEach>
													  </ol>
												</div>
												<div class="span">
													<input class="pl-point-button" type="button" onclick="toSubmit();"
													value="<spring:message code="category.save" />" /> 
												</div>
                                                </div>
                                                <div id="tab3b" class="tab">
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
																
																	
												<div class="span4" id="header6">
													  <ol class='simple_with_animation vertical' name="summaryOL6" id="summaryOL6">
													      <c:forEach items="${nvmixNoActive}" var="nvMiNActive">
													  	  	<li class='highlight'>${nvMiNActive}</li>
													  	  </c:forEach>
													  </ol>
												</div>
												<div class="span4">
													  <ol class='simple_with_animation vertical' id="selectedNVMixtosCategory">
													  		<c:forEach items="${nvmixActive}" var="nvMiActive">
													  	  		<li class='highlight'>${nvMiActive}</li>
													  	  	</c:forEach>
													  </ol>
												</div>
												<div class="span">
													<input class="pl-point-button" type="button" onclick="toSubmit();"
													value="<spring:message code="category.save" />" /> 
												</div>
                                                </div>
                                            </div>
                                   		   </div>
                                     </div>
          					  </div><!--Close Top Match-->
           				</div>
           			</div>
         		 </div>
         	</div>
         </div>
     </section>
   
</section>

</form:form>

 <section id="sponsor" class="container">
            <!--SECTION SPONSOR-->
           <div class="client-sport client-sport-nomargin">
               <div class="content-banner">
                     <ul class="sponsor second">
                      <li><img src="<%=pathGreenBall%>/resources/images/sponsor/2/02.png" alt="" /></li>
                      <li><img src="<%=pathGreenBall%>/resources/images/sponsor/2/03.png" alt="" /></li>
                      <li><img src="<%=pathGreenBall%>/resources/images/sponsor/2/04.png" alt="" /></li>
                      <li><img src="<%=pathGreenBall%>/resources/images/sponsor/2/06.png" alt="" /></li>
                      <li><img src="<%=pathGreenBall%>/resources/images/sponsor/2/08.png" alt="" /></li>
                      <li><img src="<%=pathGreenBall%>/resources/images/sponsor/2/13.png" alt="" /></li>
                    </ul>
                </div>
          </div>
       </section>


<%@ include file="foot.jsp" %>

<script src="<%=pathGreenBall%>/resources/js/jquery.ui.totop.js" type="text/javascript"></script>


<script>
    jQuery(document).ready(function () {
        jQuery('.tabs .tab-links-match a').on('click', function (e) {
            var currentAttrValue = jQuery(this).attr('href');

            // Show/Hide Tabs
            jQuery('.tabs ' + currentAttrValue).show().siblings().hide();

            // Change/remove current tab to active
            jQuery(this).parent('li').addClass('active').siblings().removeClass('active');

            e.preventDefault();
        });
    });
</script>

<script src="<%=pathGreenBall%>/resources/js/custom.js" type="text/javascript"></script>


</body>
</html>