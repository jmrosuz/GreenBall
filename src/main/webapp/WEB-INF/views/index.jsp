<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html xmlns="../../../../../../www.w3.org/1999/xhtml/index.html">
<head>
    <title>TENNIS CLUB</title>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />

<meta name="author" content="corsini" />
<meta name="keywords" content="Tennis, club, events, football, golf, non-profit, betting assistant, football,fitness, tennis, sport, soccer, goal, sports, volleyball, basketball,	charity, club, cricket, football, hockey, magazine, non profit, rugby, soccer, sport, sports, tennis" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    
    <link href="resources/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <!--<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />-->
    
    <link href='../../../../../../fonts.googleapis.com/cssa83f.css?family=Open+Sans:300italic,400italic,600italic,700italic,400,700,600,300' rel='stylesheet' type='text/css'/>
    <link href='../../../../../../fonts.googleapis.com/css912f.css?family=Open+Sans+Condensed:300,300italic,700' rel='stylesheet' type='text/css'/>
    <link href='../../../../../../fonts.googleapis.com/css27c4.css?family=Raleway:400,100,300,200,500,600,700,800,900' rel='stylesheet' type='text/css'/>
    <link href='../../../../../../fonts.googleapis.com/cssc601.css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>

    <link href="css/fonts/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!--Video Porfolio-->
    <link href="resources/css/stapel.css" rel="stylesheet" type="text/css" />
    <link href="resources/css/jquery.bxslider.css" rel="stylesheet" type="text/css" />
    <link href="resources/css/jquery.jscrollpane.css" rel="stylesheet" type="text/css" />
    

    <link href="resources/css/component.css" rel="stylesheet" type="text/css" />
    <link href="resources/css/prettyPhoto.css" rel="stylesheet" type="text/css" />
    <link href="resources/css/style_dir.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" type="image/png" href="img/favicon.ico" />
    <link href="resources/css/responsive.css" rel="stylesheet" type="text/css" />

    <link href="resources/css/animate.css" rel="stylesheet" type="text/css" />

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
             <i class="fa fa-shopping-cart"></i>
             <a href='login.html'>Login</a>
             <a href='login.html'>Sign Up</a>
          </div>
          <div class="cart-prod hiddenbox">
             <div class="sec-prod">
              <div class="content-cart-prod">
                <i class="fa fa-times"></i>
                <img src="resources/images/shop/bags1.jpg" alt="" />
                <p>FIVE BLX</p>
                <p>1 X $55.00</p>
              </div>
              <div class="content-cart-prod">
                <i class="fa fa-times"></i>
                <img class="racket-img" src="resources/images/shop/1_100L.jpg" alt="" />
                <p>FIVE BLX</p>
                <p>1 X $125.00</p>
              </div>
               <div class="content-cart-prod">
                <p class="cart-tot-price">Total: $180.00</p>
                <a href="#" class="btn-cart">Go to cart</a>
                <a href="#" class="btn-cart">Checkout</a>
              </div>
             </div>
          </div>
        </div>
        <div class="bt-menu"><a href="#" class="menu"><span>&equiv;</span> Menu</a></div>
	</header>
 </section>
 <!--SECTION CONTAINER-->
 <section class="drawer">
    <section id="summary">
      <div class="general">
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
           
           <div class="content-result content-result-news col-md-12">
             <div id="textslide" class="effect-backcolor">
                <div class="container">
                    <div class="col-md-12 slide-txt">
                        <p class='sub-result aft-little welcome linetheme-left'>Creative</p>
                        <p class='sub-result aft-little linetheme-right'>Web Design<span class="point-big">.</span></p>
                    </div>
                </div>
             </div>
           </div>
           <div id="slidematch" class="col-xs-12 col-md-12">
                  <div class="content-match-team-wrapper">
                     <span class="gdlr-left">Real Tennis</span>
                     <span class="gdlr-upcoming-match-versus">VS</span>
                     <span class="gdlr-right">Wednesday Club</span>
                  </div>
                  <div class="content-match-team-time">
                     <span class="gdlr-left">23 Sep 2016 - 14:00</span>
                     <span class="gdlr-right">Real Stadium</span>
                  </div>
               </div>
          
          <!--CONTENT Match TOP SCORE-->
          <div id="atp-match">
          <div class="container">
           <div id="people-top" class="top-match col-xs-12 col-md-12">
            <!--SECTION ATP MATCH-->
              <div class="next-match-co">
                 <div id="nextmatch-content" class="experience">
                   <div class="col-xs-4 pht-1 pht-left">
                         <p class="col-xs-12 name-mc">Nikol Brian</p>
                         <div class="col-xs-6 img-face-home"><img src="resources/images/player/djokovic.jpg" alt="" /></div>
                        
                        <div class="col-xs-6 pl-desc pl-match">
                         <p>27 (22.05.1987)</p>
                           <p>Praga, Ceco</p>
                           <p>6'2" (188 cm)</p>
                           <p>176 lbs (80 kg)</p>
                         </div>
                         <div class="col-xs-12">
                             <div class="exp-skill">
                                    <p class="exp-title">SKILLS</p>
                                    <div class="skills">
                                    <div class="skillbar clearfix" data-percent="95%">
                                        <div class="skillbar-title"><span>Grip   </span></div>
                                        <div class="skillbar-bar"></div>
                                        <div class="skill-bar-percent">95%</div>
                                    </div>
                                    <div class="skillbar clearfix" data-percent="84%">
                                        <div class="skillbar-title"><span>Serve  </span></div>
                                        <div class="skillbar-bar"></div>
                                        <div class="skill-bar-percent">84%</div>
                                    </div>
                                    <div class="skillbar clearfix" data-percent="65%">
                                        <div class="skillbar-title"><span>Forehand</span></div>
                                        <div class="skillbar-bar"></div>
                                        <div class="skill-bar-percent">65%</div>
                                    </div>
                                    <div class="skillbar clearfix" data-percent="75%">
                                        <div class="skillbar-title"><span>Backhand</span></div>
                                        <div class="skillbar-bar"></div>
                                        <div class="skill-bar-percent">75%</div>
                                    </div>
                                </div>
                            </div>
                         </div>
                         <div class="col-md-12 social-player">
                            <ul class="social">
                              <li><a class="m-facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                              <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                              <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                              <li><a href="#"><i class="fa fa-rss"></i></a></li>
                            </ul>
                         </div>
                            
                  </div>
                  <div class="col-xs-4 pl-point ">
                      <div><p class="pl-title">BEIJING - FIRST ROUND</p></div>
                      <div class="col-xs-4 nm-result">
                            <p class="nr1 ris1"> 0 </p>
                            <p class="nr2"> 0% </p>
                      </div>
                      <div class="col-xs-4 nm-result-vs">
                            <p class="nrvs"> - VS - </p>
                      </div>
                      <div class="col-xs-4 nm-result">
                            <p class="nr1 ris2"> 1 </p>
                            <p class="nr2"> 100% </p>
                      </div>
                      
                      <div class="col-xs-12 content-img-round"><img class="img-round" src="resources/images/stadium.jpg" alt=""/></div>
                      <div class="col-xs-12 pl-bt-con"><a class="pl-point-button" href="#" >View details</a></div>
                  </div>
                   <div class="col-xs-4 pht-1 pht-right">
                        <p class="col-xs-12 name-mc">Roial Mink</p>
                        <div class="col-xs-6 img-face-home"><img src="resources/images/player/nadal.jpg" alt="" /></div>
                        
                        <div class="col-xs-6 pl-desc pl-match">
                           <p>28 (03.06.1986)</p>
                           <p>Mallorca, Spain</p>
                           <p>6'1" (185 cm)</p>
                           <p>188 lbs (85 kg)</p>
                         </div>
                         <div class="col-xs-12">
                             <div class="exp-skill">
                                    <p class="exp-title">SKILLS</p>
                                    <div class="skills">
                                    <div class="skillbar clearfix" data-percent="95%">
                                        <div class="skillbar-title"><span>Grip   </span></div>
                                        <div class="skillbar-bar"></div>
                                        <div class="skill-bar-percent">95%</div>
                                    </div>
                                    <div class="skillbar clearfix" data-percent="84%">
                                        <div class="skillbar-title"><span>Serve  </span></div>
                                        <div class="skillbar-bar"></div>
                                        <div class="skill-bar-percent">84%</div>
                                    </div>
                                    <div class="skillbar clearfix" data-percent="65%">
                                        <div class="skillbar-title"><span>Forehand</span></div>
                                        <div class="skillbar-bar"></div>
                                        <div class="skill-bar-percent">65%</div>
                                    </div>
                                    <div class="skillbar clearfix" data-percent="75%">
                                        <div class="skillbar-title"><span>Backhand</span></div>
                                        <div class="skillbar-bar"></div>
                                        <div class="skill-bar-percent">75%</div>
                                    </div>
                                </div>
                            </div>
                         </div>
                         <div class="col-md-12 social-player">
                            <ul class="social">
                              <li><a class="m-facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                              <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                              <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                              <li><a href="#"><i class="fa fa-rss"></i></a></li>
                            </ul>
                         </div>
                  </div>
                 </div>
              </div>
           </div><!--Close Top Match-->
           </div>
           </div>
           <!--CONTENT NEXT MATCH-->
          
           <div id="next-match">
             <div  class="container">
              <div class="next-match-news top-match col-xs-12 col-md-12">
              <h3 class="news-title n-match">Next <span>Match</span><span class="point-little">.</span></h3>
                <div class="other-match col-md-4">
                    <div class="score-next-time">
                        <div class="circle-ico"><p>ATP</p></div>
                        <p class='sub-result'>Qatar ExonMobil</p>
                        <p class="dd-news-date">April 22, 2014 ~ 2:30pm</p>
                        <p class="dd-news-date">Canada Stadium</p>
                    </div>
                    <div class="score-next">
                        <div class="match-flags"><img src="resources/images/stadium3.jpg" alt="" /></div>
                        <div class="match-team"><span>Fernand</span> <span class="txt-vs"> - vs - </span> <span>Brain</span></div>
                        <div class="match-flags">
                          <ul class="social">
                              <li><a class="m-facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                              <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                              <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                              <li><a href="#"><i class="fa fa-rss"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    
                </div>
                <div class="other-match col-md-4">
                    <div class="score-next-time">
                        <div class="circle-ico"><p>WTP</p></div>
                        <p class='sub-result'>Apia International</p>
                        <p class="dd-news-date">April 22, 2014 ~ 2:30pm</p>
                        <p class="dd-news-date">Canada Stadium</p>
                    </div>
                    <div class="score-next">
                        <div class="match-flags"><img src="resources/images/stadium2.jpg" alt="" /></div>
                        <div class="match-team"><span>Figo</span> <span class="txt-vs"> - vs - </span> <span>Siron</span></div>
                        <div class="match-flags">
                           <ul class="social">
                              <li><a class="m-facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                              <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                              <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                              <li><a href="#"><i class="fa fa-rss"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="other-match col-md-4 other-last">
                    <div class="score-next-time">
                        <div class="circle-ico"><p>ATP</p></div>
                        <p class='sub-result'>Heineken Open </p>
                        <p class="dd-news-date">April 22, 2014 ~ 2:30pm</p>
                        <p class="dd-news-date">Canada Stadium</p>
                    </div>
                    <div class="score-next">
                        <div class="match-flags"><img src="resources/images/stadium3.jpg" alt="" /></div>
                        <div class="match-team"><span>Samuel</span> <span class="txt-vs"> - vs - </span> <span>Paul</span></div>
                        <div class="match-flags">
                           <ul class="social">
                              <li><a class="m-facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                              <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                              <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                              <li><a href="#"><i class="fa fa-rss"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    
                </div>

            </div>
           </div>
          </div>
           <div class="bbtxt-content">
               
                <div class="container">
                    <div class="col-xs-12 bbtxt-box">
                        <h4><i class="fa fa-quote-left"></i>Tennis<span class="point-big">.</span> <span class="middle-txt">is the new black<span class="point-little">.</span></span><i class="fa fa-quote-right"></i></h4>
                        <p>Radial gradient feature is used to create the rounded drop shadow effect.</p>
                        <div class="ipad-img">
                            <img src="resources/images/ipad.png" alt="" />
                        </div>
                    </div>
                  </div>
                </div>
            <div id="resultsPoint">
                <div class="container">
                    <div class="next-match-news top-match col-xs-12 col-md-12">
                     <div class="top-score-title">
                        <h3>Statistics<span class="point-little">.</span></h3>
                        <div class="col-xs-12 circle-percentage">
                          <div class="col-xs-3">
                            <div class="pie_progress" role="progressbar" data-goal="83" data-barcolor="#f59123" data-barsize="10">
                             <div class="pie_content">
                                <div class="pie_progress__number">0%</div>
                                <div class="pie_progress__content">Super-Senior</div>
                             </div>
                            </div>
                          </div>
                          <div class="col-xs-3">
                            <div class="pie_progress" role="progressbar" data-goal="65" data-barcolor="#2c333b" data-barsize="10">
                             <div class="pie_content">
                                <div class="pie_progress__number">0%</div>
                                <div class="pie_progress__content">Senior</div>
                             </div>
                            </div>
                          </div>
                          <div class="col-xs-3">
                            <div class="pie_progress" role="progressbar" data-goal="32" data-barcolor="#f59123" data-barsize="10">
                             <div class="pie_content">
                                <div class="pie_progress__number">0%</div>
                                <div class="pie_progress__content">Pro</div>
                             </div>
                            </div>
                          </div>
                          <div class="col-xs-3">
                            <div class="pie_progress" role="progressbar" data-goal="73" data-barcolor="#2c333b" data-barsize="10">
                             <div class="pie_content">
                                <div class="pie_progress__number">0%</div>
                                <div class="pie_progress__content">Junior</div>
                             </div>
                            </div>
                          </div>
                        </div>
                        <div class="clear"></div>
                        <h3>Top <span>Scores</span><span class="point-little">.</span></h3>
                        <div class="main">
                                <div class="tabs animated-slide-2">
                                 <div class="result-filter">
                                    <ul class="tab-links">
                                        <li class="active"><a href="#tab1111">ATP</a></li>
                                        <li><a href="#tab2222">WTA</a></li>
                                        <li><a href="#tab3333">ATP DBL</a></li>
                                    </ul>
                                    </div>
                                    <div class="tab-content">
                                        <div id="tab1111" class="tab active">
                                        <table class="tab-score">
                                          <tr class="top-scrore-table"><td class="score-position">POS.</td><td>PLAYER</td><td>NAT.</td><td>POINTS</td></tr>
                                          <tr><td class="score-position">1.</td><td><a href="single_player.html">Nicol Dorian</a></td><td><img src="resources/images/flags/serbia.png" alt="" /></td><td>12770</td></tr>
                                          <tr><td class="score-position">2.</td><td><a href="single_player.html">Rafael Milk</a></td><td><img src="resources/images/flags/argentina.png" alt="" /></td><td>10670</td></tr>
                                          <tr><td class="score-position">3.</td><td><a href="single_player.html">Roger Figo</a></td><td><img src="resources/images/flags/uk.png" alt="" /></td><td>7490</td></tr>
                                          <tr><td class="score-position">4.</td><td><a href="single_player.html">St. Waiker</a></td><td><img src="resources/images/flags/brazil.png" alt="" /></td><td>5985</td></tr>
                                          <tr><td class="score-position">5.</td><td><a href="single_player.html">David Ruby</a></td><td><img src="resources/images/flags/japan.png" alt="" /></td><td>4765</td></tr>
                                          <tr><td class="score-position">6.</td><td><a href="single_player.html">Milos Fiodor</a></td><td><img src="resources/images/flags/brazil.png" alt="" /></td><td>4225</td></tr>
                                          <tr><td class="score-position">7.</td><td><a href="single_player.html">Braian Raul</a></td><td><img src="resources/images/flags/uk.png" alt="" /></td><td>4225</td></tr>
                                         </table>
                                        </div>
                                        <div id="tab2222" class="tab">
                                        <table class="tab-score">
                                        <tr class="top-scrore-table"><td class="score-position">POS.</td><td>PLAYER</td><td>NAT.</td><td>POINTS</td></tr>
                                          <tr><td class="score-position">1.</td><td><a href="single_player.html">Serena Brain</a></td><td><img src="images/flags/usa.png" alt="" /></td><td>1234</td></tr>
                                          <tr><td class="score-position">2.</td><td><a href="single_player.html">Simona Figo</a></td><td><img src="images/flags/uk.png" alt="" /></td><td>1234</td></tr>
                                          <tr><td class="score-position">3.</td><td><a href="single_player.html">Nio Red</a></td><td><img src="images/flags/italy.png" alt="" /></td><td>1234</td></tr>
                                          <tr><td class="score-position">4.</td><td><a href="single_player.html">Petra Curt</a></td><td><img src="images/flags/denmark.png" alt="" /></td><td>1234</td></tr>
                                          <tr><td class="score-position">5.</td><td><a href="single_player.html">Ag. Rader</a></td><td><img src="images/flags/uk.png" alt="" /></td><td>1234</td></tr>
                                          <tr><td class="score-position">6.</td><td><a href="single_player.html">Maria Shadow</a></td><td><img src="images/flags/brazil.png" alt="" /></td><td>1234</td></tr>
                                          <tr><td class="score-position">7.</td><td><a href="single_player.html">Tina Rossi</a></td><td><img src="images/flags/argentina.png" alt="" /></td><td>1234</td></tr>
                                         </table>
                                        </div>
                                        <div id="tab3333" class="tab">
                                        <table class="tab-score">
                                        <tr class="top-scrore-table"><td class="score-position">POS.</td><td>PLAYER</td><td>NAT.</td><td>POINTS</td></tr>
                                          <tr><td class="score-position">1.</td><td><a href="single_player.html">name1</a></td><td>-</td><td>1234</td></tr>
                                          <tr><td class="score-position">2.</td><td><a href="single_player.html">name2</a></td><td>-</td><td>1234</td></tr>
                                          <tr><td class="score-position">3.</td><td><a href="single_player.html">name3</a></td><td>-</td><td>1234</td></tr>
                                          <tr><td class="score-position">4.</td><td><a href="single_player.html">name4</a></td><td>-</td><td>1234</td></tr>
                                          <tr><td class="score-position">5.</td><td><a href="single_player.html">name5</a></td><td>-</td><td>1234</td></tr>
                                          <tr><td class="score-position">6.</td><td><a href="single_player.html">name6</a></td><td>-</td><td>1234</td></tr>
                                          <tr><td class="score-position">7.</td><td><a href="single_player.html">name7</a></td><td>-</td><td>1234</td></tr>
                                         </table>
                                        </div>
                                    </div>
                                    <div class="score-view-all"><a class="pl-point-button" href="results.html">View All</a></div>
                                </div>
                            </div>
                      </div>
                    </div>
                </div>
            </div>

            <!--SECTION NEWS-->
            <div id="news-section">
               <div class="container">
                   <div class="news-section-news top-match col-xs-12 col-md-12">
                      <div class="news-content">
                       <h3 class="news-title">Latest <span>News</span><span class="point-little">.</span></h3>
                       <div id="container-vert-n">
                        <dl class="group">
		                    <dd>
			                    <ul class="filter group albumFilter"> 
				                    <li data-filter="*" class="current"><a  href="#">ALL</a></li> 
				                    <li data-filter=".cat1"><a  href="#">ATP</a></li> 
				                    <li data-filter=".cat2"><a  href="#">WTP</a></li> 
				                    <li data-filter=".cat3"><a  href="#">BEAUTY</a></li> 
				                    <li data-filter=".cat4"><a  href="#">MEETING</a></li> 
			                    </ul> 
		                    </dd>
	                    </dl>
                        <div class="clear"></div>
                        <!-- Portfolio Items -->
	                <ul class="portfolio group albumContainer"> 
		                <li class="item block cat2">
			                <a href="images/gallery/1.jpg" rel="prettyPhoto[portfolio]"><img src="images/gallery/1_thumb.jpg"  alt="Yulia Gorbachenko, Hannah 1" /></a>
                            <p class='sub-result'><span>Heineken</span> Open </p>
                            <p class="news-desc">I do so recognizing that change cannot happen overnight. Over seven years ago, the United States pursued al Qaeda and the Taliban with broad international support.</p>
		                    <p class="news-date">November 5, 2015</p>
                        </li> 
		                <li class="item block cat1">
			                <a href="images/gallery/2.jpg" rel="prettyPhoto[portfolio]"><img src="images/gallery/2_thumb.jpg"  alt="Yulia Gorbachenko, Hair 1" /></a>
                            <p class='sub-result'>Apia <span>International</span></p>
                            <p class="news-desc">I do so recognizing that change cannot happen overnight. Over seven years ago, the United States pursued al Qaeda and the Taliban with broad international support.</p>
		                    <p class="news-date">November 5, 2015</p>
                        </li>
		                <li class="item block cat1">
			                <a href="images/gallery/7.jpg" rel="prettyPhoto[portfolio]"><img src="images/gallery/7_thumb.jpg"  alt="Yulia Gorbachenko, Hair 2" /></a>
                            <p class='sub-result aft-little'>Qatar ExonMobil</p>
                            <p class="news-desc">I do so recognizing that change cannot happen overnight. Over seven years ago, the United States pursued al Qaeda and the Taliban with broad international support.</p>
		                    <p class="news-date">November 5, 2015</p>
                        </li>
		                <li class="item block cat3">
			                <a href="images/gallery/3.jpg" rel="prettyPhoto[portfolio]"><img src="images/gallery/3_thumb.jpg"  alt="Yulia Gorbachenko, Traction 1" /></a>
                            <p class='sub-result aft-little'>London Tour</p>
                            <p class="news-desc">I do so recognizing that change cannot happen overnight. Over seven years ago, the United States pursued al Qaeda and the Taliban with broad international support.</p>
		                    <p class="news-date">November 5, 2015</p>
                        </li>
		                <li class="item block cat1 cat3">
			                <a href="images/gallery/8.jpg" rel="prettyPhoto[portfolio]"><img src="images/gallery/9_thumb.jpg"  alt="Yulia Gorbachenko, Traction 1" /></a>
                            <p class='sub-result aft-little'><span>ATP</span> Europe</p>
                            <p class="news-desc">I do so recognizing that change cannot happen overnight. Over seven years ago, the United States pursued al Qaeda and the Taliban with broad international support.</p>
		                    <p class="news-date">November 5, 2015</p>
                        </li>
		                <li class="item block hiphop">
			                <a href="images/gallery/4.jpg" rel="prettyPhoto[portfolio]"><img src="images/gallery/4_thumb.jpg"  alt="Yulia Gorbachenko, Beauty 2" /></a>
                            <p class='sub-result aft-little'><span>WTP</span> Europe</p>
                             <p class="news-desc">I do so recognizing that change cannot happen overnight. Over seven years ago, the United States pursued al Qaeda and the Taliban with broad international support.</p>
		                    <p class="news-date">November 5, 2015</p>
                        </li>
	                </ul>
                     
			        </div>
                   </div>
                  </div>
               </div>
          </div>

           <!--SECTION TOP VIDEO-->
          <div class="container">
           <div class="top-video col-xs-12 col-md-12">
             <h3>Top <span>Video</span><span class="point-little">.</span></h3>
             <section class="main">
				<div class="wrapper">
					<div class="topbar">
						<span id="close" class="back">&larr;</span>
					</div>
					
					<ul id="tp-grid" class="tp-grid">
                    <!--Novak Djokovic-->
						<li data-pile="Robert Milk">
							<a href="video.html">
								<span class="tp-info">
                                    <span>Jhon - VS - Greg</span>
                                    <i class="fa fa-video-camera"></i>
                                </span>
								<img src="images/1/5.jpg" alt=""/>
							</a>
						</li>
						<li data-pile="Robert Milk">
							<a href="video.html">
								<span class="tp-info">
                                    <span>Jhon - VS - Greg</span>
                                    <i class="fa fa-video-camera"></i>
                                </span>
                                
								<img src="images/1/2.jpg" alt=""/>
							</a>
						</li>
						<li data-pile="Robert Milk">
							<a href="video.html">
								<span class="tp-info">
                                    <span>Jhon - VS - Greg</span>
                                    <i class="fa fa-video-camera"></i>
                                </span>
								<img src="images/1/3.jpg" alt=""/>
							</a>
						</li>
                        <li data-pile="Robert Milk">
							<a href="video.html">
								<span class="tp-info">
                                    <span>Jhon - VS - Greg</span>
                                    <i class="fa fa-video-camera"></i>
                                </span>
								<img src="images/1/4.jpg" alt=""/>
							</a>
						</li>
                        <li data-pile="Robert Milk">
							<a href="video.html">
								<span class="tp-info">
                                    <span>Jhon - VS - Greg</span>
                                    <i class="fa fa-video-camera"></i>
                                </span>
								<img src="images/1/1.jpg" alt=""/>
							</a>
						</li>
                        <!--Rafael Nadal-->
						<li data-pile="Rafael Garren">
							<a href="video.html">
								<span class="tp-info">
                                    <span>Gurrent - VS - Jhon</span>
                                    <i class="fa fa-video-camera"></i>
                                </span>
								<img src="images/2/3.jpg" alt=""/>
							</a>
						</li>
						<li data-pile="Rafael Garren">
							<a href="video.html">
								<span class="tp-info">
                                    <span>Gurrent - VS - Jhon</span>
                                    <i class="fa fa-video-camera"></i>
                                </span>
								<img src="images/2/1.jpg" alt=""/>
							</a>
						</li>
						<li data-pile="Rafael Garren">
							<a href="video.html">
								<span class="tp-info">
                                    <span>Gurrent - VS - Jhon</span>
                                    <i class="fa fa-video-camera"></i>
                                </span>
								<img src="images/2/2.jpg" alt=""/>
							</a>
						</li>

						<li data-pile="Richar Dior">
							<a href="video.html">
								<span class="tp-info">
                                    <span>Dior - VS - Milk</span>
                                    <i class="fa fa-video-camera"></i>
                                </span>
								<img src="images/3/1.jpg" alt=""/>
							</a>
						</li>
						<li data-pile="Richar Dior">
							<a href="video.html">
								<span class="tp-info">
                                    <span>Dior - VS - Milk</span>
                                    <i class="fa fa-video-camera"></i>
                                </span>
								<img src="images/3/2.jpg" alt=""/>
							</a>
						</li>
						<li data-pile="Richar Dior">
							<a href="video.html">
								<span class="tp-info">
                                    <span>Dior - VS - Milk</span>
                                    <i class="fa fa-video-camera"></i>
                                </span>
								<img src="images/3/3.jpg" alt=""/>
							</a>
						</li>
                        <li data-pile="Richar Dior">
							<a href="video.html">
								<span class="tp-info">
                                    <span>Dior - VS - Milk</span>
                                    <i class="fa fa-video-camera"></i>
                                </span>
								<img src="images/3/4.jpg" alt=""/>
							</a>
						</li>

						<li data-pile="Andrea Austoni">
							<a href="video.html">
								<span class="tp-info">
                                    <span>Born in 2012</span>
                                    <i class="fa fa-video-camera"></i>
                                </span>
								<img src="images/4/1.jpg" alt=""/>
							</a>
						</li>
						<li data-pile="Andrea Austoni">
							<a href="video.html">
								<span class="tp-info">
                                    <span>Grady Mikol</span>
                                    <i class="fa fa-video-camera"></i>
                                </span>
								<img src="images/4/2.jpg" alt=""/>
							</a>
						</li>
						<li data-pile="Andrea Austoni">
							<a href="video.html">
								<span class="tp-info">
                                    <span>More Cowbell</span>
                                    <i class="fa fa-video-camera"></i>
                                </span>
								<img src="images/4/3.jpg" alt=""/>
							</a>
						</li>

                        <li data-pile="Mirko Borni">
							<a href="video.html">
								<span class="tp-info">
                                    <span>Growth in 2012</span>
                                    <i class="fa fa-video-camera"></i>
                                </span>
								<img src="images/5/1.jpg" alt=""/>
							</a>
						</li>
						<li data-pile="Mirko Borni">
							<a href="video.html">
								<span class="tp-info">
                                    <span>Grady Corbel</span>
                                    <i class="fa fa-video-camera"></i>
                                </span>
								<img src="images/5/2.jpg" alt=""/>
							</a>
						</li>
						<li data-pile="Mirko Borni">
							<a href="video.html">
								<span class="tp-info">
                                    <span>More Cowbell</span>
                                    <i class="fa fa-video-camera"></i>
                                </span>
								<img src="images/5/3.jpg" alt=""/>
							</a>
						</li>

                        <li data-pile="Alessio Corsini">
							<a href="video.html">
								<span class="tp-info">
                                    <span>Holiday Card 2014</span>
                                    <i class="fa fa-video-camera"></i>
                                </span>
								<img src="images/6/1.jpg" alt=""/>
							</a>
						</li>
						<li data-pile="Alessio Corsini">
							<a href="video.html">
								<span class="tp-info">
                                    <span>Grady Corbel</span>
                                    <i class="fa fa-video-camera"></i>
                                </span>
								<img src="images/6/2.jpg" alt=""/>
							</a>
						</li>
						<li data-pile="Alessio Corsini">
							<a href="video.html">
								<span class="tp-info">
                                    <span>More Cowbell</span>
                                    <i class="fa fa-video-camera"></i>
                                </span>
								<img src="images/6/3.jpg" alt=""/>
							</a>
						</li>
					</ul>
				</div>
			</section>
            </div>
            <img class="flession-img" src="images/header-photo1.jpg" alt="" />
          </div>
          
           
            <!--SECTION TOP PRODUCTS-->
       <div class="top-product top-product-news">
         <div class="container">
           <div class="col-xs-12 col-md-12">
             <h3>Top <span>Product</span><span class="point-little">.</span></h3>
             <ul id="product" class="bxslider">
              <li>
                <div class="jm-item second">
					<div class="jm-item-wrapper">
						<div class="jm-item-image">
                            <img src="img/prod/prod1.jpg" alt="" />
                            <div class="jm-item-description">
                                    <div class="jm-item-button">
                                        <a href="details_prod.html"><i class="fa fa-chain-broken"></i></a>
                                    </div>
                                </div>
                        </div>
                    </div>
                 </div>
                 <div class="product-title"><a href="details_prod.html" >ENVY <span>100L</span></a></div>
                 <div class="tshirt-buy"><a href="#" class="tshirt-cart"><i class="fa fa-shopping-cart"></i>Add</a><p class="prod-ts-price">$256.00</p></div>
               </li>
              <li>
                  <div class="jm-item second">
					<div class="jm-item-wrapper">
						<div class="jm-item-image">
                            <img src="img/prod/prod2.jpg" alt="" />
                            <div class="jm-item-description">
                                    <div class="jm-item-button">
                                        <a href="details_prod.html"><i class="fa fa-chain-broken"></i></a>
                                    </div>
                                </div>
                        </div>
                    </div>
                 </div>
                  <div class="product-title"><a href="details_prod.html" >BIRTOL <span>PRO</span></a></div>
                 <div class="tshirt-buy"><a href="#" class="tshirt-cart"><i class="fa fa-shopping-cart"></i>Add</a><p class="prod-ts-price">$168.00</p></div>
              </li>
              <li>
                  <div class="jm-item second">
					<div class="jm-item-wrapper">
						<div class="jm-item-image">
                            <img src="img/prod/prod3.jpg" alt="" />
                            <div class="jm-item-description">
                                    <div class="jm-item-button">
                                        <a href="details_prod.html"><i class="fa fa-chain-broken"></i></a>
                                    </div>
                                </div>
                        </div>
                    </div>
                 </div>
                  <div class="product-title"><a href="details_prod.html" >JUICE <span>100L</span></a></div>
                 <div class="tshirt-buy"><a href="#" class="tshirt-cart"><i class="fa fa-shopping-cart"></i>Add</a><p class="prod-ts-price">$256.00</p></div>
              </li>
              <li>
                 <div class="jm-item second">
					<div class="jm-item-wrapper">
						<div class="jm-item-image">
                            <img src="img/prod/prod4.jpg" alt="" />
                            <div class="jm-item-description">
                                    <div class="jm-item-button">
                                        <a href="details_prod.html"><i class="fa fa-chain-broken"></i></a>
                                    </div>
                                </div>
                        </div>
                    </div>
                 </div>
                 <div class="product-title"><a href="details_prod.html" >MORBEL</a></div>
                 <div class="tshirt-buy"><a href="#" class="tshirt-cart"><i class="fa fa-shopping-cart"></i>Add</a><p class="prod-ts-price">$126.00</p></div>
              </li>
              <li>
                 <div class="jm-item second">
					<div class="jm-item-wrapper">
						<div class="jm-item-image">
                            <img src="img/prod/prod5.jpg" alt="" />
                            <div class="jm-item-description">
                                    <div class="jm-item-button">
                                        <a href="details_prod.html"><i class="fa fa-chain-broken"></i></a>
                                    </div>
                                </div>
                        </div>
                    </div>
                 </div>
                 <div class="product-title"><a href="details_prod.html" >BRT <span>100L</span></a></div>
                 <div class="tshirt-buy"><a href="#" class="tshirt-cart"><i class="fa fa-shopping-cart"></i>Add</a><p class="prod-ts-price">$86.00</p></div>
              </li>
              <li>
                 <div class="jm-item second">
					<div class="jm-item-wrapper">
						<div class="jm-item-image">
                            <img src="img/prod/prod6.jpg" alt="" />
                            <div class="jm-item-description">
                                    <div class="jm-item-button">
                                        <a href="details_prod.html"><i class="fa fa-chain-broken"></i></a>
                                    </div>
                                </div>
                        </div>
                    </div>
                 </div>
                    <div class="product-title"><a href="details_prod.html" >ICE <span>500R</span></a></div>
                 <div class="tshirt-buy"><a href="#" class="tshirt-cart"><i class="fa fa-shopping-cart"></i>Add</a><p class="prod-ts-price">$312.00</p></div>
              </li>
              <li>
                 <div class="jm-item second">
					<div class="jm-item-wrapper">
						<div class="jm-item-image">
                            <img src="img/prod/prod2.jpg" alt="" />
                            <div class="jm-item-description">
                                    <div class="jm-item-button">
                                        <a href="details_prod.html"><i class="fa fa-chain-broken"></i></a>
                                    </div>
                                </div>
                        </div>
                    </div>
                 </div>
                 <div class="product-title"><a href="details_prod.html" >JUICE <span>100L</span></a></div>
                 <div class="tshirt-buy"><a href="#" class="tshirt-cart"><i class="fa fa-shopping-cart"></i>Add</a><p class="prod-ts-price">$256.00</p></div>
              </li>
              <li>
                 <div class="jm-item second">
					<div class="jm-item-wrapper">
						<div class="jm-item-image">
                            <img src="img/prod/prod4.jpg" alt="" />
                            <div class="jm-item-description">
                                    <div class="jm-item-button">
                                        <a href="details_prod.html"><i class="fa fa-chain-broken"></i></a>
                                    </div>
                                </div>
                        </div>
                    </div>
                 </div>
                 <div class="product-title"><a href="details_prod.html" >JUICE <span>100L</span></a></div>
                 <div class="tshirt-buy"><a href="#" class="tshirt-cart"><i class="fa fa-shopping-cart"></i>Add</a><p class="prod-ts-price">$256.00</p></div>
              </li>
            </ul>
           </div>
        </div>
       </div>
            <!--SECTION SPONSOR-->
        <div class="container">
           <div class="client-sport client-sport-nomargin home-pg">
               <div class="content-banner">
                     <ul class="sponsor second">
                      <li><img src="images/sponsor/2/02.png" alt="" /></li>
                      <li><img src="images/sponsor/2/03.png" alt="" /></li>
                      <li><img src="images/sponsor/2/04.png" alt="" /></li>
                      <li><img src="images/sponsor/2/06.png" alt="" /></li>
                      <li><img src="images/sponsor/2/08.png" alt="" /></li>
                      <li><img src="images/sponsor/2/13.png" alt="" /></li>
                    </ul>
                </div>
          </div>
         </div>
       </div>
    </section>
        
   <!--SECTION FOOTER--> 
    <section id="footer-tag">
        <div class="container">
           <div class="col-md-12">
              <div class="col-md-4">
                 <h3>About Us</h3>
                 <p>Thank you for visiting tennisclub.com. Our mission is to 
                 provide unrivalled and unbiased informative and resources to help any sports fan who enjoys a flutter make informed and value led decisions.</p>
                 <p>Our mission is to 
                 provide unrivalled and unbiased informative, resources to help any sports fan who enjoys a flutter make.</p>
              </div>
              <div class="col-md-4 cat-footer">
                <div class="footer-map"></div>
                <h3 class='last-cat'>Last Categories</h3>
                <ul class="last-tips">
                  <li><a href="tournaments.html">Tournaments</a></li>
                  <li><a href="results.html">All Results</a></li>
                  <li><a href="matches.html">Matches London ATP</a></li>
                  <li><a href="matches.html">Double ATP</a></li>
                  <li><a href="matches.html">Double WTP</a></li>
                  <li><a href="shops.html">Shop Best Price</a></li>
                </ul>
              </div>
              <div class="col-md-4 footer-newsletters">
                <h3>Newsletters</h3>
                <form method="post">     
                            <div class="name">
                                <label for="name">* Name:</label><div class="clear"></div>
                                <input id="name" name="name" type="text" placeholder="e.g. Mr. John Doe" required=""/>
                            </div>
                            <div class="email">
                                <label for="email">* Email:</label><div class="clear"></div>
                                <input id="email" name="email" type="text" placeholder="example@domain.com" required=""/>
                            </div>
                            <div id="loader">
                                        <input type="submit" value="Submit"/>
                                    </div>
                </form>
              </div>
              <div class="col-xs-12">
                <ul class="social">
                      <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                      <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                      <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                      <li><a href="#"><i class="fa fa-digg"></i></a></li>
                      <li><a href="#"><i class="fa fa-rss"></i></a></li>
                      <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                      <li><a href="#"><i class="fa fa-tumblr"></i></a></li>

                    </ul>
              </div>
             </div>
           </div>
    </section>
    <footer>
      <div class="col-md-12 content-footer">
		<p>© 2014 - 2015 tennisclub.com. All rights reserved. </p>
      </div>
	</footer>
