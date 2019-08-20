var roleId = "";
var firstMenuImage = "";
var firstMenuId = "";
var firstMenuName = "";
var firstMenuImgPath = "";
var secondMenuId = "";
var secondMenuName = "";
var secondMenuUrl = "";
var selectedMenuNode = undefined;
var setting = {
	callback: {
		onClick: function onClick(event, treeId, treeNode) {
			console.log(treeNode);
			var treeData = treeNode;
			firstMenuId = treeNode.firstMenuId;
			firstMenuName = treeNode.name;
			firstMenuImgPath = treeNode.icon;
			secondMenuId = treeNode.secondMenuId;
			secondMenuName = treeNode.name;
			secondMenuUrl = treeNode.pageUrl;
			selectedMenuNode = treeNode;
			ctrolBtn(treeNode);
			return false;
		}
	}
};

//如可以把返回的数据里的child对象数组改为children, text=Name的值等
function transformJsonkey(returnData) { // 
	$.each(returnData, function(index, item) {
		if (item.children != null) { // 如果对象包含有子分类文件夹，那么再递归
			item.open = true; 
			item.isParent = true;
			item.type = "branch";
			transformJsonkey(item.children);
			if(item.hasOwnProperty("firstMenuImg")) {
				item["icon"] = "http://127.0.0.1:8086/file/downloadFile?filePath=" + item["firstMenuImg"];
				delete item["firstMenuImg"];
			}
		}else {
			item.isParent = false;
			item.type = "leaf";
			item.pageUrl = item.url;   //禁止跳转
			delete item["url"];
		}
	});
}

function checkRoleId() {
	var userInfoStr = getCookie("user");
	if(userInfoStr.length == 0) {   //表示没有登录成功
        window.location.href = "../../../login/page/login.html";
    }else {
        var userInfo = JSON.parse(userInfoStr);   //转换成对象 
    	var roleId = userInfo.roleId;
    	return roleId;
    }
}

function combineMenus(data) {
	var firstMenus = data.firstMenus;
	var secondMenus = data.secondMenus;
	var newMenu = [];
	var firstMenuArrIndex = {};
	firstMenus.map(function(item,index) {
		var tempObj = $.extend(true,{},item);
		tempObj.firstMenuId = item.id;
		delete tempObj.id;
		tempObj.firstMenuImg = item.imagePath;
		delete tempObj.imagePath;
		tempObj.children = [];
		newMenu.push(tempObj); 
		firstMenuArrIndex[item.id] = newMenu.length - 1;
	});

	secondMenus.map(function(item,index) {
		var tempFirstMenuIndex = firstMenuArrIndex[item.fmid];
		var tempFirstMenuObj = newMenu[tempFirstMenuIndex];

		var tempSecondMenuObj = $.extend(true,{},item);
		tempSecondMenuObj.secondMenuId = item.id;
		delete tempSecondMenuObj.id;

		tempFirstMenuObj.children.push(tempSecondMenuObj);
	});
	return newMenu;
}

function ctrolBtn(treeNode) {
	if(treeNode.type == "branch") {
		$(".addFirstMenuBtn").removeAttr("disabled").css("background-color","#33d41d");
		$(".addSecondMenuBtn").removeAttr("disabled").css("background-color","#33d41d");
		$(".modifyFirstMenuBtn").removeAttr("disabled").css("background-color","#33d41d");
		$(".modifySecondMenuBtn").attr("disabled","disabled").css("background-color","grey");
		$(".deleteFirstMenuBtn").removeAttr("disabled").css("background-color","#33d41d");
		$(".deleteSecondMenuBtn").attr("disabled","disabled").css("background-color","grey");
	}else {
		$(".addFirstMenuBtn").attr("disabled","disabled").css("background-color","grey");
		$(".addSecondMenuBtn").attr("disabled","disabled").css("background-color","grey");
		$(".modifyFirstMenuBtn").attr("disabled","disabled").css("background-color","grey");
		$(".modifySecondMenuBtn").removeAttr("disabled").css("background-color","#33d41d");
		$(".deleteFirstMenuBtn").attr("disabled","disabled").css("background-color","grey");
		$(".deleteSecondMenuBtn").removeAttr("disabled").css("background-color","#33d41d");
	}
}

$(function() {
	refresh();
});

