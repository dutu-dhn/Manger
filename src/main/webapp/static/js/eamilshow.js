	
/*    var iframe = document.getElementById("iframe1");
    var iwindow = iframe.contentWindow;
    var idoc = iwindow.document;*/
    
    //js拿到绝对路径
	var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var path = pathName.substr(0,index+1);
   $(function(){
		//去首页
    	usermanger();
	}); 
    


    
	//全局变量
	var totalRecord,currentPage;
	//用户显示标签点击事件,
	function usermanger() {
		$("#add-p").css("visibility","hidden");
		$("#showuser thead").empty();
		//增加表头
		var rid = $("<th></th>").append("rid");
		var info = $("<th></th>").append("邮件信息");
		var caozuo = $("<th></th>").append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作");
		$("<tr></tr>")
		.append(rid)
		.append(uname)
		.append(caozuo)
		.appendTo("#showeamil thead"); 
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
	
	  
