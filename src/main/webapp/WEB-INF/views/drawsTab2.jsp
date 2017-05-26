<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%String pathGreenBall = request.getContextPath(); %>
<c:url var="addAction" value="/${shortName}/addDraws" ></c:url>
<c:choose>
    <c:when test="${currentSuperMode eq 'D' }">
       <c:set var="isD" value="tab active"></c:set>
    </c:when>
    <c:otherwise>
       <c:set var="isD" value="tab"></c:set>
    </c:otherwise>
</c:choose>
<div id="tab2" class="${isD}">
                                          <h3 class="tab-match-title"><spring:message code="category.doubles" /></h3>
                                           <div class="tabs standard">
                                            <ul class="tab-links-match">
                                                 <c:choose>
                                            		<c:when test="${currentMode eq 'DM' }">
                                            			<li class="active"><a onclick="javascript:tabSelected('DM');" class="first-tabs" href="#tab1d"><spring:message code="category.mens" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            		<c:choose>
                                            			<c:when test="${fn:startsWith(currentMode, 'D')}">
                                            				<li><a href="#tab1d"><spring:message code="category.mens" /></a></li>	
                                            			</c:when>
                                            			<c:otherwise>
                                            				<li class="active"><a onclick="javascript:tabSelected('DM');" class="first-tabs" href="#tab1d"><spring:message code="category.mens" /></a></li>
                                            			</c:otherwise>
                                            		</c:choose>
                                            			
                                            		</c:otherwise>
                                            	</c:choose>
                                            	<c:choose>
                                            		<c:when test="${currentMode eq 'DW' }">
                                            			<li class="active"><a onclick="javascript:tabSelected('DW');" class="first-tabs" href="#tab2d"><spring:message code="category.woman" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<li><a onclick="javascript:tabSelected('DW');" href="#tab2d"><spring:message code="category.woman" /></a></li>
                                            		</c:otherwise>
                                            	</c:choose>
                                            	<c:choose>
                                            		<c:when test="${currentMode eq 'DMN' }">
                                            			<li class="active"><a onclick="javascript:tabSelected('DMN');" class="first-tabs" href="#tab3d"><spring:message code="category.nv.mens" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<li><a onclick="javascript:tabSelected('DMN');" href="#tab3d"><spring:message code="category.nv.mens" /></a></li>
                                            		</c:otherwise>
                                            	</c:choose>
                                            	<c:choose>
                                            		<c:when test="${currentMode eq 'DWN' }">
                                            			<li class="active"><a onclick="javascript:tabSelected('DWN');" class="first-tabs" href="#tab4d"><spring:message code="category.nv.woman" /></a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<li><a onclick="javascript:tabSelected('DWN');" href="#tab4d"><spring:message code="category.nv.woman" /></a></li>
                                            		</c:otherwise>
                                            	</c:choose>
                                                
                                            </ul>
                                            <div class="tab-content">
                                           	   
                                            	
                                                <jsp:include page="drawsTab1d.jsp"></jsp:include>
                                                <jsp:include page="drawsTab2d.jsp"></jsp:include>
                                                <jsp:include page="drawsTab3d.jsp"></jsp:include>
                                                <jsp:include page="drawsTab4d.jsp"></jsp:include>
                                                
                                                
                                                
                                                 
                                            </div>
                                   		   </div>
                                     </div>