	
/*    var iframe = document.getElementById("iframe1");
    var iwindow = iframe.contentWindow;
    var idoc = iwindow.document;*/
    
    //js拿到绝对路径
	var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var path = pathName.substr(0,index+1);
/*   $(function(){
		//去首页
    	//usermanger();
	}); */
    


    
	//全局变量
	var totalRecord,currentPage;
	//用户显示标签点击事件,
	function usermanger() {
		$("#add-p").css("visibility","hidden");
		$("#showuser thead").empty();
		//增加表头
		var id = $("<th></th>").append("id");
		var uname = $("<th></th>").append("用户名");
		var password = $("<th></th>").append("密码");
		var tel = $("<th></th>").append("手机号");
		var email = $("<th></th>").append("邮箱");
		var regtime = $("<th></th>").append("注册时间");
		var logintime = $("<th></th>").append("最近登录时间");
		var caozuo = $("<th></th>").append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作");
		$("<tr></tr>")
		.append(id)
		.append(uname)
		.append(password)
		.append(tel)
		.append(email)
		.append(regtime)
		.append(logintime)
		.append(caozuo)
		.appendTo("#showuser thead"); 
		showuser(1);
	}
	//ajax请求获取指定页码的用户数据
	function showuser(pn) {
		$.ajax({
			url:path+"/show",
			data:"pn="+pn,
			type:"GET",
			dataType:"json",
			success:function(result){
				//解析显示用户信息
				showuser_p(result);
				//解析显示分页信息
				showpageinfo(result);
				//解析显示分页条数据
				showpagenav(result);
			 } 
		});
		}
	//用户信息的显示
	function showuser_p(result) {
		$("#showuser tbody").empty(); 
		var users = result.data.pageInfo.list;
 		 $.each(users,function(index,item){
			var id = $("<td></td>").append(item.id);
			var uname = $("<td></td>").append(item.uname);
			var password = $("<td></td>").append(item.password);
			var tel = $("<td></td>").append(item.tel);
			var email = $("<td></td>").append(item.email);
			var regtime = $("<td></td>").append(item.regtime);
			var logintime = $("<td></td>").append(item.logintime);
			
			var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
			.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
			//为编辑按钮添加一个自定义的属性，来表示当前员工id
			editBtn.attr("edit-id",item.id);
			var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
							.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
			//为删除按钮添加一个自定义的属性来表示当前删除的员工id
			delBtn.attr("del-id",item.id);
			var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
			
			$("<tr></tr>")
			.append(id)
			.append(uname)
			.append(password)
			.append(tel)
			.append(email)
			.append(regtime)
			.append(logintime)
			.append(btnTd)
			.appendTo("#showuser tbody"); 
		});  
	}
	//解析显示分页信息
	function showpageinfo(result) {
		$("#page_info_area").empty();
		$("#page_info_area").append("当前"+result.data.pageInfo.pageNum+"页,总"+
				result.data.pageInfo.pages+"页,总"+
				result.data.pageInfo.total+"条记录");
		totalRecord = result.data.pageInfo.total;
		currentPage = result.data.pageInfo.pageNum;
	}
	
	//解析显示分页条，点击分页要能去下一页....
	function showpagenav(result) {
		//page_nav_area
		$("#page_nav_area").empty();
		var ul = $("<ul></ul>").addClass("pagination");
		
		//构建元素,前三角和后三角
		var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
		var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
		if(result.data.pageInfo.hasPreviousPage == false){
			firstPageLi.addClass("disabled");
			prePageLi.addClass("disabled");
		}else{
			//为元素添加点击翻页的事件
			firstPageLi.click(function(){
				showuser(1);
			});
			prePageLi.click(function(){
				showuser(result.data.pageInfo.pageNum -1);
			});
		}
		var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
		var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
		if(result.data.pageInfo.hasNextPage == false){
			nextPageLi.addClass("disabled");
			lastPageLi.addClass("disabled");
		}else{
			nextPageLi.click(function(){
				showuser(result.data.pageInfo.pageNum +1);
			});
			lastPageLi.click(function(){
				showuser(result.data.pageInfo.pages);
			});
		}
		//添加首页和前一页 的提示
		ul.append(firstPageLi).append(prePageLi);
		//1,2，3遍历给ul中添加页码提示
		$.each(result.data.pageInfo.navigatepageNums,function(index,item){
			
			var numLi = $("<li></li>").append($("<a></a>").append(item));
			if(result.data.pageInfo.pageNum == item){
				numLi.addClass("active");
			}
			numLi.click(function(){
				showuser(item);
			});
			ul.append(numLi);
		});
		//添加下一页和末页 的提示
		ul.append(nextPageLi).append(lastPageLi);
		
		//把ul加入到nav
		var navEle = $("<nav></nav>").append(ul);
		navEle.appendTo("#page_nav_area");
	}
	//给编辑按钮加一个模态框
	$(document).on("click",".edit_btn",function(){
		
		//查出用户信息,并且显示
		getUser($(this).attr("edit-id"));
		//把用户的id传给模态框的更新按钮
		$("#user_update_btn").attr("edit-id",$(this).attr("edit-id"));
		$("#userUpdateModal").modal({
			backdrop:"static"
		});
	});
	//给更新个人资料按钮加一个模态框


	//通过ID来查询用户显示到模态框
	function getUser(id) {
		$.ajax({
			url:path+"/user/"+id,
			type:"GET",
			success:function(result){
				var userData = result.data.user;
				$("#user_update_input_uname").val(userData.uname);
				$("#user_update_input_password").val(userData.password);
				$("#user_update_input_email").val(userData.email);
				$("#user_update_input_tel").val(userData.tel);
			}
		});
	}
	//点击更新，更新用户信息
	$("#user_update_btn").click(function(){
		//判断之前的邮箱,手机号,ajax用户名校验是否成功。
	if($(this).attr("ajax-uname")=="error"){
			return false;
		} 
		if($(this).attr("ajax-email")=="error"){
			return false;
		} 
		if($(this).attr("ajax-tel")=="error"){
			return false;
		}
		
		//2、发送ajax请求保存更新的员工数据
		$.ajax({ 
			url:path+"/user/"+$(this).attr("edit-id"),
			type:"PUT", 
			data:$("#userUpdateModal form").serialize(),
			success:function(result){
				alert(result.msg);
				//1、关闭对话框
				$("#userUpdateModal").modal("hide");
				//2、回到本页面
				showuser(currentPage);
			}
		});
	});

	//校验邮箱格式
	 $("#user_update_input_email").change(function(){
		//验证邮箱是否合法
			//1、校验邮箱信息
		 	var email = $("#user_update_input_email").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){
				show_validate_msg("#user_update_input_email", "error", "邮箱格式不正确");
				$("#user_update_btn").attr("ajax-email","error");
			}else{
				show_validate_msg("#user_update_input_email", "success", "");
				$("#user_update_btn").attr("ajax-email","success");
			}
	});  
	
	//校验用户名是否可用
	 $("#user_add_input_uname").change(function(){
		//发送ajax请求校验用户名是否可用
		var uname = this.value;
		$.ajax({
			url:path+"/checkuser",
			data:"uname="+uname,
			type:"POST",
			success:function(result){
				if(result.code==200){
					show_validate_msg("#user_add_input_uname","success","用户名可用");
					$("#user_save_btn").attr("ajax-uname","success");
				}else{
					show_validate_msg("#user_add_input_uname","error",result.data.va_msg);
					$("#user_save_btn").attr("ajax-uname","error");
				}
			}
		});
	});  
	//校验手机号格式
	 $("#user_update_input_tel").change(function(){
		 var tel = $("#user_update_input_tel").val();
			var regTel = /^[1][3,4,5,7,8][0-9]{9}$/;
			if(!regTel.test(tel)){
				show_validate_msg("#user_update_input_tel", "error", "手机号格式不正确");
				$("#user_update_btn").attr("ajax-tel","error");
			}else{
				show_validate_msg("#user_update_input_tel", "success", "");
				$("#user_update_btn").attr("ajax-tel","success");
			} 
	});  
	
	//显示校验结果的提示信息
	function show_validate_msg(ele,status,msg){
		//清除当前元素的校验状态
		$(ele).parent().removeClass("has-success has-error");
		$(ele).next("span").text("");
		if("success"==status){
			$(ele).parent().addClass("has-success");
			$(ele).next("span").text(msg);
		}else if("error" == status){
			$(ele).parent().addClass("has-error");
			$(ele).next("span").text(msg);
		}
	}
	
	//单个删除
	$(document).on("click",".delete_btn",function(){
		//1、弹出是否确认删除对话框
		var uname = $(this).parents("tr").find("td:eq(1)").text();
		var id = $(this).attr("del-id");
		//alert($(this).parents("tr").find("td:eq(1)").text());
		if(confirm("确认删除【"+uname+"】吗？")){
			//确认，发送ajax请求删除即可
			$.ajax({
				url:path+"/user/"+id,
				type:"DELETE",
				success:function(result){
					alert(result.msg);
					//回到本页
					showuser(currentPage);
				}
			});
		}
	});
	//清空表单样式及内容
	function reset_form(ele){
		$(ele)[0].reset();
		//清空表单样式
		$(ele).find("*").removeClass("has-error has-success");
		$(ele).find(".help-block").text("");
	}
	$("#user_add_modal_btn").click(function(){
		
		//清除表单数据（表单完整重置（表单的数据，表单的样式））
		reset_form("#userAddModal form");
		$("#userAddModal").modal({
			backdrop:"static"
		});
	});
	//校验表单数据
	function validate_add_form(){
		//1、拿到要校验的数据，使用正则表达式
		var uname = $("#user_add_update_input_uname").val();
		var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
		if(!regName.test(uname)){
			//alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
			show_validate_msg("#user_add_update_input_uname", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
			return false;
		}else{
			show_validate_msg("#user_add_update_input_uname", "success", "");
		};
		
		//2、校验邮箱信息
		var email = $("#user_add_input_email").val();
		var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if(!regEmail.test(email)){
			//alert("邮箱格式不正确");
			//应该清空这个元素之前的样式
			show_validate_msg("#user_add_input_email", "error", "邮箱格式不正确");
			/* $("#email_add_input").parent().addClass("has-error");
			$("#email_add_input").next("span").text("邮箱格式不正确"); */
			return false;
		}else{
			show_validate_msg("#user_add_input_email", "success", "");
		}
		return true;
	}
	//点击保存，保存员工。
	$("#user_save_btn").click(function(){
		//1、模态框中填写的表单数据提交给服务器进行保存
		//1、先对要提交给服务器的数据进行校验
		if(!validate_add_form()){
			return false;
		};
		//1、判断之前的ajax用户名校验是否成功。如果成功。
		if($(this).attr("ajax-uname")=="error"){
			return false;
		}
		
		//2、发送ajax请求保存员工
		$.ajax({
			url:path+"/user",
			type:"POST",
			data:$("#userAddModal form").serialize(),
			success:function(result){
				//alert(result.msg);
				if(result.code == 200){
					//员工保存成功；
					//1、关闭模态框
					$("#userAddModal").modal('hide');
					
					//2、来到最后一页，显示刚才保存的数据
					//发送ajax请求显示最后一页数据即可
					showuser(totalRecord);
				}else{
					//显示失败信息
					//console.log(result);
					//有哪个字段的错误信息就显示哪个字段的；
					if(undefined != result.data.errorFields.email){
						//显示邮箱错误信息
						show_validate_msg("#user_add_update_input_uname", "error", result.data.errorFields.email);
					}
					if(undefined != result.data.errorFields.empName){
						//显示员工名字的错误信息
						show_validate_msg("#user_add_update_input_uname", "error", result.data.errorFields.uname);
					}
				}
			}
		});
	});
	
	  