function refresh() {
	var menu = [];
	var roleId = checkRoleId();
	if(roleId != null) {
		$("#hint-msg-box").html("");
    	queryAllMenus().then(function (resData) {
    		$(".addFirstMenuBtn").removeAttr("disabled").css("background-color","#33d41d");
    		$(".addSecondMenuBtn").attr("disabled","disabled").css("background-color","grey");
    		$(".modifyFirstMenuBtn").attr("disabled","disabled").css("background-color","grey");
    		$(".modifySecondMenuBtn").attr("disabled","disabled").css("background-color","grey");
    		$(".deleteFirstMenuBtn").attr("disabled","disabled").css("background-color","grey");
    		$(".deleteSecondMenuBtn").attr("disabled","disabled").css("background-color","grey");
			var menus = combineMenus(resData.data);
        	//初始化菜单 
            transformJsonkey(menus);
            $.fn.zTree.init($("#hint-msg-box"), setting, menus);
            $('#firstMenuAddModal').modal({backdrop: 'static',show: false});   //禁止点非模态框地方也关闭
		}).catch(function (error) {
			console.log(error);
		});
    }
}

//添加一级菜单
function openFirstMenuModal() {
	var modal = $(this);
	$('#firstMenuAddModal').modal("show");
	$("#firstMenuAddModal .col-menu-1 input").show().val("");
	$("#firstMenuAddModal .col-menu-1 button").show();
	$("#firstMenuAddModal .col-menu-1 img").hide();
	$("#firstMenuAddModal .modal-body .col-md-3 span").text("*");
	$('#firstMenuAddModal').find('input[name="firstMenuName"]').val("");
	$("#firstMenuAddModal .modal-footer .btn-primary").attr("disabled","disabled");
}

function showFirstMenuImg() {
	var fd = new FormData();
	$("#firstMenuAddModal .col-menu-1 input").each(function(index,item){
		fd.append("file",item.files[0]);
	});
    $.ajax({
    	type: "POST",
        url: "http://127.0.0.1:8086/file/upload",
        data: fd,
        async: false,
        cache: false,
        processData: false,
        contentType: false,
        success: function (data) {
        	for(var i= 0; i< data.data.length; i++){
        		firstMenuImage = ""+data["data"][i]["filePath"];
        	}                            
        	$("#firstMenuAddModal .col-menu-1").each(function(index,item){
        		$(item).find("input").hide();
        		$(item).find("button").hide();
        		$(item).find("img").attr("src","http://127.0.0.1:8086/file/downloadFile?filePath="+data["data"][index]["filePath"]).show();
        	});
        	$(".modal-footer .btn-primary").removeAttr("disabled","none");
        },error:function(error){
        	pnotify("失败", "上传失败", "error");
        }
    });
}

function addFirstMenuBtn() {
	var firstMenuName = $(".col-md-3 input[name='firstMenuName']").val();
	var repData = {
		name: firstMenuName,
		imagePath: firstMenuImage
	}
	$(".col-md-3 input[name='firstMenuName']").on("keyup",function() {
		$("#firstMenuAddModal .modal-body .col-md-3 span").text("*");
	})
	if(firstMenuName.length == 0) {
		$("#firstMenuAddModal .modal-body .col-md-3 span").text("一级菜单名称不能为空！");
		return false;
	}

	$.ajax({
	    url: "http://127.0.0.1:8086/menu/addFirstMenu",
	    type: "POST",
	    contentType: "application/json;charset=utf-8",
	    data: JSON.stringify(repData),
	    dataType: "json",
	    success: function successCallBack(data) {
	    	if(data.success==true){
	    		$("#firstMenuAddModal").modal("hide");  //模态框自动关闭
	    		pnotify("成功", "添加一级菜单成功", "success");
	    		refresh();
			}else {
				pnotify("失败", "一级菜单已存在，新增失败！", "success");
			}
	    },
	    error: function errorCallBack(xhr) {
	    	pnotify("失败", "添加一级菜单失败", "error");
	    }
	});
}

//添加二级菜单
function openSecondMenuModal() {
	var modal = $(this);
	$('#secondMenuAddModal').modal("show");
	$('#secondMenuAddModal').find('input[name="secondMenuName"]').val("");
	$('#secondMenuAddModal').find('input[name="secondMenuUrl"]').val("");
	$("#secondMenuAddModal #secondMenuName span").text("*");
	$("#secondMenuAddModal #secondMenuUrl span").text("*");
}

