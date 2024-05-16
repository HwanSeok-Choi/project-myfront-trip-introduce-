
/*  
const open = document.querySelector(".open");
const close = document.querySelector(".modal_closeBtn");
const modal = document.querySelector(".modal");

document.addEventListener("DOMContentLoaded", function() {
    
    modal.classList.add("hidden");
    open.addEventListener("click", function(){
        modal.classList.add("modal");
    });
    close.addEventListener("click", function(){
        modal.classList.remove("modal");
    });
});

init();
*/



// 모달 열기 버튼에 대한 이벤트 리스너 추가
document.getElementById('jsBtn').addEventListener('click', function () {
  document.getElementById('modalID').style.display = 'flex';
  document.documentElement.classList.add("modalhtml");
  document.documentElement.style.overflow = 'hidden';
});

// 닫기 버튼에 대한 이벤트 리스너 추가
document.querySelector('.modal_closeBtn').addEventListener('click', function () {
  document.getElementById('modalID').style.display = 'none';
  document.documentElement.classList.add("modalhtml2");
});

document.querySelector('.md_btn1').addEventListener('click', function () {
document.getElementById('md_btn1').style.backgroundColor ='blue';
});

