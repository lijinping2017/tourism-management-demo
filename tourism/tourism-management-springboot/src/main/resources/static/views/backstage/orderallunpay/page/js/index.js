$(function() {
	//导航选中
	$(".tabnav span[data-type='all']").removeClass("on");
	$(".tabnav span[data-type='unpay']").addClass('on');
	//订单类型切换
	$(".tabnav span").click(function(){
	    var orderType = $(this).attr('data-type');
	    if(orderType == "all") {
	        window.location.href = "../../orderall/page/index.html";	
	    }
	    else if(orderType == "unpay") {
	    	window.location.href = "../../orderallunpay/page/index.html";
	    } 

	})
	refresh();
})

function refresh() {
	var user = getCookie("user");
	var userObj = JSON.parse(user);
	$.ajax({
		url: "http://127.0.0.1:8086/order/queryOrderAll",
	    type: "GET",
	    contentType: "application/json;charset=utf-8",
	    dataType: "json",
		success: function successCallBack(data) {
			if(data.success==true && data.data != null && data.data[0].userId == userObj.id){
				allOrder = data.data;
				queryorderall(allOrder);
			}else{
				pnotify("还没有预订任何订单！","查看订单失败");
			}
		},
		error : function(xhr, text, error) {
			pnotify("还没有预订任何订单！","查看订单失败");
		}
	});
}


