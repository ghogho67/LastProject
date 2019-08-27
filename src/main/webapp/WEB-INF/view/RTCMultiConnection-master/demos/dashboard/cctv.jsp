<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>CCTV</title>
  <meta name="description" content="WebRTC Dashboard including support for canvas drawing, canvas data syncing, video conferencing, screen sharing and video conferencing. Including chat and file sharing.">

  <link rel="shortcut icon" href="${cp}/RTCMultiConnection-master/demos/logo.png">
  <link rel="stylesheet" type="text/css" href="${cp}/RTCMultiConnection-master/demos/css/emojionearea.min.css">

  <script src="${cp}/RTCMultiConnection-master/demos/js/jquery.min.js"></script>
  <link href="${cp}/RTCMultiConnection-master/demos/css/bootstrap.min.css" rel="stylesheet">
  <script src="${cp}/RTCMultiConnection-master/demos/js/adapter.js"></script>
  <script src="${cp}/RTCMultiConnection-master/dist/RTCMultiConnection.min.js"></script>
  <script src="https://192.168.0.64:9001/socket.io/socket.io.js"></script>
  <script src="https://cdn.webrtc-experiment.com/FileBufferReader.js"></script>

  <script src="${cp}/RTCMultiConnection-master/demos/js/webrtc-handler.js"></script>
  <script src="${cp}/RTCMultiConnection-master/demos/js/canvas-designer-widget.js"></script>
  <script src="${cp}/RTCMultiConnection-master/demos/js/emojionearea.min.js"></script>
  <script src="${cp}/RTCMultiConnection-master/demos/js/getScreenId.js"></script>
  <!-- <script src="/node_modules/multistreamsmixer/MultiStreamsMixer.js"></script> -->
  
  
 <%@include file="/WEB-INF/view/common/LibForMypage.jsp"%>
<%@include file="/WEB-INF/view/common/LibForWebpage2.jsp"%>

<style type="text/css">
html, body, section, ul, li, nav, a, h1, h2 {
    padding: 0;
    margin: 0;
    outline: none;
    text-shadow: none;
    box-shadow: none;
    border-radius: 0;
    text-decoration: none;
}

body {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Fira Sans", "Droid Sans", "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
    font-size: 17px;
    line-height: 1.5em;
}

input[disabled], button[disabled] {
  background: transparent!important;
  color: #dcd7d7!important;
  border: 1px solid #dcd7d7!important;
  cursor: not-allowed!important;
  text-shadow: none!important;
  box-shadow: none!important;
  text-decoration: none!important;
  outline: none!important;
}
</style>
</head>

<style>
.extra-controls {
    position: absolute;
    right: 21%;
}

#btn-comments {
  color: red;
  margin-top: 5px;
  font-size: 24px;
  text-shadow: 1px 1px white;
}

#other-videos {
    margin-top: 5px;
}

#other-videos video {
    width: 45%;
    margin: 5px;
    border: 1px solid black;
    padding: 1px;
    border-radius: 3px;
}





#conversation-panel {
    margin-bottom: 20px;
    text-align: left;
    max-height: 200px;
    overflow: auto;
    border-top: 1px solid #E5E5E5;
    width: 106%;
}

#conversation-panel .message {
    border-bottom: 1px solid #E5E5E5;
    padding: 5px 10px;
}

#conversation-panel .message img, #conversation-panel .message video, #conversation-panel .message iframe {
    max-width: 100%;
}

/* #main-video { */
/*     width: 100%; */
/*     margin-top: -9px; */
/*     border-bottom: 1px solid #121010; */
/*     display: none; */
/*     padding-bottom: 1px; */
/*     display: none; */
/* } */

hr {
    height: 1px;
    border: 0;
    background: #E5E5E5;
}





.checkmark {
    display:none;
    width: 15px;
    vertical-align: middle;
}

