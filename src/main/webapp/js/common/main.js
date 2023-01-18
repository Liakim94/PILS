var cpoints = [];
var cpoints_max = 30;

$(function(){
	
	if(sUserLevel == 1){
		getProcessInfo();
		setInterval("getServerInfo()", 1000);
		setInterval("getProcessInfo()", 1000*60);
	}

});


function getServerInfo(){
	$.ajax({
		url : "./server/info",		
		//type : "json",		
		beforeSend:function(){
		},
		success : function(data){
			var response = data.response;
			if(response != null){
				var sCpu = response.systemCpuLoad;
				var pCpu = response.processCpuLoad;
				var tSpace = response.totalSpace;
				var uSpace = response.usableSpace;
				
				var tMemory = response.totalPhysicalMemory;
				var fMemory = response.freePhysicalMemory;
				
				//$("#pie-cpu-chart").attr("data-percent", Math.floor(sCpu));
				$("#pie-cpu-text").text(Math.floor(sCpu)+"%");
				$('#pie-cpu-chart').data('easyPieChart').update(Math.round(sCpu));
				
				
				cpoints.push(Math.round(sCpu));
		        if (cpoints.length > cpoints_max)
		          cpoints.splice(0, 1);
		        
		       /* $('#cpuspeed').sparkline('html',
		                {
		                  height: '1.5em', width: '8em', lineColor: '#fff', fillColor: '#fff',
		                  minSpotColor: false, maxSpotColor: false, spotColor: '#ff', spotRadius: 3
		                   data-spot-Radius="3" data-highlight-Spot-Color="#f39c12" data-highlight-Line-Color="#222" data-min-Spot-Color="#f56954" data-max-Spot-Color="#00a65a" data-spot-Color="#39CCCC" data-offset="90" data-width="100%" data-height="100px" data-line-Width="2" data-line-Color="#39CCCC" data-fill-Color="rgba(57, 204, 204, 0.08)"
		                });*/
		        //$('#cpuspeed').sparkline(cpoints, {width: cpoints.length * 2});
		        $('#cpuspeed').sparkline(cpoints,{height:'80px', lineWidth:1.2, spotColor:'#fff', spotRadius:2, highlightLineColor:'#fff', highlightSpotColor:'#fff', lineColor:'#fff', fillColor:'rgba(255, 255, 255, 0)'});
				
				
				
				
				$("#pie-space-text").text(Math.floor(((tSpace-uSpace)/tSpace)*100)+"%");
				$('#pie-space-chart').data('easyPieChart').update(Math.floor(((tSpace-uSpace)/tSpace)*100));
				$("#space-text").text(bytesToSize(uSpace) + "/"+ bytesToSize(tSpace));
				
				$("#pie-mem-text").text(Math.round(((tMemory-fMemory)/tMemory)*100)+"%");
				$('#pie-mem-chart').data('easyPieChart').update(Math.round(((tMemory-fMemory)/tMemory)*100));
				
				//console.log("전체메모리"+bytesToSize(tMemory));
				//console.log("여유메모리"+fMemory);
				
				//bytesToSize
				
			}else{
			}
			
		},
		error : function(request,status,error){			
		}
	});
}

function getProcessInfo(){
	$.ajax({
		url : "./etc/info",		
		//type : "json",		
		beforeSend:function(){
		},
		success : function(data){
			var response = data.response;
			if(response != null){
				var trans = response.transRate;
				var index = response.idxRate;
				$("#pie-trans-text").text(trans+"%");
				$('#pie-trans-chart').data('easyPieChart').update(trans);
				
				$("#pie-index-text").text(index+"%");
				$('#pie-index-chart').data('easyPieChart').update(index);
			}else{
			}
			
		},
		error : function(request,status,error){			
		}
	});
}