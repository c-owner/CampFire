/**
 * 
 */

var replyService = (function(){
	function getList(reply, callback, error){
		$.getJSON("/freeReplies/freeReplyList/"+reply.bno+"/"+reply.page+".json", 
			function(data){
				console.log(data);
				if(callback){
					callback(data.total, data.freeBoardReplyList);
				}
			}).fail(function(xhr, status, err){
			if(error){error(err);}
		});
	}
	
	return {getList: getList}
})();