"use strict"
/*
    WildRain 추가 2021-12-21 
    파일 업로더. ie10 버전 이상에서 동작함.
    
    ※ 마크업 구조
    <div class="file-uploader">
        <ul class="file-uploader-head">
            <li><input type="checkbox" /></li>
            <li>파일 이름</li>
            <li>파일 크기</li>
        </ul>
        <div class="file-uploader-list">
            <ul class="file-uploader-list-item">
                <li><input type="checkbox" id="file-index-1" value="1" /></li>
                <li><label for="file-index-1">file.jpg</label></li>';
                <li>10 KB</li>
            </ul>
        </div>
        <ul class="file-uploader-info">
            <li>최대 <strong class="file-max-count">10</strong>개 <strong class="file-max-size">100 MB</strong> 제한</li>
            <li><strong class="file-total-count">0</strong>개, <strong class="file-total-size">0 KB</strong> 추가됨</li>
        </ul>
        <div class="file-uploader-controller">
            <button id="delete-file">선택파일제거</button>
            <label for="fileselector">파일추가</label>
        </div>
        <input type="file" class="file-uploader-files" id="fileselector" multiple="multiple" accept=".jpeg"/>
    </div>
    <div class="file-uploader-progress-wrapper">
        <div class="file-uploader-progress-box">
            <strong>0%</strong>
            <div class="file-uploader-progress-bar">
                <div class="progress-gage"></div>
            </div>
            <p>파일 업로드 중입니다.</p>
        </div>
    </div>
 */
