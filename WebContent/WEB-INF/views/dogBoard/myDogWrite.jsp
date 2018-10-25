<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<li class="post_subject">
							<label class="item" for="subject">제목</label>
							<div>
								<input type="text" name="subject" onkeyup="oCafeWrite.clearInitMessage(this); this.focus(); javascript:frm_subject_keyup(); return false;"
									value="게시글 제목을 입력하세요"
									id="subject" class="box_input" onclick="oCafeWrite.clearInitMessage(this); this.focus(); clickcr(this, 'wrt.subject', '', '', event); return false;"
									onBlur="oCafeWrite.showSuicideSaver(this); return false;"> <span id="tempsaving_text" class="save">임시 저장된 글 <strong id="tempsaving_count">(0)</strong></span>
									<div class="tooltip temporary_save" id="tempSave_tooltip" style="display: none;">
										<div class="inner"><p class="txt">임시 저장은 최대 300개까지 가능합니다.<br>오래된 게시글을 삭제해 주세요.</p></div>
										<a class="clse _click(TempSaveTooltip|Close) _stopDefault" href="#">닫기</a>
										<div class="tail"></div>
									</div>
							</div>
						</li>
						
							
						<li id="file_attach_menu" class="file_attach_menu" ><label class="item">파일첨부</label>
							<div id="fileDB">
								<ul>
									<li id="iImage" class="first"><a onclick="photoUploaderPopup('16996348');clickcr(this, 'wrt.photo', '', '', event);return false;" class="ico_pic" href="#"><strong>사진</strong></a></li>
									<li id="iMovie"><a onclick="popMovie('dokchi', '16996348');clickcr(this, 'wrt.video', '', '', event);return false;" class="ico_movie" href="#"><strong>동영상</strong></a><img src="https://cafe.pstatic.net/cafe4/ico-new.gif" alt="NEW" width="10" height="9" style="margin:-1px 6px 1px -4px;vertical-align:middle"></li>
									<li id="iMap"><a onclick="popMap();clickcr(this, 'wrt.map', '', '', event);return false;" class="ico_map" href="#"><strong>지도</strong></a></li>
									<li id="iCalendar"><a onclick="attachAreaForDb.attachDbCalendar();clickcr(this, 'wrt.schedule', '', '', event);return false;" class="ico_calendar" href="#"><strong>일정</strong></a></li>
									<li id="iLink"><a onclick="clickcr(this, 'wrt.link', '', '', event);return false;" class="ico_link _click(AttachLinkHandler|ShowAttachLinkLayer)" href="#"><strong>링크</strong></a></li>
									<li id="iFile"><a onclick="popFile('dokchi', '16996348');clickcr(this, 'wrt.file', '', '', event);return false;" class="ico_file" href="#"><strong>파일</strong></a></li>
									<li id="iPoll"><a onclick="attachArea.attachPoll();clickcr(this, 'wrt.vote', '', '', event);return false;" class="ico_vote" href="#"><strong>투표</strong></a></li>
									<li id="iMusic"><a href="#" onclick="attachArea.attachMusic();clickcr(this, 'wrt.music', '', '', event);return false;" class="ico_music"><strong>음악</strong></a></li>
								</ul>
							</div>
						</li>
						
						
						<li id="info_attach_menu" style="height:25px;"><label class="pd02">정보첨부</label>
							<div id="infoDB" class="infoattach">
								<a href="#" onclick="oCafeWrite.openAttachInformationWindow('exbook.html');clickcr(this, 'wrt.ibook', '', '', event);return false;">책DB</a> <span>|</span> <a href="#"
									onclick="oCafeWrite.openAttachInformationWindow('exmovie.html');clickcr(this, 'wrt.imovie', '', '', event);return false;">영화DB</a> <span>|</span> <a href="#"
									onclick="oCafeWrite.openAttachInformationWindow('exdrama.html');clickcr(this, 'wrt.idrama', '', '', event);return false;">드라마DB</a> <span>|</span> <a href="#"
									onClick="oCafeWrite.openAttachInformationWindow('exmusic.html');clickcr(this, 'wrt.imusic', '', '', event);return false;">음악DB</a> <span>|</span> <a href="#"
									onclick="oCafeWrite.openAttachInformationWindow('exshop.html');clickcr(this, 'wrt.igoods', '', '', event);return false;">상품DB</a> <span>|</span> <a href="#"
									onclick="oCafeWrite.openAttachInformationWindow('expeople.html');clickcr(this, 'wrt.iperson', '', '', event);return false;">인물DB</a> <span>|</span> <a href="#"
									onclick="oCafeWrite.openAttachInformationWindow('exweather.html');clickcr(this, 'wrt.iweather', '', '', event);return false;">날씨DB</a> <span>|</span> <a href="#"
									onclick="oCafeWrite.openAttachInformationWindow('exencyc.html');clickcr(this, 'wrt.iknow', '', '', event);return false;">지식백과DB</a>
							</div>
						</li>
					</ul>
