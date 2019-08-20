var roleId = "";
var selectedUserRoleNode = undefined;   //当前选中的用户角色节点

function deleteUserRole() {
	if(selectedUserRoleNode) {
		var userArray = [];
		var userId = selectedUserRoleNode.secondId;
		var tempObj = {};
		tempObj.roleId = "999";
		tempObj.id = userId;
		userArray.push(tempObj);

		updataUserRoleId(userArray).then(function (data) {
			$("#role-user-tree-box").html("");
			var roleId = checkRoleId();
			if(roleId != null) {
				queryUserAll().then(function (userData) {
					queryRoleAll().then(function (roleData) {
						pnotify("成功", "用户移除角色成功", "success");
						var userTreeData = combineUser(userData.data,roleData.data);
						transformJsonkey(userTreeData);
						if(userTreeData.length > 0) {
							$.fn.zTree.init($("#role-user-tree-box"), userRoleSetting, userTreeData);
						}else {
							$("#role-user-tree-box").html("暂无用户")
						}
						$("#check-user-tree-box").html("");
					}).catch(function (error) {
						pnotify("失败", "用户移除角色失败", "error");
					});
				}).catch(function (error) {
					console.log(error);
				});
		    }
		}).catch(function (error) {
			console.log(error);
		});
	}
}

var userRoleSetting = {
	callback: {
		onClick: function onClick(event, treeId, treeNode) {
			if(treeNode.type == "branch") {
				$(".user-role").attr("disabled","disabled").css("background-color","#808080c9");
				$(".add-user").removeAttr("disabled").css("background-color","#33d41d");
			}else{
				$("#check-user-tree-box").html("");
				$(".user-role").removeAttr("disabled").css("background-color","#33d41d");
				$(".add-user").attr("disabled","disabled").css("background-color","#808080c9");
			}
			selectedUserRoleNode = treeNode;
			var childrenArray = selectedUserRoleNode.children;
			console.log(treeNode);
			if(selectedUserRoleNode && selectedUserRoleNode.type == "branch") {
				queryUserAll().then(function (userData) {
					var checkTreeData = formatCheckTree(userData.data,childrenArray);
					transformJsonkey(checkTreeData);
					if(checkTreeData.length > 0) {
						$("#check-user-tree-box").html("");
						$.fn.zTree.init($("#check-user-tree-box"), checkTreeSetting, checkTreeData);
					}else {
						$("#check-user-tree-box").html("暂无用户")
					}
				}).catch(function (error) {
					console.log(error);
				});
			}
			return false;
		}
	}
};

var checkTreeSetting = {
	check: {
		enable: true,
		chkDisabledInherit: true
	},
	callback: {
		onClick: function onClick(event, treeId, treeNode) {
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
		}else {
			item.isParent = false;
			item.type = "leaf";
		}
	});
}


function formatCheckTree(allUserObj,childrenArray) {
	allUserObj.map(function(item,index) {
		for(var i = 0; i < childrenArray.length; i++) {
			if(item.roleId == childrenArray[i]["roleId"]) {
				item.chkDisabled = true;
				break;
			}
		}
	});
	return allUserObj;
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

$(function() {
	refresh();
});

function refresh() {
	var roleId = checkRoleId();
	if(roleId != null) {
		$(".user-role").attr("disabled","disabled").css("background-color","#808080c9");
		$(".add-user").attr("disabled","disabled").css("background-color","#808080c9");
		queryUserAll().then(function (userData) {
			queryRoleAll().then(function (roleData) {
				var userTreeData = combineUser(userData.data,roleData.data);
				transformJsonkey (userTreeData);
				if(userTreeData.length > 0) {
					$.fn.zTree.init($("#role-user-tree-box"), userRoleSetting, userTreeData);
				}else {
					$("#role-user-tree-box").html("暂无用户")
				}
			}).catch(function (error) {
				console.log(error);
			});
		}).catch(function (error) {
			console.log(error);
		});
    }
}

function combineUser(allUserObj,allRoleObj) {
	var firstObj = allRoleObj;
	var secondObj = allUserObj;
	var newUser = [];
	var firstArryIndex = {};
	firstObj.map(function(item,index) {
		var tempObj = $.extend(true,{},item);
		tempObj.firstId = item.id;
		delete tempObj.id;
		tempObj.children = [];
		newUser.push(tempObj); 
		for(var i = 0; i < secondObj.length; i++) {
			if(tempObj.firstId == secondObj[i]["roleId"]) {
				var tempSecondObj = $.extend(true,{},secondObj[i]);
				tempSecondObj.secondId = tempSecondObj.id;
				delete tempSecondObj.id;
				tempObj.children.push(tempSecondObj);
			}
		}
	});
	return newUser;
}

function addUserRole() {
	var treeObj = $.fn.zTree.getZTreeObj("check-user-tree-box");  
	var checkNodes = treeObj.getCheckedNodes(true);  //获取所有选择的节点集合

	if(selectedUserRoleNode) {
		var recordArray = [];
		var roleId = selectedUserRoleNode.firstId;
		checkNodes.map(function(item,index){
			var tempObj = {};
			tempObj.roleId = roleId;
			tempObj.id = item.id;
			recordArray.push(tempObj);
		});

		updataUserRoleId(recordArray).then(function (requestdata) {
			if(requestdata.success == true) {
				pnotify("成功", "添加用户角色成功", "success");
			}else{
				pnotify("失败", "添加用户角色失败", "error");
			}
			$("#check-user-tree-box").html("");
			refresh();  	
		});
	}
}

function queryUserAll() {
	return new Promise(function (resolve, reject) {
		$.ajax({
			url: "http://127.0.0.1:8086/user/queryUserAll",
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

function queryRoleAll() {
	return new Promise(function (resolve, reject) {
		$.ajax({
			url: "http://127.0.0.1:8086/role/queryRoleAll",
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

function updataUserRoleId(repData) {
	return new Promise(function (resolve, reject) {
		$.ajax({
		    url: "http://127.0.0.1:8086/user/updataUserRoleId",
		    type: "POST",
		    contentType: "application/json;charset=utf-8",
		    data: JSON.stringify(repData),
		    dataType: "json",
		    success: function successCallBack(data) {
		    	resolve(data);
		    },
		    error: function errorCallBack(xhr) {
		    	reject(data);
		    }
		});
	})
}


