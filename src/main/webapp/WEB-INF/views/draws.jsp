<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <link href="<%=pathGreenBall%>/resources/css/drawsSingles.css" rel="stylesheet" type="text/css" />
    <link href="<%=pathGreenBall%>/resources/css/drawsdobles.css" rel="stylesheet" type="text/css" />
    <!--  script src="<%=pathGreenBall%>/resources/js/jquery-1.10.2.js" type="text/javascript"></script>-->
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="<%=pathGreenBall%>/resources/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	<script src="<%=pathGreenBall%>/resources/js/jquery.transit.min.js" type="text/javascript"></script>
	
	<script src="<%=pathGreenBall%>/resources/js/tether.min.js" type="text/javascript"></script>
	
	
	
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


<link href="<%=pathGreenBall%>/resources/css/vendor.css" rel="stylesheet" type="text/css" />
<link href="<%=pathGreenBall%>/resources/css/application.css" rel="stylesheet" type="text/css" />
<script src="<%=pathGreenBall%>/resources/js/application.js" type="text/javascript"></script>

<script src="<%=pathGreenBall%>/resources/js/bootstrap.js" type="text/javascript"></script>

<link href="<%=pathGreenBall%>/resources/css/bootstrap-datepicker.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=pathGreenBall%>/resources/js/bootstrap-datepicker.js"></script>

<link href="<%=pathGreenBall%>/resources/css/bootstrap-timepicker.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=pathGreenBall%>/resources/js/bootstrap-timepicker.js"></script>

 
 




