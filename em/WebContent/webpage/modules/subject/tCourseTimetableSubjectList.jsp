<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>课程表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
		});
		 
	</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
	<div class="ibox">
    
    <div class="ibox-content">
	<sys:message content="${message}"/>
	
	<!--查询条件-->
	<div class="row">
	<div class="col-sm-12">
	<form:form id="searchForm" modelAttribute="TCourseTimetable" action="${ctx}/subject/tCourseTimetable/subjectlist" method="post" class="form-inline">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();"/><!-- 支持排序 -->
	</form:form>
	</div>
	</div>
	 
	<!-- 表格 -->
	<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
		<thead>
			<tr>
				<th  class="sort-column courseDate">日期</th>
				<th  class="sort-column teactime">上课时间</th>
				<th  class="sort-column roomDesc">教室</th>
				<th  class="sort-column type">类型</th>
				<th  class="sort-column status">状态</th>
				<th  class="sort-column teacherName">教师</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="tCourseTimetable">
			<tr>
				<td>
					<fmt:formatDate value="${tCourseTimetable.courseDate}" pattern="yyyy-MM-dd"/>
				</td>
				<td>
					${tCourseTimetable.teactime}
				</td>
				<td>
					${tCourseTimetable.room.roomDesc}
				</td>
				<td>
					${fns:getDictLabel(tCourseTimetable.type, 'timetable_type', '')}
				</td>
				<td>
					${fns:getDictLabel(tCourseTimetable.status, 'timetable_status', '')}
				</td>
				<td>
					${tCourseTimetable.teacher.name}
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
		<!-- 分页代码 -->
	<table:page page="${page}"></table:page>
	<br/>
	<br/>
	</div>
	</div>
</div>
</body>
</html>