if (!window.smes) {
    window.smes = {};
}
if (!window.smes.FileUploader) {
    window.smes.FileUploader = function(targetSelector) {
        // IE 10 지원을 위하여 let을 사용하지 않고 var를 사용한다!
        var $target;
        var $files;
        var _storedFiles = [];
        var _deletedFiles = [];
        var _fileMaxCount = 10;
        var _fileMaxSize = 1024 * 1024 * 10;
        var _targetFolderPath;
        var _fileTagId = uuidv4();
        var _targetUrl;
        var _accept = '';
        var _isSupportBrowser = false;
        var _csrfHeader = '';
        var _csrfToken = '';
        //var _fileList = '';
        //var _deleteList = '';
        this.init = function(option) {
            if (option) {
                if (option.maxFileCount) {
                    _fileMaxCount = option.maxFileCount;
                }
                if (option.maxFileSize) {
                    _fileMaxSize = option.maxFileSize;
                }
                if (option.targetFolderPath) {
                    _targetFolderPath = option.targetFolderPath;
                }
                if (option.accept) {
                    _accept = option.accept;
                }
                if (option.targetUrl) {
                    _targetUrl = option.targetUrl;
                }
                if (option.csrfHeader) {
                    _csrfHeader = option.csrfHeader;
                }
                if (option.csrfToken) {
                    _csrfToken = option.csrfToken;
                }
                // if (option.fileList) {
                //     _fileList = option.fileList;
                // }
                // if (option.deleteList) {
                //     _deleteList = option.deleteList;
                // }
            }
            if (targetSelector) {
                if (typeof (targetSelector) === 'string') {
                    $target = find(targetSelector);
                }
                else {
                    alert("smes.FileUploader : targetSelector는 string으로 입력하세요.");
                }
            }

            // 초기 파일리스트 처리
            // var jsonData = $target.text();
            // console.log(jsonData);

            // 현재 브라우저가 지원 가능한 브라우저인지 판단.
            // FileReader API를 체크하여 설정한다.
            // 현재 IE10 이상부터 FileReader API를 지원함.
            _isSupportBrowser = typeof window.FileReader !== 'undefined';
            if (_isSupportBrowser) {
                renderTarget();
                renderProgress();
                //            $('body').append('<input type="file" class="file-uploader-files" id="' + _fileTagId + '" multiple="multiple" accept="' + accept + '" onclick="this.blur();"/>');
                $files = $('#' + _fileTagId);
                $files.on('change', function (evt) {
                    if (this.files) {
                        appendFiles(this.files);
                    }
                    $(this).val('');
                });
                // 삭제 이벤트 처리
                $target.find('#delete-file').on('click', function () {
                    var $checkedList = $target.find('.file-uploader-list input:checked');
                    if ($checkedList.length == 0) {
                        alert('선택된 파일이 없습니다.');
                    } else {
                        $($checkedList.get().reverse()).each(function (index) {
                            var i = $(this).val();
                            // 업로드 처리우 삭제 리스트를 반환하기 위하여
                            // 삭제된 파일 정보를 _deletedFiles 배열에 추가한다.
                            if (_storedFiles[i].savedFileName) {
                                _deletedFiles.push(_storedFiles[i]);
                                // console.log("delete");
                                // console.dir(_deletedFiles);
                            }
                            _storedFiles.splice(parseInt(i), 1);
                        });
                        renderFileList();
                        syncCheckAll();
                    }
                    return false;
                });
                $target.find('.file-uploader-head :checkbox').on('change', function (evt) {
                    var checkall = this;
                    $target.find('.file-uploader-list :checkbox').each(function (idx) {
                        this.checked = checkall.checked;
                    });
                });
                $target.find('.file-uploader-list').on('change', ':checkbox', function (evt) {
                    syncCheckAll();
                });
                // drag and drop 지원
                // File API를 지원하는 브라우저에서만 drag & drop을 지원하도록 한다.
                if (_isSupportBrowser) {
                    $target.find('.file-uploader-list').on('dragenter', function (e) {
                        // console.log('dragenter');
                        // 유효한 파일일 때 처리
                        // if (e.originalEvent.dataTransfer.types.indexOf('Files') >= 0) {
                        //     $(this).addClass('valid');
                        // }
                        // else {
                        //     $(this).addClass('not-valid');
                        // }
                    }).on('dragover', function (e) {
                        e.stopPropagation();
                        e.preventDefault();
                        // console.log('dragover');
                        // console.log(e.originalEvent);
                        // console.log(e.originalEvent.dataTransfer);
                        // console.log('type: ' + e.originalEvent.dataTransfer.types);
                        // console.log(e.originalEvent.dataTransfer.types[0]);
                        // console.log(e.originalEvent.dataTransfer.files);
                        // console.log(e.originalEvent.dataTransfer.files.length);
                        // 유효한 파일일 때 처리
                        if (e.originalEvent.dataTransfer.types[0].indexOf('Files') >= 0) {
                            $(this).addClass('valid');
                        } else {
                            $(this).addClass('not-valid');
                        }
                    }).on('dragleave', function (e) {
                        // console.log('dragleavee');
                        $(this).removeClass('valid not-valid');
                    }).on('drop', function (e) {
                        e.stopPropagation();
                        e.preventDefault();
                        // console.log('drop');
                        // console.dir(e.originalEvent.dataTransfer);
                        if (e.originalEvent.dataTransfer.types[0].indexOf('Files') >= 0) {
                            appendFiles(e.originalEvent.dataTransfer.files);
                        }
                        $(this).removeClass('valid not-valid');
                    }).addClass('no-data'); // drag & drop를 지원하는 경우 no-data 클래스 적용!
                }
                // 초기 파일리스트 처리
                // if (jsonData && jsonData.trim()) {
                //     _storedFiles = JSON.parse(jsonData);
                //     // console.dir(_storedFiles);
                //     renderFileList();
                // }
                if (option.fileList && option.fileList.trim()) {
                    _storedFiles = JSON.parse(option.fileList);
                    renderFileList();
                    console.log("option.fileList");
                    console.dir(option.fileList);
                }
                if (option.deletedFileList && option.deletedFileList.trim()) {
                    _deletedFiles = JSON.parse(option.deletedFileList);
                    console.log("option.deleteList");
                    console.dir(_deletedFiles);
                }
            }
            else {
                renderNoSupport();
            }
            return this;
        };
        this.upload = function(option) {
            if (!_targetUrl) {
                option.fail(new Error('targetUrl이 필요합니다!'));
                return false;
            }
            if (_storedFiles && _storedFiles.length === 0) {
                option.done(new Array(), _deletedFiles, new Array());
                return false;
            }
            transfer().done(function(result, deleted, uploaded) {
                if (option && option.done) {
                    option.done(result, deleted, uploaded);
                    return true;
                }
            }).fail(function(error) {
                if (option && option.fail) {
                    option.fail(error);
                    return false;
                }
            });
            return false;
        };
        function transfer() {
            var deferred = $.Deferred();

            // 실제 업로드 해야할 파일 선택
            var uploadFiles = new Array();
            for (var i = 0; i < _storedFiles.length; i++) {
                if (_storedFiles[i].lastModified) {
                    uploadFiles.push(_storedFiles[i])
                }
            }
            // 실제 업르도 해야할 파일이 있을때만 업로드 처리한다.
            if (uploadFiles.length <= 0) {
                deferred.resolve(_storedFiles, _deletedFiles, new Array());
            }
            else {
                var formData = new FormData();
                formData.append("targetFolderPath", _targetFolderPath);
                formData.append("maxFileSize", _fileMaxSize);
                formData.append("maxFileCount", _fileMaxCount);
                formData.append("savedFileSize", calcTotalSize(_storedFiles) - calcTotalSize(uploadFiles));
                formData.append("savedFileCount", _storedFiles.length - uploadFiles.length);
                for (var i = 0; i < uploadFiles.length; i++) {
                    formData.append("files", uploadFiles[i]);
                }
                var $progressUi = $('.file-uploader-progress-wrapper');
                $progressUi.show();

                // var header = $('meta[name="_csrf_header"]').attr('content');
                // var token = $('meta[name="_csrf"]').attr('content');
                $.ajax({
                    type: 'POST',
                    url: _targetUrl,
                    processData: false,
                    contentType: false,
                    dataType: 'json',
                    data: formData,
                    // async: false,
                    beforeSend: function(xhr, settings) {
                        // csrf 처리
                        if (_csrfToken && _csrfHeader) {
                            xhr.setRequestHeader(_csrfHeader, _csrfToken);
                        }
                    },
                    success: function (result) {
                        $progressUi.hide();
                        // 전체 파일 리스트
                        var resultFiles = new Array();
                        // 기존에 존재했던 파일 리스트 처리.
                        for (var i=0; i<_storedFiles.length; i++) {
                            if (_storedFiles[i].savedFileName) {
                                resultFiles.push(_storedFiles[i]);
                            }
                        }
                        // 새로 업로드된 파일 리스트 처리.
                        for (var i=0; i<result.files.length; i++) {
                            resultFiles.push(result.files[i]);
                        }
                        // resolve(result, uploaded, deleted)
                        // resolve 호출시 첫번째 인수에는 현재 첨부된 파일 전체 리스트를 전달한다.
                        // 두번재 인수에는 새로 업로드된 파일 리스트만 전달한다.
                        // 마지막 세번째 인수에는 삭제된 파일 리스를 전달한다.
                        deferred.resolve(resultFiles, _deletedFiles, result.files);
                    },
                    error: function (request, status, error) {
                        // console.dir(request);
                        // console.dir(status);
                        // console.dir(error);
                        var message = "";
                        if (request && request.responseJSON && request.responseJSON.message) {
                            message = request.responseJSON.message;
                        }
                        else {
                            message = request.responseText;
                        }
                        deferred.reject(new Error(message));
                    },
                    xhr: function () {
                        var xhr = $.ajaxSettings.xhr();
                        xhr.upload.onprogress = function (e) {
                            var percent = e.loaded * 100 / e.total;
                            $progressUi.find('.file-uploader-progress-box strong').text(percent.toFixed(0) + '%');
                            $progressUi.find('.progress-gage').css('width', percent + '%');
                            if (percent >= 100) {
                                $progressUi.find('.progress-gage').addClass('animated-gradient');
                                $progressUi.find('.file-uploader-progress-box p').text('파일 처리중입니다. 잠시 기다려주세요.');
                            }
                        }
                        return xhr;
                    }
                });
            }
            return deferred.promise();
        };
        function appendFiles(files) {
            if (files) {
                if (_fileMaxCount < (_storedFiles.length + files.length)) {
                    alert(_fileMaxCount + "개 이상 업로드 할 수 없습니다.");
                    return false;
                }
                if (_fileMaxSize < (calcTotalSize(_storedFiles) + calcTotalSize(files))) {
                    alert(toFileSize(_fileMaxSize) + " 이상 업로드 할 수 없습니다.");
                    return false;
                }
                for (var i = 0; i < files.length; i++) {
                    var file = files[i];
                    // console.dir(file);
                    _storedFiles.push(files[i]);
                }
                renderFileList();
            }
        }
        function renderProgress() {
            var html = '<div class="file-uploader-progress-wrapper">';
            html += '<div class="file-uploader-progress-box">';
            html += '<strong>0%</strong>';
            html += '<div class="file-uploader-progress-bar">';
            html += '<div class="progress-gage"></div>';
            html += '</div>';
            html += '<p>파일 업로드 중입니다.</p>';
            html += '<div class="progress-message"></div>';
            html += '</div>';
            html += '</div>';
            $('body').append(html);
        };
        function renderTarget() {
            var html = '<ul class="file-uploader-head">';
            html += '<li><input type="checkbox" /></li>';
            html += '<li>파일 이름</li>';
            html += '<li>파일 크기</li>';
            html += '</ul>';
            html += '<div class="file-uploader-list">';
            //html += '<label for="' + _fileTagId + '"></label>'
            html += '</div>';
            html += '<ul class="file-uploader-info">';
            html += '<li>최대 <strong class="file-max-count">' + _fileMaxCount + '</strong>개 <strong class="file-max-size">' + toFileSize(_fileMaxSize, 0) + '</strong> 제한</li>';
            html += '<li><strong class="file-total-count">0</strong>개, <strong class="file-total-size">0 KB</strong> 추가됨</li>';
            html += '</ul>';
            html += '<div class="file-uploader-controller">';
            html += '<button id="delete-file">선택파일제거</button>';
            html += '<label for="' + _fileTagId + '" class="button-color-blue">파일추가</label>';
            html += '</div>';
            html += '<input type="file" class="file-uploader-files" id="' + _fileTagId + '" name="files" multiple="multiple" accept="' + _accept + '"/>';
            if (!$target.hasClass('file-uploader')) {
                $target.addClass('file-uploader');
            }
            $target.html(html);
        };
        function renderNoSupport() {
            var html = '<div class="no-support">파일 업로드를 지원하지 않는 브라우저입니다. IE10 이상의 브라우저를 이용하세요.</div>';
            if (!$target.hasClass('file-uploader')) {
                $target.addClass('file-uploader');
            }
            $target.html(html);
        }
        function renderFileList() {
            var totalSize = 0;
            var totalCount = _storedFiles.length;
            var $fileList = $target.find('.file-uploader-list');
            $fileList.html('');
            if (totalCount > 0) {
                for (var i = 0; i < totalCount; i++) {
                    var file = _storedFiles[i];
                    totalSize += file.size;
                    appendList(file.name, file.size, i);
                }
            }
            if (totalCount == 0) {
                $fileList.addClass("no-data");
            }
            else {
                $fileList.removeClass("no-data");
            }
            $target.find('.file-total-size').text(toFileSize(totalSize));
            $target.find('.file-total-count').text(totalCount);
        };
        function appendList(fileName, fileSize, index) {
            var html = '<ul class="file-uploader-list-item">';
            html += '<li><input type="checkbox" id="file-index-' + index + '" value="' + index + '" /></li>';
            html += '<li><label for="file-index-' + index + '">' + fileName + '</label></li>';
            html += '<li>' + toFileSize(fileSize) + '</li>';
            html += '</ul>';
            $target.find('.file-uploader-list').append(html);
        };
        function syncCheckAll() {
            var checkall = true;
            var $lcb = $target.find('.file-uploader-list :checkbox');
            if ($lcb.length == 0) {
                checkall = false;
            }
            else {
                $lcb.each(function (idx) {
                    if (!this.checked) {
                        checkall = false;
                        return false;
                    }
                });
            }
            $target.find('.file-uploader-head :checkbox').get(0).checked = checkall;
        };
        function find(target) {
            var $target;
            if (target.charAt(0) === '.' || target.charAt(0) === '#') {
                return $(target);
            }
            else {
                $target = $('#' + target);
                if ($target && $target.length > 0) {
                    return $target;
                }
                else {
                    return $('.' + target);
                }
            }
        };
        function calcTotalSize(files) {
            var totalSize = 0;
            if (files && files.length) {
                for (var i = 0; i < files.length; i++) {
                    totalSize += files[i].size;
                }
            }
            return totalSize;
        };
        function toFileSize(fileSize, fixed) {
            if (typeof fixed === "undefined" || fixed === null || fixed === "") {
                fixed = 2;
            }
            if (fileSize < 1024) {
                return fileSize + " byte";
            }
            else if (fileSize < (1024 * 1024)) {
                return (fileSize / 1024).toFixed(fixed) + " KB";
            }
            else {
                return (fileSize / 1024 / 1024).toFixed(fixed) + " MB";
            }
        };
        function uuidv4() {
            return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
                var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
                return v.toString(16);
            });
        };
    }
}