function addSecondMenuBtn() {
	var secondMenuName = $(".col-md-3 input[name='secondMenuName']").val();
	var secondMenuUrl = $(".col-md-3 input[name='secondMenuUrl']").val();
	$(".col-md-3 input[name='secondMenuName']").on("keyup",function() {
		$("#secondMenuAddModal #secondMenuName span").text("*");
	})
	$(".col-md-3 input[name='secondMenuUrl']").on("keyup",function() {
		$("#secondMenuAddModal #secondMenuUrl span").text("*");
	})
	if(secondMenuName.length == 0) {
		$("#secondMenuAddModal #secondMenuName span").text("二级菜单名称不能为空！");
		return false;
	}
	if(secondMenuUrl.length == 0) {
		$("#secondMenuAddModal #secondMenuUrl span").text("二级菜单url不能为空！");
		return false;
	}
	var repData = {
		fmid: firstMenuId,
		name: secondMenuName,
		url: secondMenuUrl
	};

	addSecondMenu(repData).then(function (secMenuData) {
    	if(secMenuData.success==true && secMenuData.data != null){
    		$("#secondMenuAddModal").modal("hide");  //模态框自动关闭
    		var secondMenuId = secMenuData.data.id;
    		roleId = checkRoleId();
			if(roleId != null) {
				var roleSecMeData = {
					roleId: roleId,
					secmId: secondMenuId
				}
				addRoleSecondMenu(roleSecMeData).then(function (requestdata) {
					if(requestdata.success == true) {
						pnotify("成功", "添加二级菜单成功", "success");
						refresh();
					}else{
						alert("失败", "添加角色二级菜单失败", "error");
					}
				})
			}
		}else {
			pnotify("失败", "添加二级菜单失败", "error");
		}
	}).catch(function (error) {
		console.log(error);
	}); 
}

//修改一级菜单
function openModifyFirstMenuModal() {
	$("#updateFirstMenuModal").modal("show");
	$("#updateFirstMenuModal input[name='modifyFirstMenuName']").val(firstMenuName);
	$("#updateFirstMenuModal .modal-body .oldfirstMenuImg").attr("src",firstMenuImgPath);
	$("#updateFirstMenuModal .col-menu-1 input").show().val("");
	$("#updateFirstMenuModal .col-menu-1 button").show();
	$("#updateFirstMenuModal #modifyFirstMenuName span").text("*");
}

function showNewFirstMenuImg() {
	var fd = new FormData();
	$("#updateFirstMenuModal .col-menu-1 input").each(function(index,item){
		fd.append("file",item.files[0]);
	});
    $.ajax({
    	type: "POST",
        url: "http://127.0.0.1:8086/file/upload",
        data: fd,
        async: false,
        cache: false,
        processData: false,
        contentType: false,
        success: function (data) {
        	for(var i= 0; i< data.data.length; i++){
        		firstMenuImage = ""+data["data"][i]["filePath"];
        	}
        	$("#updateFirstMenuModal .col-menu-1").each(function(index,item){
        		$(item).find("input").hide();
        		$(item).find("button").hide();
        		$(item).find(".oldfirstMenuImg").attr("src","http://127.0.0.1:8086/file/downloadFile?filePath="+data["data"][index]["filePath"]).show();
        	});
        },error:function(error){
        	pnotify("失败", "上传失败", "error");
        }
    });
}

function modifyFirstMenuBtn() {
	var newfirstMenuName = $("#updateFirstMenuModal input[name='modifyFirstMenuName']").val();
	$("#updateFirstMenuModal input[name='modifyFirstMenuName']").on("keyup",function() {
		$("#updateFirstMenuModal #modifyFirstMenuName span").text("*");
	})
	if(newfirstMenuName.length == 0) {
		$("#updateFirstMenuModal #modifyFirstMenuName span").text("一级菜单名称不能为空！");
		return false;
	}
	if(firstMenuImage.length == 0) {
		firstMenuImage = firstMenuImgPath;
		var index = firstMenuImage.lastIndexOf("\=");  
		firstMenuImage  = firstMenuImage.substring(index + 1, firstMenuImage.length);
	}
	var updFirMenuData = {
		id: firstMenuId,
		name: newfirstMenuName,
		imagePath: firstMenuImage
	};

	updateFirstMemu(updFirMenuData).then(function (reqData) {
    	if(reqData.success==true){
    		pnotify("成功", "修改一级菜单成功", "success");
    		$("#updateFirstMenuModal").modal("hide");  //模态框自动关闭
    		refresh();
		}else {
			pnotify("失败", "修改一级菜单失败", "error");
		}
	}).catch(function (error) {
		console.log(error);
	})
}

//修改二级菜单
function openModifySecondMenuModal() {
	$("#updateSecondMenuModal").modal("show");
	$("#updateSecondMenuModal input[name='modifySecondMenuName']").val(secondMenuName);
	$("#updateSecondMenuModal input[name='modifySecondMenuUrl']").val(secondMenuUrl);
	$("#updateSecondMenuModal #modifySecondMenuName span").text("*");
	$("#updateSecondMenuModal #modifySecondMenuUrl span").text("*");
}