</section><!--Close Top Container-->
<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="js/jquery.transit.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $('#textslide p.creative').transition({ scale: 1, opacity: 1, delay: 1000, duration: 2000 });
    $('#textslide p.linetheme-left').transition({ x: '0px', opacity: 1, delay: 2000, duration: 1500 });
    $('#textslide p.linetheme-right').transition({ x: '0px', opacity: 1, delay: 2000, duration: 1500 });
    $('#textslide .titl-theme').transition({ opacity: 1, delay: 2500, duration: 2000 });
    $('.slide-txt img').transition({ opacity: 1, delay: 1000, duration: 2000 });

</script>
<!--MENU-->
<script src="js/menu/modernizr.custom.js" type="text/javascript"></script>
<script src="js/menu/cbpHorizontalMenu.js" type="text/javascript"></script>
<!--END MENU-->
<!--PERCENTAGE-->
<script>
    $(function () {
        "use strict";
        $('.skillbar').each(function () {
            $(this).find('.skillbar-bar').width(0);
        });

        $('.skillbar').each(function () {
            $(this).find('.skillbar-bar').animate({
                width: $(this).attr('data-percent')
            }, 2000);
        });
    });
</script>
<script>
    jQuery(document).ready(function () {
        jQuery('.tabs .tab-links a').on('click', function (e) {
            var currentAttrValue = jQuery(this).attr('href');

            // Show/Hide Tabs
            jQuery('.tabs ' + currentAttrValue).slideDown(400).siblings().slideUp(400);

            // Change/remove current tab to active
            jQuery(this).parent('li').addClass('active').siblings().removeClass('active');

            e.preventDefault();
        });
    });
