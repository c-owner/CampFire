/**
 * 
 */

var replyService = (function(){
	function getList(reply, callback, error){
		$.getJSON("/guideReplies/guideReplyList/"+reply.bno+"/"+reply.page+".json", 
			function(data){
				if(callback){
					callback(data.total, data.guideBoardReplyList);
				}
			}).fail(function(xhr, status, err){
			if(error){error(err);}
		});
	}
	
	function timeForToday(value) {
		const today = new Date();
		const timeValue = new Date(value);
		
		const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
		if (betweenTime < 1) return '방금전';
		if (betweenTime < 60) {
			return betweenTime+'분 전';
		}
		
		const betweenTimeHour = Math.floor(betweenTime / 60);
		if (betweenTimeHour < 24) {
			return betweenTimeHour+'시간 전';
		}
		
		const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
		if (betweenTimeDay < 365) {
			return betweenTimeDay+'일 전';
		}
		
		return Math.floor(betweenTimeDay / 365)+'년 전';
	}
	
	function add(reply, callback, error){
		$.ajax({
			type: "post",
			url: "/guideReplies/guideReplyWrite",
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result){
				if(callback){callback(result);}
			},
			error: function(xhr, status, err){
				if(error){error(err);}
			}
		});
	}
	
	function get(rno, callback, error){
		$.get("/guideReplies/"+rno+".json", function(data){
			if(callback){callback(data);}
		}).fail(function(xhr, status, err){
			if(error){error(err);}
		});
	}
	
	function remove(rno, callback, error){
		$.ajax({
			type: "delete",
			url: "/guideReplies/"+rno,
			success: function(result){
				if(callback){callback(result);}
			},
			error: function(xhr, status, err){
				if(error){error(err);}
			}
		});
	}
	
	function modify(reply, callback, error){
		console.log(reply);
		$.ajax({
			type: "patch",
			url: "/guideReplies/"+reply.rno,
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result){
				if(callback){callback(result);}
			},
			error: function(xhr, status, err){
				if(error){error(err);}
			}
		});
	}
	
	return {getList: getList,
			timeForToday: timeForToday,
			add: add,
			get: get,
			remove: remove,
			modify: modify}
})();