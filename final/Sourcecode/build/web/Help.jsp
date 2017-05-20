<%-- 
    Document   : Help
    Created on : Apr 1, 2017, 2:07:47 PM
    Author     : User
--%>

<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Help</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    </head>
    <body>
        <% User user = (User)session.getAttribute("user");
        String userStatus = user.getStatus(); %>
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <ul class="nav nav-pills nav-stacked">
                        <li role="presentation" class="active"><a href="#home">Home</a></li>
                        <% if(userStatus.equals("student")) { %>
                            <li role="presentation"><a href="#report">รายงานปัญหา</a></li>
                        <% } %>
                        <li role="presentation"><a href="#list">แสดงรายการปัญหา</a></li>
                        <li role="presentation"><a href="#status">แสดงสถานะปัญหา</a></li>
                        <% if(userStatus.equals("admin")) { %>
                            <li role="presentation"><a href="#change">เปลี่ยนเปลงสถานะปัญหา</a></li>
                            <li role="presentation"><a href="#summary">สรุปปัญหา</a></li>
                        <% } %>
                        <li role="presentation"><a href="#announce">ประกาศ</a></li>
                    </ul>
                </div>
                <div class="col-md-10">
                    <div id="home container">
                        <div class="row">
                            <div class="col-md-12">
                                <% if(userStatus.equals("student")) { %>
                                    <img src="assets/img/S_Menu.png" class="img-responsive">
                                <% } else { %>
                                    <img src="assets/img/A_Menu.png" class="img-responsive">
                                <% } %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <ol>
                                    <li>ปุ่มเพื่อเลือกการทำงานที่ต้องการ</li>
                                    <li>ปุ่มเพื่อ logout ออกจากระบบ</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <% if(userStatus.equals("student")) { %>
                        <div id="report">
                            <div class="row">
                                <div class="col-md-12">
                                    <img src="assets/img/S_Report.png" class="img-responsive">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <ol>
                                        <li>รายชื่อปัญหาที่หอพักรองรับ</li>
                                        <li>หากปัญหาเคยมีการแจ้งและยังไม่ได้รับการแก้ไขจะไม่สามารถแจ้งปัญหาได้</li>
                                        <li>ปุ่ม report เพื่อแจ้งปัญหานั้นๆ</li>
                                    </ol>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <img src="assets/img/S_Popupreport.png" class="img-responsive">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <ol>
                                        <li>กดปุ่ม No เพื่อยกเลิก</li>
                                        <li>กดปุ่ม Yes เพื่อแจ้งปัญหา</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    <% } %>
                    <div id="list">
                        <div class="row">
                            <div class="col-md-12">
                                <% if(userStatus.equals("student")) { %>
                                    <img src="assets/img/S_Listproblem.png" class="img-responsive">
                                <% } else { %>
                                    <img src="assets/img/A_Listproblem.png" class="img-responsive">
                                <% } %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <ol>
                                    <% if(userStatus.equals("student")) { %>
                                        <li>ลำดับของรายการปัญหา</li>
                                        <li>รายชื่อปัญหาที่ถูกแจ้ง</li>
                                        <li>ปุ่มกลับสู่เมนูหลักเพื่อกลับไปหน้า Menu</li>
                                    <% } else { %>
                                        <li>รายชื่อปัญหาที่ถูกแจ้ง</li>
                                        <li>หมายเลขห้องที่แจ้ง</li>
                                        <li>ปุ่มกลับสู่เมนูหลักเพื่อกลับไปหน้า Menu</li>
                                    <% } %>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <div id="status">
                        <div class="row">
                            <div class="col-md-12">
                                <% if(userStatus.equals("student")) { %>
                                    <img src="assets/img/S_Liststatus.png" class="img-responsive">
                                <% } else { %>
                                    <img src="assets/img/A_Liststatus.png" class="img-responsive">
                                <% } %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <ol>
                                    <% if(userStatus.equals("student")) { %>
                                        <li>รายชื่อปัญหาที่ถูกแจ้ง</li>
                                        <li>สถานะของปัญหา</li>
                                        <li>ปุ่มกลับสู่เมนูหลักเพื่อกลับไปหน้า Menu</li>
                                    <% } else { %>
                                        <li>รายชื่อปัญหาที่ถูกแจ้ง</li>
                                        <li>หมายเลขห้องที่แจ้ง</li>
                                        <li>สถานะของปัญหา</li>
                                        <li>ปุ่มกลับสู่เมนูหลักเพื่อกลับไปหน้า Menu</li>
                                    <% } %>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <% if(userStatus.equals("admin")) { %>
                        <div id="change">
                            <div class="row">
                                <div class="col-md-12">
                                    <img src="assets/img/A_Updatestaud.png" class="img-responsive">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <ol>
                                        <li>รายชื่อปัญหาที่ถูกแจ้ง</li>
                                        <li>หมายเลขห้องที่แจ้ง</li>
                                        <li>สถานะของปัญหา</li>
                                        <li>ปุ่ม Update เพื่อกดไปยังหน้าเปลี่ยนสถานะ</li>
                                        <li>ปุ่มกลับสู่เมนูหลักเพื่อกลับไปหน้า Menu</li>
                                    </ol>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <img src="assets/img/A_Update1.png" class="img-responsive">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <ol>
                                        <li>แสดงห้องที่แจ้งปัญหานี้</li>
                                        <li>ชื่อปัญหาที่ถูกแจ้ง</li>
                                        <li>สถานะของปัญหา</li>
                                        <li>Drop down ของสถานะที่ต้องการเปลี่ยน</li>
                                        <li>กดปุ่ม Update เพื่อเปลี่ยนสถานะของปัญหา</li>
                                        <li>กดปุ่ม Back เพื่อกลับไปหน้าเลือกสถานะเปลี่ยน</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        <div id="summary">
                            <div class="row">
                                <div class="col-md-12">
                                    <img src="assets/img/A_Summary.png" class="img-responsive">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <img src="assets/img/A_Summary2.png" class="img-responsive">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <ol>
                                        <li>Drop down เพื่อเลือกปี</li>
                                        <li>รายชื่อปัญหาทั้งหมด</li>
                                        <li>จำนวนครั้งของปัญหานั้นภายในหอที่ถูกแจ้งภายในปีนั้น</li>
                                        <li>รายชื่อปัญหาทั้งหมด</li>
                                        <li>ห้องที่มีการแจ้งสูงสุดของแต่ละปัญหา ถ้ามี</li>
                                        <li>จำนวนครั้งที่แจ้งสูงสุดต่อห้อง ถ้ามี</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    <% } %>
                    <div id="annunce">
                        <div class="row">
                            <div class="col-md-12">
                                <% if(userStatus.equals("student")) { %>
                                    <img src="assets/img/S_AnnounceMenu.png" class="img-responsive">
                                <% } else { %>
                                    <img src="assets/img/A_AnnounceMenu.png" class="img-responsive">
                                <% } %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <ol>
                                    <% if(userStatus.equals("student")) { %>
                                        <li>ปุ่มเลือกประกาศที่สนใจ</li>
                                        <li>ปุ่มกลับสู่เมนูหลักเพื่อกลับไปหน้า Menu</li>
                                    <% } else { %>
                                        <li>ปุ่มเพิ่มประกาศ เพื่อไปเพิ่มประกาศให้หอพัก</li>
                                        <li>ปุ่มเลือกประกาศที่สนใจ</li>
                                        <li>ปุ่มกลับสู่เมนูหลักเพื่อกลับไปหน้า Menu</li>
                                    <% } %>
                                </ol>
                            </div>
                        </div>
                        <% if(userStatus.equals("admin")) { %>
                            <div class="row">
                                <div class="col-md-12">
                                    <img src="assets/img/A_AnnounceForm.png" class="img-responsive">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <ol>
                                        <li>ช่องกรอกข้อมูลตามหัวข้อ</li>
                                        <li>ปุ่ม add เพื่อเพิ่มประกาศ</li>
                                        <li>ปุ่ม back เพื่อกลับไปหน้า Announce Menu</li>
                                    </ol>
                                </div>
                            </div>
                        <% } %>
                        <div class="row">
                            <div class="col-md-12">
                                <% if(userStatus.equals("student")) { %>
                                    <img src="assets/img/S_Anounce.png" class="img-responsive">
                                <% } else { %>
                                    <img src="assets/img/A_Announce.png" class="img-responsive">
                                <% } %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <ol>
                                    <% if(userStatus.equals("student")) { %>
                                        <li>หัวข้อของประกาศ</li>
                                        <li>คำอธิบายของประกาศ</li>
                                        <li>ปุ่ม back เพื่อกลับไปหน้า Announce Menu</li>
                                    <% } else { %>
                                        <li>หัวข้อของประกาศ</li>
                                        <li>คำอธิบายของประกาศ</li>
                                        <li>ปุ่ม back เพื่อกลับไปหน้า Announce Menu</li>
                                        <li>ปุ่ม แก้ไข เพื่อแก้ไขประกาศ</li>
                                    <% } %>
                                </ol>
                            </div>
                        </div>
                        <% if(userStatus.equals("admin")) { %>
                            <div class="row">
                                <div class="col-md-12">
                                    <img src="assets/img/A_AnnounceEdit.png" class="img-responsive">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <ol>
                                        <li>ช่องกรอกข้อมูลตามหัวข้อ</li>
                                        <li>ปุ่ม edit เพื่อแก้ไขประกาศ</li>
                                        <li>ปุ่ม back เพื่อกลับไปหน้าของประกาศนั้นๆ</li>
                                    </ol>
                                </div>
                            </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
