//文档加载函数
$(function(){
	//初始化菜单菜单事件
	$('#pointer>a').click(function(){
		var tag = $('#right-menu').css('display');
		if(tag == 'none'){
			$('#pointer>a').attr('class','glyphicon glyphicon-remove point-color');
		}else{
			$('#pointer>a').attr('class','glyphicon glyphicon-menu-hamburger point-color');
		}
		$('#right-menu').animate({width:'toggle'},'1000');
		
	})
})
