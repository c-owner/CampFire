var replyService = (function(){
	function getList(reply, callback, error){
		$.getJSON("/marketReplies/marketReplyList/"+reply.bno+"/"+reply.page+".json", 
			function(data){
				if(callback){
					callback(data.total, data.marketReplyList);
				}
			}).fail(function(xhr, status, err){
			if(error){error(err);}
		});
	}

	//댓글 등록
	function add(reply, callback, error){
		$.ajax({
			type: "post",
			url: "/marketReplies/write",
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
	
	//댓글 삭제
	function remove(rno, callback, error) {
		$.ajax({
			type:"delete",
			url:"marketReplies/"+ rno,
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
	
	//댓글 수정
	function modify(reply, callback, error) {
		$.ajax({
			type: "put",
			url: "/marketReplies/" + reply.rno,
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
	
	function get(rno, callback, error){
		$.get("/marketReplies/" + rno + ".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error(err);
			}
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
	
	
	
	return {add: add, getList: getList, remove: remove, modify: modify, get: get, timeForToday: timeForToday}
		
})();