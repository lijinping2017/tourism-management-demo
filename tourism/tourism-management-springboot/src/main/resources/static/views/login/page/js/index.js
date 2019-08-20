function userlogin() {
	var userName = $("#loginname").val();
	var password = $("#loginpwd").val();
	var reqData = {
		"name" : userName,
		"password":password
	};
	if(userName.length == 0) { 
		alert("用户名不能为空！");
		return false;
	}
	if(password.length == 0) {
		alert("密码不能为空！");
		return false;
	}
	
	$.ajax({
		url: "http://127.0.0.1:8086/user/queryUserByNamePwd",
		type: "POST",
		contentType: "application/json;charset=utf-8",
		dataType: "json",
		data: JSON.stringify(reqData),
		success: function successCallBack(data) {
			if(data.success==true && data.data != null){
				setCookie("user", JSON.stringify(data.data.user) );
				//setCookie("menu", JSON.stringify(data.data.menu) );
				setCookie("firstMenuId","user-index-page");
                var $txt = '<a class="dl" style="padding:0" href="javascript:;">你好,</a>';
                $txt+= '<a class="dl" href="/member/">'+data.data.user.name+'</a>';
                $txt+= '<a class="dl" href="/member/login/loginout">退出</a>';
                
                $("#loginstatus").html($txt);
				window.location.href = "../../frontmana/index/page/index.html";
			}else{
				pnotify("登录失败", "用户名或密码错误", "error");
			}
		},
		error: function errorCallBack(we) {
			console.log("error");
		}
	});
}

function register() {
	window.location.href = "../register/register.html";
}