function queryorderall(allOrder) {
    var dttable = $('#all-order-table').dataTable();
    dttable.fnClearTable();//清空数据.fnClearTable();//清空数据
    dttable.fnDestroy(); //还原初始化了的datatable
    var dataArray = [];
    var imgsrc = "";
    for (var i = 0; i < allOrder.length; i++) {
    	if(allOrder[i].status == "等待付款") {
    		var imgsrc = "http://127.0.0.1:8086/file/downloadFile?filePath=" + allOrder[i].imagePath;
    		var orderData = {};
    		var a = "";

    		if(allOrder[i].type == "scenic") {
    		    if(allOrder[i].adult == 'true') {
    		        allOrder[i].type = "成人门票";
    		        a = "http://127.0.0.1:8086/views/frontmana/showscenic/page/index.html?id=" + allOrder[i].productId;
    		    }else{
    		        allOrder[i].type = "儿童门票"; 
    		        a = "http://127.0.0.1:8086/views/frontmana/showscenic/page/index.html?id=" + allOrder[i].productId;
    		    }
    		}
    		else if(allOrder[i].type == "hotel") {
    		    allOrder[i].type = "酒店住宿房";
    		    a = "http://127.0.0.1:8086/views/frontmana/hotelshow/page/index.html?id=" + allOrder[i].productId;
    		}
    		else if(allOrder[i].type == "line") {
    		    allOrder[i].type = "线路门票";
    		    a = "http://127.0.0.1:8086/views/frontmana/lineshow/page/index.html?id=" + allOrder[i].productId;
    		}

    		orderData.code = allOrder[i].id;
    		orderData.name = allOrder[i].name;
    		orderData.date = allOrder[i].orderTime;
    		orderData.type = allOrder[i].type;
    		orderData.money = allOrder[i].totalMoney;
    		orderData.orderImg = imgsrc;
    		orderData.status = allOrder[i].status;
    		orderData.href = a;
    		orderData.id = allOrder[i].id
    		dataArray.push(orderData);
    	}
    }

    dttable = $('#all-order-table').DataTable( {
        "deferRender": true,
        data: dataArray,
        "columns": [
            { 
                "className": 'num',
                "data": null,
                "width": "30px" 
            },
            { 
                "className": 'orderImg',
                "data": null,
                "orderable": false,
                "width": "100px", 
                "targets" : 1,
                "render" : function(data, type,row) {
                    var html = "";
                    html += '<a href="'+ row.href +'" target="_blank">'+
                                '<img src="'+ row.orderImg +'" alt="">'+
                            '</a>';
                    return html;
                }
            },
            { 
                "data": null,
                "className": 'tit',
                "orderable": false,
                "width": "250px", 
                "targets" : 2,
                "render" : function(data, type,row) {
                    var html = "";
                    html = '<a href="'+ row.href +'" target="_blank">' + row.name +'</a>'
                           +'<p>订单编号：' + row.code +'</p>'
                           +'<p>下单时间：' + row.date + '</p>'
                           +'<p>产品类型：' + row.type +'</p>';
                    return html;
                }
            },
            { 
                "data": null,
                "className": 'order-td',
                "orderable": false,
                "width": "100px", 
                "targets" : 3,
                "render" : function(data, type,row) {
                    var money = "";
                    html = '<i class="currency_sy">￥</i><span class="order-td"> ' + row.money + '</span>';
                    return html;
                }
            },
            { 
                "data": null,
                "className": 'order-td',
                "orderable": false,
                "width": "100px", 
                "targets" : 4,
                "render" : function(data, type,row) {
                    var status = "";
                    html = '<span> ' + row.status + '</span>';
                    return html;
                }
            },
            {
                "className": 'order-td ',
                "orderable": false,
                "data": null,
                "defaultContent": '',
                "width": "80px",
                "targets" : 5,
                "render" : function(data, type,row) {
                    var id = '"' + row.code + '"';
                    var html = "<a class='now-fk' href='http://127.0.0.1:8086/views/backstage/orderquery/page/index.html?id="+ row.id +"'>立即付款</a>"
                    html += "<a orderid='"+row.id +"' class='cancel_order now-dp' style='background:#ccc' href='javascript:;' data-orderid='37' onclick='del(event);'>取消</a>"
                    html += "<a class='order-ck' href='http://127.0.0.1:8086/views/backstage/orderquery/page/index.html?id="+ row.id +"'>查看订单</a>"
                    return html;
                    
                }
            }
        ],
        "columnDefs": [ 
            {
                "searchable": false,
                "orderable": false,
                "targets": 0
            }
        ],
        "order": [[1, 'asc']],
        "iDisplayLength": 5,//单页显示条数
        "lengthMenu": [
            [ 2, 3,5,10, 25, 50, -1 ],
            [ '2行', '3行', '5 行', '10 行', '25 行', '50 行',  '显示所有' ]
        ],
        "language": {
            "sProcessing": "表格排版中",
            "lengthMenu": "每页显示 _MENU_ 记录",
            "emptyTable": "没有记录",
            "zeroRecords": "没有匹配的记录",
            "paginate": {
                "first": "首页",
                "last": "末页",
                "next": "下一页",
                "previous": "上一页"
            },
            "loadingRecords": "数据加载中，请等待",
            "sInfoFiltered": " - (筛选自 _MAX_ 条记录)",
            "sInfo": "第 _PAGE_ 页，共 _PAGES_ 页 / _TOTAL_ 条记录",
            "sInfoEmpty": "0 条记录",
            "sSearch": "搜索"
        },  
        'fnDrawCallback': function(table) {       //页面跳转
            $("#all-order-table_paginate").append("<div style='display:inline-block;float:right;margin-top:4px;margin-left:10px;'>  跳转到第 <input type='text' class='changePage input-text' style='width:40px;height:22px'> 页 <a class='dataTable-btn btn btn-default shiny btn-sm' href='javascript:void(0);' style='text-align:center'>确认</a></div>");   
            var oTable = $("#all-order-table").dataTable();    
            $('#all-order-table_paginate .dataTable-btn').click(function(e) {    
                if($("#all-order-table_paginate .changePage").val() && $("#all-order-table_paginate .changePage").val() > 0) {    
                    var redirectpage = $("#all-order-table_paginate .changePage").val() - 1;    
                } else {    
                    var redirectpage = 0;    
                }    
                oTable.fnPageChange(redirectpage);    
            }); 
        }
    } );

    dttable.on( 'order.dt search.dt', function () {
        dttable.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();
}


function del(event) {
	var orderid = $(event.target).attr("orderid");
	var reqData = {
        id: orderid,
        status: "订单已取消"
    };

    $.ajax({
        url: "http://127.0.0.1:8086/order/updateOrder",
        type: "POST",
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(reqData),
        success: function successCallBack(data) {
            if(data.success==true){
            	$(".user-home-order table .orderList").html("");
            	refresh();
            }else{
            	alert("取消订单失败！")
            }
        },
        error : function(xhr, text, error) {
        	alert("取消订单失败！")
        }
    });
}


	