#screen-viewer {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 9999999999999;
    display: none;
}
#widget-container {
    display: none;
}
</style>
<body>

	<%@include file="/WEB-INF/view/common/mypage/navigationBar.jsp"%>



	<c:choose>

		<c:when test="${MEM_INFO.mem_grade==0}">
			<%@include file="/WEB-INF/view/common/mypage/sidebarA.jsp"%>

		</c:when>

		<c:when test="${MEM_INFO.mem_grade==3}">
			<%@include file="/WEB-INF/view/common/mypage/sidebarW.jsp"%>

		</c:when>

		<c:otherwise>
			<%@include file="/WEB-INF/view/common/mypage/sidebarP.jsp"%>

		</c:otherwise>

	</c:choose>


	<div class="content-wrapper">

		<div class="row mb-4">


			<div class="col-lg-12" style="padding: 0 60px 0 60px;">
				<div class="card">



<!-- 					<div class="card-body"> -->
						<article>

						<div id="widget-container" style="position: fixed;bottom: 0;right: 0;left: 20%;height: 100%;border: 1px solid black; border-top:0; border-bottom: 0;" ></div>
						<video id="screen-viewer" controls playsinlins autoplay></video>
						
						<div style="width: 100%; height: 100%; position: absolute;left:0;">
						<!--     <video id="main-video" controls playsinline autoplay></video> -->
						    <div id="other-videos"></div>
						
						
						
						
						    <canvas id="temp-stream-canvas" style="display: none;"></canvas>
						</div>
						</article>
						
					
<!-- 					</div> -->
				</div>
			</div>
		</div>
	</div>
					



<script>
// console.log("${MEM_INFO.mem_id}");
// alert("${MEM_INFO.mem_id}");
(function() {
    var params = {},
        r = /([^&=]+)=?([^&]*)/g;

    function d(s) {
        return decodeURIComponent(s.replace(/\+/g, ' '));
    }
    var match, search = window.location.search;
    while (match = r.exec(search.substring(1)))
        params[d(match[1])] = d(match[2]);
    window.params = params;
})();

var connection = new RTCMultiConnection();

connection.socketURL = 'https://192.168.0.64:9001/';
//connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';

connection.extra.userFullName = params.userFullName;

/// make this room public
connection.publicRoomIdentifier = params.publicRoomIdentifier;

connection.socketMessageEvent = 'canvas-dashboard-demo';

// keep room opened even if owner leaves
connection.autoCloseEntireSession = true;

// https://www.rtcmulticonnection.org/docs/maxParticipantsAllowed/
connection.maxParticipantsAllowed = 1000;
// set value 2 for one-to-one connection
// connection.maxParticipantsAllowed = 2;

// here goes canvas designer
var designer = new CanvasDesigner();

// you can place widget.html anywhere
designer.widgetHtmlURL = 'https://cdn.webrtc-experiment.com/Canvas-Designer/widget.html';
designer.widgetJsURL = 'https://cdn.webrtc-experiment.com/Canvas-Designer/widget.js';

designer.addSyncListener(function(data) {
    connection.send(data);
});



// here goes RTCMultiConnection

connection.chunkSize = 16000;
connection.enableFileSharing = true;

connection.session = {
    audio: true,
    video: true,
    data: true
};
connection.sdpConstraints.mandatory = {
    OfferToReceiveAudio: true,
    OfferToReceiveVideo: true
};

connection.onUserStatusChanged = function(event) {
//     var infoBar = document.getElementById('onUserStatusChanged');
    var names = [];
    connection.getAllParticipants().forEach(function(pid) {
        names.push(getFullName(pid));
    });

    if (!names.length) {
        names = ['Only You'];
    } else {
        names = [connection.extra.userFullName || 'You'].concat(names);
    }

//     infoBar.innerHTML = '<b>Active users:</b> ' + names.join(', ');
};