</script>

<!-- Percentace circolar -->
    <script src="js/circle/jquery-asPieProgress.js" type="text/javascript"></script>
    <script src="js/circle/rainbow.min.js" type="text/javascript"></script>

<!--Gallery-->

<script src="js/gallery/jquery.prettyPhoto.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $(".portfolio a").hover(function () {
            $(this).children("img").animate({ opacity: 0.75 }, "fast");
        }, function () {
            $(this).children("img").animate({ opacity: 1.0 }, "slow");
        });

        $("a[rel^='prettyPhoto']").prettyPhoto({
            animation_speed: 'fast', /* fast/slow/normal */
            slideshow: 5000, /* false OR interval time in ms */
            autoplay_slideshow: false, /* true/false */
            opacity: 0.80, /* Value between 0 and 1 */
            show_title: true, /* true/false */
            allow_resize: true, /* Resize the photos bigger than viewport. true/false */
            default_width: 500,
            default_height: 344,
            counter_separator_label: '/', /* The separator for the gallery counter 1 "of" 2 */
            theme: 'pp_default', /* light_rounded / dark_rounded / light_square / dark_square / facebook */
            horizontal_padding: 20, /* The padding on each side of the picture */
            hideflash: false, /* Hides all the flash object on a page, set to TRUE if flash appears over prettyPhoto */
            wmode: 'opaque' /* Set the flash wmode attribute */
        });
    });

