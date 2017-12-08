/**
 * 
 * 命令：是一个用于执行某些特别的功能，可以是后台的，也可以是前台的，
 * 可以执行后跳转网页的，也可以执行完显示执行结果的
 * 
 * 命令格式： 命令关键字 参数
 * 常用的参数可以如下：
 *  --help  显示帮助信息
 * 
 * 
 * 
 * 
 */

var cmd = {};
//命令列表
cmd.commands = [];
//向列表中注册命令
/*cmd.commands["go"] = new go();
cmd.commands["whoami"] = new whoami();
cmd.commands["login"] = new login();
*/
/**
 * 用于注册不跳转网址的命令
 * name：命令的名字
 * url:命令执行时需要后台的服务地址
 * desc:当前命令的简介以及使用方法
 * trueInfo:调用成功时显示的信息
 * falseInfo：调用失败时显示的信息
 */
cmd.registInfoCommand = function(name,url,desc,trueInfo,falseInfo){
	cmd.commands[name] = {};
	cmd.commands[name].name = name;
	cmd.commands[name].url = url;
	cmd.commands[name].desc = desc;
	cmd.commands[name].trueInfo = trueInfo;
	cmd.commands[name].falseInfo = falseInfo;
	cmd.commands[name].execute = function(items){
		var back = {};
		var second = items[1];
		if(second == "--help"){
			return {"info":cmd.commands[name].desc};
		}
		ajax.post(url, param.parseParam(items), function(result){
			back.info = result=="true"?trueInfo:falseInfo;
		});
		return back;
	};
};
//test
cmd.registInfoCommand("login","login2","login登录到后台<br />如: login username=archer password=123","登录成功","登录失败");
/**
 * 用于跳转网址的命令
 * name：命令的名字
 * url:是一个用于网址的匹配符如：username/model/param
 * desc:当前命令的简介以及使用方法
 */
cmd.registUrl = function(name,url,desc){
	cmd.commands[name] = {};
	cmd.commands[name].name = name;
	cmd.commands[name].url = url;
	cmd.commands[name].desc = desc;
	cmd.commands[name].execute = function(items){
		var second = items[1];
		if(second == "--help"){
			return {"info":cmd.commands[name].desc};
		}
		//由于不会返回值，所以只需要调用就行了
		ajax.post(url, items);
		return {"info":"调用成功"};
	};
};

/**
 * 用于前台的命令
 * name：命令的名字
 * desc:当前命令的简介以及使用方法
 * params:简化命令的参数顺序
 */
cmd.registFun = function(name,fun,params,desc){
	cmd.commands[name] = {};
	cmd.commands[name].name = name;
	cmd.commands[name].desc = desc;
	cmd.commands[name].execute = function(items){
		var second = items[1];
		if(second == "--help"){
			return {"info":cmd.commands[name].desc};
		}
		return fun(items);
	};
};
//test
cmd.registFun("go",
		function(items){
			window.location = param.parseUrl("username/model", param.parseParam(items,["username","model"]));
		},
		"go命令<br />username:指定用户 <br/>model:指定模块,进入admin的index页面，如：<br />go username=admin model=index"+
		"<br />简化命令参数顺序：username,model");
cmd.registFun("showmodels",function(items){
	return {"info":models};
},"用于显示当前系统的所有模块");
cmd.registFun("calc",function(items){
	var aa = eval(items[1]);
	return {"info":aa};
},"用于显示当前系统的所有模块");
//用于将参数进行解析
var param = {};
/**
 * 将参数解析并返回一个数组
 * params:简化命令的参数顺序
 */
param.parseParam = function(items,params){
	var result = {};
	//items 第一个是命令关键字
	//如果使用的是简化命令
	if(items[1].split("=").length == 1){
		for(var i = 0;i<params.length;i++){
			result[params[i]] = items[i+1];
		}
	}else{
		for(var i = 1;i<items.length;i++){
			var item = items[i].split("=");
			result[item[0]] = item[1];
		}
	}
	return result;
}
/**
 * 将参数和url进行绑定，如：
 * username/model  archer,index
 * 结果：archer/index
 */
param.parseUrl = function(url,params){
	var urls = url.split("/");
	for(var i = 0;i<urls.length;i++){
		url = url.replace(urls[i],params[urls[i]]);
	}
	return url;
}









//已经使用命令列表
cmd.passcmds = [];
cmd.addPassCmd = function(command){
	cmd.passcmds.push(command);
}
cmd.passindex = 0;
cmd.getPrevCmd = function(){
	cmd.passindex = cmd.passindex<=0?0:cmd.passindex-1;
	return cmd.passcmds[cmd.passindex];
}
cmd.getNextCmd = function(){
	cmd.passindex = cmd.passindex>=cmd.passcmds.length-1?cmd.passcmds.length-1:cmd.passindex+1;
	return cmd.passcmds[cmd.passindex];
}
//解析并执行命令
cmd.parse = function(str){
	var items = str.split(/\s+/);
	var command = cmd.commands[items[0]];
	return command != null?command.execute(items):{info:"未识别命令："+items[0]};
}
/**
 * go 命令 作用是跳转到指定用户的指定模块
 * itmes[0]:命令也就是go
 * itmes[1]:用户名
 * itmes[2]:模块名
 * @returns {go}
 */
