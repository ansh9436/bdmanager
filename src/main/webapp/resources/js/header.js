/**
 * 
 */
$(function() {
	var ctx = getContextPath();
	getMenuInfo();
	
	var gnbArea = document.getElementById("gnb");
	var menuItemAll = gnbArea.getElementsByTagName("li");
	var menuItem = new Array();
	var currentItem, prevItem;
	
	for(i=0;i<menuItemAll.length;i++){
		if((menuItemAll[i].className).indexOf("item") > -1){
			menuItem.push(menuItemAll[i]);
		}
	}
	
	for(i=0;i<menuItem.length;i++){
		var link = menuItem[i].getElementsByTagName("a")[0];
		var layer = menuItem[i].getElementsByTagName("div")[0];
		var subLinks = menuItem[i].getElementsByTagName("div")[0].getElementsByTagName("a");

		link.onmouseover = layer.onmouseover = link.onfocus = function(e){
			currentItem = this.parentNode;
			if(prevItem){
				removeClass(prevItem,"on");
			}
			addClass(currentItem,"on");
			prevItem = currentItem;
		}
		link.onmouseout = layer.onmouseout = function(e){
			removeClass(this.parentNode,"on");
		}
		link.onkeydown = function(e){
			if (event.shiftKey && event.keyCode == 9){
				removeClass(this.parentNode,"on");
			}
		}
		for(j=0;j<subLinks.length;j++){
			subLinks[subLinks.length-1].onblur = function(e){
				removeClass(this.parentNode.parentNode.parentNode.parentNode,"on");
			}
		}
	}

	function getMenuInfo() {
		$.get(ctx + "/manager/getMenuInfo", function(data, status) {
			var str = "";
			$(data).each(
				function() {
					str += "<li><a href='" + ctx + "/article/list?board_id=" + this.board_id + "'>" + this.board_name + "</a></li>";
			});
			$('#subGnb1').html(str);
//			alert("Data: " + data + "\nStatus: " + status);
		});
	}
	
	function getContextPath() {
    	return sessionStorage.getItem("contextpath");
    }
	
	// 액션
	function addClass(ele, cls){
		var eleCln = ele.className;
		if(eleCln.indexOf(cls) == -1){
			ele.className = eleCln + " " + cls;
		}
	}

	function removeClass(ele, cls){
		var eleCln = ele.className;
		ele.className = eleCln.split(" " + cls)[0];
	}
});