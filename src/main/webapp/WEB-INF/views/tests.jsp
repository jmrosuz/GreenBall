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
    
    
	

    <!--Video Porfolio-->
    <link href="<%=pathGreenBall%>/resources/css/stapel.css" rel="stylesheet" type="text/css" />
    <link href="<%=pathGreenBall%>/resources/css/jquery.bxslider.css" rel="stylesheet" type="text/css" />
    <link href="<%=pathGreenBall%>/resources/css/jquery.jscrollpane.css" rel="stylesheet" type="text/css" />
    

    <link href="<%=pathGreenBall%>/resources/css/component.css" rel="stylesheet" type="text/css" />
    <link href="<%=pathGreenBall%>/resources/css/prettyPhoto.css" rel="stylesheet" type="text/css" />
    <link href="<%=pathGreenBall%>/resources/css/style_dir.css" rel="stylesheet" type="text/css" />
    <link href="<%=pathGreenBall%>/resources/css/greenBall.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" type="image/png" href="img/favicon.ico" />
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
	.col-sm-5 { width: 10%; }
	.tab-links-match {background-color: transparent;}
	.player-vs .tab-links-match {background-color: transparent;}
	.player-vs .tab-content.single-match {background: transparent;}
	.player-vs .tab-content .tab-content {background: transparent;}
</style>


</head>
<body>
<%@ include file="head.jsp" %>
<%@ include file="menu.jsp" %>

<c:url var="addAction" value="/addCategory" ></c:url>
<form:form action="${addAction}" commandName="category" name="category" id="category">


<section class="drawer">
     <section id="single-match-pl" class="container secondary-page">
      <div class="general general-results players">
           <div class="top-score-title right-score col-md-16">
           	  <div id ="atp-match"class="top-score-title player-vs">
                <h3>Total <span>Scores</span><span class="point-little">.</span></h3>
                <div class="main">
                       <div class="tabs standard single-pl">
                                <ul class="tab-links-match tb-set">
                                    <li class="active"><a class="first-tabs" href="#tab1">Singles</a></li>
                                    <li><a class="first-tabs" href="#tab2">Dobles</a></li>
                                    <li><a href="#">Mixtos</a></li>
                                </ul>
                                <div class="tab-content single-match">
                                    <div id="tab1" class="tab active">
                                       <h3 class="tab-match-title">Singles</h3>
                                        <div class="tabs standard">
                                            <ul class="tab-links-match">
                                                <li class="active"><a class="first-tabs" href="#tab1a">Varonil</a></li>
                                                <li><a href="#tab2a">Femenil</a></li>
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
																		
																			
														<div class='span4' id="header">
															  <ol class='simple_with_animation vertical' name="summaryOL" id="summaryOL">
															  	  <c:forEach items="${mensNoActive}" var="noActive">
															  	  	<li class='highlight'>${noActive}</li>
															  	  </c:forEach>
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
                                                <div id="tab2a" class="tab">  
                                                </div>
                                            </div>
                                        </div>     
                                    </div>
                                    <div id="tab2" class="tab">
                                          <h3 class="tab-match-title">Dobles</h3>
                                           <div class="tabs standard">
                                            <ul class="tab-links-match">
                                                <li class="active"><a class="first-tabs" href="#tab1b">Varonil</a></li>
                                                <li><a href="#tab2b">Femenil</a></li>
                                            </ul>
                                            <div class="tab-content">
                                              
                                                <div id="tab1b" class="tab active">
                                                </div>
                                                <div id="tab2b" class="tab">
                                                  <div class="col-md-4 single-match-data">
                                                      <p class="nm-player">Jenny Doe</p>
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

<%@ include file="foot.jsp" %>

<script src="<%=pathGreenBall%>/resources/js/jquery-1.10.2.js" type="text/javascript"></script>
<!--  script src="<%=pathGreenBall%>/resources/js/jquery-migrate- 1.2.1.min.js" type="text/javascript"></script>-->

<!--MENU-->
<script src="<%=pathGreenBall%>/resources/js/menu/modernizr.custom.js" type="text/javascript"></script>
<script src="<%=pathGreenBall%>/resources/js/menu/cbpHorizontalMenu.js" type="text/javascript"></script>
<!--END MENU-->

<!-- Button Anchor Top-->
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

<!--  /section>-->
</body>
</html>