function go(){
	this.url = "{username}/{model}";
	this.execute = function(items){
		var url = this.url;
		if(items.length==1){
			throw "go 命令作用是跳转到指定用户的指定模块 <br /> 语法:go username [model] <br /> username:用户名 <br /> model:模块名,可选,不使用时默认index";
		}
		if(check.checkUserName(items[1])){
			url = url.replace("{username}", items[1])
		}else{
			throw "用户名"+items[1]+"不存在";
		}
		if(items[2] == null){
			url = url.replace("{model}", "index");
		}else{
			if(check.checkModel(items[2])){
				url = url.replace("{model}", items[2]);
			}else{
				throw "模块"+items[2]+"不存在";
			}
		}
		return {"url":url};
	}
}
function whoami(){
	this.execute = function(items){
		return {"info":get.getCurrentUserName()};
	}
}
function login(){
	this.execute = function(items){
		return {"info":check.checkLogin(items)};
	}
}
/**
 * ajax模块
 */
var ajax = {};
ajax.post = function(url,data,success,async,dataType){
	$.ajax({
		"type" : 'POST',
		"url" : url,
		"data" : data,
		"async" : async==null?false:async,
		"success" :success,
		"dataType" : dataType==null?"text":dataType
	});
}
/**
 * 检测模块
 */
var check = {};
/**
 * 检测用户是否存在
 */
check.checkUserName = function(username){
	var result = false;
	ajax.post("checkUserName", {"username":username}, function(data){
		result = data == "true"?true:false;
	});
	return result;
}
/**
 * 检测是否可以登录成功
 */
check.checkLogin = function(items){
	var result = "登录失败";
	ajax.post("login2", {"username":items[1],"password":items[2]}, function(data){
		result = data == "true"?"登录成功":result;
	});
	return result;
}
/**
 * 检测模块是否存在
 */
var models = ["index","journal","message","photo","contact","talk"];
check.checkModel = function(model){
	return check.contains(models,model);
}

check.contains = function(items,item){
	var result = false;
	for(var i = 0;i<items.length;i++){
		if(item == items[i]){
			result = true;
			break;
		}
	}
	return result;
}
/**
 * 查询模块
 */
var get = {};
get.getCurrentUserName = function(){
	var result = "没有用户登录";
	ajax.post("getCurrentUserName", null, function(data){
		result = data == "null"?result:data;
	});
	return result;
}
//是否接受输入
cmd.enable = false;
//用于输入命令的界面
cmd.command = null;
cmd.init = function(command){
	cmd.command = $(command);
	$(document).keydown(
		function(event) {
			if (cmd.enable){
				var code = event.keyCode;
				console.log(code);
				var command = $("#commands h4:last .callable").html();
				if(event.shiftKey){
					if(code == 56){
						command += "*";
					}else if(code == 187){
						command += "+";
					}else if(code == 191){
						command += "/";
					}else if(code == 57){
						command += "(";
					}else if(code == 48){
						command += ")";
					}else if(code == 53){
						command += "%";
					}
					$("#commands h4:last .callable").html(
							command.toLocaleLowerCase());
				}else{
					if (code == 13){
						try {
							// 解析命令并得到url
							var result = cmd.parse(command.trim());
							// 记录执行过的命令
							cmd.addPassCmd(command.trim());
							// 设置使用命令的下标为最一个条命令
							cmd.passindex = cmd.passcmds.length;
							if (result.url != null) {
								window.location = result.url;
								$("#command").modal("hide");
							} else {
								// 如果不是得到执行的url就是需要显示的信息
								throw result.info;
							}

						} catch (err) {
							// 获得空白命令行
							var blank = $("#commands h4:last").clone();
							blank.children(".callable").html("");
							// 将错误信息显示
							var errRow = blank.clone();
							errRow.children(".callable").html(
									"<span style='color:orange;' >系统提示</span>：<p style='margin-left:25px;'>"
											+ err + "</p>");
							errRow.appendTo("#commands");
							// 创建新的空白命令行
							blank.appendTo("#commands");
						}
					} else if (code == 8) {
						command = command.substr(0, command.length - 1);
						$("#commands h4:last .callable").html(
								command.toLocaleLowerCase());
						return false;
					} else if (code == 38) {
						// 上
						$("#commands h4:last .callable").html(cmd.getPrevCmd());
					} else if (code == 40) {
						// 下
						$("#commands h4:last .callable").html(cmd.getNextCmd());
					} else if (code == 37 || code == 39) {
						// 忽略左右键盘
						return false;
					} else {
						var chars = {
							189 : "-",
							187 : "="
						};
						if (chars[code] != null) {
							command += chars[code];
						} else {
							command += String.fromCharCode(event.keyCode);
						}
						$("#commands h4:last .callable").html(
								command.toLocaleLowerCase());
					}
				}
			}
		});
}