function modifySecondMenuBtn() {
	var newSecondMenuName = $("#updateSecondMenuModal input[name='modifySecondMenuName']").val();
	var newSecondMenuUrl = $("#updateSecondMenuModal input[name='modifySecondMenuUrl']").val();
	$("#updateSecondMenuModal input[name='modifySecondMenuName']").on("keyup",function() {
		$("#updateSecondMenuModal #modifySecondMenuName span").text("*");
	})
	$("#updateSecondMenuModal input[name='modifySecondMenuUrl']").on("keyup",function() {
		$("#updateSecondMenuModal #modifySecondMenuUrl span").text("*");
	})
	if(newSecondMenuName.length == 0) {
		$("#updateSecondMenuModal #modifySecondMenuName span").text("二级菜单名称不能为空！");
		return false;
	}
	if(newSecondMenuUrl.length == 0) {
		$("#updateSecondMenuModal #modifySecondMenuUrl span").text("二级菜单url不能为空！");
		return false;
	}
	var repData = {
		id: secondMenuId,
		name: newSecondMenuName,
		url: newSecondMenuUrl
	};
	$.ajax({
	    url: "http://127.0.0.1:8086/menu/updateSecondMemu",
	    type: "POST",
	    contentType: "application/json;charset=utf-8",
	    data: JSON.stringify(repData),
	    dataType: "json",
	    success: function successCallBack(data) {
	    	if(data.success==true){
	    		pnotify("成功", "修改二级菜单成功", "success");
	    		$("#updateSecondMenuModal").modal("hide");  //模态框自动关闭
	 			refresh();
			}
	    },
	    error: function errorCallBack(xhr) {
	    	pnotify("失败", "修改二级菜单失败", "error");
	    }
	});
}

//删除一级菜单
function deleteFirstMenuBtn() {
	var roleId = checkRoleId();
	var firstMenuId = selectedMenuNode.firstMenuId;
	var roleSecondArray = [];
	var SecondArray = [];
	selectedMenuNode.children.map(function(item,index){
		var secondMenuId = item.secondMenuId;
		var roleSedtempObj = {};
		var sedTempObj = {};
		roleSedtempObj.roleId = roleId;
		roleSedtempObj.secmId = item.secondMenuId;
		sedTempObj.id = secondMenuId;
		roleSecondArray.push(roleSedtempObj);
		SecondArray.push(sedTempObj);
	});
	deleteRoleSecondMenu(roleSecondArray).then(function (data) {
		if(data.success == true) {
			deleteSecondMenu(SecondArray).then(function (reqData) {
				if(reqData.success == true) {
					deleteFirstMenu(firstMenuId).then(function (firMenuData) {
						if(firMenuData.success == true) {
							pnotify("成功", "删除一级菜单成功", "success");
							refresh();
						}else {
							pnotify("失败", "删除一级菜单失败", "error");
						}
					}).catch(function (error) {
						console.log(error);
					});
				}else {
					pnotify("失败", "删除二级菜单失败", "error");
				}
			}).catch(function (error) {
				console.log(error);
			});
		}else {
			pnotify("失败", "删除角色二级菜单失败", "error");
		}
	}).catch(function (error) {
		console.log(error);
	});
}

//删除二级菜单
function deleteSecondMenuBtn() {
	var roleId = checkRoleId();
	var secondMenuId = selectedMenuNode.secondMenuId;
	var recordArray = [];
	var SecondArray = [];
	var tempObj = {};
	var sedTempObj = {};
	tempObj.roleId = roleId;
	tempObj.secmId = secondMenuId;
	sedTempObj.id = secondMenuId
	recordArray.push(tempObj);
	SecondArray.push(sedTempObj);
	deleteRoleSecondMenu(recordArray).then(function (data) {
		if(data.success == true) {
			deleteSecondMenu(SecondArray).then(function (reqData) {
				if(reqData.success == true) {
					pnotify("成功", "删除二级菜单成功", "success");
					refresh();
				}else {
					pnotify("失败", "删除二级菜单失败", "error");
				}
			}).catch(function (error) {
				console.log(error);
			});
		}else {
			alert("删除角色二级菜单失败");
		}
	}).catch(function (error) {
		console.log(error);
	});
}

