$(function() {
	debugger;
	line();
	hotel();
	scenic();
})

function line() {
	$.ajax({
		url: "http://127.0.0.1:8086/line/queryLineAll",
	    type: "GET",
	    contentType: "application/json;charset=utf-8",
	    dataType: "json",
		success: function successCallBack(data) {
			if(data.success==true && data.data != null){
				allLine = data.data;
				for(var i = 0; i < allLine.length; i++) {
					var imgsrc = "http://127.0.0.1:8086/file/downloadFile?filePath=" + data.data[i].lineImage;
					var lineStr = "";
					lineStr = `	<li>
					                <div class="pic">
					                    <img class="fl" src="${imgsrc}" alt="${data.data[i].name}" width="285" height="190" />
					                    <div class="buy">
					                        <a href="../../lineshow/page/index.html?id=${data.data[i].id}" target="_blank">立即预订</a>
					                    </div>
					                </div>
					                <div class="js">
					                    <a class="tit" href="../../lineshow/page/index.html?id=${data.data[i].id}" target="_blank">${data.data[i].name}</a>
					                    <p class="attr">
					                    </p>
					                    <p class="num">
					                        <del>原价：<i class="currency_sy">￥</i>${data.data[i].originalPrice}</del>
					                        <span><b>优惠价￥${data.data[i].salePrice}</b></span>
					                    </p>
					                </div>
					            </li>`
					$(".line .st-cp-list").append(lineStr);	
				}
			}else{
				alert(data.error);
			}
		},
		error : function(xhr, text, error) {
			alert(data.error);
		}
	});
}

function hotel() {
		$.ajax({
		url: "http://127.0.0.1:8086/hotel/queryHotelAll",
	    type: "GET",
	    contentType: "application/json;charset=utf-8",
	    dataType: "json",
		success: function successCallBack(data) {
			if(data.success==true && data.data != null){
				allHotel = data.data;
				for(var i = 0; i < allHotel.length; i++) {
					var imgsrc = "http://127.0.0.1:8086/file/downloadFile?filePath=" + data.data[i].hotelImage;
					var hotelStr = "";
					hotelStr += `<li>
                                <div class="pic">
                                    <img class="fl" src="${imgsrc}" alt="${data.data[i].name}" width="285" height="190" />
                                    <div class="buy">
                                        <a href="../../hotelshow/page/index.html?id=${data.data[i].id}" target="_blank">立即预订</a>
                                    </div>
                                </div>
                                <div class="js">
                                    <a class="tit" href="../../hotelshow/page/index.html?id=${data.data[i].id}" target="_blank">${data.data[i].name}</a>
                                    <span>${data.data[i].homeType}</span>
                                    <p class="num">
					                    <del>原价：<i class="currency_sy">￥</i>${data.data[i].originalPrice}</del>
				                        <span><b>优惠价￥${data.data[i].salePrice}</b></span>
					                </p>
                                </div>
                            </li>`
					$(".hotel .st-cp-list").append(hotelStr);	
				}
			}else{
				alert(data.error);
			}
		},
		error : function(xhr, text, error) {
			alert(data.error);
		}
	});
}

function scenic() {
	$.ajax({
		url: "http://127.0.0.1:8086/scenic/queryScenicAll",
	    type: "GET",
	    contentType: "application/json;charset=utf-8",
	    dataType: "json",
		success: function successCallBack(data) {
			if(data.success==true && data.data != null){
				allScenic = data.data;
				for(var i = 0; i < allScenic.length; i++) {
					var imgsrc = "http://127.0.0.1:8086/file/downloadFile?filePath=" + data.data[i].scenicImage;
					var scenicStr = "";
					scenicStr += `	<li>
		                                <div class="pic">
		                                    <img class="fl" src="${imgsrc}" alt="${data.data[i].name}" width="285" height="190" />
		                                    <div class="buy">
		                                        <a href="../../showscenic/page/index.html?id=${data.data[i].id}" target="_blank">立即预订</a>
		                                    </div>
		                                </div>
		                                <div class="js">
		                                    <a class="tit" href="../../showscenic/page/index.html?id=${data.data[i].id}" target="_blank">${data.data[i].name}</a>
		                                    <p class="num">
		                                        <del>原价：<i class="currency_sy">￥</i>${data.data[i].originalPrice}</del>
		                                        <span>
		                                            <b><i class="currency_sy">优惠价￥</i>${data.data[i].salePrice}</b>
		                                        </span>
		                                    </p>
		                                </div>
		                            </li>`
					$(".scenic .st-cp-list").append(scenicStr);	
				}
			}else{
				alert(data.error);
			}
		},
		error : function(xhr, text, error) {
			alert(data.error);
		}
	});
}




