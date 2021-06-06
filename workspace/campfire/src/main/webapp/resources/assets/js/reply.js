/**
 * 
 */

var replyService = (function(){
	function getList(reply, callback, error){
		$.getJSON("/freeReplies/freeReplyList/"+reply.bno+"/"+reply.page+".json", function(data){
			if(callback){
				console.log("data.replyCnt : "+data.replyCnt);
				console.log("data.list : "+data.list);
				callback(data.replyCnt, data.list);}
		}).fail(function(xhr, status, err){
			if(error){error(err);}
		});
	}
	
	return {getList: getList}
})();