function queryAllMenus() {
	return new Promise(function (resolve, reject) {
		$.ajax({
			url: "http://127.0.0.1:8086/menu/queryMenusAll",
		    type: "GET",
		    contentType: "application/json;charset=utf-8",
		    dataType: "json",
			success: function successCallBack(data) {
	            resolve(data);
	        },
	        error: function errorCallBack(xhr) {
	            console.log('error');
	            reject(xhr);
	        }
		});
	});
}

function queryFirstMenuAll() {
	return new Promise(function (resolve, reject) {
		$.ajax({
			url: "http://127.0.0.1:8086/menu/queryFirstMenuAll",
		    type: "GET",
		    contentType: "application/json;charset=utf-8",
		    dataType: "json",
			success: function successCallBack(data) {
	            resolve(data);
	        },
	        error: function errorCallBack(xhr) {
	            console.log('error');
	            reject(xhr);
	        }
		});
	})
}


 //根据角色id获取菜单
function queryMenusByRole(roleId) {
    return new Promise(function (resolve, reject) {
        $.ajax({
            url: "http://127.0.0.1:8086/menu/queryMenusByRole/" +  roleId,
            type: "GET",
            contentType: "applicatin/json",
            success: function successCallBack(data) {
                resolve(data);
            },
            error: function errorCallBack(xhr) {
                console.log('error');
                reject(xhr);
            }
        });
    });
}

function addSecondMenu(repData) {
	return new Promise(function (resolve, reject) {
		$.ajax({
		    url: "http://127.0.0.1:8086/menu/addSecondMenu",
		    type: "POST",
		    contentType: "application/json;charset=utf-8",
		    data: JSON.stringify(repData),
		    dataType: "json",
		    success: function successCallBack(data) {
		    	resolve(data);
		    },
		    error: function errorCallBack(xhr) {
		    	console.log('error');
		    	reject(xhr);
		    }
		});
	})
}

function addRoleSecondMenu(roleSecMeData) {
	return new Promise(function (resolve, reject) {
		$.ajax({
		    url: "http://127.0.0.1:8086/menu/addRoleSecondMenu",
		    type: "POST",
		    contentType: "application/json;charset=utf-8",
		    data: JSON.stringify(roleSecMeData),
		    dataType: "json",
		    success: function successCallBack(data) {
		    	resolve(data);
		    },
		    error: function errorCallBack(xhr) {
		    	console.log('error');
		    	reject(xhr);
		    }
		});
	})
}

function updateFirstMemu(updFirMenuData) {
	return new Promise(function (resolve, reject) {
		$.ajax({
		    url: "http://127.0.0.1:8086/menu/updateFirstMemu",
		    type: "POST",
		    contentType: "application/json;charset=utf-8",
		    data: JSON.stringify(updFirMenuData),
		    dataType: "json",
		    success: function successCallBack(data) {
		    	resolve(data);
		    },
		    error: function errorCallBack(xhr) {
		    	console.log('error');
		    	reject(xhr);
		    }
		});
	})
}

function deleteFirstMenu(firstMenuId) {
	return new Promise(function (resolve, reject) {
		$.ajax({
	        url: "http://127.0.0.1:8086/menu/deleteFirstMenu/" + firstMenuId,
	        type: "DELETE",
	        contentType: "application/json;charset=utf-8",
	        dataType: "json",
		    success: function successCallBack(data) {
		    	resolve(data);
		    },
		    error: function errorCallBack(xhr) {
		    	console.log('error');
		    	reject(xhr);
		    }
		});
	})
}

function deleteSecondMenu(SecondArray) {
	return new Promise(function (resolve, reject) {
		$.ajax({
		    url: "http://127.0.0.1:8086/menu/deleteSecondMenu",
		    type: "DELETE",
		    contentType: "application/json;charset=utf-8",
		    data: JSON.stringify(SecondArray),
		    dataType: "json",
		    success: function successCallBack(data) {
		    	resolve(data);
		    },
		    error: function errorCallBack(xhr) {
		    	console.log('error');
                reject(xhr);
		    }
		});
	})
}

//根据角色id和二级菜单id删除角色二级菜单表
function deleteRoleSecondMenu(roleSecondArray) {
    return new Promise(function (resolve, reject) {
		$.ajax({
		    url: "http://127.0.0.1:8086/menu/deleteRoleSecondMenu",
		    type: "DELETE",
		    contentType: "application/json;charset=utf-8",
		    data: JSON.stringify(roleSecondArray),
		    dataType: "json",
		    success: function successCallBack(data) {
		    	resolve(data);
		    },
		    error: function errorCallBack(xhr) {
		    	console.log('error');
                reject(xhr);
		    }
		});
	});
}