<style>
	.separator {width:1px; background-color:transparent;}
	.input-group {display:table-cell;}
	.input-group .form-control{width:100px;}
	.input-group bootstrap-timepicker timepicker{width:10px;}
	.tab-links-match{margin-bottom: 0px;}
	.btn-primary {background-color:#212121; border-color:#333333}
	.btn-primary.active, .btn-primary:active, .open>.dropdown-toggle.btn-primary {background-color:#f59123; border-color:#e78315}
	.btn-primary:hover, .btn-primary.active:hover {
    color: #fff;
    background-color: #fcb86e;
}
	li {line-height:3px;}
	ol.vertical li{margin: 1px;}
	ol li.highlight{ height: 14px;}
	
	.tab-content {overflow: visible;}
	
	
	.dropTarget{
		width:100px;
		height: 10px;
		float: left;
		display:block;
		padding: 5px;
    	border: 1px solid #cccccc;
    	color: #0088cc;
    	background: #eeeeee;
    	margin: 0 0 9px 0;
  		min-height: 10px; 
		-webkit-user-drop:element;
	}
	
	.modal.fade.in{
		bottom: 25%;
	}
	
	.modal{width: auto; background-color: transparent; left:20%;}
	.modal.fade.in{width: auto; background-color: transparent; left:20%;}
	
	.player-vs .tab-content.single-match {background: transparent;}
	.player-vs .tab-content .tab-content {background: transparent;}
	.player-vs .tab-links-match {background: transparent;}
</style>	
	
<script type="text/javascript">

var mapDates = new Object();
var mapTimes = new Object();
var mapFields = new Object();

function categorySelectedMethod(form){
	if (form== "draws"){
		var selectedCat = $("#mensSinglesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='SM' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="S" />');
		$('#draws').attr("action","draws");
	    $("#draws").submit(); 
		
	}
	else if (form== "NVM"){
		var selectedCat = $("#nvmensSinglesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='SMN' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="S" />');
		$('#draws').attr("action","draws");
	    $("#draws").submit(); 
		
	}
	else if (form== "NVW"){
		var selectedCat = $("#nvwomansSinglesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='SWN' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="S" />');
		$('#draws').attr("action","draws");
	    $("#draws").submit(); 
		
	}
	else if (form== "SW"){
		var selectedCat = $("#womansSinglesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='SW' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="S" />');
		$('#draws').attr("action","draws");
	    $("#draws").submit(); 
		
	}
	else if (form== "DM"){
		var selectedCat = $("#mensDoublesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='DM' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="D" />');
		$('#draws').attr("action","draws");
	    $("#draws").submit(); 
		
	}
	else if (form== "DW"){
		var selectedCat = $("#womansDoublesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='DW' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="D" />');
		$('#draws').attr("action","draws");
	    $("#draws").submit(); 
		
	}
	else if (form== "DMN"){
		var selectedCat = $("#nvmensDoublesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='DMN' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="D" />');
		$('#draws').attr("action","draws");
	    $("#draws").submit(); 
		
	}
	else if (form== "DWN"){
		var selectedCat = $("#nvwomansDoublesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='DWN' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="D" />');
		$('#draws').attr("action","draws");
	    $("#draws").submit(); 
		
	}
	else if (form== "MA"){
		var selectedCat = $("#maCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='MA' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="M" />');
		$('#draws').attr("action","draws");
	    $("#draws").submit(); 
		
	}
	else if (form== "MK"){
		var selectedCat = $("#mkCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='MK' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="M" />');
		$('#draws').attr("action","draws");
	    $("#draws").submit(); 
		
	}
}

function autoSelected(form){
	if (form== "draws"){
		var selectedCat = $("#mensSinglesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='SM' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="S" />');
		$('#draws').attr("action","draws");
		$('#draws').append('<input type="hidden" name="isAuto" value="isAuto" />');
	    $("#draws").submit(); 
		
	}
	else if (form== "NVM"){
		var selectedCat = $("#nvmensSinglesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='SMN' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="S" />');
		$('#draws').attr("action","draws");
		$('#draws').append('<input type="hidden" name="isAuto" value="isAuto" />');
	    $("#draws").submit(); 
		
	}
	else if (form== "NVW"){
		var selectedCat = $("#nvwomansSinglesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='SWN' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="S" />');
		$('#draws').attr("action","draws");
		$('#draws').append('<input type="hidden" name="isAuto" value="isAuto" />');
	    $("#draws").submit(); 
	}
	else if (form== "SW"){
		var selectedCat = $("#womansSinglesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='SW' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="S" />');
		$('#draws').attr("action","draws");
		$('#draws').append('<input type="hidden" name="isAuto" value="isAuto" />');
	    $("#draws").submit(); 
	}
	else if (form== "DM"){
		var selectedCat = $("#mensDoublesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='DM' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="D" />');
		$('#draws').attr("action","draws");
		$('#draws').append('<input type="hidden" name="isAuto" value="isAuto" />');
	    $("#draws").submit(); 
	}
	else if (form== "DW"){
		var selectedCat = $("#womansDoublesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='DW' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="D" />');
		$('#draws').attr("action","draws");
		$('#draws').append('<input type="hidden" name="isAuto" value="isAuto" />');
	    $("#draws").submit(); 
	}
	else if (form== "DMN"){
		var selectedCat = $("#nvmensDoublesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='DMN' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="D" />');
		$('#draws').attr("action","draws");
		$('#draws').append('<input type="hidden" name="isAuto" value="isAuto" />');
	    $("#draws").submit(); 
	}
	else if (form== "DWN"){
		var selectedCat = $("#nvwomansDoublesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='DWN' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="D" />');
		$('#draws').attr("action","draws");
		$('#draws').append('<input type="hidden" name="isAuto" value="isAuto" />');
	    $("#draws").submit(); 
	}
	else if (form== "MA"){
		var selectedCat = $("#maCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='MA' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="M" />');
		$('#draws').attr("action","draws");
		$('#draws').append('<input type="hidden" name="isAuto" value="isAuto" />');
	    $("#draws").submit(); 
	}
	else if (form== "MK"){
		var selectedCat = $("#mkCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='MK' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="M" />');
		$('#draws').attr("action","draws");
		$('#draws').append('<input type="hidden" name="isAuto" value="isAuto" />');
	    $("#draws").submit(); 
	}
	
}

function toSubmit(form){
	var keys = [];
	var cadenaRetorno = "";
	var keys2 = [];
	var cadenaRetorno2 = "";
	
	if (form== "draws"){
		 $("#playerSM li").each(function(index){
				keys.push($(this).attr('id'));
				cadenaRetorno = cadenaRetorno + $(this).attr('id') + ","; 
			});
		var selectedCat = $("#mensSinglesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='SM' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="S" />');
		$('#draws').append("<input type='hidden' name='isSave' value='"+cadenaRetorno+"' />");
		var mapTimesEncoded = JSON.stringify(mapTimes);
		var mapDatesEncoded = JSON.stringify(mapDates);
		var mapFieldsEncoded = JSON.stringify(mapFields);
		
		$('#draws').append("<input type='hidden' name='mapTimes' value='"+mapTimesEncoded+"' />");
		$('#draws').append("<input type='hidden' name='mapDates' value='"+mapDatesEncoded+"' />");
		$('#draws').append("<input type='hidden' name='mapFields' value='"+mapFieldsEncoded+"' />");
		
		$('#draws').attr("action","draws");
	 
		var tamanoAvailableFinal = '${mAvailableFinal.size()}';
		
		var sizeNumOfGraphRR = '${numOfGraphRR}';
		var sizeNumOfGraphRR = '${NumOfGraphMD}';
		
		
		if (sizeNumOfGraphRR > 0)
			{
				tamanoAvailableFinal = parseInt(tamanoAvailableFinal);
				sizeNumOfGraphRR = parseInt(sizeNumOfGraphRR);
				var PxGroup = tamanoAvailableFinal/sizeNumOfGraphRR;
				var matchsEsperados = (PxGroup * (PxGroup-1))/2;
				
				alert("matchsEsperados: " + matchsEsperados);
				alert("mapTimes.length:" + Object.keys(mapTimes).length);
				alert("mapDates.length:" + Object.keys(mapDates).length);
				alert("mapFields.length:" + Object.keys(mapFields).length);
				
				if (Object.keys(mapTimes).length == matchsEsperados && Object.keys(mapDates).length == matchsEsperados && Object.keys(mapFields).length == matchsEsperados){
					$("#draws").submit();
				}
				else{
					$('#myModalMissingData').modal({backdrop: true});
				}
			}	
		else if (sizeNumOfGraphMD >0){
			tamanoAvailableFinal = parseInt(tamanoAvailableFinal);
			var matchsEsperados = tamanoAvailableFinal/2;
			
			alert("matchsEsperados: " + matchsEsperados);
			alert("mapTimes.length:" + Object.keys(mapTimes).length);
			alert("mapDates.length:" + Object.keys(mapDates).length);
			alert("mapFields.length:" + Object.keys(mapFields).length);
			if (Object.keys(mapTimes).length == matchsEsperados && Object.keys(mapDates).length == matchsEsperados && Object.keys(mapFields).length == matchsEsperados){
				$("#draws").submit();
			}
			else{
				$('#myModalMissingData').modal({backdrop: true});
			}
		}
	}
	else if (form == "NVM"){
		 $("#playerSMN li").each(function(index){
				keys.push($(this).attr('id'));
				cadenaRetorno = cadenaRetorno + $(this).attr('id') + ","; 
			});
		var selectedCat = $("#nvmensSinglesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='SMN' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="S" />');
		$('#draws').append("<input type='hidden' name='isSave' value='"+cadenaRetorno+"' />");
		var mapTimesEncoded = JSON.stringify(mapTimes);
		var mapDatesEncoded = JSON.stringify(mapDates);
		var mapFieldsEncoded = JSON.stringify(mapFields);
		
		$('#draws').append("<input type='hidden' name='mapTimes' value='"+mapTimesEncoded+"' />");
		$('#draws').append("<input type='hidden' name='mapDates' value='"+mapDatesEncoded+"' />");
		$('#draws').append("<input type='hidden' name='mapFields' value='"+mapFieldsEncoded+"' />");
		
		$('#draws').attr("action","draws");
	 
		var tamanoAvailableFinal = '${mnvAvailableFinal.size()}';
		
		var sizeNumOfGraphRR = '${numOfGraphRRSMN}';
		var sizeNumOfGraphMD = '${numOfGraphMDSMN}';
		
		if (sizeNumOfGraphRR > 0)
			{
				tamanoAvailableFinal = parseInt(tamanoAvailableFinal);
				sizeNumOfGraphRR = parseInt(sizeNumOfGraphRR);
				var PxGroup = tamanoAvailableFinal/sizeNumOfGraphRR;
				var matchsEsperados = (PxGroup * (PxGroup-1))/2;
				
				alert("matchsEsperados: " + matchsEsperados);
				alert("mapTimes.length:" + Object.keys(mapTimes).length);
				alert("mapDates.length:" + Object.keys(mapDates).length);
				alert("mapFields.length:" + Object.keys(mapFields).length);
				
				if (Object.keys(mapTimes).length == matchsEsperados && Object.keys(mapDates).length == matchsEsperados && Object.keys(mapFields).length == matchsEsperados){
					$("#draws").submit();
				}
				else{
					$('#myModalMissingDataSMN').modal({backdrop: true});
				}
			}	
		else if (sizeNumOfGraphMD >0){
			tamanoAvailableFinal = parseInt(tamanoAvailableFinal);
			var matchsEsperados = tamanoAvailableFinal/2;
			
			alert("matchsEsperados: " + matchsEsperados);
			alert("mapTimes.length:" + Object.keys(mapTimes).length);
			alert("mapDates.length:" + Object.keys(mapDates).length);
			alert("mapFields.length:" + Object.keys(mapFields).length);
			if (Object.keys(mapTimes).length == matchsEsperados && Object.keys(mapDates).length == matchsEsperados && Object.keys(mapFields).length == matchsEsperados){
				$("#draws").submit();
			}
			else{
				$('#myModalMissingDataSMN').modal({backdrop: true});
			}
		}
	}
	else if (form == "NVW"){
		 $("#playerSWN li").each(function(index){
				keys.push($(this).attr('id'));
				cadenaRetorno = cadenaRetorno + $(this).attr('id') + ","; 
			});
		var selectedCat = $("#nvwomansSinglesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='SWN' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="S" />');
		$('#draws').append("<input type='hidden' name='isSave' value='"+cadenaRetorno+"' />");
		var mapTimesEncoded = JSON.stringify(mapTimes);
		var mapDatesEncoded = JSON.stringify(mapDates);
		var mapFieldsEncoded = JSON.stringify(mapFields);
		
		$('#draws').append("<input type='hidden' name='mapTimes' value='"+mapTimesEncoded+"' />");
		$('#draws').append("<input type='hidden' name='mapDates' value='"+mapDatesEncoded+"' />");
		$('#draws').append("<input type='hidden' name='mapFields' value='"+mapFieldsEncoded+"' />");
		
		$('#draws').attr("action","draws");
	 
		var tamanoAvailableFinal = '${wnvAvailableFinal.size()}';
		
		var sizeNumOfGraphRR = '${numOfGraphRRSWN}';
		var sizeNumOfGraphMD = '${numOfGraphMDSWN}';
		
		if (sizeNumOfGraphRR > 0)
			{
				tamanoAvailableFinal = parseInt(tamanoAvailableFinal);
				sizeNumOfGraphRR = parseInt(sizeNumOfGraphRR);
				var PxGroup = tamanoAvailableFinal/sizeNumOfGraphRR;
				var matchsEsperados = (PxGroup * (PxGroup-1))/2;
				
				alert("matchsEsperados: " + matchsEsperados);
				alert("mapTimes.length:" + Object.keys(mapTimes).length);
				alert("mapDates.length:" + Object.keys(mapDates).length);
				alert("mapFields.length:" + Object.keys(mapFields).length);
				
				if (Object.keys(mapTimes).length == matchsEsperados && Object.keys(mapDates).length == matchsEsperados && Object.keys(mapFields).length == matchsEsperados){
					$("#draws").submit();
				}
				else{
					$('#myModalMissingDataSWN').modal({backdrop: true});
				}
			}	
		else if (sizeNumOfGraphMD >0){
			tamanoAvailableFinal = parseInt(tamanoAvailableFinal);
			var matchsEsperados = tamanoAvailableFinal/2;
			
			alert("matchsEsperados: " + matchsEsperados);
			alert("mapTimes.length:" + Object.keys(mapTimes).length);
			alert("mapDates.length:" + Object.keys(mapDates).length);
			alert("mapFields.length:" + Object.keys(mapFields).length);
			if (Object.keys(mapTimes).length == matchsEsperados && Object.keys(mapDates).length == matchsEsperados && Object.keys(mapFields).length == matchsEsperados){
				$("#draws").submit();
			}
			else{
				$('#myModalMissingDataSWN').modal({backdrop: true});
			}
		}
	}
	else if (form == "SW"){
		 $("#playerSW li").each(function(index){
				keys.push($(this).attr('id'));
				cadenaRetorno = cadenaRetorno + $(this).attr('id') + ","; 
			});
		var selectedCat = $("#womansSinglesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='SW' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="S" />');
		$('#draws').append("<input type='hidden' name='isSave' value='"+cadenaRetorno+"' />");
		var mapTimesEncoded = JSON.stringify(mapTimes);
		var mapDatesEncoded = JSON.stringify(mapDates);
		var mapFieldsEncoded = JSON.stringify(mapFields);
		
		$('#draws').append("<input type='hidden' name='mapTimes' value='"+mapTimesEncoded+"' />");
		$('#draws').append("<input type='hidden' name='mapDates' value='"+mapDatesEncoded+"' />");
		$('#draws').append("<input type='hidden' name='mapFields' value='"+mapFieldsEncoded+"' />");
		
		$('#draws').attr("action","draws");
	 
		var tamanoAvailableFinal = '${wAvailableFinal.size()}';
		
		var sizeNumOfGraphRR = '${numOfGraphRRSW}';
		var sizeNumOfGraphMD = '${numOfGraphMDSW}';
		
		if (sizeNumOfGraphRR > 0)
			{
				tamanoAvailableFinal = parseInt(tamanoAvailableFinal);
				sizeNumOfGraphRR = parseInt(sizeNumOfGraphRR);
				var PxGroup = tamanoAvailableFinal/sizeNumOfGraphRR;
				var matchsEsperados = (PxGroup * (PxGroup-1))/2;
				
				alert("matchsEsperados: " + matchsEsperados);
				alert("mapTimes.length:" + Object.keys(mapTimes).length);
				alert("mapDates.length:" + Object.keys(mapDates).length);
				alert("mapFields.length:" + Object.keys(mapFields).length);
				
				if (Object.keys(mapTimes).length == matchsEsperados && Object.keys(mapDates).length == matchsEsperados && Object.keys(mapFields).length == matchsEsperados){
					$("#draws").submit();
				}
				else{
					$('#myModalMissingDataSW').modal({backdrop: true});
				}
			}	
		else if (sizeNumOfGraphMD >0){
			tamanoAvailableFinal = parseInt(tamanoAvailableFinal);
			var matchsEsperados = tamanoAvailableFinal/2;
			
			alert("matchsEsperados: " + matchsEsperados);
			alert("mapTimes.length:" + Object.keys(mapTimes).length);
			alert("mapDates.length:" + Object.keys(mapDates).length);
			alert("mapFields.length:" + Object.keys(mapFields).length);
			if (Object.keys(mapTimes).length == matchsEsperados && Object.keys(mapDates).length == matchsEsperados && Object.keys(mapFields).length == matchsEsperados){
				$("#draws").submit();
			}
			else{
				$('#myModalMissingDataSW').modal({backdrop: true});
			}
		}
	}
	else if (form == "DM"){
		alert("Hey");
		 $("#playerDM li").each(function(index){
				keys.push($(this).attr('id'));
				cadenaRetorno = cadenaRetorno + $(this).attr('id') + ","; 
			});
		 $("#playerDM2 li").each(function(index){
				keys2.push($(this).attr('id'));
				cadenaRetorno2 = cadenaRetorno2 + $(this).attr('id') + ","; 
			});
		var selectedCat = $("#mensDoublesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='DM' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="D" />');
		$('#draws').append("<input type='hidden' name='isSave' value='"+cadenaRetorno+"' />");
		$('#draws').append("<input type='hidden' name='isSave2' value='"+cadenaRetorno2+"' />");
		var mapTimesEncoded = JSON.stringify(mapTimes);
		var mapDatesEncoded = JSON.stringify(mapDates);
		var mapFieldsEncoded = JSON.stringify(mapFields);
		
		$('#draws').append("<input type='hidden' name='mapTimes' value='"+mapTimesEncoded+"' />");
		$('#draws').append("<input type='hidden' name='mapDates' value='"+mapDatesEncoded+"' />");
		$('#draws').append("<input type='hidden' name='mapFields' value='"+mapFieldsEncoded+"' />");
		
		$('#draws').attr("action","draws");
	 
		var tamanoAvailableFinal = '${mdAvailableFinal.size()}';
		
		var sizeNumOfGraphRR = '${numOfGraphRRDM}';
		var sizeNumOfGraphMD = '${numOfGraphMDDM}';
		
		if (sizeNumOfGraphRR > 0)
			{
				tamanoAvailableFinal = parseInt(tamanoAvailableFinal);
				sizeNumOfGraphRR = parseInt(sizeNumOfGraphRR);
				var PxGroup = (tamanoAvailableFinal/2)/sizeNumOfGraphRR;
				var matchsEsperados = ((PxGroup * (PxGroup-1)))/2;
				
				alert("matchsEsperados: " + matchsEsperados);
				alert("mapTimes.length:" + Object.keys(mapTimes).length);
				alert("mapDates.length:" + Object.keys(mapDates).length);
				alert("mapFields.length:" + Object.keys(mapFields).length);
				
				if (Object.keys(mapTimes).length == matchsEsperados && Object.keys(mapDates).length == matchsEsperados && Object.keys(mapFields).length == matchsEsperados){
					$("#draws").submit();
				}
				else{				
					$('#myModalMissingDataDM').modal({backdrop: true});
				}
			}	
		else if (sizeNumOfGraphMD >0){
			tamanoAvailableFinal = parseInt(tamanoAvailableFinal);
			var matchsEsperados = tamanoAvailableFinal/4;
			
			alert("matchsEsperados: " + matchsEsperados);
			alert("mapTimes.length:" + Object.keys(mapTimes).length);
			alert("mapDates.length:" + Object.keys(mapDates).length);
			alert("mapFields.length:" + Object.keys(mapFields).length);
			if (Object.keys(mapTimes).length == matchsEsperados && Object.keys(mapDates).length == matchsEsperados && Object.keys(mapFields).length == matchsEsperados){
				$("#draws").submit();
			}
			else{
				$('#myModalMissingDataDM').modal({backdrop: true});
			}
		}
	}
	else if (form == "DW"){
		 $("#playerDW li").each(function(index){
				keys.push($(this).attr('id'));
				cadenaRetorno = cadenaRetorno + $(this).attr('id') + ","; 
			});
		 $("#playerDW2 li").each(function(index){
				keys2.push($(this).attr('id'));
				cadenaRetorno2 = cadenaRetorno2 + $(this).attr('id') + ","; 
			});
		var selectedCat = $("#womansDoublesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='DW' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="D" />');
		$('#draws').append("<input type='hidden' name='isSave' value='"+cadenaRetorno+"' />");
		$('#draws').append("<input type='hidden' name='isSave2' value='"+cadenaRetorno2+"' />");
		var mapTimesEncoded = JSON.stringify(mapTimes);
		var mapDatesEncoded = JSON.stringify(mapDates);
		var mapFieldsEncoded = JSON.stringify(mapFields);
		
		$('#draws').append("<input type='hidden' name='mapTimes' value='"+mapTimesEncoded+"' />");
		$('#draws').append("<input type='hidden' name='mapDates' value='"+mapDatesEncoded+"' />");
		$('#draws').append("<input type='hidden' name='mapFields' value='"+mapFieldsEncoded+"' />");
		
		$('#draws').attr("action","draws");
	 
		var tamanoAvailableFinal = '${wdAvailableFinal.size()}';
		
		var sizeNumOfGraphRR = '${numOfGraphRRDW}';
		var sizeNumOfGraphMD = '${numOfGraphMDDW}';
		
		if (sizeNumOfGraphRR > 0)
			{
				tamanoAvailableFinal = parseInt(tamanoAvailableFinal);
				sizeNumOfGraphRR = parseInt(sizeNumOfGraphRR);
				var PxGroup = (tamanoAvailableFinal/2)/sizeNumOfGraphRR;
				var matchsEsperados = ((PxGroup * (PxGroup-1)))/2;
				
				alert("matchsEsperados: " + matchsEsperados);
				alert("mapTimes.length:" + Object.keys(mapTimes).length);
				alert("mapDates.length:" + Object.keys(mapDates).length);
				alert("mapFields.length:" + Object.keys(mapFields).length);
				
				if (Object.keys(mapTimes).length == matchsEsperados && Object.keys(mapDates).length == matchsEsperados && Object.keys(mapFields).length == matchsEsperados){
					$("#draws").submit();
				}
				else{				
					$('#myModalMissingDataDW').modal({backdrop: true});
				}
			}	
		else if (sizeNumOfGraphMD >0){
			tamanoAvailableFinal = parseInt(tamanoAvailableFinal);
			var matchsEsperados = tamanoAvailableFinal/4;
			
			alert("matchsEsperados: " + matchsEsperados);
			alert("mapTimes.length:" + Object.keys(mapTimes).length);
			alert("mapDates.length:" + Object.keys(mapDates).length);
			alert("mapFields.length:" + Object.keys(mapFields).length);
			if (Object.keys(mapTimes).length == matchsEsperados && Object.keys(mapDates).length == matchsEsperados && Object.keys(mapFields).length == matchsEsperados){
				$("#draws").submit();
			}
			else{
				$('#myModalMissingDataDW').modal({backdrop: true});
			}
		}
	}
	else if (form == "DMN"){
		
		 $("#playerDMN li").each(function(index){
				keys.push($(this).attr('id'));
				cadenaRetorno = cadenaRetorno + $(this).attr('id') + ","; 
			});
		 $("#playerDMN2 li").each(function(index){
				keys2.push($(this).attr('id'));
				cadenaRetorno2 = cadenaRetorno2 + $(this).attr('id') + ","; 
			});
		var selectedCat = $("#nvmensDoublesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='DMN' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="D" />');
		$('#draws').append("<input type='hidden' name='isSave' value='"+cadenaRetorno+"' />");
		$('#draws').append("<input type='hidden' name='isSave2' value='"+cadenaRetorno2+"' />");
		var mapTimesEncoded = JSON.stringify(mapTimes);
		var mapDatesEncoded = JSON.stringify(mapDates);
		var mapFieldsEncoded = JSON.stringify(mapFields);
		
		$('#draws').append("<input type='hidden' name='mapTimes' value='"+mapTimesEncoded+"' />");
		$('#draws').append("<input type='hidden' name='mapDates' value='"+mapDatesEncoded+"' />");
		$('#draws').append("<input type='hidden' name='mapFields' value='"+mapFieldsEncoded+"' />");
		
		$('#draws').attr("action","draws");
	 
		var tamanoAvailableFinal = '${nvmdAvailableFinal.size()}';
		
		var sizeNumOfGraphRR = '${numOfGraphRRDMN}';
		var sizeNumOfGraphMD = '${numOfGraphMDDMN}';
		
		if (sizeNumOfGraphRR > 0)
			{
				tamanoAvailableFinal = parseInt(tamanoAvailableFinal);
				sizeNumOfGraphRR = parseInt(sizeNumOfGraphRR);
				var PxGroup = (tamanoAvailableFinal/2)/sizeNumOfGraphRR;
				var matchsEsperados = ((PxGroup * (PxGroup-1)))/2;
				
				alert("matchsEsperados: " + matchsEsperados);
				alert("mapTimes.length:" + Object.keys(mapTimes).length);
				alert("mapDates.length:" + Object.keys(mapDates).length);
				alert("mapFields.length:" + Object.keys(mapFields).length);
				
				if (Object.keys(mapTimes).length == matchsEsperados && Object.keys(mapDates).length == matchsEsperados && Object.keys(mapFields).length == matchsEsperados){
					$("#draws").submit();
				}
				else{				
					$('#myModalMissingDataDMN').modal({backdrop: true});
				}
			}	
		else if (sizeNumOfGraphMD >0){
			tamanoAvailableFinal = parseInt(tamanoAvailableFinal);
			var matchsEsperados = tamanoAvailableFinal/4;
			
			alert("matchsEsperados: " + matchsEsperados);
			alert("mapTimes.length:" + Object.keys(mapTimes).length);
			alert("mapDates.length:" + Object.keys(mapDates).length);
			alert("mapFields.length:" + Object.keys(mapFields).length);
			if (Object.keys(mapTimes).length == matchsEsperados && Object.keys(mapDates).length == matchsEsperados && Object.keys(mapFields).length == matchsEsperados){
				$("#draws").submit();
			}
			else{
				$('#myModalMissingDataDMN').modal({backdrop: true});
			}
		}
	}
	else if (form == "DWN"){
		 $("#playerDWN li").each(function(index){
				keys.push($(this).attr('id'));
				cadenaRetorno = cadenaRetorno + $(this).attr('id') + ","; 
			});
		 $("#playerDWN2 li").each(function(index){
				keys2.push($(this).attr('id'));
				cadenaRetorno2 = cadenaRetorno2 + $(this).attr('id') + ","; 
			});
		var selectedCat = $("#nvwomansDoublesCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='DWN' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="D" />');
		$('#draws').append("<input type='hidden' name='isSave' value='"+cadenaRetorno+"' />");
		$('#draws').append("<input type='hidden' name='isSave2' value='"+cadenaRetorno2+"' />");
		var mapTimesEncoded = JSON.stringify(mapTimes);
		var mapDatesEncoded = JSON.stringify(mapDates);
		var mapFieldsEncoded = JSON.stringify(mapFields);
		
		$('#draws').append("<input type='hidden' name='mapTimes' value='"+mapTimesEncoded+"' />");
		$('#draws').append("<input type='hidden' name='mapDates' value='"+mapDatesEncoded+"' />");
		$('#draws').append("<input type='hidden' name='mapFields' value='"+mapFieldsEncoded+"' />");
		
		$('#draws').attr("action","draws");
	 
		var tamanoAvailableFinal = '${nvwdAvailableFinal.size()}';
		
		var sizeNumOfGraphRR = '${numOfGraphRRDWN}';
		var sizeNumOfGraphMD = '${numOfGraphMDDWN}';
		
		if (sizeNumOfGraphRR > 0)
			{
				tamanoAvailableFinal = parseInt(tamanoAvailableFinal);
				sizeNumOfGraphRR = parseInt(sizeNumOfGraphRR);
				var PxGroup = (tamanoAvailableFinal/2)/sizeNumOfGraphRR;
				var matchsEsperados = ((PxGroup * (PxGroup-1)))/2;
				
				alert("matchsEsperados: " + matchsEsperados);
				alert("mapTimes.length:" + Object.keys(mapTimes).length);
				alert("mapDates.length:" + Object.keys(mapDates).length);
				alert("mapFields.length:" + Object.keys(mapFields).length);
				
				if (Object.keys(mapTimes).length == matchsEsperados && Object.keys(mapDates).length == matchsEsperados && Object.keys(mapFields).length == matchsEsperados){
					$("#draws").submit();
				}
				else{				
					$('#myModalMissingDataDWN').modal({backdrop: true});
				}
			}	
		else if (sizeNumOfGraphMD >0){
			tamanoAvailableFinal = parseInt(tamanoAvailableFinal);
			var matchsEsperados = tamanoAvailableFinal/4;
			
			alert("matchsEsperados: " + matchsEsperados);
			alert("mapTimes.length:" + Object.keys(mapTimes).length);
			alert("mapDates.length:" + Object.keys(mapDates).length);
			alert("mapFields.length:" + Object.keys(mapFields).length);
			if (Object.keys(mapTimes).length == matchsEsperados && Object.keys(mapDates).length == matchsEsperados && Object.keys(mapFields).length == matchsEsperados){
				$("#draws").submit();
			}
			else{
				$('#myModalMissingDataDWN').modal({backdrop: true});
			}
		}
	}
	else if (form == "MA"){
		 $("#playerMA li").each(function(index){
				keys.push($(this).attr('id'));
				cadenaRetorno = cadenaRetorno + $(this).attr('id') + ","; 
			});
		 $("#playerMA2 li").each(function(index){
				keys2.push($(this).attr('id'));
				cadenaRetorno2 = cadenaRetorno2 + $(this).attr('id') + ","; 
			});
		var selectedCat = $("#maCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='MA' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="M" />');
		$('#draws').append("<input type='hidden' name='isSave' value='"+cadenaRetorno+"' />");
		$('#draws').append("<input type='hidden' name='isSave2' value='"+cadenaRetorno2+"' />");
		var mapTimesEncoded = JSON.stringify(mapTimes);
		var mapDatesEncoded = JSON.stringify(mapDates);
		var mapFieldsEncoded = JSON.stringify(mapFields);
		
		$('#draws').append("<input type='hidden' name='mapTimes' value='"+mapTimesEncoded+"' />");
		$('#draws').append("<input type='hidden' name='mapDates' value='"+mapDatesEncoded+"' />");
		$('#draws').append("<input type='hidden' name='mapFields' value='"+mapFieldsEncoded+"' />");
		
		$('#draws').attr("action","draws");
	 
		var tamanoAvailableFinal = '${maAvailableFinal.size()}';
		
		var sizeNumOfGraphRR = '${numOfGraphRRMA}';
		var sizeNumOfGraphMD = '${numOfGraphMDMA}';
		
		if (sizeNumOfGraphRR > 0)
			{
				tamanoAvailableFinal = parseInt(tamanoAvailableFinal);
				sizeNumOfGraphRR = parseInt(sizeNumOfGraphRR);
				var PxGroup = (tamanoAvailableFinal/2)/sizeNumOfGraphRR;
				var matchsEsperados = ((PxGroup * (PxGroup-1)))/2;
				
				alert("matchsEsperados: " + matchsEsperados);
				alert("mapTimes.length:" + Object.keys(mapTimes).length);
				alert("mapDates.length:" + Object.keys(mapDates).length);
				alert("mapFields.length:" + Object.keys(mapFields).length);
				
				if (Object.keys(mapTimes).length == matchsEsperados && Object.keys(mapDates).length == matchsEsperados && Object.keys(mapFields).length == matchsEsperados){
					$("#draws").submit();
				}
				else{				
					$('#myModalMissingDataMA').modal({backdrop: true});
				}
			}	
		else if (sizeNumOfGraphMD >0){
			tamanoAvailableFinal = parseInt(tamanoAvailableFinal);
			var matchsEsperados = tamanoAvailableFinal/4;
			
			alert("matchsEsperados: " + matchsEsperados);
			alert("mapTimes.length:" + Object.keys(mapTimes).length);
			alert("mapDates.length:" + Object.keys(mapDates).length);
			alert("mapFields.length:" + Object.keys(mapFields).length);
			if (Object.keys(mapTimes).length == matchsEsperados && Object.keys(mapDates).length == matchsEsperados && Object.keys(mapFields).length == matchsEsperados){
				$("#draws").submit();
			}
			else{
				$('#myModalMissingDataMA').modal({backdrop: true});
			}
		}
	}
	else if (form == "MK"){
		 $("#playerMK li").each(function(index){
				keys.push($(this).attr('id'));
				cadenaRetorno = cadenaRetorno + $(this).attr('id') + ","; 
			});
		 $("#playerMK2 li").each(function(index){
				keys2.push($(this).attr('id'));
				cadenaRetorno2 = cadenaRetorno2 + $(this).attr('id') + ","; 
			});
		var selectedCat = $("#mkCat option:selected").val();
		$('#draws').append("<input type='hidden' name='category' value='"+selectedCat+"' />");
		$('#draws').append("<input type='hidden' name='currentMode' value='MK' />");
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="M" />');
		$('#draws').append("<input type='hidden' name='isSave' value='"+cadenaRetorno+"' />");
		$('#draws').append("<input type='hidden' name='isSave2' value='"+cadenaRetorno2+"' />");
		var mapTimesEncoded = JSON.stringify(mapTimes);
		var mapDatesEncoded = JSON.stringify(mapDates);
		var mapFieldsEncoded = JSON.stringify(mapFields);
		
		$('#draws').append("<input type='hidden' name='mapTimes' value='"+mapTimesEncoded+"' />");
		$('#draws').append("<input type='hidden' name='mapDates' value='"+mapDatesEncoded+"' />");
		$('#draws').append("<input type='hidden' name='mapFields' value='"+mapFieldsEncoded+"' />");
		
		$('#draws').attr("action","draws");
	 
		var tamanoAvailableFinal = '${mkAvailableFinal.size()}';
		
		var sizeNumOfGraphRR = '${numOfGraphRRMK}';
		var sizeNumOfGraphMD = '${numOfGraphMDMK}';
		
		if (sizeNumOfGraphRR > 0)
			{
				tamanoAvailableFinal = parseInt(tamanoAvailableFinal);
				sizeNumOfGraphRR = parseInt(sizeNumOfGraphRR);
				var PxGroup = (tamanoAvailableFinal/2)/sizeNumOfGraphRR;
				var matchsEsperados = ((PxGroup * (PxGroup-1)))/2;
				
				alert("matchsEsperados: " + matchsEsperados);
				alert("mapTimes.length:" + Object.keys(mapTimes).length);
				alert("mapDates.length:" + Object.keys(mapDates).length);
				alert("mapFields.length:" + Object.keys(mapFields).length);
				
				if (Object.keys(mapTimes).length == matchsEsperados && Object.keys(mapDates).length == matchsEsperados && Object.keys(mapFields).length == matchsEsperados){
					$("#draws").submit();
				}
				else{				
					$('#myModalMissingDataMK').modal({backdrop: true});
				}
			}	
		else if (sizeNumOfGraphMD >0){
			tamanoAvailableFinal = parseInt(tamanoAvailableFinal);
			var matchsEsperados = tamanoAvailableFinal/4;
			
			alert("matchsEsperados: " + matchsEsperados);
			alert("mapTimes.length:" + Object.keys(mapTimes).length);
			alert("mapDates.length:" + Object.keys(mapDates).length);
			alert("mapFields.length:" + Object.keys(mapFields).length);
			if (Object.keys(mapTimes).length == matchsEsperados && Object.keys(mapDates).length == matchsEsperados && Object.keys(mapFields).length == matchsEsperados){
				$("#draws").submit();
			}
			else{
				$('#myModalMissingDataMK').modal({backdrop: true});
			}
		}
	}
}



$(function () {
	$('#timepicker1').timepicker();
	$('#timepicker2').timepicker();
	$('#timepicker4').timepicker();
	$('#timepickerw').timepicker();
	$('#timepicker5').timepicker();
	$('#timepicker6').timepicker();
	$('#timepicker7').timepicker();
	$('#timepicker8').timepicker();
	$('#timepicker9').timepicker();
	$('#timepicker10').timepicker();
	$('#datepicker').datepicker();
	$('#datepicker2').datepicker();
	$('#datepicker4').datepicker();
	$('#datepickerw').datepicker();
	$('#datepicker5').datepicker();
	$('#datepicker6').datepicker();
	$('#datepicker7').datepicker();
	$('#datepicker8').datepicker();
	$('#datepicker9').datepicker();
	$('#datepicker10').datepicker();
	$('#datepicker').on('changeDate', function() {
	    $('#my_hidden_input').val(
	        $('#datepicker').datepicker('getFormattedDate')
	    );
	});
	$('#datepicker2').on('changeDate', function() {
	    $('#my_hidden_input').val(
	        $('#datepicker2').datepicker('getFormattedDate')
	    );
	});
	$('#datepicker4').on('changeDate', function() {
	    $('#my_hidden_input').val(
	        $('#datepicker4').datepicker('getFormattedDate')
	    );
	});
	$('#datepickerw').on('changeDate', function() {
	    $('#my_hidden_input').val(
	        $('#datepickerw').datepicker('getFormattedDate')
	    );
	});
	$('#datepicker5').on('changeDate', function() {
	    $('#my_hidden_input').val(
	        $('#datepicker5').datepicker('getFormattedDate')
	    );
	});
	$('#datepicker6').on('changeDate', function() {
	    $('#my_hidden_input').val(
	        $('#datepicker6').datepicker('getFormattedDate')
	    );
	});
	$('#datepicker7').on('changeDate', function() {
	    $('#my_hidden_input').val(
	        $('#datepicker7').datepicker('getFormattedDate')
	    );
	});
	$('#datepicker8').on('changeDate', function() {
	    $('#my_hidden_input').val(
	        $('#datepicker8').datepicker('getFormattedDate')
	    );
	});
	$('#datepicker9').on('changeDate', function() {
	    $('#my_hidden_input').val(
	        $('#datepicker9').datepicker('getFormattedDate')
	    );
	});
	$('#datepicker10').on('changeDate', function() {
	    $('#my_hidden_input').val(
	        $('#datepicker10').datepicker('getFormattedDate')
	    );
	});
	});


function matchTimeSelected(form){
	
	if (form == "draws"){
		var temp = $('#juegoNumSM').val();
		$('#myModal').modal('hide');
		$('#timeMatch'+temp).val($('#timepicker1').val());
		$('#timeMatch'+temp).html($('#timepicker1').val());
		$('#dayMatch'+temp).val($('#date').val());
		$('#dayMatch'+temp).html($('#date').val());
		$('#fieldMatch'+temp).val($('#field').val());
		$('#fieldMatch'+temp).html($('#field').val());
		
		mapDates[temp] = $('#date').val();
		mapFields[temp] = $('#field').val();
		mapTimes[temp] = $('#timepicker1').val();
		
		$('#field').val("");
		$('#date').val("");
	}
	else if (form == "NVM"){
		var temp = $('#juegoNumSMN').val();
		$('#myModalSMN').modal('hide');
		$('#timeMatch2'+temp).val($('#timepicker2').val());
		$('#timeMatch2'+temp).html($('#timepicker2').val());
		$('#dayMatch2'+temp).val($('#date2').val());
		$('#dayMatch2'+temp).html($('#date2').val());
		$('#fieldMatch2'+temp).val($('#field2').val());
		$('#fieldMatch2'+temp).html($('#field2').val());
		
		mapDates[temp] = $('#date2').val();
		mapFields[temp] = $('#field2').val();
		mapTimes[temp] = $('#timepicker2').val();
		
		$('#field2').val("");
		$('#date2').val("");
	}
	else if (form == "NVW"){
		var temp = $('#juegoNumSWN').val();
		$('#myModalSWN').modal('hide');
		$('#timeMatch4'+temp).val($('#timepicker4').val());
		$('#timeMatch4'+temp).html($('#timepicker4').val());
		$('#dayMatch4'+temp).val($('#date4').val());
		$('#dayMatch4'+temp).html($('#date4').val());
		$('#fieldMatch4'+temp).val($('#field4').val());
		$('#fieldMatch4'+temp).html($('#field4').val());
		
		mapDates[temp] = $('#date4').val();
		mapFields[temp] = $('#field4').val();
		mapTimes[temp] = $('#timepicker4').val();
		
		$('#field4').val("");
		$('#date4').val("");
	}
	else if (form == "SW"){
		var temp = $('#juegoNumSW').val();
		$('#myModalSW').modal('hide');
		$('#timeMatchw'+temp).val($('#timepickerw').val());
		$('#timeMatchw'+temp).html($('#timepickerw').val());
		$('#dayMatchw'+temp).val($('#datew').val());
		$('#dayMatchw'+temp).html($('#datew').val());
		$('#fieldMatchw'+temp).val($('#fieldw').val());
		$('#fieldMatchw'+temp).html($('#fieldw').val());
		
		mapDates[temp] = $('#datew').val();
		mapFields[temp] = $('#fieldw').val();
		mapTimes[temp] = $('#timepickerw').val();
		
		$('#fieldw').val("");
		$('#datew').val("");
	}
	else if (form == "DM"){
		var temp = $('#juegoNumDM').val();
		$('#myModalDM').modal('hide');
		$('#timeMatch5'+temp).val($('#timepicker5').val());
		$('#timeMatch5'+temp).html($('#timepicker5').val());
		$('#dayMatch5'+temp).val($('#date5').val());
		$('#dayMatch5'+temp).html($('#date5').val());
		$('#fieldMatch5'+temp).val($('#field5').val());
		$('#fieldMatch5'+temp).html($('#field5').val());
		
		mapDates[temp] = $('#date5').val();
		mapFields[temp] = $('#field5').val();
		mapTimes[temp] = $('#timepicker5').val();
		
		$('#field5').val("");
		$('#date5').val("");
	}
	else if (form == "DW"){
		var temp = $('#juegoNumDW').val();
		$('#myModalDW').modal('hide');
		$('#timeMatch6'+temp).val($('#timepicker6').val());
		$('#timeMatch6'+temp).html($('#timepicker6').val());
		$('#dayMatch6'+temp).val($('#date6').val());
		$('#dayMatch6'+temp).html($('#date6').val());
		$('#fieldMatch6'+temp).val($('#field6').val());
		$('#fieldMatch6'+temp).html($('#field6').val());
		
		mapDates[temp] = $('#date6').val();
		mapFields[temp] = $('#field6').val();
		mapTimes[temp] = $('#timepicker6').val();
		
		$('#field6').val("");
		$('#date6').val("");
	}
	else if (form == "DMN"){
		var temp = $('#juegoNumDMN').val();
		$('#myModalDMN').modal('hide');
		$('#timeMatch7'+temp).val($('#timepicker7').val());
		$('#timeMatch7'+temp).html($('#timepicker7').val());
		$('#dayMatch7'+temp).val($('#date7').val());
		$('#dayMatch7'+temp).html($('#date7').val());
		$('#fieldMatch7'+temp).val($('#field7').val());
		$('#fieldMatch7'+temp).html($('#field7').val());
		
		mapDates[temp] = $('#date7').val();
		mapFields[temp] = $('#field7').val();
		mapTimes[temp] = $('#timepicker7').val();
		
		$('#field7').val("");
		$('#date7').val("");
	}
	else if (form == "DWN"){
		var temp = $('#juegoNumDWN').val();
		$('#myModalDWN').modal('hide');
		$('#timeMatch8'+temp).val($('#timepicker8').val());
		$('#timeMatch8'+temp).html($('#timepicker8').val());
		$('#dayMatch8'+temp).val($('#date8').val());
		$('#dayMatch8'+temp).html($('#date8').val());
		$('#fieldMatch8'+temp).val($('#field8').val());
		$('#fieldMatch8'+temp).html($('#field8').val());
		
		mapDates[temp] = $('#date8').val();
		mapFields[temp] = $('#field8').val();
		mapTimes[temp] = $('#timepicker8').val();
		
		$('#field8').val("");
		$('#date8').val("");
	}
	else if (form == "MA"){
		var temp = $('#juegoNumMA').val();
		$('#myModalMA').modal('hide');
		$('#timeMatch9'+temp).val($('#timepicker9').val());
		$('#timeMatch9'+temp).html($('#timepicker9').val());
		$('#dayMatch9'+temp).val($('#date9').val());
		$('#dayMatch9'+temp).html($('#date9').val());
		$('#fieldMatch9'+temp).val($('#field9').val());
		$('#fieldMatch9'+temp).html($('#field9').val());
		
		mapDates[temp] = $('#date9').val();
		mapFields[temp] = $('#field9').val();
		mapTimes[temp] = $('#timepicker9').val();
		
		$('#field9').val("");
		$('#date9').val("");
	}
	else if (form == "MK"){
		var temp = $('#juegoNumMK').val();
		$('#myModalMK').modal('hide');
		$('#timeMatch10'+temp).val($('#timepicker10').val());
		$('#timeMatch10'+temp).html($('#timepicker10').val());
		$('#dayMatch10'+temp).val($('#date10').val());
		$('#dayMatch10'+temp).html($('#date10').val());
		$('#fieldMatch10'+temp).val($('#field10').val());
		$('#fieldMatch10'+temp).html($('#field10').val());
		
		mapDates[temp] = $('#date10').val();
		mapFields[temp] = $('#field10').val();
		mapTimes[temp] = $('#timepicker10').val();
		
		$('#field10').val("");
		$('#date10').val("");
	}
		

}

function ff(juego, mode){
	if (mode == 'SM'){
		$('#juegoNumSM').val(juego);
	}
	else if (mode == 'SMN'){
		$('#juegoNumSMN').val(juego);
	}
	else if (mode == 'SWN'){
		$('#juegoNumSWN').val(juego);
	}
	else if (mode == 'SW'){
		$('#juegoNumSW').val(juego);
	}
	else if (mode == 'DM'){
		$('#juegoNumDM').val(juego);
	}
	else if (mode == 'DW'){
		$('#juegoNumDW').val(juego);
	}
	else if (mode == 'DMN'){
		$('#juegoNumDMN').val(juego);
	}
	else if (mode == 'DWN'){
		$('#juegoNumDWN').val(juego);
	}
	else if (mode == 'MA'){
		$('#juegoNumMA').val(juego);
	}
	else if (mode == 'MK'){
		$('#juegoNumMK').val(juego);
	}
}
	
function setMapValues(){
	mapDates = $('#temporal');
}

function tabChanged(id){
	var tabToGo = id; 
	if (tabToGo.startsWith("S")){
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="S" />');

	}
	else if (tabToGo.startsWith("D")){
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="D" />');
	}
	else if (tabToGo.startsWith("M")){
		$('#draws').append('<input type="hidden" name="currentSuperMode" value="M" />');
	}
	
	$('#draws').append("<input type='hidden' name='currentMode' value='"+tabToGo+"' />");
	
	$('#draws').attr("action","draws");
	$("#draws").submit();
	
	
}

function tabSelected(id){
	$('#tab').val(id);
	tabChanged(id);
}

function cancelTabChange(){
	
	if ($('#actualMode').val() == 'SM'){
		$('#tabSM').addClass("active");
		$('#tabSW').removeClass("active");
		$('#tabSMN').removeClass("active");
		$('#tabSWN').removeClass("active");
	}
	else if ($('#actualMode').val() == 'SMN'){
		$('#tabSM').removeClass("active");
		$('#tabSW').removeClass("active");
		$('#tabSMN').addClass("active");
		$('#tabSWN').removeClass("active");
	}
	
	document.location.reload(true);
}



</script>	



</head>
<body>
<%@ include file="head.jsp" %>
<%@ include file="menu.jsp" %>



<c:url var="addAction" value="/${shortName}/addDraws" ></c:url>


<section class="drawer">
     <section id="single-match-pl" class="container secondary-page">
      <div class="general general-results players">
           <div class="top-score-title right-score col-md-16">
           	  <div id ="atp-match"class="top-score-title player-vs">
                <h3><spring:message code="draws" /><span class="point-little">.</span></h3>
                <p style="text-align:center;"><img alt="" src="<%=pathGreenBall%>/resources/images/draws/drawsState4.png" align="middle" ></p>
                <div class="main">
                       <div class="tabs standard single-pl">
                                <ul class="tab-links-match tb-set">
                                     <c:choose>
                                            		<c:when test="${currentSuperMode eq 'S' }">
                                            			<li class="active" onclick="${'#tab1a'}.attr('class', 'tab active')"><a onclick="javascript:tabSelected('SM');" class="first-tabs" href="#tab1"><spring:message code="category.singles" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<li onclick="${'#tab1a'}.attr('class', 'tab active')"><a onclick="javascript:tabSelected('SM');" href="#tab1"><spring:message code="category.singles" /></a></li>
                                            		</c:otherwise>
                                            	</c:choose>
                                            	<c:choose>
                                            		<c:when test="${currentSuperMode eq 'D' }">
                                            			<li class="active" onselect="${'#tab1d'}.attr('class', 'tab active');  " ><a onclick="javascript:tabSelected('DM');" class="first-tabs" href="#tab2"><spring:message code="category.doubles" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<li onselect="${'#tab1d'}.attr('class', 'tab active');  " ><a onclick="javascript:tabSelected('DM');" href="#tab2"><spring:message code="category.doubles" /></a></li>
                                            		</c:otherwise>
                                            	</c:choose>
                                            	<c:choose>
                                            		<c:when test="${currentSuperMode eq 'M' }">
                                            			<li class="active"><a class="first-tabs" onclick="javascript:tabSelected('MA');" href="#tab3"><spring:message code="category.mixes" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<li><a  onclick="javascript:tabSelected('MA');" href="#tab3"><spring:message code="category.mixes" /></a></li>
                                            		</c:otherwise>
                                            	</c:choose>
                                </ul>
                                <div class="tab-content single-match">
                                <c:choose>
								    <c:when test="${currentSuperMode eq 'S' }">
								       <c:set var="isS" value="tab active"></c:set>
								    </c:when>
								    <c:otherwise>
								       <c:set var="isS" value="tab"></c:set>
								    </c:otherwise>
								</c:choose>
                                    <div id="tab1" class="${isS }">
                                       <h3 class="tab-match-title"><spring:message code="category.singles" /></h3>
                                        <div class="tabs standard">
                                            <ul class="tab-links-match">
                                             
                                            		<c:choose>
                                            		<c:when test="${currentMode eq 'SM' }">
                                            			<li class="active" id="tabSM"><a class="first-tabs" data-toggle="modal" onclick="javascript:tabSelected('SM');" href="#"><spring:message code="category.mens" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            		<c:choose>
                                            			<c:when test="${fn:startsWith(currentMode, 'S')}">
                                            				<li id="tabSM"><a data-toggle="modal" onclick="javascript:tabSelected('SM');" href="#"><spring:message code="category.mens" /></a></li>	
                                            			</c:when>
                                            			<c:otherwise>
                                            				<li class="active" id="tabSM"><a class="first-tabs"data-toggle="modal" onclick="javascript:tabSelected('SM');" href="#"><spring:message code="category.mens" /></a></li>
                                            			</c:otherwise>
                                            		</c:choose>
                                            			
                                            		</c:otherwise>
                                            	</c:choose>
                                            	<c:choose>
                                            		<c:when test="${currentMode eq 'SW' }">
                                            			<li class="active" id="tabSW"><a class="first-tabs" data-toggle="modal" onclick="javascript:tabSelected('SW');" href="#"><spring:message code="category.woman" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<li id="tabSW"><a data-toggle="modal" onclick="javascript:tabSelected('SW');" href="#"><spring:message code="category.woman" /></a></li>
                                            		</c:otherwise>
                                            	</c:choose>
                                            	<c:choose>
                                            		<c:when test="${currentMode eq 'SMN' }">
                                            			<li id="tabSMN" class="active"><a class="first-tabs" onclick="javascript:tabSelected('SMN');"  data-toggle="modal" href="#"><spring:message code="category.nv.mens"  /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<li id="tabSMN"><a data-toggle="modal" onclick="javascript:tabSelected('SMN');" href="#" ><spring:message code="category.nv.mens" /></a></li>
                                            		</c:otherwise>
                                            	</c:choose>
                                            	<c:choose>
                                            		<c:when test="${currentMode eq 'SWN' }">
                                            			<li class="active" id="tabSWN"><a class="first-tabs" data-toggle="modal" onclick="javascript:tabSelected('SWN');" href="#"><spring:message code="category.nv.woman" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<li id="tabSWN"><a data-toggle="modal" onclick="javascript:tabSelected('SWN');" href="#"><spring:message code="category.nv.woman" /></a></li>
                                            		</c:otherwise>
                                            	</c:choose>
                                            	
                                            </ul>
                                            <div class="tab-content">
                                            	<c:choose>
                                            		<c:when test="${currentMode eq 'SM' }">
                                            			<c:set var="isSM" value="tab active"></c:set>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<c:choose>
                                            				<c:when test="${fn:startsWith(currentMode, 'S')}">
                                            					<c:set var="isSM" value="tab"></c:set>
                                            				</c:when>
                                            				<c:otherwise>
                                            					<c:set var="isSM" value="tab active"></c:set>
                                            				</c:otherwise>
                                            			</c:choose>
                                            		</c:otherwise>
                                            	</c:choose>
                                            	<div id="tab1a" class="${isSM}">
                                            		<form:form action="${addAction}" commandName="draws" name="draws" id="draws">
                                            		<input type="hidden" name="tab" id ="tab" value="">
                                            		<input type="hidden" value="${shortName}" name="shortName"></input>
                                            		<input type="hidden" name="actualMode" id ="actualMode" value="${currentMode }">
                                            		
                                            		 <!-- Modal -->
															  <div class="modal fade" id="modalTabSwitch" role="dialog"  >
															    <div class="modal-dialog">
															    
															      <!-- Modal content-->
															      <div class="modal-content">
															        <div class="modal-header">
															          <!--  button type="button" class="close" data-dismiss="modal">&times;</button>-->
															          <h4 class="modal-title"><spring:message code="draws.match.data" /></h4>
															        </div>
															        <div class="modal-body">
															          <p><spring:message code="draws.modalTabSwitch"/></p>
															          
																        
															          
															        </div>
															        <div class="modal-footer">
															          <button type="button" class="pl-point-button" data-dismiss="modal" data-backdrop="false" onclick="javascript:tabChanged();"><spring:message code="draws.match.save" /></button>
															          <button type="button" class="pl-point-button" data-dismiss="modal" onclick="javascript:cancelTabChange();"><spring:message code="draws.match.close" /></button>
															        </div>
															      </div>
															      
															    </div>
															  </div>
                                            		
                                            		<input type="hidden" id="juegoNumSM" value="0">
                                            		
                                            			<div class="captura-right-content">
                                            				<div class="form-group">
                                            					<label class="col-sm-2 control-label"><spring:message code="draws.category"/></label>
                                            					<div class="col-sm-4">
																	<select name="mensSinglesCat" id="mensSinglesCat" class="form-control" id="mensSinglesCat" onchange="javascript:categorySelectedMethod('draws');" >
																		<option value="0"><spring:message code="draws.selectCategory"/></option>
																		<c:forEach items="${mensCategoriesS}" var="cat">
																					<c:choose>
																						<c:when test="${mscSelected == cat.id}">
																							<option selected="selected" value="${cat.id}">${cat.name}</option>		
																						</c:when>
																						<c:otherwise>
																							<option  value="${cat.id}">${cat.name}</option>
																						</c:otherwise>
																					</c:choose>
																					
																				
																		</c:forEach>
																	</select>
																</div>
                                            				</div>
                                            			
                                            			</div>
                                            			
                                            			<c:if test="${(numOfGraphMD ne null and numOfGraphMD != 0)  or (numOfGraphRR ne null and numOfGraphRR ne 0)}">
                                            				<input class="pl-point-button" type="button" name="AutoGenerar" data-toggle="modal" data-target="#myModalAutoGen" 
																value="<spring:message code="draws.autogen"/>" /> 
															<input class="pl-point-button" type="button" name="AutoGenerar" onclick="toSubmit('draws');"
																value="<spring:message code="draws.save"/>" /> 
                                            			</c:if>
                                            			
                                            			<div class="captura-right-content">
                                            				<div class="form-group">
                                            					<label class="col-sm-2 control-label"><spring:message code="draws.disponibles" /></label>
                                            					<div class="span4" id="header2">
																	  <ol style="width: 220px;" class="simple_with_animation vertical" name="summaryOL2" id="summaryOL2">
																	  		<c:forEach items="${mAvailable}" var="player">
																	  			<li class='highlight' id="${player.idPlayer }">${player.name} ${player.middleName} ${player.lastName}</li>
																	  		
																	  		</c:forEach>
																	  </ol>
																</div>
                                            				</div>
                                            				
                                            				<!-- Modal -->
															  <div class="modal fade" id="myModal" role="dialog"  >
															    <div class="modal-dialog">
															    
															      <!-- Modal content-->
															      <div class="modal-content">
															        <div class="modal-header">
															          <button type="button" class="close" data-dismiss="modal">&times;</button>
															          <h4 class="modal-title"><spring:message code="draws.match.data" /></h4>
															        </div>
															        <div class="modal-body">
															          <p><spring:message code="draws.match.field" /></p>
															          <input type="text" id="field">
															          
															           <div class="input-daterange input-group" id="datepicker">
															           <label class="col-sm-5 control-label"><spring:message code="draws.match.date" /></label>
														    				<input type="text" class="input-sm form-control" name="start"  id="date" required="required"/>
																		</div>
															           <div class="input-group bootstrap-timepicker timepicker">
															           		<label class="col-sm-3 control-label"><spring:message code="draws.match.hour" /></label>
																            <input id="timepicker1" type="text" class="form-control input-small">
																            <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
																        </div>
																        
															          
															        </div>
															        <div class="modal-footer">
															          <button type="button" class="pl-point-button" data-dismiss="modal" data-backdrop="false" onclick="javascript:matchTimeSelected('draws');"><spring:message code="draws.match.save" /></button>
															          <button type="button" class="pl-point-button" data-dismiss="modal"><spring:message code="draws.match.close" /></button>
															        </div>
															      </div>
															      
															    </div>
															  </div>
															  
															  <div class="modal fade" id="myModalAutoGen" role="dialog"  >
															    <div class="modal-dialog">
															    
															      <!-- Modal content-->
															      <div class="modal-content">
															        <div class="modal-header">
															          <button type="button" class="close" data-dismiss="modal">&times;</button>
															          <h4 class="modal-title"><spring:message code="draws.confirm" /></h4>
															        </div>
															        <div class="modal-body">
															          <p><spring:message code="draws.confirm.msg" /></p>
															          
															          
															        </div>
															        <div class="modal-footer">
															          <button type="button" class="pl-point-button" data-dismiss="modal" data-backdrop="false" onclick="javascript:autoSelected('draws');"><spring:message code="draws.confirm.continue" /></button>
															          <button type="button" class="pl-point-button" data-dismiss="modal"><spring:message code="draws.match.close" /></button>
															        </div>
															      </div>
															      
															    </div>
															  </div>
															  
															  <!-- Modal -->
															  <div class="modal fade in" id="myModalMissingData" role="dialog"  >
															    <div class="modal-dialog">
															    
															      <!-- Modal content-->
															      <div class="modal-content">
															        <div class="modal-header">
															          <button type="button" class="close" data-dismiss="modal">&times;</button>
															          <h4 class="modal-title"><spring:message code="draws.confirm.missing" /></h4>
															        </div>
															        <div class="modal-body">
															          <p><spring:message code="draws.confirm.msg2" /></p>
															          
															        </div>
															        <div class="modal-footer">
															          <button type="button" class="pl-point-button" data-dismiss="modal"><spring:message code="draws.match.close" /></button>
															        </div>
															      </div>
															      
															    </div>
															  </div>
															  
                                            			
		                                            		<div class="form-group col-sm-6">
		                                            		<c:set var="c" value="0"></c:set>
		                                            		<c:set var="d" value="1"></c:set>
		                                            		<c:if test="${numOfGraphMD != 0 }">
		                                            		<c:forEach  begin="1" end="${numOfGraphMD}" varStatus="loop" var="f">
															    <div class="drawTable" id="drawTable">
																	<table id="match1" width="285" cellpadding="0" cellspacing="0" border="0" >
																		<tr height="32">
																			<td height="5px">
																				<ol style="width: 220px;" class="simple_with_animation vertical" id="playerSM">
																					<c:if test="${fn:length(mAvailableFinal) gt 0 }">
																					<li class='highlight' id="${mAvailableFinal[c].idPlayer}">${mAvailableFinal[c].name} ${mAvailableFinal[c].middleName} ${mAvailableFinal[c].lastName}</li>
																					</c:if>
																				</ol>
																			</td>
																		</tr>
																		<tr height="32">
																			<td>
																				<ol style="width: 220px;" class="simple_with_animation vertical" id="playerSM">
																					<c:if test="${fn:length(mAvailableFinal) gt 0 }">
																					<li class='highlight' id="${mAvailableFinal[c+1].idPlayer}">${mAvailableFinal[c+1].name} ${mAvailableFinal[c+1].middleName} ${mAvailableFinal[c+1].lastName}</li>
																					</c:if>
																				</ol>
																			</td>
																		</tr>
																		<tr height="42">
																			<td height="5px">
																				<ol style="width: 220px;" class="simple_with_animation vertical" id="playerSM">
																					<c:if test="${fn:length(mAvailableFinal) gt 0 }">
																					<li class='highlight' id="${mAvailableFinal[c+2].idPlayer}">${mAvailableFinal[c+2].name} ${mAvailableFinal[c+2].middleName} ${mAvailableFinal[c+2].lastName}</li>
																					</c:if>
																				</ol>
																			</td>
																		</tr>
																		<tr height="32">
																			<td>
																				<ol style="width: 220px;" class="simple_with_animation vertical" id="playerSM">
																					<c:if test="${fn:length(mAvailableFinal) gt 0 }">
																					<li class='highlight' id="${mAvailableFinal[c+3].idPlayer}">${mAvailableFinal[c+3].name} ${mAvailableFinal[c+3].middleName} ${mAvailableFinal[c+3].lastName}</li>
																					</c:if>
																				</ol>
																			</td>
																		</tr>
																		<a href="#myModal"  onclick="javascript:ff(${d},'SM');" class="tiempo" data-toggle="modal"><img src="<%=pathGreenBall%>/resources/images/calendar.png" alt="" /></a>
																		
																		<c:set var="p">${d+1}</c:set>
																		<c:choose>
																			<c:when test="${not empty fieldsMaps}">
																				<label id="timeMatch${d}" class="timeMatch">${timesMaps[d]}</label>
																				<label id="dayMatch${d}" class="dayMatch">${datesMaps[d]}</label>
																				<label id="fieldMatch${d}" class="fieldMatch">${fieldsMaps[d]}</label>
																				<a href="#myModal" onclick="javascript:ff(${d+1}, 'SM');" class="tiempo2" data-toggle="modal"><img src="<%=pathGreenBall%>/resources/images/calendar.png" alt="" /></a>
																				<label id="timeMatch${d+1}" class="timeMatch2">${timesMaps[p]}</label>
																				<label id="dayMatch${d+1}" class="dayMatch2">${datesMaps[p]}</label>
																				<label id="fieldMatch${d+1}" class="fieldMatch2">${fieldsMaps[p]}</label>
																				<input type="hidden" id="datestempo" value="${datesMaps[d]}"></input>
																				<input type="hidden" id="datestempo2" value="${datesMaps[p]}"></input>
																				<input type="hidden" id="timestempo" value="${timesMaps[d]}"></input>
																				<input type="hidden" id="timestempo2" value="${timesMaps[p]}"></input>
																				<input type="hidden" id="fieldstempo" value="${fieldsMaps[d]}"></input>
																				<input type="hidden" id="fieldstempo2" value="${fieldsMaps[p]}"></input>
																				
																				<script>
																				
																				
																				
																				//var mapDates = new Object();
																				mapDates['${d}'] = $('#datestempo').val();
																				mapDates['${p}'] = $('#datestempo2').val();
																				mapTimes['${d}'] = $('#timestempo').val();
																				mapTimes['${p}'] = $('#timestempo2').val();
																				mapFields['${d}'] = $('#fieldstempo').val();
																				mapFields['${p}'] = $('#fieldstempo2').val();
																				</script>
																			</c:when>
																			<c:otherwise>
																				<label id="timeMatch${d}" class="timeMatch"></label>
																				<label id="dayMatch${d}" class="dayMatch"></label>
																				<label id="fieldMatch${d}" class="fieldMatch"></label>
																				<a href="#myModal" onclick="javascript:ff(${d+1}, 'SM');" class="tiempo2" data-toggle="modal"><img src="<%=pathGreenBall%>/resources/images/calendar.png" alt="" /></a>
																				<label id="timeMatch${d+1}" class="timeMatch"></label>
																				<label id="dayMatch${d+1}" class="dayMatch"></label>
																				<label id="fieldMatch${d+1}" class="fieldMatch"></label>	
																			</c:otherwise>
																		</c:choose>
																		
																	</table>
																	
																	<a href="/en_AU/players/overview/atpf324.html" id="winnerf"></a>
																</div>
																<c:set var="c" value="${f*4}"></c:set>
																<c:set var="d" value="${(f*2)+1 }"></c:set>
															 </c:forEach>
															 <c:set var="c" value="0"></c:set>
															 <c:set var="d" value="1"></c:set>
															 </c:if>
															 
															 <c:if test="${numOfGraphRR  ne  0}">
															 <c:set var="a" value="1"></c:set>
															 <c:set var="currentMatch" value="1"></c:set>
															 <c:forEach  begin="1" end="${numOfGraphRR}" varStatus="loop" var="i">
															 	<div class="form-group">
	                                            					<label class="col-sm-2 control-label"><spring:message code="draws.group" /> ${i}</label>
																 	<table class="groups">
																 		<c:forEach  begin="1" end="${playersPerGroup}" varStatus="loop2" >
																 			<tr height="32">
																 				<td height="5px">
																					<ol style="width: 220px;" class="simple_with_animation vertical" id="playerSM">
																						<c:if test="${fn:length(mAvailableFinal) gt 0 }">
																							<li class='highlight' id="${mAvailableFinal[a-1].idPlayer}">${mAvailableFinal[a-1].name} ${mAvailableFinal[a-1].middleName} ${mAvailableFinal[a-1].lastName}</li>
																						</c:if>
																					</ol>
																				</td>
																 			</tr>
																 			<c:set var="a" value="${a+1}"></c:set>
																 		</c:forEach>
																 	</table>
															 	</div>
															 	<div class="form-group">
	                                            					
																 	<table class="groups2" border="1">
																 		
																 		<tr>
																 			<td>&nbsp;</td>
																	 		<c:forEach  begin="1" end="${gamesXgroup}" varStatus="loop0" var = "tempJM0">
																	 				<td align="center">${tempJM0}</td>
																	 		</c:forEach>
																 		</tr>
																 		<c:forEach  begin="1" end="${gamesXgroup}" varStatus="loopa" var = "tempJM">
																 			<c:set var="t" value="1"></c:set>
																 			
																 			<tr height="32">
																 			<td>${tempJM}</td>
																 			<c:forEach  begin="1" end="${gamesXgroup}" varStatus="loop2" var="tempJM2" >
																 				<c:choose>
																	 				<c:when test="${tempJM gt tempJM2 }">
																	 					<td height="5px">
																	 						<a href="#myModal"  onclick="javascript:ff(${currentMatch},'SM');" class="tiempoRR" data-toggle="modal"><img src="<%=pathGreenBall%>/resources/images/calendar.png" alt="" /></a>
																	 						<c:choose>
																								<c:when test="${not empty fieldsMaps}">
																									<label id="timeMatch${currentMatch}" >${timesMaps[currentMatch]}</label>
																									<label id="dayMatch${currentMatch}" >${datesMaps[currentMatch]}</label>
																									<label id="fieldMatch${currentMatch}" >${fieldsMaps[currentMatch]}</label>
																									<input type="hidden" id="datestempo${currentMatch}" value="${datesMaps[currentMatch]}"></input>
																									<input type="hidden" id="timestempo${currentMatch}" value="${timesMaps[currentMatch]}"></input>
																									<input type="hidden" id="fieldstempo${currentMatch}" value="${fieldsMaps[currentMatch]}"></input>
																									
																									<script>
																				
																										mapDates['${currentMatch}'] = $('#datestempo${currentMatch}').val();
																										mapTimes['${currentMatch}'] = $('#timestempo${currentMatch}').val();
																										mapFields['${currentMatch}'] = $('#fieldstempo${currentMatch}').val();
																									</script>
																									
																									<c:set var="currentMatch" >${currentMatch+1}</c:set>
																								</c:when>
																								<c:otherwise>
																									<label id="timeMatch${currentMatch}" >${timesMaps[currentMatch]}</label>
																									<label id="dayMatch${currentMatch}" >${datesMaps[currentMatch]}</label>
																									<label id="fieldMatch${currentMatch}" >${fieldsMaps[currentMatch]}</label>
																									<c:set var="currentMatch" >${currentMatch+1 }</c:set>
																								</c:otherwise>
																							</c:choose>
																	 						
																	 					</td>
																					</c:when>
																					<c:otherwise>
																						<td class="tdNoMatch" height="5px"><c:out value=""></c:out></td>
																					</c:otherwise>
																				</c:choose>
																				
																			</c:forEach>
																 			</tr>
																 			<c:set var="t" value="${a+1}"></c:set>
																 		</c:forEach>
																 	</table>
															 	</div>
															 	
															 </c:forEach>
															 </c:if>
															 
		                                                	</div>
		                                                 </div>
														
														</form:form>
                                            	
				                               </div> 
				                               
				                               
				                               <jsp:include page="drawsTab2a.jsp"></jsp:include>
				                               <jsp:include page="drawsTab3a.jsp"></jsp:include>
				                               <jsp:include page="drawsTab4a.jsp"></jsp:include>
											   
                                                
                                            </div>
                                        </div>     
                                    </div>
                                    <jsp:include page="drawsTab2.jsp"></jsp:include>
                                    <jsp:include page="drawsTab3.jsp"></jsp:include>
                                    <div id="tab2bis" class="tab">
                                    
                                    <div id="tab2dbis" class="tab">
				                               		<form:form action="${addAction}" commandName="drawsSW" name="draws" id="drawsSW">
                                            	<div class="span4" id="header2">
															  <ol style="width: 220px;" class='simple_with_animation vertical' name="summaryOL2" id="summaryOL2">
															      <!--  c:forEach items="${womansNoActive}" var="wnoActive">-->
															  	  	<li class='highlight'>Federer</li>
															  	    <li class='highlight'>Nadal</li>
															  	    <li class='highlight'>Djokovick</li>
															  	    <li class='highlight'>Murray</li>
															  	    <li class='highlight'>Jose Miguel Rosette Uzcanga</li>
															  	  <!--  /c:forEach>-->
															  </ol>
														</div>
                                            	
                                            	
												    <div class="drawTableD" id="drawTableD">
												   
														<table id="match1D" width="285" cellpadding="0" cellspacing="0" border="0" >
															<tr height="53">
																<td>
																	<ol style="width: 220px;" class="simple_with_animation vertical" id="team1DM"></ol>
																</td>
															</tr>
															<tr height="56">
																<td>
																	<ol style="width: 220px;" class="simple_with_animation vertical" id="team2DM"></ol>
																</td>
															</tr>
															<tr height="51">
																<td height="5px">
																	<ol style="width: 220px;" class="simple_with_animation vertical" id="team3DM"></ol>
																</td>
															</tr>
															<tr height="50">
																<td>
																	<ol style="width: 220px;" class="simple_with_animation vertical" id="team4DM"></ol>
																</td>
															</tr>
														</table>
														<a href="/en_AU/players/overview/atpf324.html" id="winnerf">R. Federer</a>
														</div>
													
												 
                                                
												
												</form:form>
				                               
				                               </div>
                                    
                                    
                                    
                                    </div>
                                    <div id="tab4" class="tab"></div>
                                    
                                     
          					  </div><!--Close Top Match-->
           				</div>
           				<p><input class="pl-point-button" type="button" name="uploadFile" onclick="window.location.href='<%=pathGreenBall%>/${shortName}/players'"
							value="<spring:message code="prev.players"/>" /></p>
           			</div>
         		 </div>
         	</div>
         </div>
     </section>
   
</section>


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