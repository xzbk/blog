<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>index</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
		<link rel="stylesheet" type="text/css" href="css/right_menu.css"/>
		<script src="js/jquery-2.0.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/main.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
		<span id="top"></span><!--回到顶部标签标志位置-->
		<!--右侧菜单部分-->
		<div id="pointer" >
			<a class="glyphicon glyphicon-menu-hamburger point-color"></a><!--菜单指针-->
		</div>
		<div id="rtnTop">
			<a href="#top" class="glyphicon glyphicon-arrow-up point-color"></a><!--回到顶部-->
		</div>
		<!--右侧滑动菜单-->
		<div id="right-menu">
			<div id="menu-head" class="text-center">
				<img src="images/header.png" class="menu-head-img"/>
				<div id="menu-name">
					Xiao&nbsp;Z
				</div>
				<div id="menu-detail">
					<ul class="list-inline">
						<li>
							<a href="#">
								<span class="menu-detail-count">40</span><br />
								<span>日志</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="menu-detail-count">10</span><br />
								<span>分类</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="menu-detail-count">20</span><br />
								<span>标签</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<!--日志微博链接-->
			<div class="links-of-author">
                  <span class="links-of-author-item">
                    <a href="#" target="_blank" title="GitHub">
                        <i class="fa"></i>GitHub
                    </a>
                </span>
                <span class="links-of-author-item">
                    <a href="#" target="_blank" title="Weibo">
                        <i class="fa fa-fw fa-weibo"></i>Weibo
                    </a>
                </span>
           </div>
            <!--自定义链接地址-->
            <div class="links">
            	<div class="links-title">
	            	<span class="glyphicon glyphicon-link"></span>
	            	<span>Links</span>
            	</div>
            	<ul class="links-list">
                  <li class="links-list-item">
                    <a href="http://fnine59.top/" title="59's Personal Blog" target="_blank">59's Personal Blog</a>
                  </li>
                  <li class="links-list-item">
                    <a href="http://www.jq22.com/" title="jQuery插件库" target="_blank">jQuery插件库</a>
                  </li>
              </ul>
            </div>
		</div>
		<!--网页部分 header body footer-->
		<div id="container">
			<header class="text-center">
				<a href="https://github.com/xzbk">
					<img style="position: absolute; top: 0; left: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_left_darkblue_121621.png" alt="Fork me on GitHub">
				</a>
				<div id="header_content" class="wid">
					<div id="title" class="text-center">
						Xiao&nbsp;Z
					</div>
					<div id="signature">
						胸有惊雷而面如平湖者，可拜上将军。
					</div>
					<nav> 
						<ul class="list-inline">
							<li>
								<a href="">
									<span class="glyphicon glyphicon-home"></span>
									<br />
									首页
								</a>
							</li>
							<li>
								<a href="">
									<span class="glyphicon glyphicon-tags"></span>
									<br />
									标签
								</a>
							</li>
							<li>
								<a href="">
									<span class="glyphicon glyphicon-th"></span>
									<br />
									分类
								</a>
							</li>
							<li>
								<a href="">
									<span class="glyphicon glyphicon-folder-close"></span>
									<br />
									归档
								</a>
							</li>
							<li>
								<a href="">
									<span class="glyphicon glyphicon-user"></span>
									<br />
									关于
								</a>
							</li>
							<li>
								<a href="">
									<span class="glyphicon glyphicon-search"></span>
									<br />
									搜索
								</a>
							</li>
						</ul>
					</nav>
				</div>
			</header>
			<div id="body">
				<div class="wid text-center">
					<div id="tags-title">
						<h1>tags</h1>
						<span class="totaltags">目前共计&nbsp;20&nbsp;个标签</span>
					</div>
					<div id="tags-body">
						<div class="tag-cloud-tags">
			              
			            </div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
