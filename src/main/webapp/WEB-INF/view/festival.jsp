<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	 $.ajax({          
         url: '${cp}/post/ImageBoard',
         dataType: 'json',
         success: function(msg){
             console.log(msg.response.body.items.item);
             var myItem = msg.response.body.items.item;
             
             for(var i=0; myItem.length; i++){
                 var output = '';
                 console.log(myItem.length);
                 output += '<h3>'+ i + '번째 서울 축제 데이터' +'</h3>';
                 output += '<h4>'+myItem[i].addr1+'</h4>';
                 output += '<h4>'+myItem[i].title+'</h4>';
                 output += '<h4>'+myItem[i].tel+'</h4>';
                  document.body.innerHTML += output;
             }
         }
     });    

});


function boardPagingListAjaxHtml(board_id, page, pageSize) {
	$.ajax({
		url : "${pageContext.request.contextPath}/board/boardPagingAjaxHtml",
		data : "board_id=" + board_id + "&page=" + page + "&pageSize=" + pageSize,
		success : function(data) {
			var html = data.split("SEPERATORSEPERATOR");

			$('#boardListTbody').html(html[0]);
			$('.pagination').html(html[1]);

		},
		error : function(status) {
		}
	});

}
</script>
</head>
<body>
<button type="button" id="btn">123</button>
	<ul id="productList" class="baby-product-list">

		

		<li class="baby-product renew-badge " id="">
			<a
			class="baby-product-link"
			href="/vp/products/166996432?itemId=478240933&amp;vendorItemId=4200250100&amp;sourceType=CAMPAIGN&amp;campaignId=82&amp;categoryId=194176"
			style="height: 300px;">
				<dl class="baby-product-wrap" style="height: 300px;">
					<dt class="image">
						<img
							src="//thumbnail11.coupangcdn.com/thumbnails/remote/230x230ex/image/product/image/vendoritem/2018/12/26/4200250100/a4cbb40d-fc85-446b-a88c-dc7b7a26e720.jpg"
							width="100%" alt="곰곰 2018년 소중한 우리 쌀, 10kg, 1개">
					</dt>
					<dd class="descriptions">
						<div class="badges"></div>
						<div class="name">곰곰 2018년 소중한 우리 쌀, 10kg, 1개</div>
					</dd>
				</dl>
			</a>
		</li>

	</ul>



</body>
</html>