connection.onopen = function(event) {
    connection.onUserStatusChanged(event);

    if (designer.pointsLength <= 0) {
        // make sure that remote user gets all drawings synced.
        setTimeout(function() {
            connection.send('plz-sync-points');
        }, 1000);
    }
};

connection.onclose = connection.onerror = connection.onleave = function(event) {
    connection.onUserStatusChanged(event);
};

connection.onmessage = function(event) {
    if(event.data.showMainVideo) {
        // $('#main-video').show();
//         $('#screen-viewer').css({
//             top: $('#widget-container').offset().top,
//             left: $('#widget-container').offset().left,
//             width: $('#widget-container').width(),
//             height: $('#widget-container').height()
//         });
//         $('#screen-viewer').show();
        return;
    }

    if(event.data.hideMainVideo) {
        // $('#main-video').hide();
        $('#screen-viewer').hide();
        return;
    }

    if(event.data.typing === true) {
        return;
    }

    if(event.data.typing === false) {
        return;
    }

    if (event.data.chatMessage) {
        appendChatMessage(event);
        return;
    }

    if (event.data.checkmark === 'received') {
        var checkmarkElement = document.getElementById(event.data.checkmark_id);
        if (checkmarkElement) {
            checkmarkElement.style.display = 'inline';
        }
        return;
    }

    if (event.data === 'plz-sync-points') {
        designer.sync();
        return;
    }

    designer.syncData(event.data);
};

// extra code

connection.onstream = function(event) {
    if (event.stream.isScreen && !event.stream.canvasStream) {
        $('#screen-viewer').get(0).srcObject = event.stream;
        $('#screen-viewer').hide();
    }
    else if (event.extra.roomOwner === true) {
    	/*
        var video = document.getElementById('main-video');
        video.setAttribute('data-streamid', event.streamid);
        // video.style.display = 'none';
        if(event.type === 'local') {
            video.muted = true;
            video.volume = 0;
        }
        video.srcObject = event.stream;
        $('#main-video').hide();
        */
    } else {
        event.mediaElement.controls = false;

        var otherVideos = document.querySelector('#other-videos');
        otherVideos.appendChild(event.mediaElement);
    }

    connection.onUserStatusChanged(event);
};

connection.onstreamended = function(event) {
    var video = document.querySelector('video[data-streamid="' + event.streamid + '"]');
    if (!video) {
        video = document.getElementById(event.streamid);
        if (video) {
            video.parentNode.removeChild(video);
            return;
        }
    }
    if (video) {
        video.srcObject = null;
        video.style.display = 'none';
    }
};

var conversationPanel = document.getElementById('conversation-panel');

function appendChatMessage(event, checkmark_id) {
    var div = document.createElement('div');

    div.className = 'message';

    if (event.data) {
        div.innerHTML = '<b>' + (event.extra.userFullName || event.userid) + ':</b><br>' + event.data.chatMessage;

        if (event.data.checkmark_id) {
            connection.send({
                checkmark: 'received',
                checkmark_id: event.data.checkmark_id
            });
        }
    } else {
        div.innerHTML = '<b>You:</b> <img class="checkmark" id="' + checkmark_id + '" title="Received" src="../image/check.png"><br>' + event;
        div.style.background = '#cbffcb';
    }

    conversationPanel.appendChild(div);

    conversationPanel.scrollTop = conversationPanel.clientHeight;
    conversationPanel.scrollTop = conversationPanel.scrollHeight - conversationPanel.scrollTop;
}

var keyPressTimer;
var numberOfKeys = 0;


window.onkeyup = function(e) {
    var code = e.keyCode || e.which;
    if (code == 13) {
    }
};



var recentFile;

