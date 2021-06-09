/**
 * review REPLY MODULE.......... 
 */


var replyService = (function(){
	
	function add(reply, callback, error){
		$.ajax({
			type: "post",
			url: "/reviewReplies/write",
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result){
				if(callback){
					callback(result);
				}	
			},
			error: function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}	
	
	function getList(reply, callback, error){
		$.getJSON("/reviewReplies/reviewReplyList/"+reply.bno+"/"+reply.page+".json", 
			function(data){
				if(callback){
					callback(data.replyCnt, data.reviewList);
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
	
	// 댓글 삭제
	function remove(rno, callback, error) {
		$.ajax({
			type:"delete",
			url:"/reviewReplies/"+ rno,
			success: function(result){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status, err){
				if(error){
					error(err);
				}
			}
		});
	}
	
	function modify(reply, callback, error) {
		$.ajax({
			type: "put",
			url: "/reviewReplies/" + reply.rno,
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status, err) {
				if(error){
					error(err);
				}
			}
		});
	}
	
	function view(rno, callback, error){
		$.get("/reviewReplies/" + rno + ".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error(err);
			}
		});
	}
	
	
	return {add: add, getList: getList, remove: remove, modify: modify, view: view, timeForToday: timeForToday}
		
})();