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
    <!--<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />-->
    
    <link href='../../../../../../fonts.googleapis.com/cssa83f.css?family=Open+Sans:300italic,400italic,600italic,700italic,400,700,600,300' rel='stylesheet' type='text/css'/>
    <link href='../../../../../../fonts.googleapis.com/css912f.css?family=Open+Sans+Condensed:300,300italic,700' rel='stylesheet' type='text/css'/>
    <link href='../../../../../../fonts.googleapis.com/css27c4.css?family=Raleway:400,100,300,200,500,600,700,800,900' rel='stylesheet' type='text/css'/>
    <link href='../../../../../../fonts.googleapis.com/cssc601.css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>

    <link href="css/fonts/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
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




</head>
<body>
<!--SECTION HEADER-->
  <section class="container box-logo">
    <header>
        <div class="content-logo">
         
          <div class="logo"> 
           <img src="resources/img/logo2.png" alt="" />
          </div>
          <div class="box-login"> 
             <a href='login.html'>Login</a>
             <a href='login.html'>Sign Up</a>
          </div>
        </div>
        <div class="bt-menu"><a href="#" class="menu"><span>&equiv;</span> Menu</a></div>
	</header>
 </section>
 <!--SECTION CONTAINER-->
 <section class="drawer">
    <section id="summary" class="container secondary-page">
      <div class="general general-results" >
            <!--SECTION MENU-->
        <div class="box-menu">
            <nav id="cbp-hrmenu" class="container cbp-hrmenu">
					    <ul class="col-md-12">    
                            <li>
                               <a class="lnk-menu" href="index.html">Home</a>
                              
                            </li>
                            <li>
								<a class="lnk-menu" href="#">Pages</a>
                                <div class="cbp-hrsub sub-little">
                                  <div class="cbp-hrsub-inner"> 
                                      <div class="content-sub-menu">
								        <ul class="menu-pages">
									        <li><a href="tournaments.html"><span>Tournaments</span></a></li>
									        <li><a href="login.html"><span>Login</span></a></li>
									        <li><a href="news.html"><span>News</span></a></li>
                                            <li><a href="single_news.html"><span>Single News</span></a></li>
									        <li><a href="video_tube.html"><span>Video (youtube)</span></a></li>
									        <li><a href="video.html"><span>Video (html5)</span></a></li>
									        <li><a href="results.html"><span>Results</span></a></li>
                                            <li><a href="players.html"><span>Players</span></a></li>
                                            <li><a href="single_player.html"><span>Single Player</span></a></li>
                                            <li><a href="matches.html"><span>Matches</span></a></li>
                                            <li><a href="match.html"><span>Single Match</span></a></li>
                                            <li><a href="shops.html">Shop</a></li>
                                            <li><a href="shop_rackets.html">Shop Rackets</a></li>
                                            <li><a href="details_prod.html">Single products</a></li>
                                            <li><a href="gallery_col.html">Photo Gallery</a></li>
								          </ul>
                                        </div>
                                    </div>
                                </div>
							</li>
						    <li>
							<a class="lnk-menu" href="#">Players</a>
							<div class="cbp-hrsub cbp-player">
							<div class="cbp-hrsub-inner cbp-hssub-rows"> 
							   <div class="content-sub-menu">
								<h4>Top Players</h4>
								<ul>
									<li>
                                        <div class="jm-item second">
							                <div class="jm-item-wrapper">
								                <div class="jm-item-image">
									                <img src="resources/images/player/face.jpg" alt="" />
									                <div class="jm-item-description">
                                                        <p>Nicolay Ryo</p>
                                                        <p>1. Current Rank: 1</p>
                                                        <p>2. Highest Rank: 1</p>
                                                        <p>3. Age: 27</p>

                                                            <div class="jm-item-button">
                                                                <a href="single_player.html" class="ca-more"><i class="fa fa-angle-double-right"></i>more...</a>
                                                            </div>
                                                    </div>
								                </div>	
							                </div>
                                            <div class="menu-details-player"><p>Nicolay Ryo</p><p>( Serbia )</p></div>
						                </div>
                                    </li>
							       <li>
                                       <div class="jm-item second">
							                <div class="jm-item-wrapper">
								                <div class="jm-item-image">
									                <img src="resources/images/player/face.jpg" alt="" />
									                <div class="jm-item-description">
                                                        <p>Rafael Badal</p>
                                                        <p>1. Current Rank: 1</p>
                                                        <p>2. Highest Rank: 1</p>
                                                        <p>3. Age: 27</p>
                                                            <div class="jm-item-button">
                                                                <a href="single_player.html" class="ca-more"><i class="fa fa-angle-double-right"></i>more...</a>
                                                            </div>
                                                   </div>
								                </div>	
							                </div>
                                            <div class="menu-details-player"><p>Rafael Badal</p><p>( Spain )</p></div>
						                </div>
                                    </li>
                                    <li>
                                       <div class="jm-item second">
							                <div class="jm-item-wrapper">
								                <div class="jm-item-image">
									                <img src="resources/images/player/face.jpg" alt="" />
									                <div class="jm-item-description">
                                                        <p>Roger Perer</p>
                                                        <p>1. Current Rank: 1</p>
                                                        <p>2. Highest Rank: 1</p>
                                                        <p>3. Age: 27</p>
                                                            <div class="jm-item-button">
                                                                <a href="single_player.html" class="ca-more"><i class="fa fa-angle-double-right"></i>more...</a>
                                                            </div>
                                                   </div>
								                </div>	
							                </div>
                                            <div class="menu-details-player"><p>Roger Perer</p><p>( Switzerland )</p></div>
						                </div>
                                    </li>
                                    <li>
                                       <div class="jm-item second">
							                <div class="jm-item-wrapper">
								                <div class="jm-item-image">
									                <img src="resources/images/player/face.jpg" alt="" />
									                <div class="jm-item-description">
                                                        <p>Simon Wild</p>
                                                        <p>1. Current Rank: 1</p>
                                                        <p>2. Highest Rank: 1</p>
                                                        <p>3. Age: 27</p>
                                                            <div class="jm-item-button">
                                                                <a href="single_player.html" class="ca-more"><i class="fa fa-angle-double-right"></i>more...</a>
                                                            </div>
                                                   </div>
								                </div>	
							                </div>
                                            <div class="menu-details-player"><p>Simon Wild</p><p>( Switzerland )</p></div>
						                </div>
                                    </li>
                                    <li>
                                       <div class="jm-item second">
							                <div class="jm-item-wrapper">
								                <div class="jm-item-image">
									                <img src="resources/images/player/face.jpg" alt="" />
									                <div class="jm-item-description">
                                                        <p>David Figo</p>
                                                        <p>1. Current Rank: 1</p>
                                                        <p>2. Highest Rank: 1</p>
                                                        <p>3. Age: 27</p>
                                                            <div class="jm-item-button">
                                                                <a href="single_player.html" class="ca-more"><i class="fa fa-angle-double-right"></i>more...</a>
                                                            </div>
                                                   </div>
								                </div>	
							                </div>
                                            <div class="menu-details-player"><p>David Figo</p><p>( Spain )</p></div>
						                </div>
                                    </li>
                                    <li>
                                       <div class="jm-item second">
							                <div class="jm-item-wrapper">
								                <div class="jm-item-image">
									                <img src="resources/images/player/face.jpg" alt="" />
									                <div class="jm-item-description">
                                                        <p>Mirko Raonic</p>
                                                        <p>1. Current Rank: 1</p>
                                                        <p>2. Highest Rank: 1</p>
                                                        <p>3. Age: 27</p>
                                                            <div class="jm-item-button">
                                                                <a href="single_player.html" class="ca-more"><i class="fa fa-angle-double-right"></i>more...</a>
                                                            </div>
                                                   </div>
								                </div>	
							                </div>
                                            <div class="menu-details-player"><p>Mirko Raonic</p><p>( Canada )</p></div>
						                </div>
                                    </li>
                                    <li>
                                       <div class="jm-item second">
							                <div class="jm-item-wrapper">
								                <div class="jm-item-image">
									                <img src="resources/images/player/face.jpg" alt="" />
									                <div class="jm-item-description">
                                                        <p>Serena Bova</p>
                                                        <p>1. Current Rank: 1</p>
                                                        <p>2. Highest Rank: 1</p>
                                                        <p>3. Age: 27</p>
                                                            <div class="jm-item-button">
                                                                <a href="single_player.html" class="ca-more"><i class="fa fa-angle-double-right"></i>more...</a>
                                                            </div>
                                                   </div>
								                </div>	
							                </div>
                                            <div class="menu-details-player"><p>Serena Bova</p><p>( United States )</p></div>
						                </div>
                                    </li>
                                    <li>
                                       <div class="jm-item second">
							                <div class="jm-item-wrapper">
								                <div class="jm-item-image">
									                <img src="resources/images/player/face.jpg" alt="" />
									                <div class="jm-item-description">
                                                        <p>Simona Hela</p>
                                                        <p>1. Current Rank: 1</p>
                                                        <p>2. Highest Rank: 1</p>
                                                        <p>3. Age: 27</p>
                                                            <div class="jm-item-button">
                                                                <a href="single_player.html" class="ca-more"><i class="fa fa-angle-double-right"></i>more...</a>
                                                            </div>
                                                   </div>
								                </div>	
							                </div>
                                            <div class="menu-details-player"><p>Simona Hela</p><p>( Romania )</p></div>
						                </div>
                                    </li>
                                    <li>
                                       <div class="jm-item second">
							                <div class="jm-item-wrapper">
								                <div class="jm-item-image">
									                <img src="resources/images/player/face.jpg" alt="" />
									                <div class="jm-item-description">
                                                        <p>Ramo Sio</p>
                                                        <p>1. Current Rank: 1</p>
                                                        <p>2. Highest Rank: 1</p>
                                                        <p>3. Age: 27</p>
                                                        <div class="jm-item-button">
                                                                <a href="single_player.html" class="ca-more"><i class="fa fa-angle-double-right"></i>more...</a>
                                                            </div>
                                                   </div>
								                </div>	
							                </div>
                                            <div class="menu-details-player"><p>Ramo Sio</p><p>( China )</p></div>
						                </div>
                                    </li>
                                    <li>
                                       <div class="jm-item second">
							                <div class="jm-item-wrapper">
								                <div class="jm-item-image">
									                <img src="resources/images/player/face.jpg" alt="" />
									                <div class="jm-item-description">
                                                        <p>Petra Volta</p>
                                                        <p>1. Current Rank: 1</p>
                                                        <p>2. Highest Rank: 1</p>
                                                        <p>3. Age: 27</p>
                                                        <div class="jm-item-button">
                                                                <a href="single_player.html" class="ca-more"><i class="fa fa-angle-double-right"></i>more...</a>
                                                            </div>
                                                   </div>
								                </div>	
							                </div>
                                            <div class="menu-details-player"><p>Petra Volta</p><p>( Czech Republic )</p></div>
						                </div>
                                    </li>
                                    <li>
                                       <div class="jm-item second">
							                <div class="jm-item-wrapper">
								                <div class="jm-item-image">
									                <img src="resources/images/player/face.jpg" alt="" />
									                <div class="jm-item-description">
                                                        <p>Agnieszka Rada</p>
                                                        <p>1. Current Rank: 1</p>
                                                        <p>2. Highest Rank: 1</p>
                                                        <p>3. Age: 27</p>
                                                        <div class="jm-item-button">
                                                                <a href="single_player.html" class="ca-more"><i class="fa fa-angle-double-right"></i>more...</a>
                                                            </div>
                                                   </div>
								                </div>	
							                </div>
                                            <div class="menu-details-player"><p>Agnieszka Rada</p><p>( Poland )</p></div>
						                </div>
                                    </li>
                                    <li>
                                       <div class="jm-item second">
							                <div class="jm-item-wrapper">
								                <div class="jm-item-image">
									                <img src="resources/images/player/face.jpg" alt="" />
									                <div class="jm-item-description">
                                                        <p>Maria Siria</p>
                                                        <p>1. Current Rank: 1</p>
                                                        <p>2. Highest Rank: 1</p>
                                                        <p>3. Age: 27</p>
                                                        <div class="jm-item-button">
                                                                <a href="single_player.html" class="ca-more"><i class="fa fa-angle-double-right"></i>more...</a>
                                                            </div>
                                                   </div>
								                </div>	
							                </div>
                                            <div class="menu-details-player"><p>Maria Siria</p><p>( Russian )</p></div>
						                </div>
                                    </li>
                                    <li class="menu-viewall">
                                        <a href="players.html">view all player</a>
                                    </li>
										</ul>
									 </div>
									
								</div><!-- /cbp-hrsub-inner -->
							</div><!-- /cbp-hrsub -->
						</li>
                        <li><a class="lnk-menu" href="results.html">Results</a></li>
						<li><a class="lnk-menu" href="news.html">News</a></li>
                        <li><a class="lnk-menu" href="shops.html">Shop</a></li>
                        <li><a class="lnk-menu" href="contact.html">Contact</a></li>
                        <li><a class="lnk-menu" href="bjTorunament.html">Torneo</a></li>
					</ul>
				</nav>
			</div>

  
