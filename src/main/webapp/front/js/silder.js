//图片数组
var imgArr = ['images/silder1.jpg','images/silder2.jpg','images/silder3.jpg','images/silder4.jpg'];
//图片索引数组
var nextArr = [1,2,3,0];
//当前图片数组索引
var currentIndex = 0;
//图片轮播函数
function silder(){
	var silder = $('#silder');
	silder.css('background-image','url("'+imgArr[currentIndex]+'")');
	//修改next图片的数组索引值
	currentIndex=nextArr[currentIndex];
}

//获取主页box内容
/* function getContent(item){
	//获取内容盒子
	var content = $('#box_content');
	//获取当前标签,转换成jquery对象
	var thisTag = $(item);
	if(thisTag.html()=='新闻'){
		content.empty();
		var news = localStorage.getItem('news');
		var newsJson = JSON.parse(news);
		content.html(newsJson.image+newsJson.time);
		alert('新闻');
	}else if(thisTag.html()=='展会'){
		alert('展会');
	}else{
		alert('活动');
	}
} */

$(function(){
	//初始化轮播背景图
	$('#silder').css('background-image','url("images/silder4.jpg")');
	//设置定时器，进行图片轮播
	setInterval(silder,3000);
	//模拟数据库数据集合
	/* var news = {
		image: '<img src="" style="width:20px;height:30px; padding:5px;">',
		time: '2018.03.16',
		content: '“智”向未来—罗森伯格@2018慕尼黑上海电…'
	};
	var jsonNews = JSON.stringify(news);
	localStorage.setItem('news',jsonNews); */
})