</script>

<script src="js/gallery/isotope.js" type="text/javascript"></script>
<script type="text/javascript">

    $(window).load(function () {
        var $container = $('.albumContainer');
        $container.isotope({
            filter: '*',
            animationOptions: {
                duration: 750,
                easing: 'linear',
                queue: false
            }
        });

        $('.albumFilter li').click(function () {
            $('.albumFilter .current').removeClass('current');
            $(this).addClass('current');

            var selector = $(this).attr('data-filter');
            $container.isotope({
                filter: selector,
                animationOptions: {
                    duration: 750,
                    easing: 'linear',
                    queue: false
                }
            });
            return false;
        });
    });

</script>
<!-- Button Anchor Top-->
<script src="js/jquery.ui.totop.js" type="text/javascript"></script>

<script src="js/custom.js" type="text/javascript"></script>
    <script src="js/jquery.bxslider.js" type="text/javascript"></script>
    <script>
        $('#product').bxSlider({
            minSlides: 3,
            maxSlides: 5,
            slideWidth: 215,
            slideMargin: 10
        });


        $('.vertical-news').bxSlider({
            mode: 'vertical',
            slideWidth: 1300, 
            minSlides: 3,
            slideMargin: 10
        });

    </script>


    <!--Carousel News Vertical-->

    <script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
    <script src="js/jquery.mousewheel.js" type="text/javascript"></script>

   <!--Portfolio Video-->
   <script src="js/modernizr.custom.63321.js"></script>
  
   <script type="text/javascript" src="js/jquery.stapel.js"></script>
		<script type="text/javascript">
		    $(function () {

		        var $grid = $('#tp-grid'),
					$name = $('#name'),
					$close = $('#close'),
					$loader = $('<div class="loader"><i></i><i></i><i></i><i></i><i></i><i></i><span>Loading...</span></div>').insertBefore($grid),
					stapel = $grid.stapel({
					    onLoad: function () {
					        $loader.remove();
					    },
					    onBeforeOpen: function (pileName) {
					        $name.html(pileName);
					    },
					    onAfterOpen: function (pileName) {
					        $close.show();
					    }
					});

		        $close.on('click', function () {
		            $close.hide();
		            $name.empty();
		            stapel.closePile();
		        });

		    });
		</script>
  
</body>
</html>

