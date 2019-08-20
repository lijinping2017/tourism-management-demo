var scenic;
$(function() {
    var scenicId = getQueryString("id");

    $.ajax({
        url: "http://127.0.0.1:8086/scenic/queryScenicById/" + scenicId,
        ttype: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function successCallBack(data) {
            if(data.success==true && data.data != null){
                scenic = data.data.scenic;
                scenicTitle(scenic);
                orderTitle(scenic);
                introduce(scenic)
            }else{
                alert(data.error);
            }
        },
        error : function(xhr, text, error) {
            alert(data.error);
        }
    });
})

function scenicTitle(scenic) {
    var scenicStr = '';
    scenicStr +=   `<div class="hs-title">
                        <h1>${scenic.name}</h1>
                        <p>${scenic.address}</p>
                    </div>
                    <div class="price">
                        <span>电询</span>
                    </div>
                    <div class="sl">
                        <span>销量：${scenic.tradeVolume}</span><s>|</s><span>满意度：${scenic.satisfaction}</span><s>|</s><span>推荐：</span>
                    </div>
                    <div class="sell-point">
                        <span>景点简介</span>
                        ${scenic.introduce}…              
                    </div>
                    <ul class="msg-ul">
                        <li>
                            <em>景区主题：</em>
                            <p>${scenic.grade}</p>
                        </li>
                        <li>
                            <em>取票方式：</em>
                            <p>${scenic.ticketWay}</p>
                        </li>
                        <li class="mb_0">
                            <em>付款方式：</em>
                            <p>
                                <img src="../res/images/pay_zfb.gif">
                            </p>
                        </li>
                        <li>
                            <em>景点电话：</em>
                            <p>${scenic.telephone}</p>
                        </li>
                    </ul>`;
    $(".focus-slide .imgnav").append(`<img src="http://127.0.0.1:8086/file/downloadFile?filePath=${scenic.scenicImage}" width="460" height="391"/>`)
    $(".cp-show-msg").append(scenicStr);
}    

function orderTitle(scenic) {
    var orderStr = "";
    
    orderStr += `<div class="car-typetable">
                    <table width="100%" border="0">
                        <tbody>
                            <tr>
                                <th width="220" height="40" scope="col"><span class="pl20">成人</span></th>
                                <th width="80" scope="col">原价</th>
                                <th width="80" align="center" scope="col">优惠价</th>
                                <th width="80" scope="col">支付方式</th>
                                <th width="260" scope="col">&nbsp;</th>
                                <th scope="col">&nbsp;</th>
                            </tr>
                            <tr>
                                <td height="40"><strong class="type-tit">景点门票</strong></td>
                                <td align="center"><i class="currency_sy">￥</i>${scenic.originalPrice}</td>
                                <td align="center"><span class="price"><i class="currency_sy">￥</i>${scenic.salePrice}起</span></td>
                                <td><span class="fk-way">全款支付</span></td>
                                <td><span class="s-jf">10分<i></i></span></td>
                                <td><a class="booking-btn" href="../../orderscenic/page/index.html?id=${scenic.id}" data-suitid="2">预订</a></td>
                            </tr>
                            <tr style="display: none">
                                <td colspan="7">
                                    <div class="cartype-nr"></div>
                                </td>
                            </tr>
                            <tr>
                                <th width="220" height="40" scope="col"><span class="pl20">儿童</span></th>
                                <th width="80" scope="col">原价</th>
                                <th width="80" align="center" scope="col">优惠价</th>
                                <th width="80" scope="col">支付方式</th>
                                <th width="260" scope="col">&nbsp;</th>
                                <th scope="col">&nbsp;</th>
                            </tr>
                            <tr>
                                <td height="40"><strong class="type-tit">景点门票</strong></td>
                                <td align="center"><i class="currency_sy">￥</i>${scenic.childPrice}</td>
                                <td align="center"><span class="price"><i class="currency_sy">￥</i>${scenic.childSale}起</span></td>
                                <td><span class="fk-way">全款支付</span></td>
                                <td><span class="s-jf">10分<i></i></span></td>
                                <td><a class="booking-btn" href="../../orderchild/page/index.html?id=${scenic.id}" data-suitid="3">预订</a></td>
                            </tr>
                            <tr style="display: none">
                                <td colspan="7">
                                    <div class="cartype-nr"></div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>`
    $(".tabcon-list.order").append(orderStr);
}

function introduce(scenic) {
    $(".tabcon-list .introduce").append(`<p>　　${scenic.introduce}</p>`);
    $(".tabcon-list .introduce").append("<h2>更多详细景点介绍:</h2>");
    for(var i = 0; i < scenic.imageList.length; i++) {
        var introStr = "";
        introStr += `<p>　　${scenic.imageList[i].fileDesc}</p>
                    <p style="text-align: center;">
                        <img src="http://127.0.0.1:8086/file/downloadFile?filePath=${scenic.imageList[i].filePath}" alt="" title="" width="600" height="330"/>
                    </p>`
        $(".tabcon-list .introduce").append(introStr);
    }
    $(".tabcon-list .orderNotice").append(`<p>${scenic.orderNotice}</p>`);
}
    

