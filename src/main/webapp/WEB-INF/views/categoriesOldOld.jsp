<%@ include file="header.jsp" %>

<link href="<%=pathGreenBall%>/resources/css/vendor.css" rel="stylesheet" type="text/css" />
<link href="<%=pathGreenBall%>/resources/css/application.css" rel="stylesheet" type="text/css" />
<script src="<%=pathGreenBall%>/resources/js/application.js" type="text/javascript"></script>

<script type="text/javascript">

function addToList(){
	var bla = $('#newCategory').val();
	$("#header ol").append("<li class='highlight'>" + bla +"</li>");
}



</script>
<style>
	.tab-links li { width: 16.6666%; }
</style>


<div id="atp-match">
<div class="container">

<c:url var="addAction" value="/categoriesOld" ></c:url>
<form:form action="${addAction}" commandName="categoryOld">


                <h3>Total <span>Scores</span><span class="point-little">.</span></h3>
                
                
                <!--  div class="main">-->
                        <div class="tabs animated-slide-2">
                            <ul class="tab-links">
                                <li class="active"><a href="#tab1111">ATP</a></li>
                                <li><a href="#tab2222">WTA</a></li>
                                <li><a href="#tab3333">ATP DBL</a></li>
                                <li><a href="#tab3333">ATP DBL</a></li>
                                <li><a href="#tab3333">ATP DBL</a></li>
                                <li><a href="#tab3333">ATP DBL</a></li>
                            </ul>
                            <div class="tab-content">
                                <div id="tab1111" class="tab active">
                                	

								<div class="form-group">
								<label class="col-sm-2 control-label">* Categoria</label>
											<div class="col-sm-5">
												<input type="text" name="newCategory" id="newCategory"/>
											</div>	
											<input class="pl-point-button" type="button" name="newCategory" onclick="addToList();"
													value="<spring:message text="Añadir"/>"/>			
								</div>
								
								            <div class='span4' id="header">
								              <ol class='simple_with_animation vertical' name="summaryOL" id="summaryOL">
								                <li class='highlight'>A</li>
								                <li class='highlight'>B</li>
								                <li class='highlight'>C</li>
								                <li class='highlight'>D</li>
								              </ol>
								            </div>
								            <div class='span4'>
								              <ol class='simple_with_animation vertical'>
								                
								              </ol>
								            </div>
                                
                                
                                
                                </div>
                                <div id="tab2222" class="tab">
                                
                                </div>
                                <div id="tab3333" class="tab">
                                
                                </div>
                            </div>
                        </div>
                    <!--  /div>-->
                    </form:form>
                    </div>
                    


<%@ include file="footer.jsp" %>