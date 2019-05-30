/**
 * 
 */
var nFile = 0;
var displayFileButton = new Array(5);
var attachBtn = null;
var loop = true;

$(function() {
	for(var i = 0;i < 5;i++) {	// 최대 5개까지 허용
		displayFileButton[i] = false;
	}
	attachBtn = document.getElementsByClassName("attachBtn");	// 5개
});

function addFileInput(nAttach) {
	if(nFile >= nAttach) {
		alert("첨부 가능한 파일의 수(" + nAttach + ")를 초과하였습니다.");
		return;
	}
	var index = searchEmptyFileButton();
	addClass(attachBtn[index], "on");
	displayFileButton[index] = true;
	nFile++;
}

function searchEmptyFileButton() {
	var i = 0;
	for(;i < 5;i++) {
		if(displayFileButton[i] == false)
			break;;
	}
	return i;
}

function delFileInput(index) {
	if(index == 0)
		attachBtn[index].children.file1.value = "";
	else if(index == 1)
		attachBtn[index].children.file2.value = "";
	else if(index == 2)
		attachBtn[index].children.file3.value = "";
	else if(index == 3)
		attachBtn[index].children.file4.value = "";
	else
		attachBtn[index].children.file5.value = "";
	removeClass(attachBtn[index], "on");
	displayFileButton[index] = false;
	nFile--;
}

//액션
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