<%--
  Created by IntelliJ IDEA.
  User: ostsc
  Date: 2022-09-29
  Time: 오전 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<html>
<head>
    <title>Title</title>
</head>

<style>
    table.dg_table {
        width: 50%;
    }
    #att_zone{
        width:660px;
        min-height: 150px;
        padding: 10px;
        border: 1px solid black;
    }
    #att_zone:empty:before{
        content: attr(date-placeholder);
        color:#999999;
        font-size:.9em;
    }
    table.dg_table{
        border: 1px solid black;
    }
</style>

<body>
<div>
    <form action="updatefindaction" method="post" enctype="multipart/form-data">
        <input type="hidden" name="user_num" value="${sessionScope.user_num}">
        <input type="hidden" name="find_num" value="${dto.find_num}">

        <input type="hidden" name="currentPage" value="${currentPage}">

        <table class="dg_table">
            <tr align="center" valign="middle">
                <th style="width:20%;">제목</th>
                <td align="left">
                    <input type="text" name="subject" required="required" placeholder="제목을 입력하세요" class="form-control"
                           id="dg_subject" width="500" value="${dto.subject}">
                </td>
            </tr>
            <tr align="center" valign="middle">
                <th style="width:20%;">사진</th>
                <td>
                    <div class="input-group">
                        <input type="file" name="findupload" multiple="multiple" id="btnAtt" class="form-control">
                        <div id='att_zone' data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
					<textarea name="content" required="required"
                              style="width:100%;aspect-ratio: 10 / 3;" id="dg_content">${dto.content}</textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit" class="btn btn-outline-dark">게시글 저장</button>
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="image_preview">

</div>
<script>
    ( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
        imageView = function imageView(att_zone, btn){

            var attZone = document.getElementById(att_zone);
            var btnAtt = document.getElementById(btn)
            var sel_files = [];

            // 이미지와 체크 박스를 감싸고 있는 div 속성
            var div_style = 'display:inline-block;position:relative;'
                + 'width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1';
            // 미리보기 이미지 속성
            var img_style = 'width:100%;height:100%;z-index:none';
            // 이미지안에 표시되는 체크박스의 속성
            var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
                + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';

            btnAtt.onchange = function(e){
                var files = e.target.files;
                var fileArr = Array.prototype.slice.call(files)
                for(f of fileArr){
                    imageLoader(f);
                }
            }

            // 탐색기에서 드래그앤 드롭 사용
            attZone.addEventListener('dragenter', function(e){
                e.preventDefault();
                e.stopPropagation();
            }, false)

            attZone.addEventListener('dragover', function(e){
                e.preventDefault();
                e.stopPropagation();

            }, false)

            attZone.addEventListener('drop', function(e){
                var files = {};
                e.preventDefault();
                e.stopPropagation();
                var dt = e.dataTransfer;
                files = dt.files;
                for(f of files){
                    imageLoader(f);
                }

            }, false)



            /*첨부된 이미리즐을 배열에 넣고 미리보기 */
            imageLoader = function(file){
                sel_files.push(file);
                var reader = new FileReader();
                reader.onload = function(ee){
                    let img = document.createElement('img')
                    img.setAttribute('style', img_style)
                    img.src = ee.target.result;
                    attZone.appendChild(makeDiv(img, file));
                }

                reader.readAsDataURL(file);
            }

            /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
            makeDiv = function(img, file){
                var div = document.createElement('div')
                div.setAttribute('style', div_style)

                var btn = document.createElement('input')
                btn.setAttribute('type', 'button')
                btn.setAttribute('value', 'x')
                btn.setAttribute('delFile', file.name);
                btn.setAttribute('style', chk_style);
                btn.onclick = function(ev){
                    var ele = ev.srcElement;
                    var delFile = ele.getAttribute('delFile');
                    for(var i=0 ;i<sel_files.length; i++){
                        if(delFile== sel_files[i].name){
                            sel_files.splice(i, 1);
                        }
                    }

                    dt = new DataTransfer();
                    for(f in sel_files) {
                        var file = sel_files[f];
                        dt.items.add(file);
                    }
                    btnAtt.files = dt.files;
                    var p = ele.parentNode;
                    attZone.removeChild(p)
                }
                div.appendChild(img)
                div.appendChild(btn)
                return div
            }
        }
    )('att_zone', 'btnAtt')

</script>
</body>
</html>
