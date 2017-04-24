<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>课程表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		var validateForm;
		function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
		  if(validateForm.form()){
			  $("#inputForm").submit();
			  return true;
		  }
	
		  return false;
		}
		$(document).ready(function() {
			validateForm = $("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
			
					laydate({
			            elem: '#courseDate', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
			            event: 'focus' //响应事件。如果没有传入event，则按照默认的click
			        });
		});
	</script>
</head>
<body>
		<form:form id="inputForm" modelAttribute="tCourseTimetable" action="${ctx}/subject/tCourseTimetable/save?opertype=updateteacher&source=${source}" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		
		<sys:message content="${message}"/>	
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
				<tr>
					<td class="width-15 active"><label class="pull-right">课程名称：</label></td>
					<td class="width-35" colspan="3">${tCourseTimetable.courseclass.classDesc}</td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">日期：</label></td>
					<td class="width-35"><fmt:formatDate value="${tCourseTimetable.courseDate}" pattern="yyyy-MM-dd"/></td>
					<td class="width-15 active"><label class="pull-right">上课时间：</label></td>
					<td class="width-35">${tCourseTimetable.teactime}</td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">教室：</label></td>
					<td class="width-35">${tCourseTimetable.room.roomDesc}</td>
					<td class="width-15 active"><label class="pull-right">类型：</label></td>
					<td class="width-35">${fns:getDictLabel(tCourseTimetable.type, 'timetable_type', '')}</td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">状态：</label></td>
					<td class="width-35">${fns:getDictLabel(tCourseTimetable.status, 'timetable_status', '')}</td>
					<td class="width-15 active"><label class="pull-right"><font color="red">*</font>教师：</label></td>
					<td class="width-35">
						<sys:treeselect id="teacher" name="teacher.id" value="${tCourseTimetable.teacher.id}" labelName="teacher.name" labelValue="${tCourseTimetable.teacher.name}"
							title="教师" url="/school/tSchoolTeacher/treeData?subject=${tCourseTimetable.subject.id}" cssClass="form-control required" notAllowSelectParent="true" notAllowSelectRoot="true"/>
					</td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">备注：</label></td>
					<td class="width-35" colspan="3">
						<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="255" class="form-control "/>
					</td>
				</tr>
		 	</tbody>
		</table>
	</form:form>
</body>
</html>