function getFileHTML(file) {
    var url = file.url || URL.createObjectURL(file);
    var attachment = '<a href="' + url + '" target="_blank" download="' + file.name + '">Download: <b>' + file.name + '</b></a>';
    if (file.name.match(/\.jpg|\.png|\.jpeg|\.gif/gi)) {
        attachment += '<br><img crossOrigin="anonymous" src="' + url + '">';
    } else if (file.name.match(/\.wav|\.mp3/gi)) {
        attachment += '<br><audio src="' + url + '" controls></audio>';
    } else if (file.name.match(/\.pdf|\.js|\.txt|\.sh/gi)) {
        attachment += '<iframe class="inline-iframe" src="' + url + '"></iframe></a>';
    }
    return attachment;
}

function getFullName(userid) {
    var _userFullName = userid;
    if (connection.peers[userid] && connection.peers[userid].extra.userFullName) {
        _userFullName = connection.peers[userid].extra.userFullName;
    }
    return _userFullName;
}

connection.onFileEnd = function(file) {
    var html = getFileHTML(file);
    var div = progressHelper[file.uuid].div;

    if (file.userid === connection.userid) {
        div.innerHTML = '<b>You:</b><br>' + html;
        div.style.background = '#cbffcb';

        if(recentFile) {
            recentFile.userIndex++;
            var nextUserId = connection.getAllParticipants()[recentFile.userIndex];
            if(nextUserId) {
                connection.send(recentFile, nextUserId);
            }
            else {
                recentFile = null;
            }
        }
        else {
            recentFile = null;
        }
    } else {
        div.innerHTML = '<b>' + getFullName(file.userid) + ':</b><br>' + html;
    }
};

// to make sure file-saver dialog is not invoked.
connection.autoSaveToDisk = false;

var progressHelper = {};

connection.onFileProgress = function(chunk, uuid) {
    var helper = progressHelper[chunk.uuid];
    helper.progress.value = chunk.currentPosition || chunk.maxChunks || helper.progress.max;
    updateLabel(helper.progress, helper.label);
};

connection.onFileStart = function(file) {
    var div = document.createElement('div');
    div.className = 'message';

    if (file.userid === connection.userid) {
        var userFullName = file.remoteUserId;
        if(connection.peersBackup[file.remoteUserId]) {
            userFullName = connection.peersBackup[file.remoteUserId].extra.userFullName;
        }

        div.innerHTML = '<b>You (to: ' + userFullName + '):</b><br><label>0%</label> <progress></progress>';
        div.style.background = '#cbffcb';
    } else {
        div.innerHTML = '<b>' + getFullName(file.userid) + ':</b><br><label>0%</label> <progress></progress>';
    }

    div.title = file.name;
    conversationPanel.appendChild(div);
    progressHelper[file.uuid] = {
        div: div,
        progress: div.querySelector('progress'),
        label: div.querySelector('label')
    };
    progressHelper[file.uuid].progress.max = file.maxChunks;

    conversationPanel.scrollTop = conversationPanel.clientHeight;
    conversationPanel.scrollTop = conversationPanel.scrollHeight - conversationPanel.scrollTop;
};

function updateLabel(progress, label) {
    if (progress.position == -1) return;
    var position = +progress.position.toFixed(2).split('.')[1] || 100;
    label.innerHTML = position + '%';
}

if(!!params.password) {
    connection.password = params.password;
}

designer.appendTo(document.getElementById('widget-container'), function() {
    if (params.open === true || params.open === 'true') {
            var tempStreamCanvas = document.getElementById('temp-stream-canvas');
            var tempStream = tempStreamCanvas.captureStream();
            tempStream.isScreen = true;
            tempStream.streamid = tempStream.id;
            tempStream.type = 'local';
            connection.attachStreams.push(tempStream);
            window.tempStream = tempStream;

            connection.extra.roomOwner = true;
       		console.log(connection.session);
            connection.session.audio=false;
            connection.session.video=false;
            connection.session.data=true;
            connection.open(params.sessionid, function(isRoomOpened, roomid, error) {
                if (error) {
                    if (error === connection.errors.ROOM_NOT_AVAILABLE) {
                        alert('Someone already created this room. Please either join or create a separate room.');
                        return;
                    }
                    alert(error);
                }

                connection.socket.on('disconnect', function() {
                    location.reload();
                });
            });
    } else {
    	console.log(connection.extra.userFullName);
    	if(connection.extra.userFullName=='${MEM_INFO.mem_id}'){
            connection.session.audio=false;
            connection.session.video=false;
            connection.session.data=true;
    	}
        connection.join(params.sessionid, function(isRoomJoined, roomid, error) {
            if (error) {
                if (error === connection.errors.ROOM_NOT_AVAILABLE) {
                    alert('CCTV 서비스 신청을 안하셨습니다! 신청시 대표전화로 문의 주세요');
                    return;
                }
                if (error === connection.errors.ROOM_FULL) {
                    alert('Room is full.');
                    return;
                }
                if (error === connection.errors.INVALID_PASSWORD) {
                    connection.password = prompt('Please enter room password.') || '';
                    if(!connection.password.length) {
                        alert('Invalid password.');
                        return;
                    }
                    connection.join(params.sessionid, function(isRoomJoined, roomid, error) {
                        if(error) {
                            alert(error);
                        }
                    });
                    return;
                }
                alert(error);
            }

            connection.socket.on('disconnect', function() {
                location.reload();
            });
        });
    }
});

function addStreamStopListener(stream, callback) {
    stream.addEventListener('ended', function() {
        callback();
        callback = function() {};
    }, false);

    stream.addEventListener('inactive', function() {
        callback();
        callback = function() {};
    }, false);

    stream.getTracks().forEach(function(track) {
        track.addEventListener('ended', function() {
            callback();
            callback = function() {};
        }, false);

        track.addEventListener('inactive', function() {
            callback();
            callback = function() {};
        }, false);
    });
}

function replaceTrack(videoTrack, screenTrackId) {
    if (!videoTrack) return;
    if (videoTrack.readyState === 'ended') {
        alert('Can not replace an "ended" track. track.readyState: ' + videoTrack.readyState);
        return;
    }
    connection.getAllParticipants().forEach(function(pid) {
        var peer = connection.peers[pid].peer;
        if (!peer.getSenders) return;
        var trackToReplace = videoTrack;
        peer.getSenders().forEach(function(sender) {
            if (!sender || !sender.track) return;
            if(screenTrackId) {
                if(trackToReplace && sender.track.id === screenTrackId) {
                    sender.replaceTrack(trackToReplace);
                    trackToReplace = null;
                }
                return;
            }

            if(sender.track.id !== tempStream.getTracks()[0].id) return;
            if (sender.track.kind === 'video' && trackToReplace) {
                sender.replaceTrack(trackToReplace);
                trackToReplace = null;
            }
        });
    });
}

function replaceScreenTrack(stream) {
    stream.isScreen = true;
    stream.streamid = stream.id;
    stream.type = 'local';

    // connection.attachStreams.push(stream);
    connection.onstream({
        stream: stream,
        type: 'local',
        streamid: stream.id,
        // mediaElement: video
    });

    var screenTrackId = stream.getTracks()[0].id;
    addStreamStopListener(stream, function() {
        connection.send({
            hideMainVideo: true
        });

        // $('#main-video').hide();
        $('#screen-viewer').hide();
        replaceTrack(tempStream.getTracks()[0], screenTrackId);
    });

    stream.getTracks().forEach(function(track) {
        if(track.kind === 'video' && track.readyState === 'live') {
            replaceTrack(track);
        }
    });

    connection.send({
        showMainVideo: true
    });

    // $('#main-video').show();
    $('#screen-viewer').css({
            top: $('#widget-container').offset().top,
            left: $('#widget-container').offset().left,
            width: $('#widget-container').width(),
            height: $('#widget-container').height()
        });
    $('#screen-viewer').show();
}


</script>
</body>
</html>
